const http = require('http');
const path = require('path');
const { Pool } = require('pg');
const { S3Client, ListObjectsV2Command, PutObjectCommand } = require('@aws-sdk/client-s3');
require('dotenv').config({ path: path.join(__dirname, '.env.local') });

const allowedTables = new Set([
  'series',
  'races',
  'race_series',
  'teams',
  'drivers',
  'race_results',
  'driver_standings',
  'constructor_standings',
  'app_meta',
]);

const storageConfig = {
  bucket: process.env.NEON_STORAGE_BUCKET || 'media',
  endpoint: process.env.AWS_ENDPOINT_URL_S3 || '',
  region: process.env.AWS_REGION || 'us-east-2',
  accessKeyId: process.env.AWS_ACCESS_KEY_ID || '',
  secretAccessKey: process.env.AWS_SECRET_ACCESS_KEY || '',
};

const s3Client = storageConfig.accessKeyId && storageConfig.secretAccessKey && storageConfig.endpoint
  ? new S3Client({
      region: storageConfig.region,
      endpoint: storageConfig.endpoint,
      forcePathStyle: true,
      credentials: {
        accessKeyId: storageConfig.accessKeyId,
        secretAccessKey: storageConfig.secretAccessKey,
      },
    })
  : null;

function sendJson(res, statusCode, payload) {
  res.writeHead(statusCode, {
    'Content-Type': 'application/json',
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',
    'Access-Control-Allow-Headers': 'Content-Type, Accept',
  });
  res.end(JSON.stringify(payload));
}

function readBody(req) {
  return new Promise((resolve, reject) => {
    const chunks = [];
    req.on('data', (chunk) => chunks.push(chunk));
    req.on('end', () => resolve(Buffer.concat(chunks).toString('utf8')));
    req.on('error', reject);
  });
}

function parseJsonBody(rawBody) {
  if (!rawBody) return {};
  try {
    return JSON.parse(rawBody);
  } catch (error) {
    return { raw: rawBody };
  }
}

function sanitizeStorageKey(rawName) {
  const safe = (rawName || 'upload').replace(/\\/g, '/').split('/').pop();
  const base = safe || 'upload';
  return `${Date.now()}-${base.replace(/[^a-zA-Z0-9._-]/g, '-')}`;
}

async function listStorageObjects(prefix = '') {
  if (!s3Client) {
    return { configured: false, items: [] };
  }

  try {
    const command = new ListObjectsV2Command({
      Bucket: storageConfig.bucket,
      Prefix: prefix || '',
    });
    const response = await s3Client.send(command);
    const items = (response.Contents || []).map((item) => ({
      key: item.Key,
      size: item.Size,
      lastModified: item.LastModified ? item.LastModified.toISOString() : null,
      etag: item.ETag || null,
    }));
    return { configured: true, items };
  } catch (error) {
    return { configured: true, items: [], error: error.message };
  }
}

async function uploadStorageObject(payload) {
  if (!s3Client) {
    return {
      ok: false,
      configured: false,
      message: 'Object storage is not configured',
    };
  }

  const fileName = payload.fileName || payload.name || 'upload.bin';
  const contentType = payload.contentType || 'application/octet-stream';
  const input = payload.content ?? payload.data ?? payload.body ?? '';
  const body = Buffer.isBuffer(input)
    ? input
    : typeof input === 'string'
      ? Buffer.from(input, /^(?:[A-Za-z0-9+/]{4})*(?:[A-Za-z0-9+/]{2}==|[A-Za-z0-9+/]{3}=)?$/.test(input) ? 'base64' : 'utf8')
      : Buffer.from(String(input));

  const key = sanitizeStorageKey(fileName);
  const putCommand = new PutObjectCommand({
    Bucket: storageConfig.bucket,
    Key: key,
    Body: body,
    ContentType: contentType,
  });

  await s3Client.send(putCommand);
  const publicUrl = `${storageConfig.endpoint.replace(/\/$/, '')}/${storageConfig.bucket}/${encodeURIComponent(key)}`;

  return {
    ok: true,
    configured: true,
    key,
    publicUrl,
    bucket: storageConfig.bucket,
    contentType,
  };
}

function createServer() {
  const pool = new Pool({
    connectionString: process.env.DATABASE_URL,
    ssl: process.env.DATABASE_URL ? { rejectUnauthorized: false } : undefined,
  });

  const server = http.createServer(async (req, res) => {
    if (req.method === 'OPTIONS') {
      res.writeHead(204, {
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',
        'Access-Control-Allow-Headers': 'Content-Type, Accept',
      });
      res.end();
      return;
    }

    const url = new URL(req.url, 'http://localhost');

    if (url.pathname === '/api/vms/health') {
      sendJson(res, 200, { ok: true, database: !!process.env.DATABASE_URL, service: 'postgres' });
      return;
    }

    if (url.pathname === '/api/vms/storage/health') {
      sendJson(res, 200, {
        ok: true,
        service: 'object-storage',
        configured: Boolean(s3Client),
        bucket: storageConfig.bucket,
        endpoint: storageConfig.endpoint,
      });
      return;
    }

    if (url.pathname === '/api/vms/storage/list') {
      const prefix = url.searchParams.get('prefix') || '';
      const result = await listStorageObjects(prefix);
      sendJson(res, 200, result);
      return;
    }

    if (url.pathname === '/api/vms/storage/upload') {
      if (req.method !== 'POST') {
        sendJson(res, 405, { error: 'Method not allowed' });
        return;
      }

      try {
        const rawBody = await readBody(req);
        const payload = parseJsonBody(rawBody);
        const result = await uploadStorageObject(payload);
        sendJson(res, result.ok ? 200 : 400, result);
      } catch (error) {
        sendJson(res, 500, { ok: false, error: error.message });
      }
      return;
    }

    const match = /^\/api\/vms\/([^/]+)$/.exec(url.pathname);
    if (!match) {
      sendJson(res, 404, { error: 'Unknown endpoint' });
      return;
    }

    const tableName = match[1];
    if (!allowedTables.has(tableName)) {
      sendJson(res, 400, { error: `Table not allowed: ${tableName}` });
      return;
    }

    try {
      const result = await pool.query(`SELECT * FROM public.${tableName}`);
      sendJson(res, 200, result.rows);
    } catch (error) {
      sendJson(res, 500, {
        error: 'Database query failed',
        detail: error.message,
      });
    }
  });

  server.on('close', async () => {
    await pool.end();
  });

  return server;
}

function startServer() {
  const server = createServer();
  const port = process.env.PORT || 3001;
  server.listen(port, () => {
    console.log(`VMS Neon API listening on http://localhost:${port}`);
  });
  return server;
}

if (require.main === module) {
  startServer();
}

module.exports = {
  createServer,
  startServer,
  allowedTables,
  storageConfig,
};

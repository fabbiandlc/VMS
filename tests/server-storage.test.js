const test = require('node:test');
const assert = require('node:assert/strict');
const http = require('node:http');

const { createServer } = require('../server');

async function request(server, pathname, options = {}) {
  const port = server.address().port;
  return new Promise((resolve, reject) => {
    const req = http.request({
      hostname: '127.0.0.1',
      port,
      path: pathname,
      method: options.method || 'GET',
      headers: options.headers || {},
    }, (res) => {
      const chunks = [];
      res.on('data', (chunk) => chunks.push(chunk));
      res.on('end', () => {
        const body = Buffer.concat(chunks).toString('utf8');
        resolve({ status: res.statusCode, headers: res.headers, body });
      });
    });
    req.on('error', reject);
    if (options.body) req.write(options.body);
    req.end();
  });
}

test('server exposes storage health and list endpoints', async () => {
  const server = createServer();
  await new Promise((resolve) => server.listen(0, resolve));

  try {
    const health = await request(server, '/api/vms/storage/health');
    assert.equal(health.status, 200);
    const payload = JSON.parse(health.body);
    assert.equal(payload.ok, true);
    assert.equal(payload.service, 'object-storage');

    const list = await request(server, '/api/vms/storage/list?prefix=');
    assert.equal(list.status, 200);
    const listPayload = JSON.parse(list.body);
    assert.ok(Array.isArray(listPayload.items));
  } finally {
    await new Promise((resolve, reject) => server.close((err) => err ? reject(err) : resolve()));
  }
});

test('server upload endpoint writes to the configured Neon bucket', async () => {
  const server = createServer();
  await new Promise((resolve) => server.listen(0, resolve));

  try {
    const upload = await request(server, '/api/vms/storage/upload', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        fileName: 'test-upload.txt',
        contentType: 'text/plain',
        content: 'Hello from VMS Neon storage test',
      }),
    });

    assert.equal(upload.status, 200);
    const payload = JSON.parse(upload.body);
    assert.equal(payload.ok, true);
    assert.match(payload.key, /^\d+-test-upload\.txt$/);
    assert.ok(payload.publicUrl.includes('/media/'));
  } finally {
    await new Promise((resolve, reject) => server.close((err) => err ? reject(err) : resolve()));
  }
});

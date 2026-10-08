import fs from 'fs';
import path from 'path';
import vm from 'vm';
import { fileURLToPath } from 'url';

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const html = fs.readFileSync(path.join(root, 'index.html'), 'utf8');

function extractConst(name) {
  const re = new RegExp(`const ${name}\\s*=`);
  const m = re.exec(html);
  if (!m) throw new Error('missing ' + name);
  const start = m.index;
  let i = start + m[0].length;
  while (html[i] && /\s/.test(html[i])) i++;
  const open = html[i];
  const close = open === '{' ? '}' : ']';
  let depth = 0;
  let inStr = null;
  let esc = false;
  for (let j = i; j < html.length; j++) {
    const c = html[j];
    if (inStr) {
      if (esc) { esc = false; continue; }
      if (c === '\\') { esc = true; continue; }
      if (c === inStr) inStr = null;
      continue;
    }
    if (c === '"' || c === "'" || c === '`') { inStr = c; continue; }
    if (c === open) depth++;
    else if (c === close) {
      depth--;
      if (depth === 0) return html.slice(start, j + 1);
    }
  }
  throw new Error('unclosed ' + name);
}

const ctx = { console };
vm.createContext(ctx);
vm.runInContext(
  [
    extractConst('RACES'),
    extractConst('RESULTS'),
    extractConst('STANDINGS_DATA'),
    extractConst('INFO_DATA'),
    extractConst('POINTS_TABLE'),
    extractConst('BONUS_FL'),
    extractConst('BONUS_POLE'),
    extractConst('SERIES_META'),
    extractConst('SESSION_TIMES'),
  ].join(';\n') +
    ';\nthis.RACES=RACES;this.RESULTS=RESULTS;this.STANDINGS_DATA=STANDINGS_DATA;this.INFO_DATA=INFO_DATA;this.POINTS_TABLE=POINTS_TABLE;this.BONUS_FL=BONUS_FL;this.BONUS_POLE=BONUS_POLE;this.SERIES_META=SERIES_META;this.SESSION_TIMES=SESSION_TIMES;',
  ctx
);

const {
  RACES, RESULTS, STANDINGS_DATA, INFO_DATA,
  POINTS_TABLE, BONUS_FL, BONUS_POLE, SERIES_META, SESSION_TIMES
} = ctx;

const ALIASES = {
  karazuarin: 'arin',
  arin: 'arin',
  juantoes: 'juan',
  juan: 'juan',
  sunrise: 'sunrise',
  yokesecapo: 'yokesecapo',
  gkf: 'gkf',
  theo: 'theo',
  sckibles: 'sckibles',
  daih: 'daih',
  daihv: 'daih',
  fabian: 'fabian',
  exokyo: 'kyo',
  kyo: 'kyo',
  yellowr1ce: 'yellowrice',
  yellowrice: 'yellowrice',
  rice: 'yellowrice',
  ukkiett: 'ukkiett',
  ukizi: 'ukizi',
  lmp: 'lmp',
};

function nameKey(s) {
  return String(s || '')
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '')
    .toLowerCase()
    .replace(/[^a-z0-9]/g, '');
}
function canonName(s) {
  const k = nameKey(s);
  return ALIASES[k] || k;
}
function slug(s) {
  const k = canonName(s) || nameKey(s) || 'unknown';
  return k.slice(0, 48) || 'unknown';
}
function sqlStr(v) {
  if (v == null) return 'NULL';
  return "'" + String(v).replace(/'/g, "''") + "'";
}
function sqlArrInt(arr) {
  return `ARRAY[${(arr || []).join(',')}]::int[]`;
}
function sqlArrText(arr) {
  if (!arr || !arr.length) return `'{}'::text[]`;
  return `ARRAY[${arr.map(sqlStr).join(',')}]::text[]`;
}
function sqlJson(v) {
  return sqlStr(JSON.stringify(v ?? null)) + '::jsonb';
}

const seriesOrder = ['f1', 'f2', 'f3'];
const teams = [];
const drivers = [];
const teamIndex = {};
const driverIndex = {};

function addTeam(series, name, extra = {}) {
  if (!name || name === '—' || name === '-') return null;
  const id = `t_${series}_${slug(name)}`;
  if (teamIndex[id]) {
    const t = teamIndex[id];
    if (extra.color && !t.color) t.color = extra.color;
    if (extra.notes && !t.notes) t.notes = extra.notes;
    return t;
  }
  const t = {
    id,
    series_id: series,
    name,
    short_name: extra.short_name || null,
    color: extra.color || '#888888',
    notes: extra.notes || '',
    sort_order: teams.filter(x => x.series_id === series).length,
  };
  teams.push(t);
  teamIndex[id] = t;
  return t;
}

function addDriver(series, name, extra = {}) {
  if (!name || name === '—' || name === '-') return null;
  const id = `d_${series}_${slug(name)}`;
  if (driverIndex[id]) {
    const d = driverIndex[id];
    if (extra.team_id && !d.team_id) d.team_id = extra.team_id;
    if (extra.code && (!d.code || d.code === '—')) d.code = extra.code;
    if (extra.num && (!d.num || d.num === '—')) d.num = extra.num;
    if (extra.pts != null && d.published_pts == null) d.published_pts = extra.pts;
    return d;
  }
  const d = {
    id,
    series_id: series,
    team_id: extra.team_id || null,
    name: extra.displayName || name,
    code: extra.code || '',
    num: extra.num || '',
    aliases: extra.aliases || [],
    published_pts: extra.pts ?? null,
    sort_order: drivers.filter(x => x.series_id === series).length,
  };
  drivers.push(d);
  driverIndex[id] = d;
  return d;
}

for (const s of seriesOrder) {
  const info = INFO_DATA[s] || {};
  const st = STANDINGS_DATA[s] || {};
  (info.teams || st.teams || []).forEach(team => {
    const t = addTeam(s, team.name, { color: team.color, notes: team.engine || '', short_name: team.engine });
    (team.drivers || []).forEach(dr => {
      addDriver(s, dr.name, { team_id: t?.id, code: dr.code, num: dr.num, pts: dr.pts });
    });
  });
  (st.constructors || []).forEach(c => addTeam(s, c.name, { color: c.color }));
  (st.drivers || []).forEach(dr => {
    const t = addTeam(s, dr.team, {});
    addDriver(s, dr.name, { team_id: t?.id, code: dr.code, pts: dr.pts, displayName: dr.name });
  });
}

Object.entries(RESULTS).forEach(([key, rows]) => {
  if (!Array.isArray(rows) || key.includes('quali')) return;
  const m = key.match(/^(\d+|BREAK)-([a-z0-9]+)$/i);
  if (!m) return;
  const series = m[2].toLowerCase();
  rows.forEach(r => {
    const t = addTeam(series, r.team, {});
    addDriver(series, r.name, { team_id: t?.id, code: r.code, num: r.num, displayName: r.name });
  });
});

const resultSums = {};
Object.entries(RESULTS).forEach(([key, rows]) => {
  if (!Array.isArray(rows) || key.includes('quali')) return;
  const m = key.match(/^(\d+|BREAK)-([a-z0-9]+)$/i);
  if (!m) return;
  const series = m[2].toLowerCase();
  rows.forEach(r => {
    const d = addDriver(series, r.name, {});
    if (!d) return;
    resultSums[d.id] = (resultSums[d.id] || 0) + (Number(r.pts) || 0);
  });
});

drivers.forEach(d => {
  const published = d.published_pts;
  const fromResults = resultSums[d.id] || 0;
  d.carryover_pts = published == null ? 0 : (published - fromResults);
});

const constructorCarry = {};
for (const s of seriesOrder) {
  const cons = STANDINGS_DATA[s]?.constructors || [];
  const summed = {};
  Object.entries(RESULTS).forEach(([key, rows]) => {
    if (!Array.isArray(rows) || !key.endsWith('-' + s) || key.includes('quali')) return;
    rows.forEach(r => {
      const t = addTeam(s, r.team, {});
      if (!t) return;
      summed[t.id] = (summed[t.id] || 0) + (Number(r.pts) || 0);
    });
  });
  cons.forEach(c => {
    const t = addTeam(s, c.name, { color: c.color });
    if (!t) return;
    constructorCarry[t.id] = (c.pts || 0) - (summed[t.id] || 0);
  });
}

const schema = `-- VMS / Velocity Motorsport Series
-- Pega este archivo primero en el SQL Editor de Supabase.

create extension if not exists pgcrypto;

drop table if exists public.race_results cascade;
drop table if exists public.driver_standings cascade;
drop table if exists public.constructor_standings cascade;
drop table if exists public.drivers cascade;
drop table if exists public.teams cascade;
drop table if exists public.race_series cascade;
drop table if exists public.races cascade;
drop table if exists public.series cascade;
drop table if exists public.app_meta cascade;

create table public.series (
  id text primary key,
  slug text not null unique,
  name text not null,
  full_name text not null,
  tag text default '',
  color text default '#e8186d',
  sort_order int default 0,
  points_table int[] not null default '{}',
  bonus_fl int not null default 0,
  bonus_pole int not null default 0,
  session_day text default 'Saturday',
  session_time text default '',
  meta jsonb default '{}'::jsonb
);

create table public.races (
  id text primary key,
  rnd text not null,
  name text not null,
  circuit text default '',
  sat_date text default '',
  sun_date text default '',
  status text default 'upcoming',
  flag text default '',
  flag_code text default '',
  sort_order int default 0,
  extra jsonb default '{}'::jsonb
);

create table public.race_series (
  race_id text not null references public.races(id) on delete cascade,
  series_id text not null references public.series(id) on delete cascade,
  primary key (race_id, series_id)
);

create table public.teams (
  id text primary key,
  series_id text not null references public.series(id) on delete cascade,
  name text not null,
  short_name text,
  color text default '#888888',
  notes text default '',
  sort_order int default 0,
  carryover_pts int not null default 0
);

create table public.drivers (
  id text primary key,
  series_id text not null references public.series(id) on delete cascade,
  team_id text references public.teams(id) on delete set null,
  name text not null,
  code text default '',
  num text default '',
  aliases text[] default '{}',
  carryover_pts int not null default 0,
  active boolean not null default true,
  sort_order int default 0
);

create table public.race_results (
  id uuid primary key default gen_random_uuid(),
  race_id text not null references public.races(id) on delete cascade,
  series_id text not null references public.series(id) on delete cascade,
  driver_id text references public.drivers(id) on delete set null,
  driver_name text not null,
  team_name text default '',
  pos int not null default 0,
  pts int not null default 0,
  fl boolean not null default false,
  pole boolean not null default false,
  gap text default '',
  note text default '',
  status text default 'classified',
  unique (race_id, series_id, driver_name)
);

create table public.driver_standings (
  driver_id text primary key references public.drivers(id) on delete cascade,
  series_id text not null references public.series(id) on delete cascade,
  pts int not null default 0,
  wins int not null default 0,
  pods int not null default 0,
  dnf int not null default 0,
  poles int not null default 0,
  fls int not null default 0,
  pos int not null default 0,
  gap text default '',
  form jsonb default '[]'::jsonb
);

create table public.constructor_standings (
  team_id text primary key references public.teams(id) on delete cascade,
  series_id text not null references public.series(id) on delete cascade,
  pts int not null default 0,
  pos int not null default 0
);

create table public.app_meta (
  key text primary key,
  value jsonb not null default '{}'::jsonb
);

create index on public.race_results (series_id, race_id);
create index on public.drivers (series_id);
create index on public.teams (series_id);

alter table public.series enable row level security;
alter table public.races enable row level security;
alter table public.race_series enable row level security;
alter table public.teams enable row level security;
alter table public.drivers enable row level security;
alter table public.race_results enable row level security;
alter table public.driver_standings enable row level security;
alter table public.constructor_standings enable row level security;
alter table public.app_meta enable row level security;

create policy "public read series" on public.series for select using (true);
create policy "public read races" on public.races for select using (true);
create policy "public read race_series" on public.race_series for select using (true);
create policy "public read teams" on public.teams for select using (true);
create policy "public read drivers" on public.drivers for select using (true);
create policy "public read race_results" on public.race_results for select using (true);
create policy "public read driver_standings" on public.driver_standings for select using (true);
create policy "public read constructor_standings" on public.constructor_standings for select using (true);
create policy "public read app_meta" on public.app_meta for select using (true);

create policy "auth write series" on public.series for all to authenticated using (true) with check (true);
create policy "auth write races" on public.races for all to authenticated using (true) with check (true);
create policy "auth write race_series" on public.race_series for all to authenticated using (true) with check (true);
create policy "auth write teams" on public.teams for all to authenticated using (true) with check (true);
create policy "auth write drivers" on public.drivers for all to authenticated using (true) with check (true);
create policy "auth write race_results" on public.race_results for all to authenticated using (true) with check (true);
create policy "auth write driver_standings" on public.driver_standings for all to authenticated using (true) with check (true);
create policy "auth write constructor_standings" on public.constructor_standings for all to authenticated using (true) with check (true);
create policy "auth write app_meta" on public.app_meta for all to authenticated using (true) with check (true);

-- Recalcula WDC/WCC desde resultados + carryover (puntos históricos ya publicados)
create or replace function public.vms_recompute_series(p_series text)
returns void
language plpgsql
security definer
as $$
begin
  delete from public.driver_standings where series_id = p_series;
  insert into public.driver_standings (driver_id, series_id, pts, wins, pods, dnf, poles, fls, pos, gap, form)
  select
    d.id,
    d.series_id,
    d.carryover_pts + coalesce(x.pts, 0),
    coalesce(x.wins, 0),
    coalesce(x.pods, 0),
    coalesce(x.dnf, 0),
    coalesce(x.poles, 0),
    coalesce(x.fls, 0),
    0,
    '',
    coalesce(x.form, '[]'::jsonb)
  from public.drivers d
  left join lateral (
    select
      sum(r.pts)::int as pts,
      count(*) filter (where r.pos = 1 and coalesce(r.status,'classified') not in ('dns','dsq'))::int as wins,
      count(*) filter (where r.pos between 1 and 3 and coalesce(r.status,'classified') not in ('dns','dsq'))::int as pods,
      count(*) filter (where r.status = 'dnf' or r.note ilike '%DNF%')::int as dnf,
      count(*) filter (where r.pole)::int as poles,
      count(*) filter (where r.fl)::int as fls,
      (
        select coalesce(jsonb_agg(item.form_val), '[]'::jsonb)
        from (
          select case
            when rr.status = 'dnf' or rr.note ilike '%DNF%' then 'DNF'
            when rr.status = 'dsq' or rr.note ilike '%DSQ%' then 'DSQ'
            when rr.status = 'dns' then 'DNS'
            when rr.pos = 1 then 'W'
            else rr.pos::text
          end as form_val
          from public.race_results rr
          join public.races ra on ra.id = rr.race_id
          where rr.driver_id = d.id and rr.series_id = d.series_id
          order by ra.sort_order desc
          limit 5
        ) item
      ) as form
    from public.race_results r
    where r.driver_id = d.id and r.series_id = d.series_id
  ) x on true
  where d.series_id = p_series and d.active;

  with ranked as (
    select driver_id, pts, rank() over (order by pts desc, wins desc, pods desc) as pos,
           first_value(pts) over (order by pts desc) as top
    from public.driver_standings where series_id = p_series
  )
  update public.driver_standings s
  set pos = ranked.pos,
      gap = case when ranked.pos = 1 then '0' else '-' || (ranked.top - ranked.pts)::text end
  from ranked where s.driver_id = ranked.driver_id;

  delete from public.constructor_standings where series_id = p_series;
  insert into public.constructor_standings (team_id, series_id, pts, pos)
  select t.id, t.series_id,
         t.carryover_pts + coalesce((
           select sum(r.pts) from public.race_results r
           where r.series_id = t.series_id and r.team_name = t.name
         ), 0),
         0
  from public.teams t
  where t.series_id = p_series;

  with ranked as (
    select team_id, pts, rank() over (order by pts desc) as pos
    from public.constructor_standings where series_id = p_series
  )
  update public.constructor_standings s
  set pos = ranked.pos
  from ranked where s.team_id = ranked.team_id;
end;
$$;
`;

const seriesColors = { f1: '#e8186d', f2: '#6699ff', f3: '#22d3ee' };
let seed = `-- VMS seed: datos reales extraídos de index.html
-- Ejecuta DESPUÉS de schema.sql en el SQL Editor.

begin;

`;

seriesOrder.forEach((s, i) => {
  const m = SERIES_META[s];
  const st = SESSION_TIMES[s] || {};
  seed += `insert into public.series (id, slug, name, full_name, tag, color, sort_order, points_table, bonus_fl, bonus_pole, session_day, session_time, meta) values (
    ${sqlStr(s)}, ${sqlStr(s)}, ${sqlStr(m.label)}, ${sqlStr(m.full)}, ${sqlStr(m.tag)}, ${sqlStr(seriesColors[s])}, ${i},
    ${sqlArrInt(POINTS_TABLE[s] || [])}, ${BONUS_FL[s] || 0}, ${BONUS_POLE[s] || 0},
    ${sqlStr(st.day || '')}, ${sqlStr(st.time || '')},
    ${sqlJson({ teams: m.teams, people: m.people, peopleLbl: m.peopleLbl, rounds: m.rounds, countries: m.countries, desc: m.desc, badgeClass: m.badgeClass })}
  );\n`;
});

RACES.forEach((r, i) => {
  const id = `r_${String(r.rnd).replace(/[^a-zA-Z0-9]/g, '_')}`;
  seed += `insert into public.races (id, rnd, name, circuit, sat_date, sun_date, status, flag, flag_code, sort_order, extra) values (
    ${sqlStr(id)}, ${sqlStr(r.rnd)}, ${sqlStr(r.name)}, ${sqlStr(r.circuit)}, ${sqlStr(r.satDate || '')}, ${sqlStr(r.sunDate || '')},
    ${sqlStr(r.status || 'upcoming')}, ${sqlStr(r.flag || '')}, ${sqlStr(r.flagCode || '')}, ${i},
    ${sqlJson({ rndBySeries: r.rndBySeries || null })}
  );\n`;
  (r.series || []).forEach(s => {
    seed += `insert into public.race_series (race_id, series_id) values (${sqlStr(id)}, ${sqlStr(s)});\n`;
  });
});

teams.forEach(t => {
  seed += `insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    ${sqlStr(t.id)}, ${sqlStr(t.series_id)}, ${sqlStr(t.name)}, ${sqlStr(t.short_name)}, ${sqlStr(t.color)}, ${sqlStr(t.notes)}, ${t.sort_order}, ${constructorCarry[t.id] || 0}
  );\n`;
});

drivers.forEach(d => {
  seed += `insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    ${sqlStr(d.id)}, ${sqlStr(d.series_id)}, ${d.team_id ? sqlStr(d.team_id) : 'NULL'}, ${sqlStr(d.name)}, ${sqlStr(d.code || '')}, ${sqlStr(d.num || '')},
    ${sqlArrText(d.aliases)}, ${d.carryover_pts || 0}, true, ${d.sort_order}
  );\n`;
});

Object.entries(RESULTS).forEach(([key, rows]) => {
  if (!Array.isArray(rows) || key.includes('quali')) return;
  const m = key.match(/^(.+)-([a-z0-9]+)$/i);
  if (!m) return;
  const rnd = m[1];
  const series = m[2].toLowerCase();
  const raceId = `r_${String(rnd).replace(/[^a-zA-Z0-9]/g, '_')}`;
  rows.forEach(r => {
    const d = addDriver(series, r.name, {});
    const note = r.note || '';
    let status = 'classified';
    if (/dns/i.test(note)) status = 'dns';
    else if (/dsq/i.test(note)) status = 'dsq';
    else if (/dnf/i.test(note)) status = 'dnf';
    seed += `insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      ${sqlStr(raceId)}, ${sqlStr(series)}, ${d ? sqlStr(d.id) : 'NULL'}, ${sqlStr(r.name)}, ${sqlStr(r.team || '')},
      ${Number(r.pos) || 0}, ${Number(r.pts) || 0}, ${r.fl ? 'true' : 'false'}, ${r.pole ? 'true' : 'false'},
      ${sqlStr(r.gap || '')}, ${sqlStr(note)}, ${sqlStr(status)}
    );\n`;
  });
});

seriesOrder.forEach(s => {
  seed += `select public.vms_recompute_series(${sqlStr(s)});\n`;
});

seed += `
insert into public.app_meta (key, value) values ('seed_source', ${sqlJson({ file: 'index.html', note: 'Datos reales VMS 2026' })});

commit;
`;

const outDir = path.join(root, 'supabase');
fs.mkdirSync(outDir, { recursive: true });
fs.writeFileSync(path.join(outDir, 'schema.sql'), schema);
fs.writeFileSync(path.join(outDir, 'seed.sql'), seed);

const summary = {
  series: seriesOrder.length,
  races: RACES.length,
  teams: teams.length,
  drivers: drivers.length,
  resultRows: Object.values(RESULTS).reduce((n, r) => n + (Array.isArray(r) ? r.length : 0), 0),
};
fs.writeFileSync(path.join(outDir, 'extract-summary.json'), JSON.stringify(summary, null, 2));
console.log(summary);

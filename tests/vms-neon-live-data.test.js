const test = require('node:test');
const assert = require('node:assert/strict');

function makeLocalStorage() {
  const store = new Map();
  return {
    getItem(key) { return store.has(key) ? store.get(key) : null; },
    setItem(key, value) { store.set(key, String(value)); },
    removeItem(key) { store.delete(key); },
    clear() { store.clear(); },
  };
}

test('Neon sync clears stale local standings before rendering live data', async () => {
  global.window = global;
  global.localStorage = makeLocalStorage();
  global.fetch = async (url) => {
    const table = url.includes('/series') ? [{ id: 'f3', slug: 'f3', name: 'Formula 3', full_name: 'VMS F3' }] :
      url.includes('/drivers') ? [{ id: 'd_f3_piko', series_id: 'f3', name: 'Piko', code: 'PIK', num: '1', team_name: 'Team X' }] :
      url.includes('/driver_standings') ? [{ driver_id: 'd_f3_piko', series_id: 'f3', driver_name: 'Piko', team_name: 'Team X', pts: 228, wins: 2, pods: 4, dnf: 0, poles: 1, fls: 0, pos: 1, gap: '0', form: ['W'] }] :
      url.includes('/constructor_standings') ? [] :
      url.includes('/races') ? [] :
      url.includes('/race_series') ? [] :
      url.includes('/race_results') ? [] :
      [];

    return { ok: true, json: async () => table };
  };

  global.SERIES_META = {};
  global.RACES = [];
  global.RESULTS = {};
  global.STANDINGS_DATA = {};
  global.INFO_DATA = {};
  global.window.VMS_CONFIG = { neonApiUrl: 'http://localhost:3001/api/vms', neonDatabaseUrl: '', neonAnonKey: '' };
  delete require.cache[require.resolve('../js/vms-neon.js')];
  require('../js/vms-neon.js');

  global.localStorage.setItem('vms_live_v1', JSON.stringify({
    STANDINGS_DATA: { f3: { drivers: [{ name: 'Piko', pts: 111, team: 'Team X' }], constructors: [] } },
  }));

  const ok = await global.window.VMSNeon.syncFromNeon();

  assert.equal(ok, true);
  assert.equal(global.window.STANDINGS_DATA.f3.drivers[0].pts, 228);
  assert.equal(global.localStorage.getItem('vms_live_v1'), null);
});

test('driver_standings points are the source of truth for title-fight totals', async () => {
  global.window = global;
  global.localStorage = makeLocalStorage();
  global.fetch = async (url) => {
    if (url.includes('/series')) return { ok: true, json: async () => [{ id: 'f3', slug: 'f3', name: 'Formula 3', full_name: 'VMS F3' }] };
    if (url.includes('/drivers')) return { ok: true, json: async () => [{ id: 'd_f3_piko', series_id: 'f3', name: 'Piko', code: 'PIK', num: '1', team_name: 'Team X' }] };
    if (url.includes('/driver_standings')) return { ok: true, json: async () => [{ driver_id: 'd_f3_piko', series_id: 'f3', pts: 228, wins: 2, pods: 4, dnf: 0, poles: 1, fls: 0, pos: 1, gap: '0', form: ['W'] }] };
    if (url.includes('/constructor_standings')) return { ok: true, json: async () => [] };
    if (url.includes('/races')) return { ok: true, json: async () => [] };
    if (url.includes('/race_series')) return { ok: true, json: async () => [] };
    if (url.includes('/race_results')) return { ok: true, json: async () => [
      { series_id: 'f3', driver_name: 'Piko', team_name: 'Team X', pos: 1, pts: 25, fl: false, pole: false, note: '', status: 'classified' },
      { series_id: 'f3', driver_name: 'Piko', team_name: 'Team X', pos: 2, pts: 18, fl: false, pole: false, note: '', status: 'classified' },
      { series_id: 'f3', driver_name: 'Piko', team_name: 'Team X', pos: 3, pts: 15, fl: false, pole: false, note: '', status: 'classified' },
    ] };
    return { ok: true, json: async () => [] };
  };

  global.SERIES_META = {};
  global.RACES = [];
  global.RESULTS = {};
  global.STANDINGS_DATA = {};
  global.INFO_DATA = {};
  global.window.VMS_CONFIG = { neonApiUrl: 'http://localhost:3001/api/vms', neonDatabaseUrl: '', neonAnonKey: '' };
  delete require.cache[require.resolve('../js/vms-neon.js')];
  require('../js/vms-neon.js');

  const ok = await global.window.VMSNeon.syncFromNeon();

  assert.equal(ok, true);
  assert.equal(global.window.STANDINGS_DATA.f3.drivers[0].pts, 228);
  assert.equal(global.window.STANDINGS_DATA.f3.drivers[0].name, 'Piko');
  assert.notEqual(global.window.STANDINGS_DATA.f3.drivers[0].pts, 228 + 25 + 18 + 15);
});

test('Neon team ids resolve to team names for driver cards', async () => {
  global.window = global;
  global.localStorage = makeLocalStorage();
  global.fetch = async (url) => {
    if (url.includes('/series')) return { ok: true, json: async () => [{ id: 'f1', slug: 'f1', name: 'Formula 1', full_name: 'VMS F1' }] };
    if (url.includes('/teams')) return { ok: true, json: async () => [{ id: 't_1', series_id: 'f1', name: 'Aero Apex Racing' }] };
    if (url.includes('/drivers')) return { ok: true, json: async () => [{ id: 'd_1', series_id: 'f1', name: 'Jamie', team_id: 't_1' }] };
    if (url.includes('/driver_standings')) return { ok: true, json: async () => [{ driver_id: 'd_1', series_id: 'f1', pts: 132, wins: 1, pods: 2, dnf: 0, poles: 0, fls: 0, pos: 1, gap: '0', form: ['W'] }] };
    if (url.includes('/constructor_standings')) return { ok: true, json: async () => [] };
    if (url.includes('/races')) return { ok: true, json: async () => [] };
    if (url.includes('/race_series')) return { ok: true, json: async () => [] };
    if (url.includes('/race_results')) return { ok: true, json: async () => [] };
    return { ok: true, json: async () => [] };
  };

  global.SERIES_META = {};
  global.RACES = [];
  global.RESULTS = {};
  global.STANDINGS_DATA = {};
  global.INFO_DATA = {};
  global.window.VMS_CONFIG = { neonApiUrl: 'http://localhost:3001/api/vms', neonDatabaseUrl: '', neonAnonKey: '' };
  delete require.cache[require.resolve('../js/vms-neon.js')];
  require('../js/vms-neon.js');

  const ok = await global.window.VMSNeon.syncFromNeon();

  assert.equal(ok, true);
  assert.equal(global.window.STANDINGS_DATA.f1.drivers[0].team, 'Aero Apex Racing');
  assert.equal(global.window.INFO_DATA.f1.teams[0].name, 'Aero Apex Racing');
});

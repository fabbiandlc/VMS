(function (global) {
  const LIVE_KEY = 'vms_live_v1';
  const CFG_KEY = 'vms_supabase_cfg';

  const ALIASES = {
    karazuarin: 'arin', arin: 'arin',
    juantoes: 'juan', juan: 'juan',
    sunrise: 'sunrise',
    yokesecapo: 'yokesecapo',
    gkf: 'gkf', theo: 'theo',
    sckibles: 'sckibles',
    daih: 'daih', daihv: 'daih',
    fabian: 'fabian',
    exokyo: 'kyo', kyo: 'kyo',
    yellowr1ce: 'yellowrice', yellowrice: 'yellowrice', rice: 'yellowrice',
    ukkiett: 'ukkiett',
  };

  function nameKey(s) {
    return String(s || '')
      .normalize('NFD')
      .replace(/[\u0300-\u036f]/g, '')
      .toLowerCase()
      .replace(/[^a-z0-9]/g, '');
  }
  function canon(s) { const k = nameKey(s); return ALIASES[k] || k; }

  function seriesIds() {
    const fromMeta = Object.keys(global.SERIES_META || {});
    return fromMeta.length ? fromMeta : ['f1', 'f2', 'f3'];
  }

  function calcAutoPts(series, pos, isFl, isPole, status) {
    if (status === 'dns' || status === 'dsq') return 0;
    const table = (global.POINTS_TABLE || {})[series] || [];
    let pts = (pos >= 1 && pos <= table.length) ? table[pos - 1] : 0;
    if (isFl) pts += (global.BONUS_FL && global.BONUS_FL[series]) || 0;
    if (isPole) pts += (global.BONUS_POLE && global.BONUS_POLE[series]) || 0;
    return pts;
  }

  function statusFromNote(note, explicit) {
    if (explicit) return explicit;
    const n = String(note || '');
    if (/dns/i.test(n)) return 'dns';
    if (/dsq/i.test(n)) return 'dsq';
    if (/dnf/i.test(n)) return 'dnf';
    return 'classified';
  }

  function formFromResult(r) {
    const st = statusFromNote(r.note, r.status);
    if (st === 'dnf') return 'DNF';
    if (st === 'dsq') return 'DSQ';
    if (st === 'dns') return 'DNS';
    if (r.pos === 1) return 'W';
    return r.pos ? String(r.pos) : '';
  }

  function findDriver(series, name) {
    const list = (global.STANDINGS_DATA[series] && global.STANDINGS_DATA[series].drivers) || [];
    const k = canon(name);
    return list.find(d => canon(d.name) === k) || null;
  }

  function findConstructor(series, teamName) {
    const list = (global.STANDINGS_DATA[series] && global.STANDINGS_DATA[series].constructors) || [];
    const k = canon(teamName);
    return list.find(c => canon(c.name) === k) || null;
  }

  function ensureSeriesBuckets(series) {
    if (!global.STANDINGS_DATA[series]) global.STANDINGS_DATA[series] = { drivers: [], constructors: [] };
    if (!global.STANDINGS_DATA[series].drivers) global.STANDINGS_DATA[series].drivers = [];
    if (!global.STANDINGS_DATA[series].constructors) global.STANDINGS_DATA[series].constructors = [];
    if (!global.INFO_DATA[series]) global.INFO_DATA[series] = { teams: [] };
    if (!global.INFO_DATA[series].teams) global.INFO_DATA[series].teams = [];
  }

  function lineupDrivers(series) {
    const out = [];
    const seen = new Set();
    const teams = (global.INFO_DATA[series] && global.INFO_DATA[series].teams) || [];
    teams.forEach(team => {
      (team.drivers || []).forEach(d => {
        if (!d.name || d.name === '—') return;
        const k = canon(d.name);
        if (seen.has(k)) return;
        seen.add(k);
        out.push({ name: d.name, code: d.code, num: d.num, team: team.name, color: team.color });
      });
    });
    ((global.STANDINGS_DATA[series] && global.STANDINGS_DATA[series].drivers) || []).forEach(d => {
      const k = canon(d.name);
      if (seen.has(k)) return;
      seen.add(k);
      out.push({ name: d.name, code: d.code, num: d.num, team: d.team });
    });
    return out.sort((a, b) => a.name.localeCompare(b.name));
  }

  function resultEntriesForSeries(series) {
    const rows = [];
    (global.RACES || []).forEach((race, idx) => {
      if (race.status === 'break') return;
      if (race.series && race.series.length && !race.series.includes(series)) return;
      const rnd = (typeof global.getRnd === 'function') ? global.getRnd(race, series) : race.rnd;
      const key = `${rnd}-${series}`;
      const list = global.RESULTS[key];
      if (!list || !list.length) return;
      list.forEach(entry => rows.push({ race, idx, key, entry }));
    });
    return rows;
  }

  function initCarryover() {
    seriesIds().forEach(series => {
      ensureSeriesBuckets(series);
      const sums = {};
      const teamSums = {};
      resultEntriesForSeries(series).forEach(({ entry }) => {
        const k = canon(entry.name);
        sums[k] = (sums[k] || 0) + (Number(entry.pts) || 0);
        const tk = canon(entry.team);
        teamSums[tk] = (teamSums[tk] || 0) + (Number(entry.pts) || 0);
      });
      global.STANDINGS_DATA[series].drivers.forEach(d => {
        if (d.carryover_pts == null) {
          d.carryover_pts = (Number(d.pts) || 0) - (sums[canon(d.name)] || 0);
        }
      });
      global.STANDINGS_DATA[series].constructors.forEach(c => {
        if (c.carryover_pts == null) {
          c.carryover_pts = (Number(c.pts) || 0) - (teamSums[canon(c.name)] || 0);
        }
      });
    });
  }

  function upsertStandingDriver(series, name, team, extra) {
    ensureSeriesBuckets(series);
    let d = findDriver(series, name);
    if (!d) {
      d = { name, code: extra && extra.code || '', team: team || '', pts: 0, wins: 0, pods: 0, dnf: 0, pos: 99, gap: '', form: [], carryover_pts: 0 };
      global.STANDINGS_DATA[series].drivers.push(d);
    }
    if (team) d.team = team;
    return d;
  }

  function upsertConstructor(series, name, color) {
    ensureSeriesBuckets(series);
    let c = findConstructor(series, name);
    if (!c) {
      c = { name, color: color || '#888888', pts: 0, pos: 99, carryover_pts: 0 };
      global.STANDINGS_DATA[series].constructors.push(c);
    }
    return c;
  }

  function recomputeSeries(series) {
    ensureSeriesBuckets(series);
    const drivers = global.STANDINGS_DATA[series].drivers;
    const cons = global.STANDINGS_DATA[series].constructors;
    const hasPersistedPoints = drivers.some(d => Number.isFinite(Number(d.pts)) && d.pts !== null && d.pts !== undefined);
    if (hasPersistedPoints) {
      drivers.sort((a, b) => (Number(b.pts) || 0) - (Number(a.pts) || 0));
      const top = drivers[0] ? Number(drivers[0].pts) || 0 : 0;
      drivers.forEach((d, i) => {
        d.pos = i + 1;
        d.gap = i === 0 ? '0' : `-${top - (Number(d.pts) || 0)}`;
        if (!Array.isArray(d.form)) d.form = [];
      });
      cons.sort((a, b) => (Number(b.pts) || 0) - (Number(a.pts) || 0));
      cons.forEach((c, i) => { c.pos = i + 1; });
      return;
    }

    initCarryover();
    drivers.forEach(d => {
      d._computed = 0; d.wins = 0; d.pods = 0; d.dnf = 0; d._poles = 0; d._fls = 0; d._form = [];
    });
    cons.forEach(c => { c._computed = 0; });

    resultEntriesForSeries(series).forEach(({ race, entry }) => {
      const d = upsertStandingDriver(series, entry.name, entry.team, entry);
      const st = statusFromNote(entry.note, entry.status);
      d._computed += Number(entry.pts) || 0;
      if (st !== 'dns' && st !== 'dsq' && entry.pos === 1) d.wins += 1;
      if (st !== 'dns' && st !== 'dsq' && entry.pos >= 1 && entry.pos <= 3) d.pods += 1;
      if (st === 'dnf' || /dnf/i.test(entry.note || '')) d.dnf += 1;
      if (entry.pole) d._poles += 1;
      if (entry.fl) d._fls += 1;
      d._form.unshift({ sort: race.rnd, val: formFromResult(entry) });
      if (entry.team) {
        const c = upsertConstructor(series, entry.team);
        c._computed += Number(entry.pts) || 0;
      }
    });

    drivers.forEach(d => {
      d.pts = (Number(d.carryover_pts) || 0) + (d._computed || 0);
      d.form = (d._form || []).slice(0, 5).map(x => x.val);
    });
    cons.forEach(c => {
      c.pts = (Number(c.carryover_pts) || 0) + (c._computed || 0);
    });

    if (typeof global.recalcPositionsAndGaps === 'function') global.recalcPositionsAndGaps(series);
    else {
      drivers.sort((a, b) => b.pts - a.pts);
      const top = drivers[0] ? drivers[0].pts : 0;
      drivers.forEach((d, i) => { d.pos = i + 1; d.gap = i === 0 ? '0' : '-' + (top - d.pts); });
      cons.sort((a, b) => b.pts - a.pts);
      cons.forEach((c, i) => { c.pos = i + 1; });
    }
  }

  function recomputeAll() {
    initCarryover();
    seriesIds().forEach(recomputeSeries);
  }

  function persistLive() {
    try {
      localStorage.setItem(LIVE_KEY, JSON.stringify({
        RACES: global.RACES,
        RESULTS: global.RESULTS,
        STANDINGS_DATA: global.STANDINGS_DATA,
        INFO_DATA: global.INFO_DATA,
        SERIES_META: global.SERIES_META,
        POINTS_TABLE: global.POINTS_TABLE,
        BONUS_FL: global.BONUS_FL,
        BONUS_POLE: global.BONUS_POLE,
        SESSION_TIMES: global.SESSION_TIMES,
        SERIES_COLOR_HEX: global.SERIES_COLOR_HEX,
      }));
    } catch (e) { console.warn('VMS persist', e); }
  }

  function loadLive() {
    try {
      const raw = JSON.parse(localStorage.getItem(LIVE_KEY));
      if (!raw) return false;
      if (raw.RACES) global.RACES = raw.RACES;
      if (raw.RESULTS) global.RESULTS = raw.RESULTS;
      if (raw.STANDINGS_DATA) global.STANDINGS_DATA = raw.STANDINGS_DATA;
      if (raw.INFO_DATA) global.INFO_DATA = raw.INFO_DATA;
      if (raw.SERIES_META) Object.assign(global.SERIES_META, raw.SERIES_META);
      if (raw.POINTS_TABLE) Object.assign(global.POINTS_TABLE, raw.POINTS_TABLE);
      if (raw.BONUS_FL) Object.assign(global.BONUS_FL, raw.BONUS_FL);
      if (raw.BONUS_POLE) Object.assign(global.BONUS_POLE, raw.BONUS_POLE);
      if (raw.SESSION_TIMES) Object.assign(global.SESSION_TIMES, raw.SESSION_TIMES);
      if (raw.SERIES_COLOR_HEX && global.SERIES_COLOR_HEX) Object.assign(global.SERIES_COLOR_HEX, raw.SERIES_COLOR_HEX);
      if (global.SERIES_LIST) {
        global.SERIES_LIST.length = 0;
        seriesIds().forEach(s => global.SERIES_LIST.push(s));
      }
      return true;
    } catch (e) { return false; }
  }

  function getCfg() {
    let cfg = Object.assign({}, global.VMS_CONFIG || {});
    try {
      const extra = JSON.parse(localStorage.getItem(CFG_KEY) || '{}');
      Object.assign(cfg, extra);
    } catch (e) {}
    return cfg;
  }
  function setCfg(partial) {
    const cfg = Object.assign(getCfg(), partial);
    localStorage.setItem(CFG_KEY, JSON.stringify({
      supabaseUrl: cfg.supabaseUrl || '',
      supabaseAnonKey: cfg.supabaseAnonKey || '',
      adminEmail: cfg.adminEmail || '',
    }));
    global.VMS_CONFIG = cfg;
    return cfg;
  }

  function refreshPublicViews() {
    try {
      if (typeof global.renderHomeStandings === 'function') global.renderHomeStandings();
      if (typeof global.renderCalendar === 'function') global.renderCalendar('all');
      seriesIds().forEach(s => {
        if (typeof global.renderStandingsForPage === 'function') global.renderStandingsForPage(s);
        if (typeof global.renderInfoPage === 'function') global.renderInfoPage(s);
        if (typeof global.renderSeriesPulse === 'function') global.renderSeriesPulse(s);
      });
      if (typeof global.renderHeroMarquee === 'function') global.renderHeroMarquee();
    } catch (e) { console.warn('VMS refresh', e); }
  }

  function afterResultsChanged(series) {
    if (series) recomputeSeries(series);
    else recomputeAll();
    persistLive();
    refreshPublicViews();
    if (global.VMSSupa && typeof global.VMSSupa.pushLive === 'function') {
      global.VMSSupa.pushLive().catch(err => console.warn('Supabase push', err));
    }
  }

  function applyGrid(raceIdx, series, grid) {
    const race = global.RACES[raceIdx];
    if (!race) return;
    const rnd = (typeof global.getRnd === 'function') ? global.getRnd(race, series) : race.rnd;
    const key = `${rnd}-${series}`;
    const clean = (grid || []).filter(r => r && r.name).map(r => {
      const status = statusFromNote(r.note, r.status);
      const pos = parseInt(r.pos, 10) || 0;
      const fl = !!r.fl;
      const pole = !!r.pole;
      const pts = r.ptsOverride != null && r.ptsOverride !== ''
        ? Number(r.ptsOverride)
        : calcAutoPts(series, pos, fl, pole, status);
      return {
        pos, name: r.name, team: r.team || '', code: r.code || '', num: r.num || '—',
        pts, fl, pole, gap: r.gap || '', note: r.note || '', status,
      };
    }).sort((a, b) => (a.pos || 99) - (b.pos || 99));
    global.RESULTS[key] = clean;
    if (clean.length && race.status === 'upcoming') race.status = 'completed';
    afterResultsChanged(series);
  }

  global.VMSChamp = {
    nameKey, canon, calcAutoPts, statusFromNote, lineupDrivers, seriesIds,
    recomputeSeries, recomputeAll, initCarryover, persistLive, loadLive,
    getCfg, setCfg, refreshPublicViews, afterResultsChanged, applyGrid,
    upsertStandingDriver, upsertConstructor, findDriver, LIVE_KEY, CFG_KEY,
  };
})(window);

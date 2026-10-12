(function () {
  const cfg = window.VMS_CONFIG || {};
  const NEON_DATABASE_URL = cfg.neonDatabaseUrl || cfg.supabaseUrl || '';
  const NEON_ANON_KEY = cfg.neonAnonKey || cfg.supabaseAnonKey || '';
  const NEON_API_URL = (cfg.neonApiUrl || '').replace(/\/+$/, '');
  const NEON_ENABLED = Boolean(NEON_API_URL || (NEON_DATABASE_URL && NEON_ANON_KEY));

  function safeText(value, fallback = '') {
    if (value === null || value === undefined) return fallback;
    return String(value).trim() || fallback;
  }

  function normalizeKey(value) {
    return safeText(value)
      .normalize('NFD')
      .replace(/[\u0300-\u036f]/g, '')
      .toLowerCase()
      .replace(/[^a-z0-9]/g, '');
  }

  function buildDriverLabel(name, fallback = 'Unknown') {
    const value = safeText(name, fallback);
    return value === '—' ? fallback : value;
  }

  function arrayValue(value) {
    if (!value) return [];
    return Array.isArray(value) ? value : [value];
  }

  function resolveTeamName(teamRef, fallback = '—', teamById = new Map()) {
    const direct = teamRef && typeof teamRef === 'object' ? (teamRef.name || teamRef.team_name || teamRef.teamName || '') : teamRef;
    const value = safeText(direct, '');
    if (!value && teamRef && typeof teamRef !== 'object') {
      const match = teamById.get(String(teamRef));
      if (match) return safeText(match.name || match.team_name || match.teamName || '', fallback);
      return fallback;
    }
    if (value) {
      const match = teamById.get(String(teamRef));
      if (match) return safeText(match.name || match.team_name || match.teamName || '', value);
      return value === '—' ? fallback : value;
    }
    return fallback;
  }

  function normalizeRaceStatus(value) {
    const status = safeText(value, 'upcoming').toLowerCase();
    if (['completed', 'upcoming', 'live', 'break'].includes(status)) return status;
    return 'upcoming';
  }

  function mergeSeriesMeta(seriesRows) {
    if (!seriesRows || !seriesRows.length) return;
    const existingMeta = window.SERIES_META || globalThis.SERIES_META || {};
    const meta = { ...existingMeta };
    seriesRows.forEach((row) => {
      const slug = safeText(row.slug || row.id, '').toLowerCase();
      if (!slug) return;
      meta[slug] = {
        ...meta[slug],
        label: safeText(row.name || row.full_name || meta[slug]?.label || slug.toUpperCase(), slug.toUpperCase()),
        full: safeText(row.full_name || row.name || meta[slug]?.full || `${slug.toUpperCase()} Series`, `${slug.toUpperCase()} Series`),
        tag: safeText(row.tag || meta[slug]?.tag || 'Championship', 'Championship'),
        badgeClass: meta[slug]?.badgeClass || `sd-${slug}`,
        teams: safeText(row.meta?.teams || meta[slug]?.teams || '0', '0'),
        people: safeText(row.meta?.people || meta[slug]?.people || '0', '0'),
        peopleLbl: safeText(row.meta?.peopleLbl || meta[slug]?.peopleLbl || 'Drivers', 'Drivers'),
        rounds: safeText(row.meta?.rounds || meta[slug]?.rounds || '16', '16'),
        countries: safeText(row.meta?.countries || meta[slug]?.countries || '20+', '20+'),
        desc: safeText(row.meta?.desc || meta[slug]?.desc || '', ''),
      };
    });
    SERIES_META = meta;
    window.SERIES_META = SERIES_META;
    if (Array.isArray(window.SERIES_LIST)) {
      window.SERIES_LIST.length = 0;
      Object.keys(meta).forEach((key) => window.SERIES_LIST.push(key));
    }
  }

  function buildRaceCalendar(raceRows, raceSeriesRows) {
    const map = new Map();
    (raceSeriesRows || []).forEach((row) => {
      const raceId = safeText(row.race_id || row.raceId || row.id, '');
      const seriesId = safeText(row.series_id || row.seriesId || row.series || '', '').toLowerCase();
      if (!raceId || !seriesId) return;
      if (!map.has(raceId)) map.set(raceId, new Set());
      map.get(raceId).add(seriesId);
    });

    const races = (raceRows || []).map((row) => {
      const raceId = safeText(row.id || row.race_id || row.raceId, '');
      const series = Array.from(map.get(raceId) || new Set()).filter(Boolean);
      const defaultSeries = series.length ? series : ['f1', 'f2', 'f3'];
      const parsedSortOrder = Number.parseInt(safeText(row.sort_order || row.sortOrder || '', '0'), 10);
      const fallbackRound = Number.parseInt(safeText(row.rnd || row.round || '0', '0'), 10);
      return {
        rnd: safeText(row.rnd || row.round || '0', '0'),
        name: safeText(row.name || row.title || 'Race', 'Race'),
        circuit: safeText(row.circuit || row.track || '', ''),
        satDate: safeText(row.sat_date || row.satDate || '', ''),
        sunDate: safeText(row.sun_date || row.sunDate || '', ''),
        status: normalizeRaceStatus(row.status),
        series: defaultSeries,
        flag: safeText(row.flag || '', ''),
        flagCode: safeText(row.flag_code || row.flagCode || '', ''),
        sort_order: Number.isFinite(parsedSortOrder) && parsedSortOrder >= 0 ? parsedSortOrder : (Number.isFinite(fallbackRound) ? fallbackRound : 0),
      };
    });

    races.sort((a, b) => {
      const left = Number.isFinite(Number(a.sort_order)) ? Number(a.sort_order) : (Number(a.rnd) || 0);
      const right = Number.isFinite(Number(b.sort_order)) ? Number(b.sort_order) : (Number(b.rnd) || 0);
      if (left !== right) return left - right;
      return a.name.localeCompare(b.name);
    });

    if (!RACES || !Array.isArray(RACES)) {
      return races;
    }

    RACES.length = 0;
    races.forEach((race) => RACES.push(race));
    window.RACES = RACES;
    return races;
  }

  function buildResultsMap(resultsRows, allRaces) {
    const raceMap = new Map((allRaces || []).map((race) => [safeText(race.id || race.race_id || '', ''), race]));
    const results = {};

    (resultsRows || []).forEach((row) => {
      const raceId = safeText(row.race_id || row.raceId || '', '');
      const seriesId = safeText(row.series_id || row.seriesId || row.series || 'f1', 'f1').toLowerCase();
      const race = raceMap.get(raceId) || { rnd: safeText(row.rnd || row.round || '0', '0') };
      const roundKey = safeText(race.rnd || row.rnd || row.round || '0', '0');
      const raceKey = raceId ? raceId.replace(/^r_/, '') : roundKey;
      const entry = {
        pos: Number(row.pos) || 0,
        name: buildDriverLabel(row.driver_name || row.driverName || row.name, 'Unknown Driver'),
        team: safeText(row.team_name || row.teamName || '', ''),
        pts: Number(row.pts) || 0,
        fl: Boolean(row.fl),
        pole: Boolean(row.pole),
        gap: safeText(row.gap || '', ''),
        note: safeText(row.note || '', ''),
        status: safeText(row.status || '', 'classified'),
      };

      const candidateKeys = new Set([
        `${roundKey}-${seriesId}`,
        `${raceKey}-${seriesId}`,
        `${raceId}-${seriesId}`,
        `${raceId.replace(/^r_/, '')}-${seriesId}`,
      ]);

      candidateKeys.forEach((key) => {
        if (!results[key]) results[key] = [];
        results[key].push(entry);
      });
    });

    Object.keys(results).forEach((key) => {
      results[key].sort((a, b) => (a.pos || 99) - (b.pos || 99));
    });

    if (!RESULTS || typeof RESULTS !== 'object') {
      return results;
    }

    Object.keys(RESULTS).forEach((key) => delete RESULTS[key]);
    Object.assign(RESULTS, results);
    window.RESULTS = RESULTS;
    return results;
  }

  function buildInfoData(seriesRows, teamsRows, driversRows) {
    const info = {};
    const teamMap = new Map();

    const allSeries = seriesRows && seriesRows.length ? seriesRows : Object.keys(window.SERIES_META || {});
    allSeries.forEach((rowOrSeriesKey) => {
      const seriesKey = typeof rowOrSeriesKey === 'string' ? rowOrSeriesKey : safeText(rowOrSeriesKey.slug || rowOrSeriesKey.id, '').toLowerCase();
      if (!seriesKey) return;
      info[seriesKey] = { teams: [] };
    });

    teamsRows.forEach((team) => {
      const seriesId = safeText(team.series_id || team.seriesId || team.series || 'f1', 'f1').toLowerCase();
      if (!info[seriesId]) {
        info[seriesId] = { teams: [] };
      }
      const teamEntry = {
        name: safeText(team.name, 'Unknown Team'),
        short_name: safeText(team.short_name || team.shortName || '', ''),
        color: safeText(team.color, '#888888'),
        engine: safeText(team.notes || '', '—'),
        drivers: [],
      };
      info[seriesId].teams.push(teamEntry);
      teamMap.set(String(team.id || teamEntry.name), teamEntry);
    });

    driversRows.forEach((driver) => {
      const seriesId = safeText(driver.series_id || driver.seriesId || driver.series || 'f1', 'f1').toLowerCase();
      if (!info[seriesId]) {
        info[seriesId] = { teams: [] };
      }

      const driverName = buildDriverLabel(driver.name, 'Unknown Driver');
      const driverEntry = {
        name: driverName,
        code: safeText(driver.code || '', ''),
        num: safeText(driver.num || '', '—'),
      };

      const teamName = safeText(driver.team_name || driver.teamName || '', '');
      let matchedTeam = null;
      if (teamName) {
        matchedTeam = info[seriesId].teams.find((team) => normalizeKey(team.name) === normalizeKey(teamName));
      }
      if (!matchedTeam && driver.team_id) {
        const byId = [...teamMap.entries()].find(([key, value]) => key === String(driver.team_id));
        matchedTeam = byId ? byId[1] : null;
      }
      if (!matchedTeam && info[seriesId].teams.length) {
        matchedTeam = info[seriesId].teams[0];
      }
      if (matchedTeam) {
        if (!matchedTeam.drivers.some((d) => normalizeKey(d.name) === normalizeKey(driverName))) {
          matchedTeam.drivers.push(driverEntry);
        }
      }
    });

    return info;
  }

  function buildStandingsData(seriesRows, teamsRows, driversRows, driverStandingsRows, constructorStandingsRows, resultsRows) {
    const standings = {};
    const seriesKeys = Array.from(new Set([
      ...(seriesRows || []).map((row) => safeText(row.slug || row.id, '').toLowerCase()),
      ...(driversRows || []).map((row) => safeText(row.series_id || row.seriesId || row.series || 'f1', 'f1').toLowerCase()),
      ...(teamsRows || []).map((row) => safeText(row.series_id || row.seriesId || row.series || 'f1', 'f1').toLowerCase()),
      ...(resultsRows || []).map((row) => safeText(row.series_id || row.seriesId || row.series || 'f1', 'f1').toLowerCase()),
      ...Object.keys(window.SERIES_META || {}),
    ].filter(Boolean)));

    seriesKeys.forEach((seriesId) => {
      standings[seriesId] = { drivers: [], constructors: [] };
    });

    const driverById = new Map();
    (driversRows || []).forEach((driver) => {
      const driverId = safeText(driver.id || driver.driver_id || driver.driverId || '', '');
      if (!driverId) return;
      driverById.set(driverId, driver);
    });

    const teamById = new Map();
    (teamsRows || []).forEach((team) => {
      const teamId = safeText(team.id || team.team_id || team.teamId || '', '');
      if (!teamId) return;
      teamById.set(teamId, team);
    });

    const driverPointsBySeries = new Map();
    driverStandingsRows.forEach((row) => {
      const seriesId = safeText(row.series_id || row.seriesId || row.series || 'f1', 'f1').toLowerCase();
      const driverId = safeText(row.driver_id || row.driverId || '', '');
      const driverMeta = driverId ? driverById.get(driverId) : null;
      const driverName = buildDriverLabel(
        driverMeta?.name || row.driver_name || row.driverName || row.name || driverMeta?.driver_name || driverMeta?.driverName,
        'Unknown Driver'
      );
      const teamName = resolveTeamName(
        driverMeta?.team_name || driverMeta?.teamName || row.team_name || row.teamName || row.team_id || row.teamId || driverMeta?.team_id || driverMeta?.teamId,
        '—',
        teamById
      );
      if (!driverPointsBySeries.has(seriesId)) driverPointsBySeries.set(seriesId, new Map());
      const key = driverId || normalizeKey(driverName);
      const entry = {
        name: driverName,
        team: teamName,
        pts: Number(row.pts) || 0,
        wins: Number(row.wins) || 0,
        pods: Number(row.pods) || 0,
        dnf: Number(row.dnf) || 0,
        poles: Number(row.poles) || 0,
        fls: Number(row.fls) || 0,
        pos: Number(row.pos) || 0,
        gap: safeText(row.gap || '', '0'),
        form: Array.isArray(row.form) ? row.form : [],
      };
      driverPointsBySeries.get(seriesId).set(key, entry);
      driverPointsBySeries.get(seriesId).set(normalizeKey(driverName), entry);
    });

    const teamPointsBySeries = new Map();
    constructorStandingsRows.forEach((row) => {
      const seriesId = safeText(row.series_id || row.seriesId || row.series || 'f1', 'f1').toLowerCase();
      const teamId = safeText(row.team_id || row.teamId || '', '');
      const teamMeta = teamId ? teamById.get(teamId) : null;
      const teamName = safeText(teamMeta?.name || row.team_name || row.teamName || row.name || '', 'Unknown Team');
      if (!teamPointsBySeries.has(seriesId)) teamPointsBySeries.set(seriesId, new Map());
      const key = teamId || normalizeKey(teamName);
      const entry = {
        name: teamName,
        color: safeText(teamMeta?.color || row.color || '', '#888888'),
        pts: Number(row.pts) || 0,
        pos: Number(row.pos) || 0,
      };
      teamPointsBySeries.get(seriesId).set(key, entry);
      teamPointsBySeries.get(seriesId).set(normalizeKey(teamName), entry);
    });

    driversRows.forEach((driver) => {
      const seriesId = safeText(driver.series_id || driver.seriesId || driver.series || 'f1', 'f1').toLowerCase();
      const driverName = buildDriverLabel(driver.name, 'Unknown Driver');
      const key = normalizeKey(driverName);
      const teamName = resolveTeamName(
        driver.team_name || driver.teamName || driver.team_id || driver.teamId || driver.team?.name || '',
        '—',
        teamById
      );
      const rowData = driverPointsBySeries.get(seriesId)?.get(driver.id || key) || driverPointsBySeries.get(seriesId)?.get(key) || {
        name: driverName,
        team: teamName,
        pts: 0,
        wins: 0,
        pods: 0,
        dnf: 0,
        poles: 0,
        fls: 0,
        pos: 0,
        gap: '0',
        form: [],
      };
      standings[seriesId].drivers.push({
        name: driverName,
        code: safeText(driver.code || '', ''),
        num: safeText(driver.num || '', '—'),
        team: rowData.team || teamName || '—',
        pts: Number(rowData.pts) || 0,
        wins: Number(rowData.wins) || 0,
        pods: Number(rowData.pods) || 0,
        dnf: Number(rowData.dnf) || 0,
        pos: Number(rowData.pos) || 0,
        gap: safeText(rowData.gap || '', '0'),
        form: Array.isArray(rowData.form) ? rowData.form : [],
      });
    });

    if (resultsRows && resultsRows.length) {
      const aggregateDriver = new Map();
      const aggregateTeam = new Map();
      const hasDriverStandings = Boolean(driverStandingsRows && driverStandingsRows.length);
      const hasConstructorStandings = Boolean(constructorStandingsRows && constructorStandingsRows.length);

      resultsRows.forEach((result) => {
        const seriesId = safeText(result.series_id || result.seriesId || result.series || 'f1', 'f1').toLowerCase();
        const name = buildDriverLabel(result.driver_name || result.driverName || result.name, 'Unknown Driver');
        const team = safeText(result.team_name || result.teamName || '', '—');
        const key = normalizeKey(name);

        if (hasDriverStandings && (driverPointsBySeries.get(seriesId)?.has(String(result.driver_id || result.driverId || '')) || driverPointsBySeries.get(seriesId)?.has(key))) {
          return;
        }

        if (!aggregateDriver.has(seriesId)) aggregateDriver.set(seriesId, new Map());
        const driverMap = aggregateDriver.get(seriesId);
        if (!driverMap.has(key)) {
          driverMap.set(key, {
            name,
            team,
            pts: 0,
            wins: 0,
            pods: 0,
            dnf: 0,
            poles: 0,
            fls: 0,
            pos: 0,
            gap: '0',
            form: [],
          });
        }
        const driverEntry = driverMap.get(key);
        driverEntry.team = team || driverEntry.team || '—';
        driverEntry.pts += Number(result.pts) || 0;
        if (Number(result.pos) === 1) driverEntry.wins += 1;
        if (Number(result.pos) >= 1 && Number(result.pos) <= 3) driverEntry.pods += 1;
        if (String(result.status || '').toLowerCase() === 'dnf' || /(dnf)/i.test(String(result.note || ''))) driverEntry.dnf += 1;
        if (result.pole) driverEntry.poles += 1;
        if (result.fl) driverEntry.fls += 1;
        driverEntry.form.push(Number(result.pos) === 1 ? 'W' : String(result.pos || '—'));

        const teamKey = normalizeKey(team || 'Unknown Team');
        if (hasConstructorStandings && (teamPointsBySeries.get(seriesId)?.has(String(result.team_id || result.teamId || '')) || teamPointsBySeries.get(seriesId)?.has(teamKey))) {
          return;
        }

        if (!aggregateTeam.has(seriesId)) aggregateTeam.set(seriesId, new Map());
        const teamMap = aggregateTeam.get(seriesId);
        if (!teamMap.has(teamKey)) {
          teamMap.set(teamKey, { name: team || 'Unknown Team', color: '#888888', pts: 0, pos: 0 });
        }
        teamMap.get(teamKey).pts += Number(result.pts) || 0;
      });

      aggregateDriver.forEach((driverMap, seriesId) => {
        driverMap.forEach((driverResult) => {
          const list = standings[seriesId].drivers || [];
          const idx = list.findIndex((entry) => normalizeKey(entry.name) === normalizeKey(driverResult.name));
          if (idx >= 0) {
            list[idx].pts = (Number(list[idx].pts) || 0) + (Number(driverResult.pts) || 0);
            list[idx].wins = (Number(list[idx].wins) || 0) + (Number(driverResult.wins) || 0);
            list[idx].pods = (Number(list[idx].pods) || 0) + (Number(driverResult.pods) || 0);
            list[idx].dnf = (Number(list[idx].dnf) || 0) + (Number(driverResult.dnf) || 0);
            list[idx].team = driverResult.team || list[idx].team || '—';
            list[idx].form = (list[idx].form || []).concat(driverResult.form || []).slice(-5);
          } else {
            list.push({
              name: driverResult.name,
              code: '',
              num: '—',
              team: driverResult.team || '—',
              pts: Number(driverResult.pts) || 0,
              wins: Number(driverResult.wins) || 0,
              pods: Number(driverResult.pods) || 0,
              dnf: Number(driverResult.dnf) || 0,
              pos: 0,
              gap: '0',
              form: driverResult.form || [],
            });
          }
        });
      });

      aggregateTeam.forEach((teamMap, seriesId) => {
        teamMap.forEach((teamEntry) => {
          const list = standings[seriesId].constructors || [];
          const idx = list.findIndex((entry) => normalizeKey(entry.name) === normalizeKey(teamEntry.name));
          if (idx >= 0) {
            list[idx].pts = (Number(list[idx].pts) || 0) + (Number(teamEntry.pts) || 0);
          } else {
            list.push({
              name: teamEntry.name,
              color: teamEntry.color || '#888888',
              pts: Number(teamEntry.pts) || 0,
              pos: 0,
            });
          }
        });
      });
    }

    Object.keys(standings).forEach((seriesId) => {
      const drivers = (standings[seriesId].drivers || []).slice().sort((a, b) => (Number(b.pts) || 0) - (Number(a.pts) || 0));
      drivers.forEach((driver, index) => {
        driver.pos = index + 1;
        driver.gap = index === 0 ? '0' : `-${Math.max(0, (Number(drivers[0].pts) || 0) - (Number(driver.pts) || 0))}`;
      });
      standings[seriesId].drivers = drivers;

      const constructors = (standings[seriesId].constructors || []).slice().sort((a, b) => (Number(b.pts) || 0) - (Number(a.pts) || 0));
      constructors.forEach((team, index) => {
        team.pos = index + 1;
      });
      standings[seriesId].constructors = constructors;
    });

    return standings;
  }

  async function fetchTable(tableName, select) {
    const baseUrl = NEON_API_URL || NEON_DATABASE_URL.replace(/\/+$/, '');
    const shouldUseApi = Boolean(NEON_API_URL);
    const url = shouldUseApi
      ? `${baseUrl}/${tableName}?select=${encodeURIComponent(select)}`
      : `${baseUrl}/rest/v1/${tableName}?select=${encodeURIComponent(select)}`;
    const response = await fetch(url, shouldUseApi ? {
      headers: { Accept: 'application/json' },
    } : {
      headers: {
        apikey: NEON_ANON_KEY,
        Authorization: `Bearer ${NEON_ANON_KEY}`,
        Accept: 'application/json',
      },
    });
    if (!response.ok) {
      throw new Error(`Neon fetch failed for ${tableName}: ${response.status}`);
    }
    return response.json();
  }

  async function syncFromNeon() {
    if (!NEON_ENABLED) {
      return false;
    }

    try {
      const [seriesRows, teamsRows, driversRows, driverStandingsRows, constructorStandingsRows, raceRows, raceSeriesRows, resultsRows] = await Promise.all([
        fetchTable('series', '*').catch(() => []),
        fetchTable('teams', '*').catch(() => []),
        fetchTable('drivers', '*').catch(() => []),
        fetchTable('driver_standings', '*').catch(() => []),
        fetchTable('constructor_standings', '*').catch(() => []),
        fetchTable('races', '*').catch(() => []),
        fetchTable('race_series', '*').catch(() => []),
        fetchTable('race_results', '*').catch(() => []),
      ]);

      mergeSeriesMeta(seriesRows);
      const nextRaces = buildRaceCalendar(raceRows, raceSeriesRows);
      const nextResults = buildResultsMap(resultsRows, nextRaces);
      const nextInfo = buildInfoData(seriesRows, teamsRows, driversRows);
      const nextStandings = buildStandingsData(seriesRows, teamsRows, driversRows, driverStandingsRows, constructorStandingsRows, resultsRows);

      if (seriesRows && seriesRows.length) {
        const orderedSeries = seriesRows.map((row) => safeText(row.slug || row.id, '').toLowerCase()).filter(Boolean);
        orderedSeries.forEach((seriesId) => {
          if (!nextStandings[seriesId]) nextStandings[seriesId] = { drivers: [], constructors: [] };
          if (!nextInfo[seriesId]) nextInfo[seriesId] = { teams: [] };
        });
      }

      STANDINGS_DATA = { ...(STANDINGS_DATA || {}), ...nextStandings };
      INFO_DATA = { ...(INFO_DATA || {}), ...nextInfo };
      window.STANDINGS_DATA = STANDINGS_DATA;
      window.INFO_DATA = INFO_DATA;

      if (typeof window.renderHomeStandings === 'function') {
        window.renderHomeStandings();
      }
      if (typeof window.renderHeroMarquee === 'function') {
        window.renderHeroMarquee();
      }
      if (typeof window.renderTitleFight === 'function') {
        window.renderTitleFight();
      }
      if (typeof window.renderPodiumWall === 'function') {
        window.renderPodiumWall();
      }
      if (typeof window.renderUpNext === 'function') {
        window.renderUpNext();
      }
      ['f1', 'f2', 'f3'].forEach((seriesId) => {
        if (typeof window.renderStandingsForPage === 'function') {
          window.renderStandingsForPage(seriesId);
        }
        if (typeof window.renderInfoPage === 'function') {
          window.renderInfoPage(seriesId);
        }
        if (typeof window.renderSeriesPulse === 'function') {
          window.renderSeriesPulse(seriesId);
        }
      });

      try {
        if (typeof localStorage !== 'undefined') {
          localStorage.removeItem('vms_live_v1');
        }
      } catch (error) {
        // Ignore cache cleanup failures and keep using live Neon data.
      }

      console.info('[VMS] Neon data synced successfully.');
      return true;
    } catch (error) {
      console.warn('[VMS] Neon sync failed, keeping local static data.', error);
      return false;
    }
  }

  const syncFromSupabase = syncFromNeon;

  const api = {
    syncFromNeon,
    syncFromSupabase,
    pullFromNeon: syncFromNeon,
    pullFromSupabase: syncFromSupabase,
    pushLive: async function () {
      return false;
    },
    isEnabled: function () {
      return NEON_ENABLED;
    },
  };

  window.VMSNeon = api;
  window.VMSSupa = api;

  if (window.addEventListener) {
    window.addEventListener('load', function () {
      const hasNeonConfig = !!(window.VMS_CONFIG && (window.VMS_CONFIG.neonApiUrl || ((window.VMS_CONFIG.neonDatabaseUrl || window.VMS_CONFIG.supabaseUrl) && (window.VMS_CONFIG.neonAnonKey || window.VMS_CONFIG.supabaseAnonKey))));
      if (hasNeonConfig) {
        window.VMSNeon.syncFromNeon();
      }
    }, { once: true });
  }
})();

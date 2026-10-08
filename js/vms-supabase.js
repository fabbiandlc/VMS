(function () {
  const cfg = window.VMS_CONFIG || {};
  const SUPABASE_ENABLED = Boolean(cfg.supabaseUrl && cfg.supabaseAnonKey);

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

  function mergeSeriesMeta(seriesRows) {
    if (!seriesRows || !seriesRows.length) return;
    const meta = window.SERIES_META || {};
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
    window.SERIES_META = meta;
    if (Array.isArray(window.SERIES_LIST)) {
      window.SERIES_LIST.length = 0;
      Object.keys(meta).forEach((key) => window.SERIES_LIST.push(key));
    }
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

    const driverPointsBySeries = new Map();
    driverStandingsRows.forEach((row) => {
      const seriesId = safeText(row.series_id || row.seriesId || row.series || 'f1', 'f1').toLowerCase();
      const driverName = buildDriverLabel(row.driver_name || row.driverName || row.name, 'Unknown Driver');
      if (!driverPointsBySeries.has(seriesId)) driverPointsBySeries.set(seriesId, new Map());
      driverPointsBySeries.get(seriesId).set(normalizeKey(driverName), {
        name: driverName,
        team: safeText(row.team_name || row.teamName || '', '—'),
        pts: Number(row.pts) || 0,
        wins: Number(row.wins) || 0,
        pods: Number(row.pods) || 0,
        dnf: Number(row.dnf) || 0,
        poles: Number(row.poles) || 0,
        fls: Number(row.fls) || 0,
        pos: Number(row.pos) || 0,
        gap: safeText(row.gap || '', '0'),
        form: Array.isArray(row.form) ? row.form : [],
      });
    });

    const teamPointsBySeries = new Map();
    constructorStandingsRows.forEach((row) => {
      const seriesId = safeText(row.series_id || row.seriesId || row.series || 'f1', 'f1').toLowerCase();
      const teamName = safeText(row.team_name || row.teamName || row.name || '', 'Unknown Team');
      if (!teamPointsBySeries.has(seriesId)) teamPointsBySeries.set(seriesId, new Map());
      teamPointsBySeries.get(seriesId).set(normalizeKey(teamName), {
        name: teamName,
        color: safeText(row.color || '', '#888888'),
        pts: Number(row.pts) || 0,
        pos: Number(row.pos) || 0,
      });
    });

    driversRows.forEach((driver) => {
      const seriesId = safeText(driver.series_id || driver.seriesId || driver.series || 'f1', 'f1').toLowerCase();
      const driverName = buildDriverLabel(driver.name, 'Unknown Driver');
      const key = normalizeKey(driverName);
      const teamName = safeText(driver.team_name || driver.teamName || '', '—');
      const rowData = driverPointsBySeries.get(seriesId)?.get(key) || {
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

      resultsRows.forEach((result) => {
        const seriesId = safeText(result.series_id || result.seriesId || result.series || 'f1', 'f1').toLowerCase();
        const name = buildDriverLabel(result.driver_name || result.driverName || result.name, 'Unknown Driver');
        const team = safeText(result.team_name || result.teamName || '', '—');
        const key = normalizeKey(name);

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

        if (!aggregateTeam.has(seriesId)) aggregateTeam.set(seriesId, new Map());
        const teamMap = aggregateTeam.get(seriesId);
        const teamKey = normalizeKey(team || 'Unknown Team');
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
    const baseUrl = (cfg.supabaseUrl || '').replace(/\/+$/, '');
    const url = `${baseUrl}/rest/v1/${tableName}?select=${encodeURIComponent(select)}`;
    const response = await fetch(url, {
      headers: {
        apikey: cfg.supabaseAnonKey || '',
        Authorization: `Bearer ${cfg.supabaseAnonKey || ''}`,
        Accept: 'application/json',
      },
    });
    if (!response.ok) {
      throw new Error(`Supabase fetch failed for ${tableName}: ${response.status}`);
    }
    return response.json();
  }

  async function syncFromSupabase() {
    if (!SUPABASE_ENABLED) {
      return false;
    }

    try {
      const [seriesRows, teamsRows, driversRows, driverStandingsRows, constructorStandingsRows, resultsRows] = await Promise.all([
        fetchTable('series', '*').catch(() => []),
        fetchTable('teams', '*').catch(() => []),
        fetchTable('drivers', '*').catch(() => []),
        fetchTable('driver_standings', '*').catch(() => []),
        fetchTable('constructor_standings', '*').catch(() => []),
        fetchTable('race_results', '*').catch(() => []),
      ]);

      mergeSeriesMeta(seriesRows);
      const nextInfo = buildInfoData(seriesRows, teamsRows, driversRows);
      const nextStandings = buildStandingsData(seriesRows, teamsRows, driversRows, driverStandingsRows, constructorStandingsRows, resultsRows);

      if (seriesRows && seriesRows.length) {
        const orderedSeries = seriesRows.map((row) => safeText(row.slug || row.id, '').toLowerCase()).filter(Boolean);
        orderedSeries.forEach((seriesId) => {
          if (!nextStandings[seriesId]) nextStandings[seriesId] = { drivers: [], constructors: [] };
          if (!nextInfo[seriesId]) nextInfo[seriesId] = { teams: [] };
        });
      }

      window.STANDINGS_DATA = { ...(window.STANDINGS_DATA || {}), ...nextStandings };
      window.INFO_DATA = { ...(window.INFO_DATA || {}), ...nextInfo };

      if (typeof window.renderHomeStandings === 'function') {
        window.renderHomeStandings();
      }
      if (typeof window.renderHeroMarquee === 'function') {
        window.renderHeroMarquee();
      }
      if (typeof window.renderTitleFight === 'function') {
        window.renderTitleFight();
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

      console.info('[VMS] Supabase data synced successfully.');
      return true;
    } catch (error) {
      console.warn('[VMS] Supabase sync failed, keeping local static data.', error);
      return false;
    }
  }

  const api = {
    syncFromSupabase,
    pullFromSupabase: syncFromSupabase,
    pushLive: async function () {
      return false;
    },
    isEnabled: function () {
      return SUPABASE_ENABLED;
    },
  };

  window.VMSSupa = api;

  if (window.addEventListener) {
    window.addEventListener('load', function () {
      if (window.VMS_CONFIG && window.VMS_CONFIG.supabaseUrl && window.VMS_CONFIG.supabaseAnonKey) {
        window.VMSSupa.syncFromSupabase();
      }
    }, { once: true });
  }
})();

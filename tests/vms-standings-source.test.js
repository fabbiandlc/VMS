const test = require('node:test');
const assert = require('node:assert/strict');

global.window = global;
global.localStorage = {
  data: {},
  getItem(key) {
    return Object.prototype.hasOwnProperty.call(this.data, key) ? this.data[key] : null;
  },
  setItem(key, value) {
    this.data[key] = String(value);
  },
  removeItem(key) {
    delete this.data[key];
  },
};

global.SERIES_META = { f3: { label: 'F3' } };
global.STANDINGS_DATA = { f3: { drivers: [{ name: 'Piko', pts: 228, team: 'Team X' }], constructors: [] } };
global.INFO_DATA = { f3: { teams: [] } };
global.RESULTS = {
  '1-f3': [{ name: 'Piko', team: 'Team X', pos: 1, pts: 25, fl: false, pole: false, note: '', status: 'classified' }],
  '2-f3': [{ name: 'Piko', team: 'Team X', pos: 1, pts: 25, fl: false, pole: false, note: '', status: 'classified' }],
  '3-f3': [{ name: 'Piko', team: 'Team X', pos: 1, pts: 25, fl: false, pole: false, note: '', status: 'classified' }],
  '4-f3': [{ name: 'Piko', team: 'Team X', pos: 1, pts: 25, fl: false, pole: false, note: '', status: 'classified' }],
  '5-f3': [{ name: 'Piko', team: 'Team X', pos: 5, pts: 11, fl: false, pole: false, note: '', status: 'classified' }],
};
global.RACES = [
  { rnd: '1', series: ['f3'], status: 'completed' },
  { rnd: '2', series: ['f3'], status: 'completed' },
  { rnd: '3', series: ['f3'], status: 'completed' },
  { rnd: '4', series: ['f3'], status: 'completed' },
  { rnd: '5', series: ['f3'], status: 'completed' },
];
global.POINTS_TABLE = { f3: [25, 18, 15, 12, 10, 8, 6, 4, 2, 1] };
global.BONUS_FL = { f3: 1 };
global.BONUS_POLE = { f3: 0 };
global.SESSION_TIMES = {};
global.SERIES_COLOR_HEX = {};
global.SERIES_LIST = ['f3'];

delete require.cache[require.resolve('../js/vms-championship.js')];
require('../js/vms-championship.js');

test('Neon-sourced standings are not recalculated by the browser legacy engine', () => {
  global.VMSNeon = { isEnabled: () => true };

  global.VMSChamp.afterResultsChanged('f3');

  assert.equal(global.STANDINGS_DATA.f3.drivers[0].pts, 228);
});

const fs = require('fs');
const path = 'C:/Users/FABIAN/Downloads/Velcoity-Motorsport-Series-main/index.html';
let t = fs.readFileSync(path, 'utf8');

const racesStart = t.indexOf('const RACES = [');
const racesEnd = t.indexOf('// Returns the round label');
if (racesStart !== -1 && racesEnd !== -1) {
  t = t.slice(0, racesStart) + 'const RACES = [];\n\n' + t.slice(racesEnd);
}

const timesStart = t.indexOf('const SESSION_TIMES = {');
const standingsStart = t.indexOf('let STANDINGS_DATA = {');
if (timesStart !== -1 && standingsStart !== -1) {
  const replacement = "const SESSION_TIMES = { f1: { day: 'Saturday', time: 'TBD' }, f2: { day: 'Saturday', time: 'TBD' }, f3: { day: 'Sunday', time: 'TBD' } };\nconst RESULTS = {};\n\n";
  t = t.slice(0, timesStart) + replacement + t.slice(standingsStart);
}

fs.writeFileSync(path, t, 'utf8');
console.log('Reduced hardcoded race and result data blocks to empty defaults.');

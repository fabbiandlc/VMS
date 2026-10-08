-- VMS seed: datos reales extraídos de index.html
-- Ejecuta DESPUÉS de schema.sql en el SQL Editor.

begin;

insert into public.series (id, slug, name, full_name, tag, color, sort_order, points_table, bonus_fl, bonus_pole, session_day, session_time, meta) values (
    'f1', 'f1', 'Formula 1', 'VMS F1', 'Pinnacle Series', '#e8186d', 0,
    ARRAY[25,18,15,12,10,8,6,4,2,1]::int[], 1, 0,
    'Saturday', '11:00 AM EST',
    '{"teams":"12","people":"20","peopleLbl":"Drivers","rounds":"16","countries":"20+","desc":"Formula 1 is the pinnacle of motorsport, where the world''s top drivers compete with sheer speed and technical excellence.","badgeClass":"sd-f1"}'::jsonb
  );
insert into public.series (id, slug, name, full_name, tag, color, sort_order, points_table, bonus_fl, bonus_pole, session_day, session_time, meta) values (
    'f2', 'f2', 'Formula 2', 'VMS F2', 'Elite Development', '#6699ff', 1,
    ARRAY[20,18,16,14,12,10,8,6,4,2,1]::int[], 0, 1,
    'Saturday', '1:00 PM EST',
    '{"teams":"10","people":"22","peopleLbl":"Drivers","rounds":"16","countries":"20+","desc":"The final step before Formula 1 — elite development racing that builds the next generation of VMS champions.","badgeClass":"sd-f2"}'::jsonb
  );
insert into public.series (id, slug, name, full_name, tag, color, sort_order, points_table, bonus_fl, bonus_pole, session_day, session_time, meta) values (
    'f3', 'f3', 'Formula 3', 'VMS F3', 'Rising Stars', '#22d3ee', 2,
    ARRAY[20,18,16,14,12,10,8,6,4,2]::int[], 2, 1,
    'Sunday', '11:00 AM EST',
    '{"teams":"10","people":"30","peopleLbl":"Drivers","rounds":"16","countries":"20+","desc":"The entry point to VMS open-wheel racing, where rising stars begin their climb up the ladder.","badgeClass":"sd-f3"}'::jsonb
  );
insert into public.races (id, rnd, name, circuit, sat_date, sun_date, status, flag, flag_code, sort_order, extra) values (
    'r_01', '01', 'Italian Grand Prix', 'Autodromo Nazionale Monza', 'Jun 27', 'Jun 28',
    'completed', '🇮🇹', 'it', 0,
    '{"rndBySeries":null}'::jsonb
  );
insert into public.race_series (race_id, series_id) values ('r_01', 'f1');
insert into public.race_series (race_id, series_id) values ('r_01', 'f2');
insert into public.race_series (race_id, series_id) values ('r_01', 'f3');
insert into public.races (id, rnd, name, circuit, sat_date, sun_date, status, flag, flag_code, sort_order, extra) values (
    'r_02', '02', 'Canadian Grand Prix', 'Circuit Gilles Villeneuve', 'Jul 4', 'Jul 5',
    'completed', '🇨🇦', 'ca', 1,
    '{"rndBySeries":null}'::jsonb
  );
insert into public.race_series (race_id, series_id) values ('r_02', 'f1');
insert into public.race_series (race_id, series_id) values ('r_02', 'f2');
insert into public.race_series (race_id, series_id) values ('r_02', 'f3');
insert into public.races (id, rnd, name, circuit, sat_date, sun_date, status, flag, flag_code, sort_order, extra) values (
    'r_03', '03', 'Las Vegas Grand Prix', 'Las Vegas Strip Circuit', 'Jul 11', 'Jul 12',
    'completed', '🇺🇸', 'us', 2,
    '{"rndBySeries":null}'::jsonb
  );
insert into public.race_series (race_id, series_id) values ('r_03', 'f1');
insert into public.race_series (race_id, series_id) values ('r_03', 'f2');
insert into public.race_series (race_id, series_id) values ('r_03', 'f3');
insert into public.races (id, rnd, name, circuit, sat_date, sun_date, status, flag, flag_code, sort_order, extra) values (
    'r_04', '04', 'Azerbaijan Grand Prix', 'Baku City Circuit', 'Jul 18', 'Jul 19',
    'completed', '🇦🇿', 'az', 3,
    '{"rndBySeries":null}'::jsonb
  );
insert into public.race_series (race_id, series_id) values ('r_04', 'f1');
insert into public.race_series (race_id, series_id) values ('r_04', 'f2');
insert into public.race_series (race_id, series_id) values ('r_04', 'f3');
insert into public.races (id, rnd, name, circuit, sat_date, sun_date, status, flag, flag_code, sort_order, extra) values (
    'r_05', '05', 'Belgian Grand Prix', 'Circuit de Spa-Francorchamps', 'Jul 25', 'Jul 26',
    'completed', '🇧🇪', 'be', 4,
    '{"rndBySeries":null}'::jsonb
  );
insert into public.race_series (race_id, series_id) values ('r_05', 'f1');
insert into public.race_series (race_id, series_id) values ('r_05', 'f2');
insert into public.race_series (race_id, series_id) values ('r_05', 'f3');
insert into public.races (id, rnd, name, circuit, sat_date, sun_date, status, flag, flag_code, sort_order, extra) values (
    'r_06', '06', 'Hungarian Grand Prix / French Grand Prix', 'Hungaroring / Circuit de Paul Ricard', 'Aug 1', 'Aug 2',
    'completed', '🇭🇺/🇫🇷', 'hu', 5,
    '{"rndBySeries":null}'::jsonb
  );
insert into public.race_series (race_id, series_id) values ('r_06', 'f1');
insert into public.race_series (race_id, series_id) values ('r_06', 'f2');
insert into public.race_series (race_id, series_id) values ('r_06', 'f3');
insert into public.races (id, rnd, name, circuit, sat_date, sun_date, status, flag, flag_code, sort_order, extra) values (
    'r_07', '07', 'Emilia Romagna Grand Prix', 'Autodromo Internazionale Enzo e Dino Ferrari', 'Aug 8', 'Aug 9',
    'completed', '🇮🇹', 'it', 6,
    '{"rndBySeries":null}'::jsonb
  );
insert into public.race_series (race_id, series_id) values ('r_07', 'f1');
insert into public.race_series (race_id, series_id) values ('r_07', 'f2');
insert into public.race_series (race_id, series_id) values ('r_07', 'f3');
insert into public.races (id, rnd, name, circuit, sat_date, sun_date, status, flag, flag_code, sort_order, extra) values (
    'r_BREAK', 'BREAK', 'Season Break & Signing Window', 'MID-SEASON BREAK AND SIGNING WINDOW', '', '',
    'break', '', '', 7,
    '{"rndBySeries":null}'::jsonb
  );
insert into public.races (id, rnd, name, circuit, sat_date, sun_date, status, flag, flag_code, sort_order, extra) values (
    'r_08', '08', 'Hockenheim GP', 'Hockenheimring Baden-Württemberg', 'Aug 15', 'Aug 16',
    'completed', '🇩🇪', 'de', 8,
    '{"rndBySeries":null}'::jsonb
  );
insert into public.race_series (race_id, series_id) values ('r_08', 'f1');
insert into public.race_series (race_id, series_id) values ('r_08', 'f2');
insert into public.race_series (race_id, series_id) values ('r_08', 'f3');
insert into public.races (id, rnd, name, circuit, sat_date, sun_date, status, flag, flag_code, sort_order, extra) values (
    'r_09', '09', 'Monaco Grand Prix', 'Circuit de Monaco', 'Aug 29', 'Aug 30',
    'completed', '🇲🇨', 'mc', 9,
    '{"rndBySeries":null}'::jsonb
  );
insert into public.race_series (race_id, series_id) values ('r_09', 'f1');
insert into public.race_series (race_id, series_id) values ('r_09', 'f2');
insert into public.race_series (race_id, series_id) values ('r_09', 'f3');
insert into public.races (id, rnd, name, circuit, sat_date, sun_date, status, flag, flag_code, sort_order, extra) values (
    'r_10', '10', 'Russian Grand Prix', 'Sochi Autodrom', 'Sep 5', 'Sep 6',
    'completed', '🇷🇺', 'ru', 10,
    '{"rndBySeries":null}'::jsonb
  );
insert into public.race_series (race_id, series_id) values ('r_10', 'f1');
insert into public.race_series (race_id, series_id) values ('r_10', 'f2');
insert into public.race_series (race_id, series_id) values ('r_10', 'f3');
insert into public.races (id, rnd, name, circuit, sat_date, sun_date, status, flag, flag_code, sort_order, extra) values (
    'r_11', '11', 'Qatar Grand Prix', 'Lusail International Circuit', 'Sep 12', 'Sep 13',
    'completed', '🇶🇦', 'qa', 11,
    '{"rndBySeries":null}'::jsonb
  );
insert into public.race_series (race_id, series_id) values ('r_11', 'f1');
insert into public.race_series (race_id, series_id) values ('r_11', 'f2');
insert into public.race_series (race_id, series_id) values ('r_11', 'f3');
insert into public.races (id, rnd, name, circuit, sat_date, sun_date, status, flag, flag_code, sort_order, extra) values (
    'r_12', '12', 'United States Grand Prix', 'Circuit of the Americas', 'Sep 19', 'Sep 20',
    'upcoming', '🇺🇸', 'us', 12,
    '{"rndBySeries":null}'::jsonb
  );
insert into public.race_series (race_id, series_id) values ('r_12', 'f1');
insert into public.race_series (race_id, series_id) values ('r_12', 'f2');
insert into public.race_series (race_id, series_id) values ('r_12', 'f3');
insert into public.races (id, rnd, name, circuit, sat_date, sun_date, status, flag, flag_code, sort_order, extra) values (
    'r_13', '13', 'São Paulo Grand Prix', 'Autódromo José Carlos Pace', 'Sep 26', 'Sep 27',
    'upcoming', '🇧🇷', 'br', 13,
    '{"rndBySeries":null}'::jsonb
  );
insert into public.race_series (race_id, series_id) values ('r_13', 'f1');
insert into public.race_series (race_id, series_id) values ('r_13', 'f2');
insert into public.race_series (race_id, series_id) values ('r_13', 'f3');
insert into public.races (id, rnd, name, circuit, sat_date, sun_date, status, flag, flag_code, sort_order, extra) values (
    'r_14', '14', 'Singapore Grand Prix', 'Marina Bay Street Circuit', 'Oct 3', 'Oct 4',
    'upcoming', '🇸🇬', 'sg', 14,
    '{"rndBySeries":null}'::jsonb
  );
insert into public.race_series (race_id, series_id) values ('r_14', 'f1');
insert into public.race_series (race_id, series_id) values ('r_14', 'f2');
insert into public.race_series (race_id, series_id) values ('r_14', 'f3');
insert into public.races (id, rnd, name, circuit, sat_date, sun_date, status, flag, flag_code, sort_order, extra) values (
    'r_15', '15', 'Mexico City Grand Prix', 'Autódromo Hermanos Rodríguez', 'Oct 10', 'Oct 11',
    'upcoming', '🇲🇽', 'mx', 15,
    '{"rndBySeries":null}'::jsonb
  );
insert into public.race_series (race_id, series_id) values ('r_15', 'f1');
insert into public.race_series (race_id, series_id) values ('r_15', 'f2');
insert into public.race_series (race_id, series_id) values ('r_15', 'f3');
insert into public.races (id, rnd, name, circuit, sat_date, sun_date, status, flag, flag_code, sort_order, extra) values (
    'r_16', '16', 'Austrian Grand Prix', 'Red Bull Ring', 'Oct 17', 'Oct 18',
    'upcoming', '🇦🇹', 'at', 16,
    '{"rndBySeries":null}'::jsonb
  );
insert into public.race_series (race_id, series_id) values ('r_16', 'f1');
insert into public.race_series (race_id, series_id) values ('r_16', 'f2');
insert into public.race_series (race_id, series_id) values ('r_16', 'f3');
insert into public.races (id, rnd, name, circuit, sat_date, sun_date, status, flag, flag_code, sort_order, extra) values (
    'r_17', '17', 'British Grand Prix', 'Silverstone Circuit', 'Oct 24', 'Oct 25',
    'upcoming', '🇬🇧', 'gb', 17,
    '{"rndBySeries":null}'::jsonb
  );
insert into public.race_series (race_id, series_id) values ('r_17', 'f1');
insert into public.race_series (race_id, series_id) values ('r_17', 'f2');
insert into public.race_series (race_id, series_id) values ('r_17', 'f3');
insert into public.races (id, rnd, name, circuit, sat_date, sun_date, status, flag, flag_code, sort_order, extra) values (
    'r_18', '18', 'Abu Dhabi Grand Prix', 'Yas Marina Circuit', 'Oct 31', 'Nov 1',
    'upcoming', '🇦🇪', 'ae', 18,
    '{"rndBySeries":null}'::jsonb
  );
insert into public.race_series (race_id, series_id) values ('r_18', 'f1');
insert into public.race_series (race_id, series_id) values ('r_18', 'f2');
insert into public.race_series (race_id, series_id) values ('r_18', 'f3');
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f1_richardmillelmmotorsportf1', 'f1', 'Richard Mille LM Motorsport F1', 'CEO: Mikos | LM CEO · Director: Lawie (Gay Bitch)', '#a78bfa', 'CEO: Mikos | LM CEO · Director: Lawie (Gay Bitch)', 0, 16
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f1_scuderiaferrari', 'f1', 'Scuderia Ferrari', 'CEO: pringle-i luv jem,jamie,silk,age', '#dc143c', 'CEO: pringle-i luv jem,jamie,silk,age', 1, 0
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f1_vodafonemclaren', 'f1', 'Vodafone McLaren', 'CEO: Neon | McLaren & Israel CEO · Director: Zachary | McLaren Director', '#ff8000', 'CEO: Neon | McLaren & Israel CEO · Director: Zachary | McLaren Director', 2, 0
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f1_renaultsportformula1team', 'f1', 'Renault Sport Formula 1 Team', 'CEO: Neon | McLaren & Israel CEO', '#60a5fa', 'CEO: Neon | McLaren & Israel CEO', 3, 96
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f1_aeroapexracing', 'f1', 'Aero Apex Racing', 'CEO: Flekzy | Aero CEO · Director: Ernesto2013 | AAR Team Director', '#7c3aed', 'CEO: Flekzy | Aero CEO · Director: Ernesto2013 | AAR Team Director', 4, 1
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f1_mercedesamg', 'f1', 'Mercedes-AMG', 'CEO: LeYeetBoi | Merc & GlitchGP CEO · Director: Kuzey | Merc Director', '#00d2be', 'CEO: LeYeetBoi | Merc & GlitchGP CEO · Director: Kuzey | Merc Director', 5, -4
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f1_hertzporsche', 'f1', 'Hertz Porsche', 'CEO: yake | JHP - ATP CEO', '#b9a96a', 'CEO: yake | JHP - ATP CEO', 6, 0
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f1_vanguardsabremotorsport', 'f1', 'Vanguard Sabre Motorsport', 'CEO: POnight_LAlloy', '#7f1010', 'CEO: POnight_LAlloy', 7, 11
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f1_glitchgpf1team', 'f1', 'GlitchGP F1 Team', 'CEO: LeYeetBoi | Merc & GlitchGP CEO · Director: CJ | GlitchGP Director', '#8e3bb5', 'CEO: LeYeetBoi | Merc & GlitchGP CEO · Director: CJ | GlitchGP Director', 8, 14
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f1_tarigysmotorsportteamf1', 'f1', 'Tarigy''s Motorsport Team F1', 'CEO: Flande | Tarigy''s CEO', '#1438d4', 'CEO: Flande | Tarigy''s CEO', 9, 30
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f1_bmwsauberf1team', 'f1', 'BMW Sauber F1 Team', 'CEO: Jamie | BMW Sauber CEO · Director: G spot', '#7dd3fc', 'CEO: Jamie | BMW Sauber CEO · Director: G spot', 10, 0
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f1_saharaforceindiaf1team', 'f1', 'Sahara Force India F1 Team', NULL, '#d7ef00', '', 11, 10
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f2_lmperformancef2', 'f2', 'LM Performance F2', 'CEO: Mikos | LM CEO · Director: Lawie (Gay Bitch)', '#a78bfa', 'CEO: Mikos | LM CEO · Director: Lawie (Gay Bitch)', 0, 171
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f2_renaultsportformula2team', 'f2', 'Renault Sport Formula 2 Team', 'CEO: Neon | McLaren & Isreal CEO', '#d9a300', 'CEO: Neon | McLaren & Isreal CEO', 1, 0
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f2_tarigysmotorsportteamf2', 'f2', 'Tarigy''s Motorsport Team F2', 'CEO: Flande | Tarigy''s CEO · Director: Lauu''s lover | Tarigy''s Director', '#7b2cbf', 'CEO: Flande | Tarigy''s CEO · Director: Lauu''s lover | Tarigy''s Director', 2, 0
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f2_afcorsa', 'f2', 'AF Corsa', 'CEO: pringle-i luv jem,jamie,silk,age', '#ef0000', 'CEO: pringle-i luv jem,jamie,silk,age', 3, 50
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f2_glitchgpf2team', 'f2', 'GlitchGP F2 Team', 'CEO: LeYeetBoi | Merc & GlitchGP CEO · Director: CJ | GlitchGP Director', '#8e3bb5', 'CEO: LeYeetBoi | Merc & GlitchGP CEO · Director: CJ | GlitchGP Director', 4, 0
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f2_vanguardsabreracing', 'f2', 'Vanguard Sabre Racing', 'CEO: POnight_LAlloy', '#7f1010', 'CEO: POnight_LAlloy', 5, 42
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f2_aeroapexracingf2', 'f2', 'Aero Apex Racing F2', 'CEO: Flekzy | Aero CEO', '#2496d2', 'CEO: Flekzy | Aero CEO', 6, 48
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f2_racingpointf2', 'f2', 'Racing Point F2', 'CEO: G spot', '#d100ff', 'CEO: G spot', 7, 0
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f2_cartiracingassociation', 'f2', 'Carti Racing Association', 'CEO: Tiyu | Carti CEO · Director: Zak', '#555555', 'CEO: Tiyu | Carti CEO · Director: Zak', 8, 53
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f2_nissannissmo', 'f2', 'Nissan Nissmo', 'CEO: Ford | Nissan CEO · Director: Alone | NRX Director', '#dbe4cf', 'CEO: Ford | Nissan CEO · Director: Alone | NRX Director', 9, 0
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f2_bmwsauberf2team', 'f2', 'BMW Sauber F2 Team', 'CEO: Jamie | BMW Sauber CEO', '#7dd3fc', 'CEO: Jamie | BMW Sauber CEO', 10, 0
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f2_renaultsportformula2teamisreal', 'f2', 'Renault Sport Formula 2 Team (Isreal)', NULL, '#60a5fa', '', 11, 228
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f2_tarigysmotorsportteamf2acura', 'f2', 'Tarigy’s Motorsport Team F2 (Acura)', NULL, '#7b2cbf', '', 12, 108
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f2_nissannissmonightreapersx', 'f2', 'Nissan Nissmo (Night Reapers X)', NULL, '#dbe4cf', '', 13, 80
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f2_racingpointf2cassien', 'f2', 'Racing Point F2 (Cassien)', NULL, '#d100ff', '', 14, 44
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f2_premafastlineracing', 'f2', 'Prema Fast Line Racing', NULL, '#d1d5db', '', 15, 32
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f2_bmwsauberf2teamokxhpcrimsongp', 'f2', 'BMW Sauber F2 Team (OKX HP Crimson GP)', NULL, '#7dd3fc', '', 16, 6
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f3_lmperformancef3', 'f3', 'LM Performance F3', NULL, '#a78bfa', '', 0, 0
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f3_tarigysmotorsportteamf3', 'f3', 'Tarigy''s Motorsport Team F3', NULL, '#f59e0b', '', 1, 161
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f3_astonmartinracingf3', 'f3', 'Aston Martin Racing F3', NULL, '#22c55e', '', 2, 73
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f3_renaultsportformula3team', 'f3', 'Renault Sport Formula 3 Team', NULL, '#60a5fa', '', 3, 101
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f3_cartiracingassociationf3', 'f3', 'Carti Racing Association F3', NULL, '#ec4899', '', 4, 0
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f3_aeroapexracingf3', 'f3', 'Aero Apex Racing F3', NULL, '#7c3aed', '', 5, 20
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f3_polasabremotorsports', 'f3', 'Pola Sabre Motorsports', NULL, '#1e40af', '', 6, 56
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f3_anonymousjuniors', 'f3', 'Anonymous Juniors', NULL, '#dc143c', '', 7, 0
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f3_koguntechnologiesf3team', 'f3', 'Kogun Technologies F3 Team', NULL, '#eab308', '', 8, 10
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f3_bmwsauberf3team', 'f3', 'BMW Sauber F3 Team', NULL, '#7dd3fc', '', 9, 0
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f3_glitchgpf3', 'f3', 'GlitchGP F3', NULL, '#00d2be', '', 10, 30
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f3_lmp', 'f3', 'LMP', NULL, '#a78bfa', '', 11, 379
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f3_cartiracingassociation', 'f3', 'Carti Racing Association', NULL, '#555555', '', 12, 126
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f3_fastlinemotorsportf3team', 'f3', 'Fast Line Motorsport F3 Team', NULL, '#888888', '', 13, 0
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f1_redbullracing', 'f1', 'Red Bull Racing', NULL, '#888888', '', 12, 0
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f1_isrealracingpoint', 'f1', 'Isreal Racing Point', NULL, '#888888', '', 13, 0
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f1_chonkebeeracingf1', 'f1', 'Chonkebee Racing F1', NULL, '#888888', '', 14, 0
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f1_cassienmotorsport', 'f1', 'Cassien Motorsport', NULL, '#888888', '', 15, 0
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f1_monsterenergyperformance', 'f1', 'Monster Energy Performance', NULL, '#888888', '', 16, 0
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f1_richardmillelmmotorsportsf1', 'f1', 'Richard Mille LM Motorsports F1', NULL, '#888888', '', 17, 0
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f1_monstercadillacf1', 'f1', 'Monster Cadillac F1', NULL, '#888888', '', 18, 0
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f1_tbc', 'f1', 'TBC', NULL, '#888888', '', 19, 0
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f1_oracleredbullracingf1', 'f1', 'Oracle Red Bull Racing F1', NULL, '#888888', '', 20, 0
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f1_renaultsportsformula1team', 'f1', 'Renault Sports Formula 1 Team', NULL, '#888888', '', 21, 0
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f1_vanguardsabremotorsports', 'f1', 'Vanguard Sabre Motorsports', NULL, '#888888', '', 22, 0
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f1_redbullracingf1team', 'f1', 'Red Bull Racing F1 Team', NULL, '#888888', '', 23, 0
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f2_renaultsportformula1team', 'f2', 'Renault Sport Formula 1 Team', NULL, '#888888', '', 17, 0
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f2_acurateampenske', 'f2', 'Acura Team Penske', NULL, '#888888', '', 18, 0
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f2_nightreapersx', 'f2', 'Night Reapers X', NULL, '#888888', '', 19, 0
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f2_camposracingf2', 'f2', 'Campos Racing F2', NULL, '#888888', '', 20, 0
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f2_okxhpcrimsongp', 'f2', 'OKX HP Crimson GP', NULL, '#888888', '', 21, 0
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f3_tarigysmotorsportteam', 'f3', 'Tarigy''s Motorsport Team', NULL, '#888888', '', 14, 0
  );
insert into public.teams (id, series_id, name, short_name, color, notes, sort_order, carryover_pts) values (
    't_f3_renaultsportformula1teamf3', 'f3', 'Renault Sport Formula 1 Team F3', NULL, '#888888', '', 15, 0
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_peters', 'f1', 't_f1_richardmillelmmotorsportf1', 'Peters', 'MD1', '19',
    '{}'::text[], -4, true, 0
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_lory', 'f1', 't_f1_richardmillelmmotorsportf1', 'Lory', 'MD2', '1',
    '{}'::text[], -138, true, 1
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_skirmis', 'f1', 't_f1_richardmillelmmotorsportf1', 'Skirmis', 'RD2', '03',
    '{}'::text[], -15, true, 2
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_nick', 'f1', 't_f1_scuderiaferrari', 'Nick', 'MD1', '—',
    '{}'::text[], -282, true, 3
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_ageftyg2', 'f1', 't_f1_scuderiaferrari', 'Ageftyg2', 'MD2', '12',
    '{}'::text[], -41, true, 4
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_vitality', 'f1', 't_f1_scuderiaferrari', 'Vitality', 'RD1', '67',
    '{}'::text[], -23, true, 5
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_gkf', 'f1', 't_f1_vodafonemclaren', 'gkf', 'MD1', '27',
    '{}'::text[], -20, true, 6
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_theo', 'f1', 't_f1_vodafonemclaren', 'theo', 'MD2', '17_HB46',
    '{}'::text[], -28, true, 7
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_veyro', 'f1', 't_f1_vodafonemclaren', 'Veyro', 'RD1', '—',
    '{}'::text[], 0, true, 8
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_amin', 'f1', 't_f1_renaultsportformula1team', 'Amin', 'MD1', '93',
    '{}'::text[], -12, true, 9
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_dan', 'f1', 't_f1_renaultsportformula1team', 'Dan', 'MD2', '—',
    '{}'::text[], 0, true, 10
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_arin', 'f1', 't_f1_aeroapexracing', 'Karazu Arin', 'MD1', '41',
    '{}'::text[], -34, true, 11
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_joshua', 'f1', 't_f1_aeroapexracing', 'Joshua', 'MD2', '44',
    '{}'::text[], -40, true, 12
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_flaredrdapperbowtie', 'f1', 't_f1_aeroapexracing', 'Flare (@Dr_DapperBowtie)', 'RD1', '—',
    '{}'::text[], 0, true, 13
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_infinity', 'f1', 't_f1_aeroapexracing', 'infinity', 'RD2', '81',
    '{}'::text[], -8, true, 14
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_unironically', 'f1', 't_f1_mercedesamg', 'Unironically', 'MD1', '14',
    '{}'::text[], -16, true, 15
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_emirovic', 'f1', 't_f1_mercedesamg', 'Emirovic', 'MD2', '98',
    '{}'::text[], -1, true, 16
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_leo', 'f1', 't_f1_mercedesamg', 'Leo', 'RD1', '7',
    '{}'::text[], 0, true, 17
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_sunrise', 'f1', 't_f1_hertzporsche', 'Sun_Rise', 'MD1', '15',
    '{}'::text[], -22, true, 18
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_igorexe', 'f1', 't_f1_hertzporsche', 'Igorexe', 'MD2', '17',
    '{}'::text[], 0, true, 19
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_luddsterluddestuttar', 'f1', 't_f1_hertzporsche', 'luddster (@luddestuttar)', 'RD1', '—',
    '{}'::text[], 0, true, 20
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_daih', 'f1', 't_f1_vanguardsabremotorsport', 'Daih', 'MD1', '79',
    '{}'::text[], -24, true, 21
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_waffle', 'f1', 't_f1_vanguardsabremotorsport', 'Waffle', 'MD2', '25',
    '{}'::text[], 0, true, 22
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_yokesecapo', 'f1', 't_f1_glitchgpf1team', 'yokesecapo', 'MD1', '43',
    '{}'::text[], -24, true, 23
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_sckibles', 'f1', 't_f1_glitchgpf1team', 'SCKIBLES', 'MD2', '20',
    '{}'::text[], -20, true, 24
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_yuki', 'f1', 't_f1_glitchgpf1team', 'Yuki', 'RD1', '22',
    '{}'::text[], -2, true, 25
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_elkrazy', 'f1', 't_f1_glitchgpf1team', 'El_krazy', 'RD2', '60',
    '{}'::text[], 0, true, 26
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_shadowrex', 'f1', 't_f1_tarigysmotorsportteamf1', 'ShadowRex', 'MD1', '26',
    '{}'::text[], -12, true, 27
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_maldonado', 'f1', 't_f1_tarigysmotorsportteamf1', 'Maldonado', 'MD2', '92',
    '{}'::text[], 0, true, 28
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_octi', 'f1', 't_f1_tarigysmotorsportteamf1', 'Octi', 'RD1', '0',
    '{}'::text[], 0, true, 29
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_sly', 'f1', 't_f1_bmwsauberf1team', 'Sly', 'MD1', '48',
    '{}'::text[], -45, true, 30
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_veinblong', 'f1', 't_f1_bmwsauberf1team', 'Vein Blong', 'MD2', '9',
    '{}'::text[], 0, true, 31
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_lewis', 'f1', 't_f1_vanguardsabremotorsport', 'Lewis', 'MD2', '',
    '{}'::text[], 0, true, 32
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_rats', 'f1', 't_f1_tarigysmotorsportteamf1', 'Rats', 'MD1', '',
    '{}'::text[], 12, true, 33
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_greenshinobi', 'f1', 't_f1_renaultsportformula1team', 'GreenShinobi', 'MD2', '',
    '{}'::text[], 0, true, 34
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_john', 'f1', 't_f1_hertzporsche', 'John', 'MD2', '',
    '{}'::text[], 0, true, 35
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_bence', 'f1', 't_f1_glitchgpf1team', 'Bence', 'MD1', '',
    '{}'::text[], 0, true, 36
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_sam', 'f1', 't_f1_saharaforceindiaf1team', 'Sam', 'MD2', '',
    '{}'::text[], 0, true, 37
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f2_skirmis', 'f2', 't_f2_lmperformancef2', 'Skirmis', 'MD1', '03',
    '{}'::text[], -108, true, 0
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f2_peters', 'f2', 't_f2_lmperformancef2', 'Peters', 'MD2', '19',
    '{}'::text[], -38, true, 1
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f2_ukizi', 'f2', 't_f2_lmperformancef2', 'Ukizi', 'RD1', '91',
    '{}'::text[], 0, true, 2
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f2_gamrin', 'f2', 't_f2_renaultsportformula2team', 'Gamrin', 'MD1', '23',
    '{}'::text[], -114, true, 3
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f2_gui', 'f2', 't_f2_renaultsportformula2team', 'Gui', 'MD2', '29',
    '{}'::text[], -12, true, 4
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f2_octi', 'f2', 't_f2_tarigysmotorsportteamf2', 'Octi', 'MD1', '0',
    '{}'::text[], 0, true, 5
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f2_dante', 'f2', 't_f2_tarigysmotorsportteamf2', 'dante', 'MD2', '—',
    '{}'::text[], -2, true, 6
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f2_dino', 'f2', 't_f2_afcorsa', 'Dino', 'MD1', '52',
    '{}'::text[], 0, true, 7
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f2_zayn', 'f2', 't_f2_afcorsa', 'ZAYN', 'MD2', '22',
    '{}'::text[], -10, true, 8
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f2_halo', 'f2', 't_f2_afcorsa', 'Halo', 'RD1', '18',
    '{}'::text[], 0, true, 9
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f2_boj', 'f2', 't_f2_afcorsa', 'Boj', 'RD2', '—',
    '{}'::text[], 0, true, 10
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f2_thewind', 'f2', 't_f2_glitchgpf2team', 'The Wind', 'MD1', '—',
    '{}'::text[], 0, true, 11
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f2_yuki', 'f2', 't_f2_glitchgpf2team', 'Yuki', 'MD2', '22',
    '{}'::text[], 0, true, 12
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f2_ruta', 'f2', 't_f2_glitchgpf2team', 'RuTa', 'RD1', '33',
    '{}'::text[], 0, true, 13
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f2_lewis', 'f2', 't_f2_vanguardsabreracing', 'Lewis', 'MD1', '27',
    '{}'::text[], 0, true, 14
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f2_nahim', 'f2', 't_f2_vanguardsabreracing', 'Nahim', 'MD2', '97',
    '{}'::text[], -10, true, 15
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f2_penguin', 'f2', 't_f2_vanguardsabreracing', 'Penguin', 'RD1', '41',
    '{}'::text[], 0, true, 16
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f2_jimmy', 'f2', 't_f2_vanguardsabreracing', 'Jimmy', 'RD2', '36',
    '{}'::text[], 0, true, 17
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f2_kyo', 'f2', 't_f2_aeroapexracingf2', 'EXO_Kyo', 'MD1', '10',
    '{}'::text[], -14, true, 18
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f2_fb', 'f2', 't_f2_aeroapexracingf2', 'Fb', 'MD2', '—',
    '{}'::text[], -1, true, 19
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f2_hazza', 'f2', 't_f2_aeroapexracingf2', 'Hazza', 'MD3', '—',
    '{}'::text[], 0, true, 20
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f2_pear', 'f2', 't_f2_racingpointf2', 'Pear', 'MD1', '—',
    '{}'::text[], 0, true, 21
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f2_jules', 'f2', 't_f2_racingpointf2', 'JULES', 'RD1', '55',
    '{}'::text[], 0, true, 22
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f2_juan', 'f2', 't_f2_cartiracingassociation', 'Juantoes', 'MD1', '1',
    '{}'::text[], -82, true, 23
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f2_crocs', 'f2', 't_f2_cartiracingassociation', 'Crocs', 'MD2', '26',
    '{}'::text[], -91, true, 24
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f2_jeremiahspookie', 'f2', 't_f2_cartiracingassociation', 'jeremiah_spookie', 'RD2', '—',
    '{}'::text[], 0, true, 25
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f2_alien', 'f2', 't_f2_nissannissmo', 'Alien', 'MD1', '95',
    '{}'::text[], -41, true, 26
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f2_zaphira', 'f2', 't_f2_nissannissmo', 'Zaphira', 'MD2', '24',
    '{}'::text[], -9, true, 27
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f2_vittorioso', 'f2', 't_f2_nissannissmo', 'Vittorioso', 'RD2', '15',
    '{}'::text[], 0, true, 28
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f2_hb', 'f2', 't_f2_bmwsauberf2team', 'HB~', 'MD1', '<46>',
    '{}'::text[], 0, true, 29
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f2_ao', 'f2', 't_f2_bmwsauberf2team', 'AO', 'MD2', '17',
    '{}'::text[], -6, true, 30
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f2_jeffz', 'f2', 't_f2_lmperformancef2', 'Jeffz', 'MD3', '',
    '{}'::text[], 40, true, 31
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f2_style', 'f2', 't_f2_vanguardsabreracing', 'Style', 'MD1', '',
    '{}'::text[], 8, true, 32
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f2_fandrs', 'f2', 't_f2_premafastlineracing', 'Fandrs', 'MD1', '',
    '{}'::text[], 22, true, 33
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f2_zach', 'f2', NULL, 'Zach', '—', '',
    '{}'::text[], 20, true, 34
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f2_igor', 'f2', 't_f2_tarigysmotorsportteamf2', 'Igor', 'RD1', '',
    '{}'::text[], 20, true, 35
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f2_vittorio', 'f2', 't_f2_nissannissmo', 'Vittorio', 'RD2', '',
    '{}'::text[], 12, true, 36
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f2_maldonado', 'f2', 't_f2_tarigysmotorsportteamf2', 'Maldonado', 'MD1', '',
    '{}'::text[], 0, true, 37
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f2_wavee', 'f2', 't_f2_racingpointf2', 'Wavee', 'MD1', '',
    '{}'::text[], 2, true, 38
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f2_gasly', 'f2', 't_f2_afcorsa', 'Gasly', 'RD1', '',
    '{}'::text[], 0, true, 39
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f2_danomk', 'f2', 't_f2_premafastlineracing', 'Danomk', 'MD2', '',
    '{}'::text[], 10, true, 40
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f2_alonso', 'f2', 't_f2_tarigysmotorsportteamf2', 'Alonso', '', '',
    '{}'::text[], 4, true, 41
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_piko', 'f3', 't_f3_lmperformancef3', 'Piko', 'MD1', '53',
    '{}'::text[], 117, true, 0
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_jeffz', 'f3', 't_f3_lmperformancef3', 'Jeffz', 'MD3', '99',
    '{}'::text[], 71, true, 1
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_kriekel', 'f3', 't_f3_lmperformancef3', 'Kriekel', 'RD1', '21',
    '{}'::text[], 0, true, 2
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_fabian', 'f3', 't_f3_tarigysmotorsportteamf3', 'Fabián', 'MD1', '11',
    '{}'::text[], 8, true, 3
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_lancelot', 'f3', 't_f3_tarigysmotorsportteamf3', 'Lancelot', 'MD2', '27',
    '{}'::text[], 18, true, 4
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_elmanco010', 'f3', 't_f3_tarigysmotorsportteamf3', 'El_Manco010', 'MD3', '—',
    '{}'::text[], 0, true, 5
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_sam', 'f3', 't_f3_astonmartinracingf3', 'Sam', 'MD1', '5',
    '{}'::text[], 0, true, 6
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_tta', 'f3', 't_f3_astonmartinracingf3', 'Tta', 'MD2', '21',
    '{}'::text[], 0, true, 7
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_maslo', 'f3', 't_f3_astonmartinracingf3', 'Maslo', 'MD3', '88',
    '{}'::text[], 2, true, 8
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_mikey', 'f3', 't_f3_astonmartinracingf3', 'Mikey', 'RD1', '78',
    '{}'::text[], 0, true, 9
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_yellowrice', 'f3', 't_f3_renaultsportformula3team', 'Rice', 'MD3', '55',
    '{}'::text[], 1, true, 10
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_ukkiett', 'f3', 't_f3_cartiracingassociationf3', 'ukkiett', 'MD1', '3',
    '{}'::text[], 73, true, 11
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_wibz', 'f3', 't_f3_cartiracingassociationf3', 'Wibz', 'MD2', '77',
    '{}'::text[], 0, true, 12
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_dannell', 'f3', 't_f3_cartiracingassociationf3', 'Dannell', 'MD3', '57',
    '{}'::text[], 0, true, 13
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_chipimenor', 'f3', 't_f3_cartiracingassociationf3', 'Chipi Menor', 'RD1', '13',
    '{}'::text[], 0, true, 14
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_nyiko', 'f3', 't_f3_aeroapexracingf3', 'Nyiko', 'MD1', '77',
    '{}'::text[], 0, true, 15
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_elden', 'f3', 't_f3_aeroapexracingf3', 'Elden', 'MD2', '—',
    '{}'::text[], 0, true, 16
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_beticosss', 'f3', 't_f3_aeroapexracingf3', 'BETICOSSS', 'MD3', '95',
    '{}'::text[], 0, true, 17
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_darkshadow', 'f3', 't_f3_polasabremotorsports', 'Dark Shadow', 'MD1', '28',
    '{}'::text[], 36, true, 18
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_elf', 'f3', 't_f3_polasabremotorsports', 'Elf', 'MD2', '10',
    '{}'::text[], 0, true, 19
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_bartos', 'f3', 't_f3_polasabremotorsports', 'Bartos', 'MD3', '04',
    '{}'::text[], 26, true, 20
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_piti', 'f3', 't_f3_anonymousjuniors', 'Piti', 'MD1', '56',
    '{}'::text[], 0, true, 21
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_halo', 'f3', 't_f3_anonymousjuniors', 'Halo', 'MD2', '18',
    '{}'::text[], 4, true, 22
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_unknownuser', 'f3', 't_f3_anonymousjuniors', 'unknown-user', 'MD3', '—',
    '{}'::text[], 0, true, 23
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_majd', 'f3', 't_f3_anonymousjuniors', 'Majd', 'RD1', '1',
    '{}'::text[], 0, true, 24
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_ellie', 'f3', 't_f3_koguntechnologiesf3team', 'ellie', 'MD1', '45',
    '{}'::text[], 6, true, 25
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_avda', 'f3', 't_f3_koguntechnologiesf3team', 'Avda', 'MD2', '96',
    '{}'::text[], 0, true, 26
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_marin', 'f3', 't_f3_koguntechnologiesf3team', 'Marin', 'MD3', '45',
    '{}'::text[], 0, true, 27
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_dunstsoocerking4', 'f3', 't_f3_koguntechnologiesf3team', 'Dunstsoocerking4', 'RD1', '—',
    '{}'::text[], 0, true, 28
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_kashin', 'f3', 't_f3_bmwsauberf3team', 'Kashin', 'MD1', '5',
    '{}'::text[], 0, true, 29
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_roven', 'f3', 't_f3_bmwsauberf3team', 'Roven', 'MD2', '55',
    '{}'::text[], 0, true, 30
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_genghis', 'f3', 't_f3_bmwsauberf3team', 'Genghis', 'MD3', '17',
    '{}'::text[], 0, true, 31
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_hakeman', 'f3', 't_f3_glitchgpf3', 'Hakeman', 'MD1', '19',
    '{}'::text[], 0, true, 32
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_bence', 'f3', 't_f3_glitchgpf3', 'Bence', 'MD2', '77',
    '{}'::text[], 0, true, 33
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_syxe', 'f3', 't_f3_glitchgpf3', 'syxe', 'MD3', '34',
    '{}'::text[], 12, true, 34
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_leo', 'f3', 't_f3_glitchgpf3', 'Leo', 'RD1', '15',
    '{}'::text[], 0, true, 35
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_ukizi', 'f3', 't_f3_lmp', 'Ukizi', 'RD1', '',
    '{}'::text[], 50, true, 36
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_peters', 'f3', 't_f3_tarigysmotorsportteamf3', 'Peters', '—', '',
    '{}'::text[], 21, true, 37
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_jardin', 'f3', 't_f3_lmp', 'Jardin', 'MD2', '',
    '{}'::text[], 29, true, 38
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_shadowrex', 'f3', 't_f3_tarigysmotorsportteamf3', 'Shadow Rex', '—', '',
    '{}'::text[], 28, true, 39
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_maldonado', 'f3', 't_f3_tarigysmotorsportteamf3', 'Maldonado', '—', '',
    '{}'::text[], 21, true, 40
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_ageftyg2', 'f3', NULL, 'Ageftyg2', '—', '',
    '{}'::text[], 20, true, 41
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_sckibles', 'f3', 't_f3_glitchgpf3', 'SCKIBLES', '—', '',
    '{}'::text[], 4, true, 42
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_bobby', 'f3', 't_f3_fastlinemotorsportf3team', 'Bobby', 'MD3', '',
    '{}'::text[], 10, true, 43
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_ljs', 'f3', 't_f3_anonymousjuniors', 'LJS', 'MD3', '',
    '{}'::text[], 0, true, 44
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_lance', 'f3', 't_f3_astonmartinracingf3', 'Lance', 'MD3', '',
    '{}'::text[], 2, true, 45
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_michael', 'f1', 't_f1_mercedesamg', 'Michael', '', '',
    '{}'::text[], 0, true, 38
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_douzy', 'f1', 't_f1_richardmillelmmotorsportf1', 'Douzy', '', '',
    '{}'::text[], 0, true, 39
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_dovantae', 'f1', 't_f1_aeroapexracing', 'Dovantae', '', '',
    '{}'::text[], 0, true, 40
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_nath', 'f1', 't_f1_glitchgpf1team', 'Nath', '', '',
    '{}'::text[], 0, true, 41
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_alpha', 'f1', 't_f1_mercedesamg', 'Alpha', '', '',
    '{}'::text[], 0, true, 42
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_lightening', 'f1', 't_f1_redbullracing', 'Lightening', '', '',
    '{}'::text[], 0, true, 43
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_juan', 'f1', 't_f1_vanguardsabremotorsport', 'Juan', '', '',
    '{}'::text[], 0, true, 44
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_alex', 'f1', 't_f1_aeroapexracing', 'Alex', '', '',
    '{}'::text[], 0, true, 45
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_zemmer', 'f1', 't_f1_renaultsportformula1team', 'Zemmer', '', '',
    '{}'::text[], 0, true, 46
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_elijah', 'f1', 't_f1_hertzporsche', 'Elijah', '', '',
    '{}'::text[], 0, true, 47
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_jeffz', 'f1', 't_f1_saharaforceindiaf1team', 'Jeffz', '', '',
    '{}'::text[], 0, true, 48
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_yktommsthesequel', 'f1', 't_f1_aeroapexracing', 'yktomms the sequel', '', '',
    '{}'::text[], 0, true, 49
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_jamie', 'f1', 't_f1_renaultsportformula1team', 'Jamie', '', '',
    '{}'::text[], 0, true, 50
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_noel', 'f1', 't_f1_mercedesamg', 'Noel', '', '',
    '{}'::text[], 0, true, 51
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_gabi', 'f1', 't_f1_vodafonemclaren', 'Gabi', '', '',
    '{}'::text[], 0, true, 52
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_noah', 'f1', 't_f1_chonkebeeracingf1', 'Noah', '', '',
    '{}'::text[], 0, true, 53
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_tenbreakes', 'f1', 't_f1_aeroapexracing', 'Tenbreakes', '', '',
    '{}'::text[], 0, true, 54
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_albanana', 'f1', 't_f1_chonkebeeracingf1', 'Albanana', '', '',
    '{}'::text[], 0, true, 55
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_soulx', 'f1', 't_f1_vodafonemclaren', 'SoulX', '', '',
    '{}'::text[], 0, true, 56
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_milan', 'f1', 't_f1_cassienmotorsport', 'Milan', '', '',
    '{}'::text[], 0, true, 57
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_rma', 'f1', 't_f1_scuderiaferrari', 'RMA', '', '',
    '{}'::text[], 0, true, 58
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_clamzyro', 'f1', 't_f1_chonkebeeracingf1', 'Clamzyro', '', '',
    '{}'::text[], 0, true, 59
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_luddster', 'f1', 't_f1_hertzporsche', 'Luddster', '', '',
    '{}'::text[], 0, true, 60
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_whapples', 'f1', 't_f1_chonkebeeracingf1', 'Whapples', '', '',
    '{}'::text[], 0, true, 61
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_chester', 'f1', 't_f1_aeroapexracing', 'Chester', '', '',
    '{}'::text[], 0, true, 62
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f1_hakeman', 'f1', 't_f1_tbc', 'Hakeman', '', '',
    '{}'::text[], 0, true, 63
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f2_igorexe', 'f2', 't_f2_acurateampenske', 'Igorexe', '', '',
    '{}'::text[], 0, true, 42
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f2_batman', 'f2', 't_f2_nightreapersx', 'Batman', '', '',
    '{}'::text[], 0, true, 43
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f2_alistair', 'f2', 't_f2_camposracingf2', 'Alistair', '', '',
    '{}'::text[], 0, true, 44
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f2_neon', 'f2', 't_f2_renaultsportformula1team', 'Neon', '', '',
    '{}'::text[], 0, true, 45
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f2_jandosak', 'f2', 't_f2_cartiracingassociation', 'Jandosak', '', '',
    '{}'::text[], 0, true, 46
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f2_ash', 'f2', 't_f2_aeroapexracingf2', 'Ash', '', '',
    '{}'::text[], 0, true, 47
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f2_unknownuser', 'f2', NULL, 'unknown-user', '', '',
    '{}'::text[], 0, true, 48
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f2_aobro13', 'f2', 't_f2_cartiracingassociation', 'AObro13', '', '',
    '{}'::text[], 0, true, 49
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f2_shadowrex', 'f2', 't_f2_tarigysmotorsportteamf2', 'ShadowRex', '', '',
    '{}'::text[], 0, true, 50
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f2_indytogetsu', 'f2', 't_f2_okxhpcrimsongp', 'IndyTogetsu', '', '',
    '{}'::text[], 0, true, 51
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f2_santos', 'f2', 't_f2_racingpointf2', 'Santos', '', '',
    '{}'::text[], 0, true, 52
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f2_idkandidc', 'f2', NULL, 'idk and idc', '', '',
    '{}'::text[], 0, true, 53
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_pradx', 'f3', 't_f3_lmp', 'PradX', '', '',
    '{}'::text[], 0, true, 46
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_swixks', 'f3', 't_f3_cartiracingassociationf3', 'Swixks', '', '',
    '{}'::text[], 0, true, 47
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_chonki', 'f3', 't_f3_renaultsportformula1teamf3', 'Chonki', '', '',
    '{}'::text[], 0, true, 48
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_doa', 'f3', 't_f3_tarigysmotorsportteam', 'DOA', '', '',
    '{}'::text[], 0, true, 49
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_jimmy', 'f3', 't_f3_polasabremotorsports', 'Jimmy', '', '',
    '{}'::text[], 0, true, 50
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_fred', 'f3', 't_f3_glitchgpf3', 'Fred', '', '',
    '{}'::text[], 0, true, 51
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_silentz', 'f3', NULL, 'SilentZ', '', '',
    '{}'::text[], 0, true, 52
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_spring', 'f3', NULL, 'Spring', '', '',
    '{}'::text[], 0, true, 53
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_boby', 'f3', 't_f3_fastlinemotorsportf3team', 'Boby', '', '',
    '{}'::text[], 0, true, 54
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_ftl', 'f3', 't_f3_renaultsportformula3team', 'FTL', '', '',
    '{}'::text[], 0, true, 55
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_oshio', 'f3', NULL, 'OSHIO', '', '',
    '{}'::text[], 0, true, 56
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_avdla', 'f3', 't_f3_koguntechnologiesf3team', 'Avdla', '', '',
    '{}'::text[], 0, true, 57
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_gasly', 'f3', 't_f3_glitchgpf3', 'GASLY', '', '',
    '{}'::text[], 0, true, 58
  );
insert into public.drivers (id, series_id, team_id, name, code, num, aliases, carryover_pts, active, sort_order) values (
    'd_f3_bleh', 'f3', NULL, 'Bleh', '', '',
    '{}'::text[], 0, true, 59
  );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_01', 'f1', 'd_f1_michael', 'Michael', 'Mercedes-AMG',
      1, 26, false, false,
      '', 'Retired from championship — pts count for WCC only', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_01', 'f1', 'd_f1_nick', 'Nick', 'Scuderia Ferrari',
      1, 26, false, true,
      '', '50% rule Art. B.4.2', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_01', 'f1', 'd_f1_douzy', 'Douzy', 'Richard Mille LM Motorsport F1',
      2, 20, true, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_01', 'f1', 'd_f1_lory', 'Lory', 'Richard Mille LM Motorsport F1',
      3, 16, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_01', 'f1', 'd_f1_joshua', 'Joshua', 'Renault Sport Formula 1 Team',
      4, 13, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_01', 'f1', 'd_f1_ageftyg2', 'Ageftyg2', 'Vodafone McLaren',
      5, 11, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_01', 'f1', 'd_f1_dovantae', 'Dovantae', 'Aero Apex Racing',
      6, 9, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_01', 'f1', 'd_f1_vitality', 'Vitality', 'Scuderia Ferrari',
      7, 7, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_01', 'f1', 'd_f1_nath', 'Nath', 'GlitchGP F1 Team',
      8, 5, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_01', 'f1', 'd_f1_theo', 'theo', 'GlitchGP F1 Team',
      9, 3, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_01', 'f1', 'd_f1_lewis', 'Lewis', 'Sahara Force India F1 Team',
      10, 2, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_01', 'f1', 'd_f1_alpha', 'Alpha', 'Mercedes-AMG',
      11, 1, false, false,
      '', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_01', 'f1', 'd_f1_lightening', 'Lightening', 'Red Bull Racing',
      12, 1, false, false,
      '', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_01', 'f1', 'd_f1_juan', 'Juan', 'Vanguard Sabre Motorsport',
      13, 1, false, false,
      '', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_01', 'f1', 'd_f1_alex', 'Alex', 'Aero Apex Racing',
      14, 1, false, false,
      '', 'DNF (Reserve)', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_01', 'f1', 'd_f1_zemmer', 'Zemmer', 'Renault Sport Formula 1 Team',
      15, 1, false, false,
      '', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_01', 'f1', 'd_f1_elijah', 'Elijah', 'Hertz Porsche',
      16, 1, false, false,
      '', 'DNS', 'dns'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_02', 'f1', 'd_f1_nick', 'Nick', 'Scuderia Ferrari',
      1, 25, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_02', 'f1', 'd_f1_douzy', 'Douzy', 'Richard Mille LM Motorsport F1',
      2, 19, true, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_02', 'f1', 'd_f1_lory', 'Lory', 'Richard Mille LM Motorsport F1',
      3, 15, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_02', 'f1', 'd_f1_joshua', 'Joshua', 'Renault Sport Formula 1 Team',
      4, 12, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_02', 'f1', 'd_f1_dovantae', 'Dovantae', 'Aero Apex Racing',
      5, 10, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_02', 'f1', 'd_f1_nath', 'Nath', 'GlitchGP F1 Team',
      6, 8, false, false,
      '', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_02', 'f1', 'd_f1_sunrise', 'Sunrise', 'Hertz Porsche',
      7, 6, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_02', 'f1', 'd_f1_ageftyg2', 'Ageftyg2', 'Vodafone McLaren',
      8, 0, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_02', 'f1', 'd_f1_jeffz', 'Jeffz', 'Sahara Force India F1 Team',
      9, 0, false, false,
      '', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_02', 'f1', 'd_f1_elijah', 'Elijah', 'Hertz Porsche',
      10, 0, false, false,
      '', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_02', 'f1', 'd_f1_yktommsthesequel', 'yktomms the sequel', 'Aero Apex Racing',
      11, 0, false, false,
      '', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_02', 'f1', 'd_f1_vitality', 'Vitality', 'Scuderia Ferrari',
      12, 0, false, false,
      '', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_02', 'f1', 'd_f1_lewis', 'Lewis', 'Sahara Force India F1 Team',
      13, 0, false, false,
      '', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_03', 'f1', 'd_f1_douzy', 'Douzy', 'Richard Mille LM Motorsport F1',
      1, 25, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_03', 'f1', 'd_f1_lory', 'Lory', 'Richard Mille LM Motorsport F1',
      2, 18, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_03', 'f1', 'd_f1_jamie', 'Jamie', 'Renault Sport Formula 1 Team',
      3, 16, true, false,
      '', 'New Renault Sport Formula 1 Team MD1 (TBC)', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_03', 'f1', 'd_f1_sunrise', 'Sunrise', 'Hertz Porsche',
      4, 12, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_03', 'f1', 'd_f1_dovantae', 'Dovantae', 'Aero Apex Racing',
      5, 10, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_03', 'f1', 'd_f1_yktommsthesequel', 'yktomms the sequel', 'Aero Apex Racing',
      6, 8, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_04', 'f1', 'd_f1_jamie', 'Jamie', 'Renault Sport Formula 1 Team',
      1, 26, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_04', 'f1', 'd_f1_douzy', 'Douzy', 'Richard Mille LM Motorsport F1',
      2, 18, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_04', 'f1', 'd_f1_lory', 'Lory', 'Richard Mille LM Motorsport F1',
      3, 15, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_04', 'f1', 'd_f1_noel', 'Noel', 'Mercedes-AMG',
      4, 12, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_04', 'f1', 'd_f1_vitality', 'Vitality', 'Scuderia Ferrari',
      5, 10, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_04', 'f1', 'd_f1_dovantae', 'Dovantae', 'Aero Apex Racing',
      6, 8, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_04', 'f1', 'd_f1_john', 'John', 'Hertz Porsche',
      7, 6, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_04', 'f1', 'd_f1_sunrise', 'Sunrise', 'Hertz Porsche',
      8, 4, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_04', 'f1', 'd_f1_daih', 'Daih', 'Vanguard Sabre Motorsport',
      9, 2, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_04', 'f1', 'd_f1_gabi', 'Gabi', 'Vodafone McLaren',
      10, 1, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_04', 'f1', 'd_f1_yktommsthesequel', 'yktomms the sequel', 'Aero Apex Racing',
      11, 0, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_05', 'f1', 'd_f1_nick', 'Nick', 'Scuderia Ferrari',
      1, 26, true, true,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_05', 'f1', 'd_f1_jamie', 'Jamie', 'Isreal Racing Point',
      2, 18, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_05', 'f1', 'd_f1_noel', 'Noel', 'Mercedes-AMG',
      3, 15, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_05', 'f1', 'd_f1_douzy', 'Douzy', 'Richard Mille LM Motorsport F1',
      4, 12, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_05', 'f1', 'd_f1_noah', 'Noah', 'Chonkebee Racing F1',
      5, 10, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_05', 'f1', 'd_f1_lory', 'Lory', 'Richard Mille LM Motorsport F1',
      6, 8, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_05', 'f1', 'd_f1_tenbreakes', 'Tenbreakes', 'Aero Apex Racing',
      7, 6, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_05', 'f1', 'd_f1_john', 'John', 'Hertz Porsche',
      8, 4, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_05', 'f1', 'd_f1_gabi', 'Gabi', 'Vodafone McLaren',
      8, 2, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_05', 'f1', 'd_f1_albanana', 'Albanana', 'Chonkebee Racing F1',
      10, 1, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_05', 'f1', 'd_f1_soulx', 'SoulX', 'Vodafone McLaren',
      11, 0, false, false,
      '', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_05', 'f1', 'd_f1_milan', 'Milan', 'Cassien Motorsport',
      12, 0, false, false,
      '', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_05', 'f1', 'd_f1_rma', 'RMA', 'Scuderia Ferrari',
      13, 0, false, false,
      '', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_06', 'f1', 'd_f1_noel', 'Noel', 'Mercedes-AMG',
      1, 25, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_06', 'f1', 'd_f1_nick', 'Nick', 'Scuderia Ferrari',
      1, 25, false, false,
      '', '50% Rule', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_06', 'f1', 'd_f1_jamie', 'Jamie', 'Isreal Racing Point',
      2, 18, true, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_06', 'f1', 'd_f1_joshua', 'Joshua', 'Isreal Racing Point',
      3, 15, false, true,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_06', 'f1', 'd_f1_tenbreakes', 'Tenbreakes', 'Aero Apex Racing',
      4, 12, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_06', 'f1', 'd_f1_ageftyg2', 'Ageftyg2', 'Vodafone McLaren',
      5, 10, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_06', 'f1', 'd_f1_infinity', 'Infinity', 'Scuderia Ferrari',
      6, 8, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_06', 'f1', 'd_f1_theo', 'Theo', 'Monster Energy Performance',
      7, 6, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_06', 'f1', 'd_f1_douzy', 'Douzy', 'Richard Mille LM Motorsports F1',
      8, 4, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_06', 'f1', 'd_f1_lory', 'Lory', 'Richard Mille LM Motorsports F1',
      9, 0, false, false,
      '', 'DSQ', 'dsq'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_06', 'f1', 'd_f1_daih', 'Daih', 'Monster Cadillac F1',
      10, 0, false, false,
      '', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_06', 'f1', 'd_f1_lewis', 'Lewis', 'Cassien Motorsport',
      11, 0, false, false,
      '', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_06', 'f1', 'd_f1_noah', 'Noah', 'Chonkebee Racing F1',
      12, 0, false, false,
      '', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_07', 'f1', 'd_f1_nick', 'Nick', 'Scuderia Ferrari',
      1, 26, true, true,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_07', 'f1', 'd_f1_jamie', 'Jamie', 'Isreal Racing Point',
      2, 18, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_07', 'f1', 'd_f1_noel', 'Noel', 'Mercedes-AMG',
      3, 15, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_07', 'f1', 'd_f1_lory', 'Lory', 'Richard Mille LM Motorsports F1',
      4, 12, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_07', 'f1', 'd_f1_daih', 'Daih', 'Monster Cadillac F1',
      5, 10, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_07', 'f1', 'd_f1_tenbreakes', 'Tenbreakes', 'Aero Apex Racing',
      6, 8, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_07', 'f1', 'd_f1_ageftyg2', 'Ageftyg2', 'Vodafone McLaren',
      7, 0, false, false,
      '', 'DSQ', 'dsq'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_07', 'f1', 'd_f1_joshua', 'Joshua', 'Isreal Racing Point',
      8, 0, false, false,
      '', 'DSQ', 'dsq'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_07', 'f1', 'd_f1_clamzyro', 'Clamzyro', 'Chonkebee Racing F1',
      9, 0, false, false,
      '', 'DSQ', 'dsq'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_07', 'f1', 'd_f1_dovantae', 'Dovantae', 'Aero Apex Racing',
      10, 0, false, false,
      '', 'DNS', 'dns'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_07', 'f1', 'd_f1_luddster', 'Luddster', 'Hertz Porsche',
      11, 0, false, false,
      '', 'DNS', 'dns'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_07', 'f1', 'd_f1_whapples', 'Whapples', 'Chonkebee Racing F1',
      12, 0, false, false,
      '', 'DNS', 'dns'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_08', 'f1', 'd_f1_nick', 'Nick', 'Scuderia Ferrari',
      1, 26, true, true,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_08', 'f1', 'd_f1_douzy', 'Douzy', 'Richard Mille LM Motorsport F1',
      2, 18, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_08', 'f1', 'd_f1_skirmis', 'Skirmis', 'Richard Mille LM Motorsport F1',
      3, 15, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_08', 'f1', 'd_f1_daih', 'Daih', 'Monster Cadillac F1',
      4, 12, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_08', 'f1', 'd_f1_tenbreakes', 'Tenbreakes', 'Aero Apex Racing',
      5, 10, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_08', 'f1', 'd_f1_theo', 'Theo', 'Monster Energy Performance',
      6, 8, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_08', 'f1', 'd_f1_lewis', 'Lewis', 'Cassien Motorsport',
      8, 6, false, false,
      '', 'DSQ', 'dsq'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_08', 'f1', 'd_f1_sam', 'Sam', 'Cassien Motorsport',
      9, 4, false, false,
      '', 'DSQ', 'dsq'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_08', 'f1', 'd_f1_vitality', 'Vitality', 'Scuderia Ferrari',
      10, 2, false, false,
      '', 'DNS', 'dns'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_08', 'f1', 'd_f1_alpha', 'Alpha', 'Mercedes-AMG',
      11, 0, false, false,
      '', 'Mechanical Failure', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_08', 'f1', 'd_f1_chester', 'Chester', 'Aero Apex Racing',
      12, 0, false, false,
      '', 'DNS', 'dns'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_09', 'f1', 'd_f1_nick', 'Nick', 'Scuderia Ferrari',
      1, 25, false, false,
      '', 'Leader', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_09', 'f1', 'd_f1_ageftyg2', 'Ageftyg2', 'Scuderia Ferrari',
      2, 18, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_09', 'f1', 'd_f1_sly', 'Sly', 'Sahara Force India F1 Team',
      3, 15, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_09', 'f1', 'd_f1_sckibles', 'Sckibles', 'GlitchGP F1 Team',
      4, 12, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_09', 'f1', 'd_f1_tenbreakes', 'Tenbreakes', 'Vanguard Sabre Motorsport',
      5, 10, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_09', 'f1', 'd_f1_lewis', 'Lewis', 'Vanguard Sabre Motorsport',
      6, 8, false, false,
      '', '+1 Lap', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_09', 'f1', 'd_f1_noel', 'Noel', 'Mercedes-AMG',
      7, 0, false, false,
      '', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_09', 'f1', 'd_f1_sunrise', 'Sun_Rise', 'Hertz Porsche',
      8, 0, false, false,
      '', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_09', 'f1', 'd_f1_sam', 'Sam', 'Sahara Force India F1 Team',
      9, 0, false, false,
      '', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_09', 'f1', 'd_f1_nath', 'Nath', 'Mercedes-AMG',
      10, 0, false, false,
      '', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_09', 'f1', 'd_f1_hakeman', 'Hakeman', 'TBC',
      11, 0, false, false,
      '', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_09', 'f1', 'd_f1_jamie', 'Jamie', 'Richard Mille LM Motorsport F1',
      12, 0, false, false,
      '', 'DSQ', 'dsq'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_09', 'f1', 'd_f1_lory', 'Lory', 'Richard Mille LM Motorsport F1',
      13, 0, false, false,
      '', 'DSQ', 'dsq'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_10', 'f1', 'd_f1_nick', 'Nick', 'Scuderia Ferrari',
      1, 26, true, false,
      '', 'Leader (5s Pen) · Fastest Lap 1:06.566', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_10', 'f1', 'd_f1_jamie', 'Jamie', 'Richard Mille LM Motorsport F1',
      2, 18, false, false,
      '', '5s Penalty', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_10', 'f1', 'd_f1_sly', 'Sly', 'Sahara Force India F1 Team',
      3, 15, false, false,
      '', '5s Penalty', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_10', 'f1', 'd_f1_unironically', 'Unironically', 'Mercedes-AMG',
      4, 12, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_10', 'f1', 'd_f1_arin', 'Karazu Arin', 'Aero Apex Racing',
      5, 10, false, false,
      '', '5s Penalty', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_10', 'f1', 'd_f1_lory', 'Lory', 'Richard Mille LM Motorsport F1',
      6, 8, false, false,
      '', '10s Penalty', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_10', 'f1', 'd_f1_nath', 'Nath', 'Mercedes-AMG',
      7, 6, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_10', 'f1', 'd_f1_rats', 'Rats', 'Oracle Red Bull Racing F1',
      8, 4, false, false,
      '', '10s Penalty', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_10', 'f1', 'd_f1_bence', 'Bence', 'GlitchGP F1 Team',
      9, 2, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_10', 'f1', 'd_f1_sam', 'Sam', 'Sahara Force India F1 Team',
      10, 1, false, false,
      '', '15s Penalty', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_10', 'f1', 'd_f1_greenshinobi', 'GreenShinobi', 'Renault Sport Formula 1 Team',
      11, 0, false, false,
      '', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_10', 'f1', 'd_f1_ageftyg2', 'Ageftyg2', 'Scuderia Ferrari',
      12, 0, false, false,
      '', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_10', 'f1', 'd_f1_yokesecapo', 'Yokesecapo', 'GlitchGP F1 Team',
      13, 0, false, false,
      '', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_10', 'f1', 'd_f1_octi', 'Octi', 'Oracle Red Bull Racing F1',
      14, 0, false, false,
      '', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_10', 'f1', 'd_f1_igorexe', 'Igorexe', 'Hertz Porsche',
      15, 0, false, false,
      '', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_10', 'f1', 'd_f1_lewis', 'Lewis', 'Vanguard Sabre Motorsport',
      16, 0, false, false,
      '', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_10', 'f1', 'd_f1_amin', 'Amin', 'Renault Sport Formula 1 Team',
      17, 0, false, false,
      '', 'DSQ', 'dsq'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_11', 'f1', 'd_f1_nick', 'Nick', 'Scuderia Ferrari',
      1, 26, true, false,
      '', 'Leader', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_11', 'f1', 'd_f1_jamie', 'Jamie', 'Richard Mille LM Motorsport F1',
      2, 18, false, true,
      '', '+16.799', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_11', 'f1', 'd_f1_greenshinobi', 'GreenShinobi', 'Renault Sports Formula 1 Team',
      3, 15, false, false,
      '', '+28.000', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_11', 'f1', 'd_f1_lory', 'Lory', 'Richard Mille LM Motorsport F1',
      4, 12, false, false,
      '', '+47.914', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_11', 'f1', 'd_f1_gkf', 'gkf', 'Vodafone McLaren',
      5, 10, false, false,
      '', '+63.014', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_11', 'f1', 'd_f1_arin', 'Karazu Arin', 'Aero Apex Racing',
      6, 8, false, false,
      '', '+75.315 (20s Penalty)', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_11', 'f1', 'd_f1_yokesecapo', 'Yokesecapo', 'GlitchGP F1 Team',
      7, 6, false, false,
      '', '+1 Lap', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_11', 'f1', 'd_f1_unironically', 'Unironically', 'Mercedes-AMG',
      8, 4, false, false,
      '', '+1 Lap', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_11', 'f1', 'd_f1_ageftyg2', 'Ageftyg2', 'Scuderia Ferrari',
      9, 2, false, false,
      '', '+1 Lap', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_11', 'f1', 'd_f1_theo', 'Theo', 'Vodafone McLaren',
      10, 1, false, false,
      '', '+1 Lap', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_11', 'f1', 'd_f1_veinblong', 'Vein Blong', 'Sahara Force India F1 Team',
      11, 0, false, false,
      '', '+2 Laps', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_11', 'f1', 'd_f1_bence', 'Bence', 'Glitch GP F1 Team',
      12, 0, false, false,
      '', '+2 Laps', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_11', 'f1', 'd_f1_waffle', 'Waffle', 'Vanguard Sabre Motorsports',
      13, 0, false, false,
      '', '+2 Laps', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_11', 'f1', 'd_f1_sly', 'Sly', 'Sahara Force India F1 Team',
      14, 0, false, false,
      '', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_11', 'f1', 'd_f1_joshua', 'Joshua', 'Aero Apex Racing',
      15, 0, false, false,
      '', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_11', 'f1', 'd_f1_nath', 'Nath', 'Mercedes-AMG',
      16, 0, false, false,
      '', 'DNF (Ragequit cuz of CC Slowdown)', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_11', 'f1', 'd_f1_rats', 'Rats', 'Red Bull Racing F1 Team',
      17, 0, false, false,
      '', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_12', 'f1', 'd_f1_nick', 'Nick', 'Scuderia Ferrari',
      1, 25, false, false,
      '', 'Leader', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_12', 'f1', 'd_f1_lory', 'Lory', 'Richard Mille LM Motorsport F1',
      2, 19, true, false,
      '', '+4.467', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_12', 'f1', 'd_f1_sly', 'Sly', 'Sahara Force India F1 Team',
      3, 15, false, true,
      '', '+39.149', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_12', 'f1', 'd_f1_amin', 'Amin', 'Renault Sports Formula 1 Team',
      4, 12, false, false,
      '', '+68.452', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_12', 'f1', 'd_f1_arin', 'Karazu Arin', 'Aero Apex Racing',
      5, 10, false, false,
      '', '+84.630', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_12', 'f1', 'd_f1_gkf', 'gkf', 'Vodafone McLaren',
      6, 8, false, false,
      '', '+94.913', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_12', 'f1', 'd_f1_bence', 'Bence', 'GlitchGP F1 Team',
      7, 6, false, false,
      '', '+1 Lap', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_12', 'f1', 'd_f1_peters', 'Peters', 'Richard Mille LM Motorsport F1',
      8, 4, false, false,
      '', '+2 Laps', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_12', 'f1', 'd_f1_yuki', 'Yuki', 'GlitchGP F1 Team',
      9, 2, false, false,
      '', '+2 Laps', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_12', 'f1', 'd_f1_infinity', 'Infinity', 'Aero Apex Racing',
      10, 0, false, false,
      '', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_12', 'f1', 'd_f1_maldonado', 'Maldonado', 'Red Bull Racing F1 Team',
      11, 0, false, false,
      '', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_12', 'f1', 'd_f1_veinblong', 'Vein Blong', 'Sahara Force India F1 Team',
      12, 0, false, false,
      '', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_12', 'f1', 'd_f1_vitality', 'Vitality', 'Scuderia Ferrari',
      13, 0, false, false,
      '', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_12', 'f1', 'd_f1_leo', 'Leo', 'Mercedes-AMG',
      12, 0, false, false,
      '', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_12', 'f1', 'd_f1_waffle', 'Waffle', 'Vanguard Sabre Motorsports',
      13, 0, false, false,
      '', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_12', 'f1', 'd_f1_octi', 'Octi', 'Red Bull Racing F1 Team',
      14, 0, false, false,
      '', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_02', 'f2', 'd_f2_gamrin', 'Gamrin', 'LM Performance F2',
      1, 23, false, true,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_02', 'f2', 'd_f2_skirmis', 'Skirmis', 'LM Performance F2',
      2, 18, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_02', 'f2', 'd_f2_style', 'Style', 'Renault Sport Formula 1 Team',
      3, 16, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_02', 'f2', 'd_f2_crocs', 'Crocs', 'Acura Team Penske',
      4, 14, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_02', 'f2', 'd_f2_igorexe', 'Igorexe', 'Acura Team Penske',
      5, 12, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_02', 'f2', 'd_f2_gasly', 'Gasly', 'AF Corsa',
      6, 10, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_02', 'f2', 'd_f2_nahim', 'Nahim', 'Renault Sport Formula 1 Team',
      7, 8, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_02', 'f2', 'd_f2_batman', 'Batman', 'Night Reapers X',
      8, 0, false, false,
      '', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_02', 'f2', 'd_f2_alistair', 'Alistair', 'Campos Racing F2',
      9, 0, false, false,
      '', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_03', 'f2', 'd_f2_skirmis', 'Skirmis', 'LM Performance F2',
      1, 20, false, true,
      '', 'Leader', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_03', 'f2', 'd_f2_gamrin', 'Gamrin', 'LM Performance F2',
      2, 18, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_03', 'f2', 'd_f2_neon', 'Neon', 'Renault Sport Formula 1 Team',
      3, 16, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_03', 'f2', 'd_f2_batman', 'Batman', 'Night Reapers X',
      4, 15, true, false,
      '', 'Fastest Lap', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_03', 'f2', 'd_f2_crocs', 'Crocs', 'Acura Team Penske',
      5, 12, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_04', 'f2', 'd_f2_gamrin', 'Gamrin', 'LM Performance F2',
      1, 22, false, true,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_04', 'f2', 'd_f2_skirmis', 'Skirmis', 'LM Performance F2',
      2, 19, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_04', 'f2', 'd_f2_neon', 'neon', 'Renault Sport Formula 1 Team',
      3, 16, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_04', 'f2', 'd_f2_jandosak', 'Jandosak', 'Carti Racing Association',
      4, 14, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_04', 'f2', 'd_f2_ash', 'Ash', 'Aero Apex Racing F2',
      5, 12, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_04', 'f2', 'd_f2_zayn', 'ZAYN', 'AF Corsa',
      6, 10, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_04', 'f2', 'd_f2_nahim', 'Nahim', 'Renault Sport Formula 1 Team',
      7, 0, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_04', 'f2', 'd_f2_alistair', 'Alistair', 'Campos Racing F2',
      8, 0, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_04', 'f2', 'd_f2_batman', 'Batman', 'Night Reapers X',
      9, 0, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_06', 'f2', 'd_f2_gamrin', 'Gamrin', 'Renault Sport Formula 2 Team',
      1, 25, false, false,
      '', '10s Pen', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_06', 'f2', 'd_f2_crocs', 'Crocs', 'Carti Racing Association',
      2, 20, true, false,
      '', '+1.616', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_06', 'f2', 'd_f2_peters', 'Peters', 'LM Performance F2',
      3, 15, false, false,
      '', '+16.265', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_06', 'f2', 'd_f2_maldonado', 'Maldonado', 'Tarigy''s Motorsport Team F2',
      4, 12, false, false,
      '', '5s Pen', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_06', 'f2', 'd_f2_alien', 'Alien', 'Nissan Nissmo',
      5, 11, false, false,
      '', '5s Pen · +1 Lap', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_06', 'f2', 'd_f2_zaphira', 'Zaphira', 'Nissan Nissmo',
      6, 8, false, false,
      '', '+1 Lap', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_06', 'f2', 'd_f2_unknownuser', 'unknown-user', '',
      7, 0, false, false,
      '', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_06', 'f2', 'd_f2_skirmis', 'Skirmis', 'LM Performance F2',
      8, 0, false, false,
      '', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_06', 'f2', 'd_f2_aobro13', 'AObro13', 'Carti Racing Association',
      9, 0, false, false,
      '', 'DNS', 'dns'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_09', 'f2', 'd_f2_juan', 'Juantoes', 'Carti Racing Association',
      1, 27, true, false,
      '', 'Leader', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_09', 'f2', 'd_f2_skirmis', 'Skirmis', 'LM Performance F2',
      2, 18, false, false,
      '', '+4.433', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_09', 'f2', 'd_f2_crocs', 'Crocs', 'Carti Racing Association',
      3, 15, false, false,
      '', '+7.752', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_09', 'f2', 'd_f2_alien', 'Alien', 'Nissan Nissmo',
      4, 12, false, false,
      '', '+25.452', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_09', 'f2', 'd_f2_wavee', 'wavee', 'Racing Point F2',
      5, 10, false, false,
      '', '+29.866', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_09', 'f2', 'd_f2_peters', 'Peters', 'LM Performance F2',
      6, 8, false, false,
      '', '+35.266', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_09', 'f2', 'd_f2_gamrin', 'Gamrin', 'Renault Sport Formula 2 Team',
      7, 7, false, true,
      '', '+1 Lap', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_09', 'f2', 'd_f2_vittorioso', 'Vittorioso', 'Nissan Nissmo',
      8, 0, false, false,
      '', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_09', 'f2', 'd_f2_gui', 'Gui', 'Renault Sport Formula 2 Team',
      9, 0, false, false,
      '', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_09', 'f2', 'd_f2_shadowrex', 'ShadowRex', 'Tarigy''s Motorsport Team F2',
      10, 0, false, false,
      '', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_09', 'f2', 'd_f2_danomk', 'Danomk', 'PREMA Fast Line Racing',
      11, 0, false, false,
      '', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_09', 'f2', 'd_f2_indytogetsu', 'IndyTogetsu', 'OKX HP Crimson GP',
      12, 0, false, false,
      '', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_09', 'f2', 'd_f2_santos', 'Santos', 'Racing Point F2',
      13, 0, false, false,
      '', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_09', 'f2', 'd_f2_fandrs', 'Fandrs', 'PREMA Fast Line Racing',
      14, 0, false, false,
      '', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_11', 'f2', 'd_f2_juan', 'Juantoes', 'Carti Racing Association',
      1, 28, true, true,
      '', 'Leader', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_11', 'f2', 'd_f2_skirmis', 'Skirmis', 'LM Performance F2',
      2, 18, false, false,
      '', '+4.033', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_11', 'f2', 'd_f2_peters', 'Peters', 'LM Performance F2',
      3, 15, false, false,
      '', '+15.116', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_11', 'f2', 'd_f2_crocs', 'Crocs', 'Carti Racing Association',
      4, 12, false, false,
      '', '12', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_11', 'f2', 'd_f2_kyo', 'EXO_Kyo', 'Aero Apex Racing F2',
      5, 10, false, false,
      '', '+16.418', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_11', 'f2', 'd_f2_alien', 'Alien', 'Nissan Nissmo',
      6, 8, false, false,
      '', '+33.432', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_11', 'f2', 'd_f2_gamrin', 'Gamrin', 'Renault Sport Formula 2 Team',
      7, 6, false, false,
      '', '+44.356', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_11', 'f2', 'd_f2_gui', 'Gui', 'Renault Sport Formula 2 Team',
      8, 4, false, false,
      '', '+57.181', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_11', 'f2', 'd_f2_nahim', 'Nahim', 'Vanguard Sabre Racing',
      9, 2, false, false,
      '', '+1 Lap', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_11', 'f2', 'd_f2_zaphira', 'Zaphira', 'Nissan Nissmo',
      10, 1, false, false,
      '', '+1 Lap', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_11', 'f2', 'd_f2_maldonado', 'Maldonado', 'Tarigy''s Motorsport Team F2',
      11, 0, false, false,
      '', '+2 Laps', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_11', 'f2', 'd_f2_idkandidc', 'idk and idc', '',
      12, 0, false, false,
      '', 'Not Classified', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_02', 'f3', 'd_f3_pradx', 'PradX', 'LMP',
      1, 21, false, true,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_02', 'f3', 'd_f3_ukizi', 'Ukizi', 'LMP',
      2, 18, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_02', 'f3', 'd_f3_piko', 'Piko', 'LMP',
      3, 16, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_02', 'f3', 'd_f3_peters', 'Peters', 'Tarigy''s Motorsport Team',
      4, 14, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_02', 'f3', 'd_f3_bartos', 'Bartos', 'Aero Apex Racing F3',
      5, 14, true, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_02', 'f3', 'd_f3_yellowrice', 'YellowR1ce', 'Renault Sport Formula 1 Team F3',
      6, 10, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_02', 'f3', 'd_f3_swixks', 'Swixks', 'Carti Racing Association F3',
      7, 8, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_02', 'f3', 'd_f3_fabian', 'Fabián', 'Tarigy''s Motorsport Team F3',
      8, 6, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_02', 'f3', 'd_f3_chonki', 'Chonki', 'Renault Sport Formula 1 Team F3',
      9, 4, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_03', 'f3', 'd_f3_piko', 'Piko', 'LMP',
      1, 20, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_03', 'f3', 'd_f3_doa', 'DOA', 'Tarigy''s Motorsport Team',
      2, 18, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_03', 'f3', 'd_f3_fabian', 'Fabián', 'Tarigy''s Motorsport Team F3',
      3, 16, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_03', 'f3', 'd_f3_peters', 'Peters', 'Tarigy''s Motorsport Team',
      4, 15, true, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_03', 'f3', 'd_f3_pradx', 'PradX', 'LMP',
      5, 12, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_03', 'f3', 'd_f3_chonki', 'Chonki', 'Renault Sport Formula 1 Team F3',
      6, 10, false, false,
      '', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_03', 'f3', 'd_f3_ukizi', 'Ukizi', 'LMP',
      7, 8, false, false,
      '', 'LMP driver', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_09', 'f3', 'd_f3_jeffz', 'Jeffz', 'LM Performance F3',
      1, 27, true, false,
      'Leader', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_09', 'f3', 'd_f3_piko', 'Piko', 'LM Performance F3',
      2, 19, false, true,
      '+0.132', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_09', 'f3', 'd_f3_fabian', 'Fabián', 'Tarigy''s Motorsport Team F3',
      3, 15, false, false,
      '+8.115', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_09', 'f3', 'd_f3_darkshadow', 'Dark Shadow', 'Pola Sabre Motorsports',
      4, 12, false, false,
      '+10.994', '6s Penalty', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_09', 'f3', 'd_f3_piti', 'Piti', 'Anonymous Juniors',
      5, 10, false, false,
      '+12.119', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_09', 'f3', 'd_f3_ellie', 'ellie', 'Kogun Technologies F3 Team',
      6, 8, false, false,
      '+12.743', '5s Penalty', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_09', 'f3', 'd_f3_jardin', 'Jardin', 'LM Performance F3',
      7, 6, false, false,
      '+17.265', '11s Penalty', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_09', 'f3', 'd_f3_bartos', 'Bartos', 'Pola Sabre Motorsports',
      8, 4, false, false,
      '+17.750', '10s Penalty', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_09', 'f3', 'd_f3_ljs', 'LJS', 'Anonymous Juniors',
      9, 2, false, false,
      '+28.280s', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_09', 'f3', 'd_f3_jimmy', 'Jimmy', 'Pola Sabre Motorsports',
      10, 0, false, false,
      'DNF', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_09', 'f3', 'd_f3_maslo', 'Maslo', 'Aston Martin Racing F3',
      11, 0, false, false,
      'DNF', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_09', 'f3', 'd_f3_tta', 'Tta', 'Aston Martin Racing F3',
      12, 0, false, false,
      'DNF', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_09', 'f3', 'd_f3_mikey', 'Mikey', 'Aston Martin Racing F3',
      13, 0, false, false,
      'DNF', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_09', 'f3', 'd_f3_fred', 'Fred', 'GlitchGP F3',
      14, 0, false, false,
      'DNF', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_09', 'f3', 'd_f3_silentz', 'SilentZ', '',
      15, 0, false, false,
      'DNS', 'DNS', 'dns'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_09', 'f3', 'd_f3_halo', 'Halo', 'Anonymous Juniors',
      16, 0, false, false,
      'DNS', 'DNS', 'dns'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_10', 'f3', 'd_f3_piko', 'Piko', 'LM Performance F3',
      1, 28, true, true,
      'Leader', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_10', 'f3', 'd_f3_ukkiett', 'Ukkiett', 'Carti Racing Association F3',
      2, 18, false, false,
      '+7.410', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_10', 'f3', 'd_f3_bartos', 'Bartos', 'Pola Sabre Motorsports',
      3, 15, false, false,
      '+8.333', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_10', 'f3', 'd_f3_darkshadow', 'Dark Shadow', 'Pola Sabre Motorsports',
      4, 12, false, false,
      '+8.483', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_10', 'f3', 'd_f3_lancelot', 'Lancelot', 'Tarigy''s Motorsport Team F3',
      5, 10, false, false,
      '+14.091', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_10', 'f3', 'd_f3_kriekel', 'Kriekel', 'LM Performance F3',
      6, 8, false, false,
      '+30.106', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_10', 'f3', 'd_f3_fabian', 'Fabián', 'Tarigy''s Motorsport Team F3',
      7, 6, false, false,
      '+30.508', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_10', 'f3', 'd_f3_yellowrice', 'Rice', 'Renault Sport Formula 3 Team',
      8, 4, false, false,
      '+46.782', '5s Pen', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_10', 'f3', 'd_f3_syxe', 'syxe', 'GlitchGP F3',
      9, 2, false, false,
      '+1 Lap', '5s Pen', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_10', 'f3', 'd_f3_ljs', 'LJS', 'Anonymous Juniors',
      10, 1, false, false,
      '+1 Lap', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_10', 'f3', 'd_f3_jardin', 'Jardin', 'LM Performance F3',
      11, 0, false, false,
      'DNF', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_10', 'f3', 'd_f3_maslo', 'Maslo', 'Aston Martin Racing F3',
      12, 0, false, false,
      'DNF', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_10', 'f3', 'd_f3_piti', 'Piti', 'Anonymous Juniors',
      13, 0, false, false,
      'DNF', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_10', 'f3', 'd_f3_elmanco010', 'El_Manco010', 'Tarigy''s Motorsport Team F3',
      14, 0, false, false,
      'DNF', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_10', 'f3', 'd_f3_spring', 'Spring', '',
      15, 0, false, false,
      'DNF', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_10', 'f3', 'd_f3_boby', 'Boby', 'Fast Line Motorsport F3 Team',
      16, 0, false, false,
      'DNF', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_10', 'f3', 'd_f3_mikey', 'Mikey', 'Aston Martin Racing F3',
      17, 0, false, false,
      'DNF', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_10', 'f3', 'd_f3_elden', 'Elden', 'Aero Apex Racing F3',
      18, 0, false, false,
      'DNF', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_10', 'f3', 'd_f3_ftl', 'FTL', 'Renault Sport Formula 3 Team',
      19, 0, false, false,
      'DSQ', 'DSQ', 'dsq'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_10', 'f3', 'd_f3_oshio', 'OSHIO', '',
      20, 0, false, false,
      'DSQ', 'DSQ', 'dsq'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_11', 'f3', 'd_f3_jeffz', 'Jeffz', 'LM Performance F3',
      1, 28, true, true,
      'Leader', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_11', 'f3', 'd_f3_bartos', 'Bartos', 'Pola Sabre Motorsports',
      2, 18, false, false,
      '+7.083', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_11', 'f3', 'd_f3_ukkiett', 'Ukkiett', 'Carti Racing Association F3',
      3, 15, false, false,
      '+10.516', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_11', 'f3', 'd_f3_lancelot', 'Lancelot', 'Tarigy''s Motorsport Team F3',
      4, 12, false, false,
      '+10.702', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_11', 'f3', 'd_f3_piko', 'Piko', 'LM Performance F3',
      5, 10, false, false,
      '+11.367', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_11', 'f3', 'd_f3_sckibles', 'SCKIBLES', 'GlitchGP F3',
      6, 8, false, false,
      '+15.400', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_11', 'f3', 'd_f3_fabian', 'Fabián', 'Tarigy''s Motorsport Team F3',
      7, 6, false, false,
      '+20.832', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_11', 'f3', 'd_f3_jardin', 'Jardin', 'LM Performance F3',
      8, 4, false, false,
      '+29.048', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_11', 'f3', 'd_f3_yellowrice', 'Rice', 'Renault Sport Formula 3 Team',
      9, 2, false, false,
      '+37.632', '10s Pen', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_11', 'f3', 'd_f3_avdla', 'Avdla', 'Kogun Technologies F3 Team',
      10, 0, false, false,
      'DNF', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_11', 'f3', 'd_f3_maslo', 'Maslo', 'Aston Martin Racing F3',
      11, 0, false, false,
      'DNF', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_11', 'f3', 'd_f3_gasly', 'GASLY', 'GlitchGP F3',
      12, 0, false, false,
      'DNF', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_11', 'f3', 'd_f3_syxe', 'syxe', 'GlitchGP F3',
      13, 0, false, false,
      'DNF', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_11', 'f3', 'd_f3_mikey', 'Mikey', 'Aston Martin Racing F3',
      14, 0, false, false,
      'DNF', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_11', 'f3', 'd_f3_piti', 'Piti', 'Anonymous Juniors',
      15, 0, false, false,
      'DNF', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_11', 'f3', 'd_f3_elf', 'Elf', 'Pola Sabre Motorsports',
      16, 0, false, false,
      'DNF', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_13', 'f1', 'd_f1_nick', 'Nick', 'Scuderia Ferrari',
      1, 26, true, false,
      '', 'Leader · Fastest Lap', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_13', 'f1', 'd_f1_yokesecapo', 'yokesecapo', 'GlitchGP F1 Team',
      2, 18, false, false,
      '', '+33.868 (10s Pen)', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_13', 'f1', 'd_f1_lory', 'Lory', 'Richard Mille LM Motorsport F1',
      3, 15, false, false,
      '', '+50.206 (10s Pen)', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_13', 'f1', 'd_f1_shadowrex', 'ShadowRex', 'Tarigy''s Motorsport Team F1',
      4, 12, false, false,
      '', '+66.723 (30s Pen)', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_13', 'f1', 'd_f1_theo', 'theo', 'Vodafone McLaren',
      5, 10, false, false,
      '', '+74.701', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_13', 'f1', 'd_f1_sckibles', 'SCKIBLES', 'GlitchGP F1 Team',
      6, 8, false, false,
      '', '+1 Lap', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_13', 'f1', 'd_f1_arin', 'Karazu Arin', 'Aero Apex Racing',
      7, 6, false, false,
      '', '+1 Lap (20s Pen)', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_13', 'f1', 'd_f1_vitality', 'Vitality', 'Scuderia Ferrari',
      8, 4, false, false,
      '', '+1 Lap', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_13', 'f1', 'd_f1_gkf', 'gkf', 'Vodafone McLaren',
      9, 2, false, false,
      '', '+2 Laps', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_13', 'f1', 'd_f1_emirovic', 'Emirovic', 'Mercedes-AMG',
      10, 1, false, false,
      '', '+2 Laps (15s Pen)', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_13', 'f1', 'd_f1_unironically', 'Unironically', 'Mercedes-AMG',
      11, 0, false, false,
      '', '+4 Laps', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_13', 'f1', 'd_f1_octi', 'Octi', 'Tarigy''s Motorsport Team F1',
      12, 0, false, false,
      '', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_13', 'f2', 'd_f2_juan', 'Juantoes', 'Carti Racing Association',
      1, 27, true, false,
      '', 'Leader · Fastest Lap', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_13', 'f2', 'd_f2_crocs', 'Crocs', 'Carti Racing Association',
      2, 18, false, false,
      '', '+10.150', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_13', 'f2', 'd_f2_skirmis', 'Skirmis', 'LM Performance F2',
      3, 15, false, false,
      '', '+13.017', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_13', 'f2', 'd_f2_gamrin', 'Gamrin', 'Renault Sport Formula 2 Team',
      4, 13, false, true,
      '', '+21.466 (10s Pen)', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_13', 'f2', 'd_f2_alien', 'Alien', 'Nissan Nissmo',
      5, 10, false, false,
      '', '+48.722', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_13', 'f2', 'd_f2_gui', 'Gui', 'Renault Sport Formula 2 Team',
      6, 8, false, false,
      '', '+54.042', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_13', 'f2', 'd_f2_ao', 'AO', 'BMW Sauber F2 Team',
      7, 6, false, false,
      '', '+87.996', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_13', 'f2', 'd_f2_kyo', 'EXO_Kyo', 'Aero Apex Racing F2',
      8, 4, false, false,
      '', '+95.928', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_13', 'f2', 'd_f2_dante', 'dante', 'Tarigy''s Motorsport Team F2',
      9, 2, false, false,
      '', '+1 Lap', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_13', 'f2', 'd_f2_fb', 'Fb', 'Aero Apex Racing F2',
      10, 1, false, false,
      '', '+1 Lap', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_13', 'f3', 'd_f3_bartos', 'Bartos', 'Pola Sabre Motorsports',
      1, 25, false, false,
      'Leader', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_13', 'f3', 'd_f3_darkshadow', 'Dark Shadow', 'Pola Sabre Motorsports',
      2, 18, false, false,
      '+1.139', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_13', 'f3', 'd_f3_piko', 'Piko', 'LM Performance F3',
      3, 18, true, true,
      '+3.389', 'Fastest Lap · Pole', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_13', 'f3', 'd_f3_jeffz', 'Jeffz', 'LM Performance F3',
      4, 12, false, false,
      '+4.706', '5s Pen', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_13', 'f3', 'd_f3_fabian', 'Fabián', 'Tarigy''s Motorsport Team F3',
      5, 10, false, false,
      '+10.456', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_13', 'f3', 'd_f3_ukkiett', 'ukkiett', 'Carti Racing Association F3',
      6, 8, false, false,
      '+12.822', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_13', 'f3', 'd_f3_lancelot', 'Lancelot', 'Tarigy''s Motorsport Team F3',
      7, 6, false, false,
      '+12.989', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_13', 'f3', 'd_f3_wibz', 'Wibz', 'Carti Racing Association F3',
      8, 4, false, false,
      '+14.914', '5s Pen', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_13', 'f3', 'd_f3_bence', 'Bence', 'GlitchGP F3',
      9, 2, false, false,
      '+16.572', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_13', 'f3', 'd_f3_syxe', 'syxe', 'GlitchGP F3',
      10, 1, false, false,
      '+28.805', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_13', 'f3', 'd_f3_maslo', 'Maslo', 'Aston Martin Racing F3',
      11, 0, false, false,
      '+52.371', '', 'classified'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_13', 'f3', 'd_f3_yellowrice', 'Rice', 'Renault Sport Formula 3 Team',
      12, 0, false, false,
      'DNF', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_13', 'f3', 'd_f3_kashin', 'Kashin', 'BMW Sauber F3 Team',
      13, 0, false, false,
      'DNF', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_13', 'f3', 'd_f3_hakeman', 'Hakeman', 'GlitchGP F3',
      14, 0, false, false,
      'DNF', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_13', 'f3', 'd_f3_genghis', 'Genghis', 'BMW Sauber F3 Team',
      15, 0, false, false,
      'DNF', 'DNF', 'dnf'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_13', 'f3', 'd_f3_bleh', 'Bleh', '',
      16, 0, false, false,
      'DNS', 'DNS', 'dns'
    );
insert into public.race_results (race_id, series_id, driver_id, driver_name, team_name, pos, pts, fl, pole, gap, note, status) values (
      'r_13', 'f3', 'd_f3_roven', 'Roven', 'BMW Sauber F3 Team',
      17, 0, false, false,
      'DNS', 'DNS', 'dns'
    );
select public.vms_recompute_series('f1');
select public.vms_recompute_series('f2');
select public.vms_recompute_series('f3');

insert into public.app_meta (key, value) values ('seed_source', '{"file":"index.html","note":"Datos reales VMS 2026"}'::jsonb);

commit;

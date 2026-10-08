-- VMS / Velocity Motorsport Series
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

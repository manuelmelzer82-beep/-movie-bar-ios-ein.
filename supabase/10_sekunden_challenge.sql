-- Movie Bar – 10-Sekunden-Challenge: kostenlose, öffentliche Übungs-Bestenliste
-- In Supabase SQL Editor ausführen. Keine echten Gewinne.
create extension if not exists pgcrypto;

create table if not exists public.movie_challenge_scores (
  id uuid primary key default gen_random_uuid(),
  player_name text not null check (char_length(btrim(player_name)) between 2 and 28),
  elapsed_seconds numeric(12,4) not null check (elapsed_seconds between 0.0001 and 60.0000),
  difference_seconds numeric(12,4) generated always as (abs(elapsed_seconds - 10.0000)) stored,
  created_at timestamptz not null default now()
);
create index if not exists movie_challenge_scores_rank_idx
  on public.movie_challenge_scores (difference_seconds asc, created_at asc);
create index if not exists movie_challenge_scores_created_idx
  on public.movie_challenge_scores (created_at desc);

alter table public.movie_challenge_scores enable row level security;
revoke all on public.movie_challenge_scores from public, anon, authenticated;
grant select on public.movie_challenge_scores to anon, authenticated;

drop policy if exists "Public leaderboard read" on public.movie_challenge_scores;
create policy "Public leaderboard read"
  on public.movie_challenge_scores for select to anon, authenticated using (true);

-- Direkte INSERT/UPDATE/DELETE-Rechte bleiben gesperrt.
-- Diese RPC erlaubt nur validierte Übungs-Ergebnisse.
-- Achtung: Browser-Zeiten sind manipulierbar. Nicht für Preisgeld verwenden.
create or replace function public.movie_challenge_submit(
  p_player_name text,
  p_elapsed_seconds numeric
) returns table (score_id uuid, recorded_seconds numeric, deviation_seconds numeric)
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_name text := btrim(p_player_name);
  v_score public.movie_challenge_scores%rowtype;
begin
  if v_name is null or char_length(v_name) not between 2 and 28
     or v_name ~ '[[:cntrl:]]'
     or p_elapsed_seconds is null
     or p_elapsed_seconds < 0.0001
     or p_elapsed_seconds > 60.0000 then
    raise exception 'Ungültiger Name oder ungültige Zeit';
  end if;
  insert into public.movie_challenge_scores(player_name, elapsed_seconds)
  values (v_name, round(p_elapsed_seconds, 4))
  returning * into v_score;
  return query select v_score.id, v_score.elapsed_seconds, v_score.difference_seconds;
end;
$$;
revoke all on function public.movie_challenge_submit(text,numeric) from public;
grant execute on function public.movie_challenge_submit(text,numeric) to anon, authenticated;

-- Abruf der Top 20:
-- select player_name, elapsed_seconds, difference_seconds, created_at
-- from public.movie_challenge_scores
-- order by difference_seconds asc, created_at asc limit 20;

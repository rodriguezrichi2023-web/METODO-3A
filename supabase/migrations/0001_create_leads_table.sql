-- Método 3A — leads table
-- Mirrors the lead object shape saved by saveLead() in "Auditoria 3A - Kinetic.dc.html"
-- and read/written by "Admin Leads.dc.html". See project/uploads/PRD-Metodo3A-v2.md §5.4.

create table if not exists public.leads (
  id                  uuid primary key default gen_random_uuid(),
  created_at          timestamptz not null default now(),
  nombre              text not null,
  email               text not null,
  pais                text,
  instagram_username  text,
  nicho               text,
  score_total         integer,          -- raw points, 0-380, internal only
  temperatura         text,             -- frio | tibio | caliente | urgente, internal only
  pilar_atraccion_pct integer,          -- 0-100, shown to user
  pilar_autoridad_pct integer,          -- 0-100, shown to user
  pilar_audiencia_pct integer,          -- 0-100, shown to user
  respuestas          jsonb,            -- the 11 question answers, keyed by question id
  flags               jsonb,            -- alta_probabilidad_cierre / contacto_prioritario / calificado_financieramente
  estado              text not null default 'nuevo',
  notas               text,
  cta_clicked         boolean not null default false,

  constraint leads_estado_check
    check (estado in ('nuevo', 'contactado', 'agendado', 'cliente', 'descartado')),
  constraint leads_temperatura_check
    check (temperatura is null or temperatura in ('frio', 'tibio', 'caliente', 'urgente'))
);

create index if not exists leads_created_at_idx  on public.leads (created_at desc);
create index if not exists leads_estado_idx      on public.leads (estado);
create index if not exists leads_temperatura_idx on public.leads (temperatura);
create index if not exists leads_pais_idx        on public.leads (pais);
create index if not exists leads_nicho_idx       on public.leads (nicho);

alter table public.leads enable row level security;

-- Anyone (including unauthenticated test-takers) can create a lead, but never read or
-- modify one — this keeps the public gate/test flow able to write without exposing
-- other people's data.
create policy "public can insert leads"
  on public.leads
  for insert
  to anon, authenticated
  with check (true);

-- Only signed-in users (Ricardo, via Supabase Auth) can read/update/delete leads.
-- A single admin account is expected; tighten further with `auth.jwt() ->> 'email' = '<ADMIN_EMAIL>'`
-- in the USING clause if more than one authenticated user could ever exist.
create policy "authenticated can read leads"
  on public.leads
  for select
  to authenticated
  using (true);

create policy "authenticated can update leads"
  on public.leads
  for update
  to authenticated
  using (true)
  with check (true);

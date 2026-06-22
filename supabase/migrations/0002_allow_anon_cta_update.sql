-- markCta() in "Auditoria 3A - Kinetic.dc.html" updates cta_clicked from the public
-- test flow, before any Supabase Auth session exists — so it runs as `anon`.
-- The existing "authenticated can update leads" policy doesn't cover that role,
-- so the update was silently rejected by RLS and cta_clicked never persisted.
--
-- Scope the fix tightly: anon may only ever write the cta_clicked column (enforced
-- by the column-level grant, independent of the permissive USING/WITH CHECK below),
-- and only on rows it can already see via the public insert policy's row shape.
grant update (cta_clicked) on public.leads to anon;

create policy "public can update cta_clicked"
  on public.leads
  for update
  to anon
  using (true)
  with check (true);

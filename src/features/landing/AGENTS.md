**Scope**
- Landing page feature components (hero, sections, CTAs, logo cloud, footers) with locale support.

**Key Files**
- `src/features/landing/CenteredHero.tsx:1` — hero section
- `src/features/landing/CTABanner.tsx:1` — call-to-action banner
- `src/features/landing/LogoCloud.tsx:1` — logos grid
- `src/features/landing/CenteredFooter.tsx:1` — footer section
- `src/features/landing/Section.tsx:1` — generic section wrapper

**Commands**
- `dev` — preview landing updates
- `storybook` — iterate on section components
- `lint` / `check-types` — quality gates
- `test` — unit tests for rendering and copy

**Tasks**
- Update marketing copy and i18n keys; ensure FR/EN parity.
- Keep layout responsive and accessible; test on mobile.
- Provide stories for each section with sample content.

**Testing**
- Unit: render components and assert visible text.
- E2E: home route smoke and i18n switching (`tests/e2e/Visual.e2e.ts:1`, `tests/e2e/I18n.e2e.ts:1`).

**Integration**
- Used by public pages under `src/app/[locale]/(unauth)/page.tsx:1`.
- Consumes shared components and UI primitives.


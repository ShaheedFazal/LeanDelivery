**Scope**
- Domain feature modules aggregated for pages. Encapsulate UI + light logic per domain (auth, billing, dashboard, landing, sponsors).

**Key Files**
- `src/features/landing/CenteredHero.tsx:1` — hero section
- `src/features/billing/PricingFeature.tsx:1` — pricing composition
- `src/features/auth/ProtectFallback.tsx:1` — auth guard UI
- `src/features/dashboard/DashboardHeader.tsx:1` — dashboard header
- `src/features/sponsors/SponsorLogos.tsx:1` — sponsors grid

**Commands**
- `dev` — iterate pages using these features
- `storybook` — develop feature components in isolation
- `lint` / `lint:fix` / `check-types` — quality gates
- `test` — unit tests for feature pieces

**Tasks**
- Add a new domain: create `src/features/<domain>` and colocate UI + tests.
- Build compositions from shared components and UI primitives.
- Keep props typed; export minimal surface area.
- Provide simple stories for visual review.

**Testing**
- Unit: Vitest + Testing Library for feature pieces.
- E2E: page flows that consume features (`tests/e2e:1`).
- Visual: Percy coverage where relevant.

**Integration**
- Used by app routes in `src/app:1`.
- Depends on shared UI `src/components:1` and primitives `src/components/ui:1`.
- May consume utils `src/utils:1` and types `src/types:1`.


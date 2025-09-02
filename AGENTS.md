**Scope**
- High-level map for LeanDelivery. Index of area-specific AGENTS.md files and core project commands/conventions.

**Key Files**
- `README.md:1` — project overview and usage
- `next.config.mjs:1` — Next.js configuration
- `tailwind.config.ts:1` — Tailwind setup and design tokens
- `eslint.config.mjs:1` — linting rules
- `vitest.config.mts:1` — unit test runner config
- `playwright.config.ts:1` — E2E test runner config
- `components.json:1` — UI generator/shadcn settings
- `drizzle.config.ts:1` — database migration/tooling config
- `checkly.config.ts:1` — production monitoring checks
- `tsconfig.json:1` — TypeScript project config

**Commands**
- `dev` / `dev:next` / `dev:spotlight` — run app locally and spotlight sidecar
- `build` / `start` / `build-stats` — production build, start, analyze bundle
- `clean` — remove build artifacts (`.next`, `out`, `coverage`)
- `lint` / `lint:fix` — static analysis and autofix
- `check-types` — typecheck without emitting files
- `test` / `test:e2e` — unit/integration and Playwright E2E
- `storybook` / `storybook:build` / `storybook:serve` / `serve-storybook` — component docs
- `test-storybook:ci` — run Storybook test-runner against built stories
- `db:generate` / `db:migrate` / `db:studio` — Drizzle schema/migrations and studio
- `commit` — conventional commit assistant

**Tasks**
- Run/dev: `npm run dev` then open local app; iterate on features/components.
- Ship: `npm run build && npm start`; use `build-stats` when analyzing bundles.
- DB workflow: update `src/models/Schema.ts:1`, then `db:generate` and `db:migrate`.
- UI system: develop in Storybook; build/serve stories locally for review.
- Quality: `lint`, `check-types`, `test`, E2E via `test:e2e` before release.

**Testing**
- Unit: Vitest + Testing Library; setup in `vitest-setup.ts:1` and `vitest.config.mts:1`.
- E2E: Playwright specs in `tests/e2e:1`, config in `playwright.config.ts:1`.
- Visual: Percy integration in `tests/e2e/Visual.e2e.ts:1`.
- Storybook: CI runner via `npm run test-storybook:ci` after `serve-storybook`.

**Integration**
- App routes under `src/app:1` compose domain features in `src/features:1` and shared `src/components:1`.
- Common UI primitives in `src/components/ui:1`; styling via Tailwind `src/styles:1`.
- Cross-cutting libs: `src/libs/Env.ts:1`, `src/libs/Logger.ts:1`, `src/libs/i18n.ts:1`.
- Data layer: `src/models/Schema.ts:1` with Drizzle; types in `src/types:1`.
- Utilities in `src/utils:1` used across features, tested with Vitest.

**Index**
- `src/app/AGENTS.md:1`
- `src/features/AGENTS.md:1`
- `src/features/auth/AGENTS.md:1`
- `src/features/billing/AGENTS.md:1`
- `src/features/dashboard/AGENTS.md:1`
- `src/features/landing/AGENTS.md:1`
- `src/features/sponsors/AGENTS.md:1`
- `src/components/AGENTS.md:1`
- `src/components/ui/AGENTS.md:1`
- `src/libs/AGENTS.md:1`
- `src/models/AGENTS.md:1`
- `src/types/AGENTS.md:1`
- `src/utils/AGENTS.md:1`
- `.storybook/AGENTS.md:1`
- `docs/AGENTS.md:1`
- `tests/AGENTS.md:1`


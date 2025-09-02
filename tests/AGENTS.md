**Scope**
- Automated quality checks: unit/integration (Vitest), end-to-end (Playwright), Storybook runner, and lint/type checks.

**Key Files**
- `vitest.config.mts:1` / `vitest-setup.ts:1` — unit test config and setup
- `playwright.config.ts:1` — E2E config
- `tests/e2e/Sanity.check.e2e.ts:1` — deploy-monitoring sanity via Checkly
- `tests/e2e/Visual.e2e.ts:1` — Percy visual snapshots
- `tests/e2e/I18n.e2e.ts:1` — i18n switching scenarios

**Commands**
- `test` — run unit tests (Vitest)
- `test:e2e` — run Playwright E2E locally/CI
- `test-storybook:ci` — run Storybook test-runner against served stories
- `lint` / `check-types` — static gates

**Tasks**
- Add unit tests next to code (`*.test.tsx`/`*.test.ts`).
- E2E: cover critical user journeys and locales.
- Use Storybook runner for interaction/a11y on components.

**Testing**
- Run `npm run test` for fast feedback; use `--watch` locally if preferred.
- Execute `npm run test:e2e` before release; Percy snapshots for key pages.

**Integration**
- E2E depends on routes under `src/app:1`; unit tests cover `src/**/*`.
- CI can gate on lint, types, unit, E2E, and Storybook runner.


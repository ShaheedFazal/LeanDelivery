**Scope**
- General-purpose helpers and configuration utilities used across app/features.

**Key Files**
- `src/utils/AppConfig.ts:1` — application constants/config
- `src/utils/Helpers.ts:1` — utility functions
- `src/utils/Helpers.test.ts:1` — unit tests for helpers

**Commands**
- `test` — run unit tests for utils
- `lint` / `lint:fix` — static analysis
- `check-types` — typecheck util signatures and usage

**Tasks**
- Add helpers with focused responsibilities and tests.
- Keep pure functions; avoid side-effects and I/O.
- Export stable APIs; document expectations in JSDoc where helpful.

**Testing**
- Vitest coverage exists for helpers; extend as utilities grow.

**Integration**
- Imported by features and components; ensure no heavy deps.
- Prefer delegating env/logging to `src/libs:1`.


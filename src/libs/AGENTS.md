**Scope**
- Cross-cutting libraries: environment, logging, i18n helpers, and DB client wiring used across the app.

**Key Files**
- `src/libs/Env.ts:1` — environment schema and accessors
- `src/libs/Logger.ts:1` — logging utilities (pino)
- `src/libs/i18n.ts:1` / `src/libs/i18nNavigation.ts:1` — next-intl helpers
- `src/libs/DB.ts:1` — database connection/client helpers

**Commands**
- `lint` / `lint:fix` — code quality
- `check-types` — validate types for env/logging/DB helpers
- `test` — unit tests for helper behavior

**Tasks**
- Extend `Env.ts` when adding new secrets/vars; type them and document defaults.
- Provide small, focused helpers; avoid domain logic.
- Keep the DB client and i18n helpers pure and testable.

**Testing**
- Unit: env parsing, logger formatting, and helper behavior.
- Integration: DB usage validated via models/migrations.

**Integration**
- Used by app routes (`src/app:1`), features (`src/features:1`), and utils.
- DB helpers pair with Drizzle models in `src/models:1` and migrations in `migrations:1`.


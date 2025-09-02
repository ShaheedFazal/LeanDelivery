**Scope**
- Database schema and model definitions powered by Drizzle. Manages schema evolution and DB studio.

**Key Files**
- `src/models/Schema.ts:1` — Drizzle schema/types
- `migrations/0000_init-db.sql:1` — initial SQL migration
- `drizzle.config.ts:1` — Drizzle tooling configuration

**Commands**
- `db:generate` — generate migrations from `Schema.ts`
- `db:migrate` — apply migrations (uses `.env.production` via dotenv-cli)
- `db:studio` — open Drizzle Studio against configured DB
- `check-types` / `lint` — ensure schema/types quality

**Tasks**
- Update entities in `Schema.ts`; keep names and relations consistent.
- Generate and review migrations; commit with rationale.
- Verify env vars via `src/libs/Env.ts:1` before migrating.

**Testing**
- Type-level checks to verify models compile and align with usage.
- Run app smoke after migrations to validate queries.

**Integration**
- Consumed by data-access in `src/libs/DB.ts:1` and features.
- Types shared with `src/types:1`; config in `drizzle.config.ts:1`.


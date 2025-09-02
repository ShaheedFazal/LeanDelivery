**Scope**
- Next.js App Router entrypoint. Defines routes, layouts, error boundaries, and metadata. Hosts localized pages under `[locale]`.

**Key Files**
- `src/app/[locale]/layout.tsx:1` — root layout (locale-aware)
- `src/app/[locale]/(unauth)/page.tsx:1` — public landing route
- `src/app/[locale]/(auth)/dashboard/page.tsx:1` — authenticated dashboard
- `src/app/global-error.tsx:1` — global error boundary
- `src/app/sitemap.ts:1` / `src/app/robots.ts:1` — SEO endpoints
- `src/middleware.ts:1` — middleware (e.g., i18n, auth, routing)

**Commands**
- `dev` / `dev:next` — run the app locally
- `build` / `start` / `build-stats` — prod build, start, analyze
- `clean` — reset build artifacts
- `lint` / `lint:fix` / `check-types` — code quality and types

**Tasks**
- Add/update routes under `src/app/[locale]`; colocate page-level UI with features.
- Configure SEO via `sitemap.ts`/`robots.ts`; ensure i18n paths resolve.
- Wire in providers (theme, i18n) in `layout.tsx` and test navigation.
- Handle failures gracefully in `global-error.tsx`.

**Testing**
- Unit: small page/loader logic via Vitest when feasible.
- E2E: navigation and locale flows (`tests/e2e/I18n.e2e.ts:1`).
- Lint/typecheck before merging.

**Integration**
- Consumes domain UI from `src/features:1` and shared components in `src/components:1`.
- Relies on i18n utilities `src/libs/i18n.ts:1` and `src/libs/i18nNavigation.ts:1`.
- Uses types from `src/types:1`; config from `src/utils/AppConfig.ts:1`.


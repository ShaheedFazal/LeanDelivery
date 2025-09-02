**Scope**
- Dashboard page UI building blocks and composition (headers, sections, empty/loading states).

**Key Files**
- `src/features/dashboard/DashboardHeader.tsx:1` — top bar
- `src/features/dashboard/DashboardSection.tsx:1` — content section container
- `src/features/dashboard/TitleBar.tsx:1` — title + actions bar
- `src/features/dashboard/MessageState.tsx:1` — empty/loading/error messaging

**Commands**
- `dev` — iterate authenticated dashboard
- `lint` / `check-types` — quality gates
- `test` — unit tests for conditional/empty states

**Tasks**
- Compose sections with shared primitives; keep props minimal and typed.
- Provide skeleton/empty/error variants for reliability.
- Add stories for each variant to speed visual QA.

**Testing**
- Unit: verify rendering logic and accessibility roles.
- E2E: dashboard smoke in `tests/e2e/Sanity.check.e2e.ts:1` and flows.

**Integration**
- Consumed by `src/app/[locale]/(auth)/dashboard/page.tsx:1`.
- Can use auth context and routing from the app layer.


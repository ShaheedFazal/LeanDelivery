**Scope**
- Authentication-related feature UI and guards for protected areas.

**Key Files**
- `src/features/auth/ProtectFallback.tsx:1` — fallback UI when auth is required

**Commands**
- `dev` — iterate auth flows locally
- `lint` / `lint:fix` / `check-types` — quality checks
- `test` — unit tests for guard behavior

**Tasks**
- Update fallback messaging and link targets for sign-in/up routes.
- Keep UI accessible; prefer shared primitives from `src/components/ui:1`.
- Add stories to validate empty/edge states.

**Testing**
- Unit: render guards and verify conditional rendering.
- E2E: sign-in/sign-up locale flows (`tests/e2e/I18n.e2e.ts:1`).

**Integration**
- Consumed by dashboard and other protected routes in `src/app:1`.
- Works with auth providers/middleware wired in app layer.


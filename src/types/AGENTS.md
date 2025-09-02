**Scope**
- Shared TypeScript types/enums used throughout the app and features.

**Key Files**
- `src/types/Auth.ts:1` — auth-related types
- `src/types/Subscription.ts:1` — billing/subscription domain types
- `src/types/Enum.ts:1` — common enums
- `src/types/global.d.ts:1` — ambient/global declarations

**Commands**
- `check-types` — verify type safety across the project
- `lint` / `lint:fix` — enforce type-aware lint rules

**Tasks**
- Define clear, reusable domain types; export from index where appropriate.
- Avoid circular dependencies; keep types serializable where needed.
- Prefer exact/readonly shapes and narrow unions.

**Testing**
- Rely on compilation and usage sites; add small type tests with Vitest when helpful.

**Integration**
- Consumed by features, components, libs, and models.
- Keep aligned with `src/models/Schema.ts:1` and API payloads.


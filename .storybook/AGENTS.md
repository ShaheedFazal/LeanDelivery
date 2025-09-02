**Scope**
- Storybook setup for component/feature-level UI development, documentation, and visual review.

**Key Files**
- `.storybook/main.ts:1` — Storybook framework/addons config
- `.storybook/preview.ts:1` — global decorators/parameters
- `src/components/Background.stories.tsx:1` — example story

**Commands**
- `storybook` — run Storybook locally on port 6006
- `storybook:build` — build static Storybook to `storybook-static`
- `storybook:serve` — serve built stories (http-server)
- `serve-storybook` — run Storybook build + serve
- `test-storybook:ci` — run Storybook test runner against built stories

**Tasks**
- Add `*.stories.tsx` near components/features; document states and edge cases.
- Configure globals (themes/i18n) in `preview.ts` and addons in `main.ts`.
- Use stories during PR review; link Percy snapshots if needed.

**Testing**
- Storybook Test Runner validates interactions and accessibility.
- Visual checks via Percy complement unit tests.

**Integration**
- Shares the same Tailwind/TS tooling as the app.
- Serves as a living UI inventory for `src/components:1` and `src/features:1`.


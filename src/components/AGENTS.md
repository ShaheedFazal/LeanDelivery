**Scope**
- Shared, reusable components used across features and pages (navigation, layout, badges, buttons).

**Key Files**
- `src/components/ActiveLink.tsx:1` — nav link with active state
- `src/components/ToggleMenuButton.tsx:1` — mobile menu toggle
- `src/components/DemoBadge.tsx:1` — demo/preview badge
- `src/components/Background.tsx:1` — background visual component
- `src/components/LocaleSwitcher.tsx:1` — i18n dropdown
- `src/components/Background.stories.tsx:1` — example Storybook story

**Commands**
- `storybook` — develop components in isolation
- `storybook:build` / `storybook:serve` / `serve-storybook` — build and serve
- `test-storybook:ci` — run Storybook test-runner against built stories
- `lint` / `check-types` / `test` — quality gates and unit tests

**Tasks**
- Build components with Tailwind and `src/components/ui` primitives.
- Provide stories per component; include states (hover/disabled/empty).
- Keep props minimal, typed, and accessible (roles/labels/tab order).

**Testing**
- Unit: render with Testing Library; assert behavior and a11y roles.
- Visual: rely on Storybook + Percy where applicable.

**Integration**
- Consumed by `src/features:1` and `src/app:1`.
- Primitives provided by `src/components/ui:1` to standardize patterns.


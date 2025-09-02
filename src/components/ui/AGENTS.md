**Scope**
- Low-level UI primitives (buttons, inputs, form controls, tables, accordions, tooltips) used to compose components/features.

**Key Files**
- `src/components/ui/button.tsx:1` / `src/components/ui/buttonVariants.ts:1` — button + variants
- `src/components/ui/input.tsx:1` / `src/components/ui/label.tsx:1` — form input + label
- `src/components/ui/dropdown-menu.tsx:1` / `src/components/ui/tooltip.tsx:1` — overlays
- `src/components/ui/table.tsx:1` / `src/components/ui/data-table.tsx:1` — tabular UIs
- `src/components/ui/accordion.tsx:1` / `src/components/ui/separator.tsx:1` — structure primitives
- `src/components/ui/badge.tsx:1` / `src/components/ui/badgeVariants.ts:1` — badges
- `src/components/ui/useFormField.ts:1` / `src/components/ui/form.tsx:1` — RHF helpers

**Commands**
- `storybook` — iterate on primitives
- `lint` / `check-types` / `test` — quality gates

**Tasks**
- Keep API surface consistent (variant names, sizes, disabled states).
- Provide comprehensive stories per primitive and state.
- Prefer composition over props; avoid domain logic here.

**Testing**
- Unit: minimal rendering/interaction checks; accessibility attributes.
- Visual: rely on Storybook and per-primitive stories.

**Integration**
- Consumed by `src/components:1`, features, and pages.
- Styling via Tailwind (`src/styles/global.css:1`); icons via `lucide-react`.


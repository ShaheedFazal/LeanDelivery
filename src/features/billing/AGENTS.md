**Scope**
- Pricing and billing presentation components for plans/tiers and purchase CTA surfaces.

**Key Files**
- `src/features/billing/PricingFeature.tsx:1` — feature composition
- `src/features/billing/PricingCard.tsx:1` — plan card UI
- `src/features/billing/PricingInformation.tsx:1` — copy/details and FAQs

**Commands**
- `dev` — validate pricing pages locally
- `storybook` — review card variants and states
- `lint` / `check-types` — ensure quality and types
- `test` — unit tests for pricing logic/presentation

**Tasks**
- Add/update tiers, feature lists, and locale copy.
- Maintain responsive layout and accessible semantics.
- Provide stories for states (selected, disabled, hovered).

**Testing**
- Unit: render cards/sections and assert labels/prices.
- Visual: Percy snapshots of pricing page states.

**Integration**
- Used by landing and checkout entry points from `src/app:1`.
- Can consume product/plan types from `src/types/Subscription.ts:1`.


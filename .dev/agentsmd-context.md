# AGENTS.md Maintainer Context

- Date (UTC): 2025-09-02T10:03:38Z
- Branch: feature/initial-setup
- Since ref: v1.7.6
- Commits since ref: 7

## Changed files since v1.7.6
A	.bmad-core/agent-teams/team-all.yaml
A	.bmad-core/agent-teams/team-fullstack.yaml
A	.bmad-core/agent-teams/team-ide-minimal.yaml
A	.bmad-core/agent-teams/team-no-ui.yaml
A	.bmad-core/agents/analyst.md
A	.bmad-core/agents/architect.md
A	.bmad-core/agents/bmad-master.md
A	.bmad-core/agents/bmad-orchestrator.md
A	.bmad-core/agents/dev.md
A	.bmad-core/agents/pm.md
A	.bmad-core/agents/po.md
A	.bmad-core/agents/qa.md
A	.bmad-core/agents/sm.md
A	.bmad-core/agents/ux-expert.md
A	.bmad-core/checklists/architect-checklist.md
A	.bmad-core/checklists/change-checklist.md
A	.bmad-core/checklists/pm-checklist.md
A	.bmad-core/checklists/po-master-checklist.md
A	.bmad-core/checklists/story-dod-checklist.md
A	.bmad-core/checklists/story-draft-checklist.md
A	.bmad-core/core-config.yaml
A	.bmad-core/data/bmad-kb.md
A	.bmad-core/data/brainstorming-techniques.md
A	.bmad-core/data/elicitation-methods.md
A	.bmad-core/data/technical-preferences.md
A	.bmad-core/data/test-levels-framework.md
A	.bmad-core/data/test-priorities-matrix.md
A	.bmad-core/enhanced-ide-development-workflow.md
A	.bmad-core/install-manifest.yaml
A	.bmad-core/tasks/advanced-elicitation.md
A	.bmad-core/tasks/apply-qa-fixes.md
A	.bmad-core/tasks/brownfield-create-epic.md
A	.bmad-core/tasks/brownfield-create-story.md
A	.bmad-core/tasks/correct-course.md
A	.bmad-core/tasks/create-brownfield-story.md
A	.bmad-core/tasks/create-deep-research-prompt.md
A	.bmad-core/tasks/create-doc.md
A	.bmad-core/tasks/create-next-story.md
A	.bmad-core/tasks/document-project.md
A	.bmad-core/tasks/execute-checklist.md
A	.bmad-core/tasks/facilitate-brainstorming-session.md
A	.bmad-core/tasks/generate-ai-frontend-prompt.md
A	.bmad-core/tasks/index-docs.md
A	.bmad-core/tasks/kb-mode-interaction.md
A	.bmad-core/tasks/nfr-assess.md
A	.bmad-core/tasks/qa-gate.md
A	.bmad-core/tasks/review-story.md
A	.bmad-core/tasks/risk-profile.md
A	.bmad-core/tasks/shard-doc.md
A	.bmad-core/tasks/test-design.md
A	.bmad-core/tasks/trace-requirements.md
A	.bmad-core/tasks/validate-next-story.md
A	.bmad-core/templates/architecture-tmpl.yaml
A	.bmad-core/templates/brainstorming-output-tmpl.yaml
A	.bmad-core/templates/brownfield-architecture-tmpl.yaml
A	.bmad-core/templates/brownfield-prd-tmpl.yaml
A	.bmad-core/templates/competitor-analysis-tmpl.yaml
A	.bmad-core/templates/front-end-architecture-tmpl.yaml
A	.bmad-core/templates/front-end-spec-tmpl.yaml
A	.bmad-core/templates/fullstack-architecture-tmpl.yaml
A	.bmad-core/templates/market-research-tmpl.yaml
A	.bmad-core/templates/prd-tmpl.yaml
A	.bmad-core/templates/project-brief-tmpl.yaml
A	.bmad-core/templates/qa-gate-tmpl.yaml
A	.bmad-core/templates/story-tmpl.yaml
A	.bmad-core/user-guide.md
A	.bmad-core/utils/bmad-doc-template.md
A	.bmad-core/utils/workflow-management.md
A	.bmad-core/workflows/brownfield-fullstack.yaml
A	.bmad-core/workflows/brownfield-service.yaml
A	.bmad-core/workflows/brownfield-ui.yaml
A	.bmad-core/workflows/greenfield-fullstack.yaml
A	.bmad-core/workflows/greenfield-service.yaml
A	.bmad-core/workflows/greenfield-ui.yaml
A	.bmad-core/working-in-the-brownfield.md
A	.claude/.last-bmad-check
A	.claude/commands/BMad/agents/analyst.md
A	.claude/commands/BMad/agents/architect.md
A	.claude/commands/BMad/agents/bmad-master.md
A	.claude/commands/BMad/agents/bmad-orchestrator.md
A	.claude/commands/BMad/agents/dev.md
A	.claude/commands/BMad/agents/pm.md
A	.claude/commands/BMad/agents/po.md
A	.claude/commands/BMad/agents/qa.md
A	.claude/commands/BMad/agents/sm.md
A	.claude/commands/BMad/agents/ux-expert.md
A	.claude/commands/BMad/tasks/advanced-elicitation.md
A	.claude/commands/BMad/tasks/apply-qa-fixes.md
A	.claude/commands/BMad/tasks/brownfield-create-epic.md
A	.claude/commands/BMad/tasks/brownfield-create-story.md
A	.claude/commands/BMad/tasks/correct-course.md
A	.claude/commands/BMad/tasks/create-brownfield-story.md
A	.claude/commands/BMad/tasks/create-deep-research-prompt.md
A	.claude/commands/BMad/tasks/create-doc.md
A	.claude/commands/BMad/tasks/create-next-story.md
A	.claude/commands/BMad/tasks/document-project.md
A	.claude/commands/BMad/tasks/execute-checklist.md
A	.claude/commands/BMad/tasks/facilitate-brainstorming-session.md
A	.claude/commands/BMad/tasks/generate-ai-frontend-prompt.md
A	.claude/commands/BMad/tasks/index-docs.md
A	.claude/commands/BMad/tasks/kb-mode-interaction.md
A	.claude/commands/BMad/tasks/nfr-assess.md
A	.claude/commands/BMad/tasks/qa-gate.md
A	.claude/commands/BMad/tasks/review-story.md
A	.claude/commands/BMad/tasks/risk-profile.md
A	.claude/commands/BMad/tasks/shard-doc.md
A	.claude/commands/BMad/tasks/test-design.md
A	.claude/commands/BMad/tasks/trace-requirements.md
A	.claude/commands/BMad/tasks/validate-next-story.md
A	.claude/hooks/.auto-updated-20250827
A	.claude/hooks/startup-hook.sh
A	.claude/scripts/bmad-safe-upgrade.sh
A	.claude/settings.json
M	.env.production
M	.storybook/main.ts
M	.storybook/preview.ts
M	README.md
A	agentsmd-context.sh
M	eslint.config.mjs
M	next-env.d.ts
M	next.config.mjs
M	package-lock.json
M	package.json
A	public/assets/images/nutrient-dark.png
A	public/assets/images/nutrient-light.png
A	public/assets/images/surveyjs.svg
A	public/assets/images/warp-banner.png
M	src/app/[locale]/(auth)/(center)/sign-in/[[...sign-in]]/page.tsx
M	src/app/[locale]/(auth)/(center)/sign-up/[[...sign-up]]/page.tsx
M	src/app/[locale]/(auth)/dashboard/layout.tsx
M	src/app/[locale]/(auth)/dashboard/organization-profile/[[...organization-profile]]/page.tsx
M	src/app/[locale]/(auth)/dashboard/user-profile/[[...user-profile]]/page.tsx
M	src/app/[locale]/(auth)/layout.tsx
M	src/app/[locale]/(auth)/onboarding/organization-selection/page.tsx
M	src/app/[locale]/(unauth)/page.tsx
M	src/app/[locale]/layout.tsx
M	src/app/global-error.tsx
M	src/components/Background.stories.tsx
M	src/components/ToggleMenuButton.test.tsx
M	src/features/landing/CenteredFooter.test.tsx
M	src/libs/DB.ts
M	src/libs/i18n.ts
M	src/libs/i18nNavigation.ts
M	src/models/Schema.ts
M	src/utils/AppConfig.ts
M	vitest.config.mts

## Existing AGENTS.md files

## package.json (scripts only)

## Project structure (selected)
### src/app/api

### src/features (top-level)
src/features/auth
src/features/billing
src/features/dashboard
src/features/landing
src/features/sponsors

### src/components/ui primitives
src/components/ui/accordion.tsx
src/components/ui/badge.tsx
src/components/ui/button.tsx
src/components/ui/data-table.tsx
src/components/ui/dropdown-menu.tsx
src/components/ui/form.tsx
src/components/ui/input.tsx
src/components/ui/label.tsx
src/components/ui/separator.tsx
src/components/ui/table.tsx
src/components/ui/tooltip.tsx

### libs, models, types, utils
src/libs/DB.ts
src/libs/Env.ts
src/libs/i18n.ts
src/libs/i18nNavigation.ts
src/libs/Logger.ts
src/models/Schema.ts
src/types/Auth.ts
src/types/Enum.ts
src/types/global.d.ts
src/types/Subscription.ts
src/utils/AppConfig.ts
src/utils/Helpers.test.ts
src/utils/Helpers.ts

# Claude AGENTS.md Update Prompt

## Role
You are the AGENTS.md maintainer for the LeanDelivery repo. Update and align all AGENTS.md files to match current code, scripts, and conventions.

## Context
Read the context from `.dev/agentsmd-context.md` which contains:
- Changed files since last update
- Current project structure
- Package.json scripts
- Existing AGENTS.md files

## Key References
Use these files as your primary references:
- `AGENTS.md:1` (root file if exists)
- `docs/AGENTS_TEMPLATE.md:1` (template to follow)
- `REPOSITORY_STRUCTURE.md:1` (project organization)
- `CLAUDE.md:1` (Claude-specific commands)
- `CI_CD_EXPLAINED.md:1` (build/deploy info)
- `package.json:1` (available scripts)

## Target Files to Update/Create
Based on the project structure, update or create these AGENTS.md files:

### Core Files
- Root: `AGENTS.md:1`
- App router: `src/app/AGENTS.md:1`

### API Routes
- Organizations: `src/app/api/organizations/AGENTS.md:1`
- Pharmacies: `src/app/api/pharmacies/AGENTS.md:1`
- NHS integration: `src/app/api/nhs/AGENTS.md:1`
- Lookup services: `src/app/api/lookup/AGENTS.md:1`

### Features
- Features overview: `src/features/AGENTS.md:1`
- Authentication: `src/features/auth/AGENTS.md:1`
- Billing: `src/features/billing/AGENTS.md:1`
- Dashboard: `src/features/dashboard/AGENTS.md:1`
- Landing: `src/features/landing/AGENTS.md:1`
- Organizations: `src/features/organizations/AGENTS.md:1`
- Sponsors: `src/features/sponsors/AGENTS.md:1`

### Components & Libraries
- Components: `src/components/AGENTS.md:1`
- UI primitives: `src/components/ui/AGENTS.md:1`
- Libraries: `src/lib/AGENTS.md:1` or `src/libs/AGENTS.md:1`
- Models: `src/models/AGENTS.md:1`
- Types: `src/types/AGENTS.md:1`
- Services: `src/services/AGENTS.md:1`
- Utils: `src/utils/AGENTS.md:1`

### Development & Testing
- Storybook: `.storybook/AGENTS.md:1`
- Documentation: `docs/AGENTS.md:1`
- Testing: `tests/AGENTS.md:1`

## Tasks
1. **Update existing AGENTS.md files**: Refresh sections to reflect recent changes:
   - Scope and purpose
   - Key paths & entry points
   - Available commands (match package.json scripts)
   - Common tasks and workflows
   - Quality gates and testing
   - Integration & hand-offs

2. **Create missing AGENTS.md files**: Use `docs/AGENTS_TEMPLATE.md:1` as template

3. **Maintain root AGENTS.md index**: Ensure the "AGENTS.md Index" section:
   - Links to every AGENTS.md under `src/**`, `.storybook/`, `docs/`, `tests/`
   - Groups by category (App & API, Features, Components, Platform libs, Development & Testing)
   - Keeps links sorted alphabetically
   - Includes `docs/AGENTS_TEMPLATE.md`

## Requirements
- Commands must match `package.json` scripts exactly
- File references use clickable `path:line` anchors (`:1` for directories)
- Keep docs concise and actionable (bullets, short lines)
- Maintain consistent style with existing files
- Emphasize Zod validators, DB schema, and `src/types` alignment
- No code changes - only AGENTS.md files

## Constraints
- Do not leak secrets or modify env files
- Only modify/create AGENTS.md files
- Keep professional, technical tone
- Focus on actionable guidance for developers

## Output Format
Proceed systematically through the files, creating or updating as needed. Use the TodoWrite tool to track your progress through the different areas.
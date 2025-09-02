#!/usr/bin/env bash
set -euo pipefail

# Collects a concise context bundle to help maintain AGENTS.md files.
# Usage: bash scripts/agentsmd-context.sh [SINCE_REF]

ROOT_DIR=$(git rev-parse --show-toplevel 2>/dev/null || pwd)
cd "$ROOT_DIR"

SINCE_REF="${1:-}"
if [[ -z "$SINCE_REF" ]]; then
  if git describe --tags --abbrev=0 >/dev/null 2>&1; then
    SINCE_REF=$(git describe --tags --abbrev=0)
  else
    SINCE_REF=$(git rev-list --max-parents=0 HEAD)
  fi
fi

OUT_DIR=".dev"
OUT_FILE="$OUT_DIR/agentsmd-context.md"
mkdir -p "$OUT_DIR"

BRANCH=$(git rev-parse --abbrev-ref HEAD)
DATE_UTC=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
COMMITS=$(git rev-list --count "$SINCE_REF"..HEAD)

{
  echo "# AGENTS.md Maintainer Context"
  echo
  echo "- Date (UTC): $DATE_UTC"
  echo "- Branch: $BRANCH"
  echo "- Since ref: $SINCE_REF"
  echo "- Commits since ref: $COMMITS"
  echo
  echo "## Changed files since $SINCE_REF"
  git diff --name-status "$SINCE_REF"..HEAD || true
  echo
  echo "## Existing AGENTS.md files"
  rg -n "^#|^$" --no-line-number --glob "**/AGENTS.md" || true
  echo
  echo "## package.json (scripts only)"
  # Extract scripts block without requiring jq
  awk '/"scripts"\s*:\s*{/{flag=1} flag{print} /},/{if(flag){print; exit}}' package.json || true
  echo
  echo "## Project structure (selected)"
  echo "### src/app/api"
  find src/app/api -maxdepth 3 -type f -name "route.ts" -print 2>/dev/null | sort || true
  echo
  echo "### src/features (top-level)"
  find src/features -maxdepth 1 -mindepth 1 -type d -print 2>/dev/null | sort || true
  echo
  echo "### src/components/ui primitives"
  find src/components/ui -maxdepth 1 -type f -name "*.tsx" -print 2>/dev/null | sort || true
  echo
  echo "### libs, models, types, utils"
  find src/libs -maxdepth 1 -type f -print 2>/dev/null | sort || true
  find src/models -maxdepth 1 -type f -print 2>/dev/null | sort || true
  find src/types -maxdepth 1 -type f -print 2>/dev/null | sort || true
  find src/utils -maxdepth 1 -type f -print 2>/dev/null | sort || true
  echo
  echo "---"
  echo
  cat <<'PROMPT'
## Suggested Maintainer Prompt

Role: You are the AGENTS.md maintainer for the LeanDelivery repo. Update and align all AGENTS.md files to match current code, scripts, and conventions.

Scope: Only modify or add AGENTS.md files. Do not change code.

Inputs:
- Use the context above (changed files, scripts, structure).
- Key references: `AGENTS.md:1`, `docs/AGENTS_TEMPLATE.md:1`, `REPOSITORY_STRUCTURE.md:1`, `CLAUDE.md:1`, `CI_CD_EXPLAINED.md:1`, `package.json:1`.
- Target docs to review/update or create:
  - Root: `AGENTS.md:1`
  - App router: `src/app/AGENTS.md:1`
  - API routes: `src/app/api/organizations/AGENTS.md:1`, `src/app/api/pharmacies/AGENTS.md:1`, `src/app/api/nhs/AGENTS.md:1`, `src/app/api/lookup/AGENTS.md:1`
  - Features: `src/features/AGENTS.md:1`, plus per-domain:
    - `src/features/auth/AGENTS.md:1`
    - `src/features/billing/AGENTS.md:1`
    - `src/features/dashboard/AGENTS.md:1`
    - `src/features/landing/AGENTS.md:1`
    - `src/features/organizations/AGENTS.md:1`
    - `src/features/sponsors/AGENTS.md:1`
  - UI/components/libs:
    - `src/components/AGENTS.md:1`, `src/components/ui/AGENTS.md:1`
    - `src/lib/AGENTS.md:1`, `src/libs/AGENTS.md:1`
    - `src/models/AGENTS.md:1`, `src/types/AGENTS.md:1`, `src/services/AGENTS.md:1`, `src/utils/AGENTS.md:1`

Tasks:
- For existing AGENTS.md: update sections “Scope”, “Key paths & entry points”, “Commands”, “Common tasks”, “Quality gates”, “Integration & hand‑offs” to reflect changes since the provided ref.
- For any relevant folder missing AGENTS.md: add one using `docs/AGENTS_TEMPLATE.md:1`.
- Maintain the root AGENTS.md “AGENTS.md Index” section:
  - Ensure it links to every AGENTS.md under `src/**` and `docs/AGENTS_TEMPLATE.md`.
  - Group links by category (App & API, Features, Components, Platform libs) and keep sorted.
  - Create the section if missing.
- Ensure commands match `package.json` scripts (dev, test, storybook, db tasks).
- Keep file references clickable using `path:line` anchors (use `:1` for directories or start of file).
- Keep docs concise and actionable (bullets, short lines), consistent with existing style.

Constraints:
- No code edits, only AGENTS.md files.
- Do not leak secrets or modify env files.
- Emphasize keeping Zod validators, DB schema, and `src/types` aligned in checklists where relevant.

Output:
- Return a single patch in apply_patch format that adds/updates only AGENTS.md files:
  - `*** Begin Patch` … `*** End Patch`
  - `*** Update File:` when changing a file
  - `*** Add File:` when creating a new one

Sanity checklist before finishing:
- All modified paths exist.
- Commands in docs exist in `package.json`.
- No unrelated files in the patch.
- Brevity and consistency with existing tone.
 - Root AGENTS.md index includes all AGENTS.md files.
PROMPT
} > "$OUT_FILE"

echo "Wrote $OUT_FILE"

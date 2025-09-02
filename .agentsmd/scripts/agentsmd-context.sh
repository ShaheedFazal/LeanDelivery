#!/usr/bin/env bash
set -euo pipefail

# Collects a concise context bundle to help maintain AGENTS.md files.
# Usage: bash scripts/agentsmd-context.sh [SINCE_REF]
# Always generates single, fresh context file

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

# Clean any old context files to prevent confusion
find "$OUT_DIR" -name "agentsmd-context*.md" -delete 2>/dev/null || true

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
  if command -v rg >/dev/null 2>&1; then
    rg -n "^#|^$" --no-line-number --glob "**/AGENTS.md" || true
  else
    find . -name "AGENTS.md" -not -path "./.git/*" -exec echo "Found: {}" \; 2>/dev/null || true
  fi
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
} > "$OUT_FILE"

echo "Wrote $OUT_FILE"

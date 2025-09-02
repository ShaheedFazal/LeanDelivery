#!/bin/bash
# Claude Code Startup Hook - BMad Auto-Upgrade
# This script runs automatically when Claude Code starts in this project
# Author: LeanDelivery Team
# Version: 1.0.0

set -e

# Configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
UPGRADE_SCRIPT="$CLAUDE_DIR/scripts/bmad-safe-upgrade.sh"
LAST_CHECK_FILE="$CLAUDE_DIR/.last-bmad-check"
CHECK_INTERVAL_HOURS=1  # Check for updates every hour (testing mode)
AUTO_UPDATE_ENABLED=true  # Enable automatic updates (testing mode)

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

log() {
    echo -e "${GREEN}[BMad Hook] $1${NC}"
}

warn() {
    echo -e "${YELLOW}[BMad Hook] $1${NC}"
}

info() {
    echo -e "${BLUE}[BMad Hook] $1${NC}"
}

# Check if we should run the upgrade check
should_check_for_updates() {
    if [[ ! -f "$LAST_CHECK_FILE" ]]; then
        return 0  # First run, should check
    fi
    
    LAST_CHECK=$(cat "$LAST_CHECK_FILE" 2>/dev/null || echo "0")
    CURRENT_TIME=$(date +%s)
    TIME_DIFF=$((CURRENT_TIME - LAST_CHECK))
    INTERVAL_SECONDS=$((CHECK_INTERVAL_HOURS * 3600))
    
    if [[ $TIME_DIFF -gt $INTERVAL_SECONDS ]]; then
        return 0  # Time to check
    else
        return 1  # Too soon
    fi
}

# Update last check timestamp
update_last_check() {
    date +%s > "$LAST_CHECK_FILE"
}

# Check git repository status and get detailed state
get_git_status() {
    if ! command -v git >/dev/null 2>&1 || ! git rev-parse --git-dir >/dev/null 2>&1; then
        echo "no_git"
        return
    fi
    
    # Get git status, ignoring operational files we create/update
    local dirty_files=$(git status --porcelain | grep -v "^.M .last-bmad-check$" | grep -v "^.M PROJECT_INDEX.json$" | grep -v "^.M .claude/hooks/startup-hook.sh$")
    local staged_files=$(git status --porcelain | grep "^[MADRC]" | wc -l | tr -d ' ')
    local unstaged_files=$(git status --porcelain | grep "^.[MD]" | wc -l | tr -d ' ')
    
    if [[ -z "$dirty_files" ]]; then
        echo "clean"
    else
        if [[ "$staged_files" -gt 0 ]] && [[ "$unstaged_files" -gt 0 ]]; then
            echo "mixed_changes"
        elif [[ "$staged_files" -gt 0 ]]; then
            echo "staged_changes"
        else
            echo "unstaged_changes"
        fi
    fi
}

# Check if git working directory is clean (ignoring our timestamp file)
is_git_clean() {
    local git_status=$(get_git_status)
    [[ "$git_status" == "clean" || "$git_status" == "no_git" ]]
}

# Get git status message for display
get_git_status_message() {
    local git_status=$(get_git_status)
    case "$git_status" in
        "clean")
            echo ""
            ;;
        "staged_changes")
            echo "📝 Commit staged changes first"
            ;;
        "unstaged_changes") 
            echo "📝 Stage and commit changes first"
            ;;
        "mixed_changes")
            echo "📝 Stage and commit all changes first"
            ;;
        "no_git")
            echo ""
            ;;
        *)
            echo "📝 Clean git working directory first"
            ;;
    esac
}

# Perform automatic upgrade if safe
auto_upgrade_if_safe() {
    local updates_available="$1"
    local git_status=$(get_git_status)
    
    if [[ "$AUTO_UPDATE_ENABLED" != "true" ]] || [[ "$updates_available" != "true" ]]; then
        return 0
    fi
    
    # Safety checks
    if ! is_git_clean; then
        return 1  # Can't auto-update with uncommitted changes
    fi
    
    # Run the upgrade in background to avoid blocking Claude Code startup
    (
        log "🔄 Auto-updating BMad Method..."
        if "$UPGRADE_SCRIPT" --auto-confirm >/dev/null 2>&1; then
            log "✅ BMad Method auto-update completed successfully"
            # Touch a marker file to indicate successful auto-update
            touch "$SCRIPT_DIR/.auto-updated-$(date +%Y%m%d)"
        else
            warn "❌ Auto-update failed - manual intervention required"
        fi
    ) &
    
    return 0
}

# Generate Claude Code hook output
generate_claude_output() {
    local context_message="$1"
    
    cat << EOF
{
  "hookSpecificOutput": {
    "hookEventName": "SessionStart",
    "additionalContext": "$context_message"
  }
}
EOF
}

# Main startup hook logic
main() {
    # Only run if BMad is present
    if [[ ! -f ".bmad-core/install-manifest.yaml" ]]; then
        # Not a BMad project, output minimal context
        generate_claude_output "Standard project (no BMad Method detected)"
        return 0
    fi
    
    # Check if upgrade script exists
    if [[ ! -x "$UPGRADE_SCRIPT" ]]; then
        generate_claude_output "⚠️ BMad project detected but upgrade script missing"
        return 0
    fi
    
    # Get current version
    CURRENT_VERSION=$(grep "^version:" ".bmad-core/install-manifest.yaml" | cut -d' ' -f2 2>/dev/null || echo "unknown")
    
    # Build context message
    local context_msg="🚀 BMad Method v$CURRENT_VERSION project"
    
    # Check if we should look for updates
    if should_check_for_updates; then
        # Run upgrade check (non-interactive)
        if "$UPGRADE_SCRIPT" --check-only >/dev/null 2>&1; then
            context_msg="$context_msg | ✅ Up to date"
        else
            # Updates available - provide clear messaging based on git status
            local git_status_msg=$(get_git_status_message)
            
            if [[ "$AUTO_UPDATE_ENABLED" == "true" ]]; then
                if is_git_clean; then
                    if auto_upgrade_if_safe "true"; then
                        context_msg="$context_msg | 🔄 Update available → Auto-updating in background..."
                    else
                        context_msg="$context_msg | ⚠️ Auto-update failed → Run \`.claude/scripts/bmad-safe-upgrade.sh\` manually"
                    fi
                else
                    if [[ -n "$git_status_msg" ]]; then
                        context_msg="$context_msg | 📦 Update available → $git_status_msg → Run \`.claude/scripts/bmad-safe-upgrade.sh\`"
                    else
                        context_msg="$context_msg | 📦 Update available → Clean git first → Run \`.claude/scripts/bmad-safe-upgrade.sh\`"
                    fi
                fi
            else
                if [[ -n "$git_status_msg" ]]; then
                    context_msg="$context_msg | 📦 Update available → $git_status_msg → Run \`.claude/scripts/bmad-safe-upgrade.sh\`"
                else
                    context_msg="$context_msg | 📦 Update available → Run \`.claude/scripts/bmad-safe-upgrade.sh\` to upgrade safely"
                fi
            fi
        fi
        update_last_check
    else
        # Check if auto-update completed recently
        AUTO_UPDATE_MARKER=$(find "$SCRIPT_DIR" -name ".auto-updated-*" -newer "$LAST_CHECK_FILE" 2>/dev/null | head -1)
        if [[ -n "$AUTO_UPDATE_MARKER" ]]; then
            context_msg="$context_msg | ✅ Auto-updated recently"
        else
            context_msg="$context_msg | ✅ Recently checked"
        fi
    fi
    
    # Check customization status
    if [[ -f ".bmad-core/project-config.yaml" ]]; then
        context_msg="$context_msg | ✅ UI Enhancement workflow integrated"
    else
        context_msg="$context_msg | ⚠️ Run \`./scripts/bmad-safe-upgrade.sh --setup\` to activate UI Enhancement"
    fi
    
    # Output Claude Code compatible JSON
    generate_claude_output "$context_msg"
}

# Error handling
trap 'warn "Startup hook encountered an error"' ERR

# Run main function silently (don't interrupt Claude Code startup)
main 2>/dev/null || true
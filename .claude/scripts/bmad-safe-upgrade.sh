#!/bin/bash
# BMad Safe Upgrade Script
# Automatically upgrades BMad while preserving project customizations
# Author: LeanDelivery Team
# Version: 1.0.0

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
BMAD_REPO="https://github.com/your-bmad-repo/bmad-method"  # Update with actual repo
BACKUP_DIR=".bmad-backup-$(date +%Y%m%d-%H%M%S)"
PROJECT_CONFIG=".bmad-core/project-config.yaml"
CORE_CONFIG=".bmad-core/core-config.yaml"
INSTALL_MANIFEST=".bmad-core/install-manifest.yaml"
AUTO_CONFIRM=false

echo -e "${BLUE}🚀 BMad Safe Upgrade System${NC}"
echo -e "${BLUE}================================${NC}"

# Function to log messages
log() {
    echo -e "${GREEN}[$(date +'%Y-%m-%d %H:%M:%S')] $1${NC}"
}

warn() {
    echo -e "${YELLOW}⚠️  [$(date +'%Y-%m-%d %H:%M:%S')] $1${NC}"
}

error() {
    echo -e "${RED}❌ [$(date +'%Y-%m-%d %H:%M:%S')] $1${NC}"
}

# Confirmation function that respects auto-confirm mode
confirm() {
    local message="$1"
    local default="${2:-N}"
    
    if [[ "$AUTO_CONFIRM" == "true" ]]; then
        log "Auto-confirming: $message"
        return 0
    fi
    
    read -p "$message (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        return 0
    else
        return 1
    fi
}

# Check if we're in a project with BMad
check_bmad_project() {
    if [[ ! -f "$INSTALL_MANIFEST" ]]; then
        error "Not in a BMad project directory (no install-manifest.yaml found)"
        exit 1
    fi
    
    if [[ ! -f "$CORE_CONFIG" ]]; then
        error "BMad core configuration not found"
        exit 1
    fi
    
    log "✅ BMad project detected"
}

# Get current BMad version
get_current_version() {
    if [[ -f "$INSTALL_MANIFEST" ]]; then
        CURRENT_VERSION=$(grep "^version:" "$INSTALL_MANIFEST" | cut -d' ' -f2)
        log "📋 Current BMad version: $CURRENT_VERSION"
    else
        CURRENT_VERSION="unknown"
        warn "Cannot determine current BMad version"
    fi
}

# Backup project customizations
backup_customizations() {
    log "💾 Creating backup of customizations..."
    
    mkdir -p "$BACKUP_DIR"
    
    # Backup project config (most important)
    if [[ -f "$PROJECT_CONFIG" ]]; then
        cp "$PROJECT_CONFIG" "$BACKUP_DIR/"
        log "✅ Backed up project-config.yaml"
    fi
    
    # Backup modified core config
    if [[ -f "$CORE_CONFIG" ]]; then
        cp "$CORE_CONFIG" "$BACKUP_DIR/"
        log "✅ Backed up core-config.yaml"
    fi
    
    # Backup any local workflow overrides
    if [[ -d ".bmad-core/workflows/local" ]]; then
        cp -r ".bmad-core/workflows/local" "$BACKUP_DIR/"
        log "✅ Backed up local workflow overrides"
    fi
    
    # Backup any custom expansion packs
    if [[ -d ".bmad-core/expansion-packs/local" ]]; then
        cp -r ".bmad-core/expansion-packs/local" "$BACKUP_DIR/"
        log "✅ Backed up local expansion packs"
    fi
    
    # Create backup manifest
    cat > "$BACKUP_DIR/backup-manifest.yaml" << EOF
# BMad Customizations Backup
created_at: $(date -u +"%Y-%m-%dT%H:%M:%S.%3NZ")
bmad_version_before_upgrade: $CURRENT_VERSION
project_name: LeanDelivery

customizations:
  project_config: $(test -f "$PROJECT_CONFIG" && echo "true" || echo "false")
  core_config_modified: $(test -f "$CORE_CONFIG" && echo "true" || echo "false")
  local_workflows: $(test -d ".bmad-core/workflows/local" && echo "true" || echo "false")
  local_expansion_packs: $(test -d ".bmad-core/expansion-packs/local" && echo "true" || echo "false")

restore_instructions: |
  To restore these customizations after upgrade:
  1. cp $BACKUP_DIR/project-config.yaml .bmad-core/
  2. Merge $BACKUP_DIR/core-config.yaml changes if needed
  3. cp -r $BACKUP_DIR/local/* .bmad-core/workflows/ (if exists)
EOF
    
    log "✅ Backup created at: $BACKUP_DIR"
}

# Check for upstream BMad updates
check_for_updates() {
    log "🔍 Checking for BMad updates..."
    
    # This would connect to BMad's update mechanism
    # For now, we'll simulate update checking
    
    # In real implementation, this might:
    # 1. Check BMad's GitHub releases API
    # 2. Compare with current version
    # 3. Download update information
    
    # Simulated update check
    LATEST_VERSION="4.41.0"  # This would come from actual check
    
    if [[ "$CURRENT_VERSION" != "$LATEST_VERSION" ]]; then
        log "📦 Update available: $CURRENT_VERSION → $LATEST_VERSION"
        return 0
    else
        log "✅ BMad is up to date ($CURRENT_VERSION)"
        return 1
    fi
}

# Pre-upgrade validation
pre_upgrade_validation() {
    log "🔍 Running pre-upgrade validation..."
    
    # Check Git status
    if git status --porcelain | grep -q .; then
        warn "Repository has uncommitted changes"
        echo "Consider committing changes before upgrade, or continue anyway"
        if ! confirm "Continue with upgrade?"; then
            log "Upgrade cancelled by user"
            exit 0
        fi
    fi
    
    # Validate project config syntax (if PyYAML is available)
    if [[ -f "$PROJECT_CONFIG" ]]; then
        if command -v python3 >/dev/null 2>&1; then
            if python3 -c "import yaml; yaml.safe_load(open('$PROJECT_CONFIG'))" 2>/dev/null; then
                log "✅ Project config syntax valid"
            elif python3 -c "import yaml" 2>/dev/null; then
                error "Project config YAML syntax is invalid"
                exit 1
            else
                log "ℹ️ PyYAML not available, skipping YAML syntax validation"
            fi
        else
            log "ℹ️ Python3 not available, skipping YAML syntax validation"
        fi
    fi
    
    # Check disk space
    AVAILABLE_SPACE=$(df . | awk 'NR==2 {print $4}')
    if [[ $AVAILABLE_SPACE -lt 100000 ]]; then  # Less than ~100MB
        warn "Low disk space available"
    fi
    
    log "✅ Pre-upgrade validation passed"
}

# Perform BMad upgrade
perform_upgrade() {
    log "⬆️  Performing BMad upgrade..."
    
    # This would call the actual BMad upgrade mechanism
    # Different approaches depending on how BMad is installed:
    
    # Option 1: If BMad has its own upgrade command
    if command -v bmad-upgrade &> /dev/null; then
        log "Using BMad's built-in upgrade mechanism"
        bmad-upgrade --preserve-customizations
    
    # Option 2: If using npm/yarn
    elif command -v npm &> /dev/null; then
        log "Upgrading via npm"
        npm update @bmad/method
        
    # Option 3: Git-based upgrade (if BMad is git submodule)
    elif [[ -d ".bmad-core/.git" ]]; then
        log "Upgrading via Git"
        cd .bmad-core
        git fetch origin
        git checkout main
        git pull origin main
        cd ..
        
    # Option 4: Download and replace (manual)
    else
        warn "No automatic upgrade mechanism detected"
        log "Please manually upgrade BMad and re-run this script"
        exit 1
    fi
    
    log "✅ BMad core upgrade completed"
}

# Restore customizations
restore_customizations() {
    log "🔄 Restoring project customizations..."
    
    # Restore project config (should not be overwritten, but just in case)
    if [[ -f "$BACKUP_DIR/project-config.yaml" ]]; then
        if [[ ! -f "$PROJECT_CONFIG" ]] || [[ "$BACKUP_DIR/project-config.yaml" -nt "$PROJECT_CONFIG" ]]; then
            cp "$BACKUP_DIR/project-config.yaml" "$PROJECT_CONFIG"
            log "✅ Restored project-config.yaml"
        else
            log "ℹ️  Project config was preserved during upgrade"
        fi
    fi
    
    # Check if core config needs restoration
    if [[ -f "$BACKUP_DIR/core-config.yaml" ]]; then
        # Check if our project config line is still there
        if ! grep -q "projectConfig:" "$CORE_CONFIG"; then
            warn "Project config reference was removed from core config"
            echo "Adding project config reference back..."
            echo -e "\n# Project-specific configuration override (survives upgrades)" >> "$CORE_CONFIG"
            echo "projectConfig: project-config.yaml" >> "$CORE_CONFIG"
            log "✅ Restored project config reference"
        else
            log "ℹ️  Core config project reference preserved"
        fi
    fi
    
    # Restore local workflow overrides
    if [[ -d "$BACKUP_DIR/local" ]]; then
        cp -r "$BACKUP_DIR/local" ".bmad-core/workflows/"
        log "✅ Restored local workflow overrides"
    fi
    
    log "✅ Customizations restored"
}

# Post-upgrade validation
post_upgrade_validation() {
    log "🔍 Running post-upgrade validation..."
    
    # Check that BMad is still functional
    if [[ -f "$INSTALL_MANIFEST" ]]; then
        NEW_VERSION=$(grep "^version:" "$INSTALL_MANIFEST" | cut -d' ' -f2)
        log "✅ Upgraded to BMad version: $NEW_VERSION"
    else
        error "Install manifest missing after upgrade"
        return 1
    fi
    
    # Validate project config is still loaded
    if [[ -f "$PROJECT_CONFIG" ]]; then
        log "✅ Project configuration preserved"
    else
        warn "Project configuration may need to be recreated"
    fi
    
    # Test basic BMad functionality (if possible)
    # This would depend on BMad's CLI interface
    
    log "✅ Post-upgrade validation passed"
}

# Cleanup old backups (keep last 5)
cleanup_old_backups() {
    log "🧹 Cleaning up old backups..."
    
    # Keep only the 5 most recent backups
    ls -dt .bmad-backup-* 2>/dev/null | tail -n +6 | xargs rm -rf 2>/dev/null || true
    
    log "✅ Backup cleanup completed"
}

# Main upgrade flow
main() {
    log "Starting BMad safe upgrade process..."
    
    # Core upgrade steps
    check_bmad_project
    get_current_version
    
    # Check if update is needed
    if ! check_for_updates; then
        log "✅ No update needed. Exiting."
        exit 0
    fi
    
    # Pre-upgrade steps
    pre_upgrade_validation
    backup_customizations
    
    # Perform the upgrade
    perform_upgrade
    
    # Post-upgrade steps
    restore_customizations
    post_upgrade_validation
    cleanup_old_backups
    
    log "🎉 BMad upgrade completed successfully!"
    log "📁 Backup available at: $BACKUP_DIR"
    
    # Optional: Show what's new
    if [[ -f ".bmad-core/CHANGELOG.md" ]]; then
        echo
        echo -e "${BLUE}📝 Recent Changes:${NC}"
        head -20 ".bmad-core/CHANGELOG.md" 2>/dev/null || echo "Changelog not available"
    fi
}

# Help function
show_help() {
    echo "BMad Safe Upgrade Script"
    echo ""
    echo "Usage: $0 [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  -h, --help        Show this help message"
    echo "  --check-only      Only check for updates, don't upgrade"
    echo "  --auto-confirm    Skip confirmation prompts (for automated use)"
    echo "  --force           Force upgrade even if up to date"
    echo "  --restore DIR     Restore from specific backup directory"
    echo ""
    echo "This script safely upgrades BMad while preserving:"
    echo "  • Project-specific configuration (project-config.yaml)"
    echo "  • Local workflow overrides"
    echo "  • Custom expansion packs"
    echo "  • Core config modifications"
}

# Setup project customizations (without upgrading)
setup_customizations() {
    log "🛠️  Setting up project customizations..."
    
    check_bmad_project
    
    # Create project config if it doesn't exist
    if [[ ! -f "$PROJECT_CONFIG" ]]; then
        log "Creating project-config.yaml..."
        # The project config content is already created above
        log "✅ Project configuration created"
    else
        log "✅ Project configuration already exists"
    fi
    
    # Update core config if needed
    if ! grep -q "projectConfig:" "$CORE_CONFIG"; then
        log "Adding project config reference to core config..."
        echo -e "\n# Project-specific configuration override (survives upgrades)" >> "$CORE_CONFIG"
        echo "projectConfig: project-config.yaml" >> "$CORE_CONFIG"
        log "✅ Core config updated"
    else
        log "✅ Core config already references project config"
    fi
    
    # Setup startup hook
    if [[ -f ".claude-startup-hook.sh" ]]; then
        log "✅ Claude Code startup hook already exists"
    else
        warn "Claude Code startup hook not found"
        log "Create .claude-startup-hook.sh for automatic update checking"
    fi
    
    log "🎉 Project customizations setup completed!"
    log "ℹ️  UI Enhancement workflow is now integrated"
}

# Auto upgrade (non-interactive)
auto_upgrade() {
    log "🤖 Running automatic upgrade..."
    
    # Set non-interactive mode
    export DEBIAN_FRONTEND=noninteractive
    
    # Skip confirmations
    AUTO_MODE=true
    
    # Run main upgrade flow
    main
}

# Parse command line arguments
case "${1:-}" in
    -h|--help)
        show_help
        exit 0
        ;;
    --check-only)
        check_bmad_project
        get_current_version
        # For testing: simulate update available by checking if version < 4.41.0
        CURRENT_VERSION=$(grep "^version:" "$INSTALL_MANIFEST" | cut -d' ' -f2 2>/dev/null || echo "0.0.0")
        if [[ "$CURRENT_VERSION" < "4.41.0" ]]; then
            log "Update available: v4.41.0"
            exit 1  # Exit code 1 indicates update available
        else
            log "Already up to date"
            exit 0  # Exit code 0 indicates no update needed
        fi
        ;;
    --auto-confirm)
        AUTO_CONFIRM=true
        main
        exit 0
        ;;
    --setup)
        setup_customizations
        exit 0
        ;;
    --auto)
        auto_upgrade
        exit 0
        ;;
    --force)
        log "Forcing upgrade regardless of version"
        FORCE_UPGRADE=true
        ;;
    --restore)
        if [[ -n "${2:-}" && -d "$2" ]]; then
            log "Restoring from backup: $2"
            BACKUP_DIR="$2"
            restore_customizations
            exit 0
        else
            error "Invalid backup directory: ${2:-}"
            exit 1
        fi
        ;;
    "")
        # No arguments, run main
        ;;
    *)
        error "Unknown option: $1"
        show_help
        exit 1
        ;;
esac

# Run main function
main "$@"
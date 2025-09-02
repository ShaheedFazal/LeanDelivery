#!/usr/bin/env bash
set -euo pipefail

# Master AGENTS.md management script
# Usage: bash update-agents.sh [claude|chatgpt|context|status] [args...]

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/../.." && pwd)"
cd "$ROOT_DIR"

case "${1:-}" in
  "claude")
    echo "🔄 Generating context and Claude prompt..."
    bash "$SCRIPT_DIR/agentsmd-context.sh" "${@:2}"
    echo
    echo "🤖 Claude Prompt:"
    echo "================="
    cat "$SCRIPT_DIR/../prompts/claude-prompt.md"
    ;;
    
  "chatgpt")
    echo "🔄 Generating context and ChatGPT prompt..."  
    bash "$SCRIPT_DIR/agentsmd-context.sh" "${@:2}"
    echo
    echo "🤖 ChatGPT Prompt:"
    echo "=================="
    cat "$SCRIPT_DIR/../prompts/chatgpt-prompt.md"
    ;;
    
  "context")
    echo "🔄 Generating context only..."
    bash "$SCRIPT_DIR/agentsmd-context.sh" "${@:2}"
    echo "✅ Context generated: .dev/agentsmd-context.md"
    ;;
    
  "status")
    echo "📁 Current AGENTS.md files:"
    find . -name "AGENTS.md" -not -path "./.git/*" | sort || echo "None found"
    echo
    echo "📄 Context file:"
    if [[ -f ".dev/agentsmd-context.md" ]]; then
      echo "✅ .dev/agentsmd-context.md ($(stat -f%z .dev/agentsmd-context.md) bytes)"
    else
      echo "❌ No context file"
    fi
    echo
    echo "📋 Recent updates:"
    if [[ -f ".agentsmd/logs/updates.log" ]]; then
      tail -5 ".agentsmd/logs/updates.log"
    else
      echo "No update history"
    fi
    ;;
    
  "both")
    echo "🔄 Generating context and both prompts..."
    bash "$SCRIPT_DIR/agentsmd-context.sh" "${@:2}"
    echo
    echo "🤖 Claude Prompt:"
    echo "================="
    cat "$SCRIPT_DIR/../prompts/claude-prompt.md"
    echo
    echo "════════════════════════════════════════════════════════════════"
    echo
    echo "🤖 ChatGPT Prompt:"
    echo "=================="
    cat "$SCRIPT_DIR/../prompts/chatgpt-prompt.md"
    ;;
    
  "")
    # Default to 'both' when no parameters
    echo "🔄 Generating context and both prompts..."
    bash "$SCRIPT_DIR/agentsmd-context.sh"
    echo
    echo "🤖 Claude Prompt:"
    echo "================="
    cat "$SCRIPT_DIR/../prompts/claude-prompt.md"
    echo
    echo "════════════════════════════════════════════════════════════════"
    echo
    echo "🤖 ChatGPT Prompt:"
    echo "=================="
    cat "$SCRIPT_DIR/../prompts/chatgpt-prompt.md"
    ;;
    
  *)
    echo "Usage: $0 [claude|chatgpt|both|context|status]"
    echo
    echo "Commands:"
    echo "  claude   - Generate context + show Claude prompt"
    echo "  chatgpt  - Generate context + show ChatGPT prompt"
    echo "  both     - Generate context + show both prompts" 
    echo "  context  - Generate context only"
    echo "  status   - Show current AGENTS.md status"
    echo
    echo "Default: Runs 'both' when no command specified"
    exit 1
    ;;
esac
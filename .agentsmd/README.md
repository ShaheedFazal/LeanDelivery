# AGENTS.md Management System

Systematic approach to maintaining AGENTS.md files across the LeanDelivery project using multiple AI agents.

## Quick Start

```bash
# Generate context and show Claude prompt
bash .agentsmd/scripts/update-agents.sh claude

# Generate context and show ChatGPT prompt  
bash .agentsmd/scripts/update-agents.sh chatgpt

# Generate context only
bash .agentsmd/scripts/update-agents.sh context

# Check AGENTS.md status
bash .agentsmd/scripts/update-agents.sh status
```

## Structure

```
.agentsmd/
├── prompts/
│   ├── claude-prompt.md    # Claude-optimized prompt
│   ├── chatgpt-prompt.md   # ChatGPT-optimized prompt  
│   └── template.md         # Base template for other agents
├── scripts/
│   ├── update-agents.sh    # Main dispatcher (claude|chatgpt|context|status)
│   └── agentsmd-context.sh # Context generation engine
├── logs/                   # Update history and metadata
└── README.md               # This documentation
```

**Generated files:**
- `.dev/agentsmd-context.md` - Project context for AI agents

## Workflow

1. **Generate Context**: Script analyzes git changes, project structure, and existing AGENTS.md files
2. **Select Agent**: Choose Claude or ChatGPT (or see both prompts)
3. **Copy-Paste**: Copy displayed prompt into your chosen AI
4. **AI Creates**: Agent reads context and systematically updates/creates AGENTS.md files
5. **Track Progress**: Logs maintain history of updates

## Claude Commands

If using Claude Code, add these to `CLAUDE.md`:

```bash
agents-update    # Generate context + both prompts (default)
agents-context   # Generate context only
agents-status    # Show current status
# Or specify LLM:
# agents-update claude   → Context + Claude prompt
# agents-update chatgpt  → Context + ChatGPT prompt  
```

## Multi-Agent Usage

- **Claude**: Best for complex analysis, TodoWrite tracking, tool integration
- **ChatGPT**: Good for straightforward documentation, step-by-step workflows
- **Both**: Can work on same files - prompts are tailored for each agent's strengths

## Target Files

The system manages AGENTS.md files across:

### App & API
- Root and app structure
- API routes (/organizations, /pharmacies, /nhs, /lookup)

### Features  
- Authentication, billing, dashboard, landing, organizations, sponsors

### Components & Libraries
- Components, UI primitives, libraries, models, types, services, utils

### Development & Testing
- **Storybook** (`.storybook/`) - Component stories and development
- **Documentation** (`docs/`) - Architecture guides and project docs  
- **Testing** (`tests/`) - E2E tests, test patterns, and workflows

Each maintains consistent structure while reflecting area-specific details.
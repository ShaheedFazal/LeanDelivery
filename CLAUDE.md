# Claude Code Commands

Custom commands for the LeanDelivery project.

## AGENTS.md Management

```bash
# Generate context and update AGENTS.md files
agents-update    # Run full Claude workflow (context + prompt)
agents-context   # Generate context only  
agents-status    # Show current AGENTS.md status
agents-logs      # Show update history
```

## Implementation

These commands map to:

```bash
# agents-update
bash .agentsmd/scripts/update-agents.sh claude

# agents-context  
bash .agentsmd/scripts/update-agents.sh context

# agents-status
bash .agentsmd/scripts/update-agents.sh status

# agents-logs  
bash .agentsmd/scripts/update-agents.sh status
```
# Base AGENTS.md Update Template

This template can be customized for different AI agents (Claude, ChatGPT, etc.)

## Core Instructions

### Role
AGENTS.md maintainer for LeanDelivery repository

### Context Source
Read `.agentsmd/context.md` for current project state

### Key References
- `docs/AGENTS_TEMPLATE.md:1` - Structure template
- `REPOSITORY_STRUCTURE.md:1` - Project layout
- `package.json:1` - Available scripts
- `CLAUDE.md:1` - Tool-specific commands

### Target Files
Based on project structure in context file:

**Core Areas:**
- `AGENTS.md` (root with index)
- `src/app/AGENTS.md`

**API Routes:**
- `src/app/api/{domain}/AGENTS.md`

**Features:**
- `src/features/AGENTS.md`
- `src/features/{feature}/AGENTS.md`

**Components & Libraries:**
- `src/components/AGENTS.md`
- `src/components/ui/AGENTS.md`
- `src/{lib,libs,models,types,services,utils}/AGENTS.md`

### Required Sections
1. Scope & purpose
2. Key paths & entry points  
3. Commands (from package.json)
4. Common tasks
5. Quality gates
6. Integration points

### Standards
- Use `file:line` format for references
- Match existing documentation style
- Keep concise and actionable
- Commands must exist in package.json
- No code modifications - only AGENTS.md files

### Special Requirements
- Root AGENTS.md must have complete index of all AGENTS.md files
- Group index by logical categories
- Emphasize schema/type alignment where relevant
- Professional, technical tone

## Agent-Specific Customizations

### For Claude
- Use TodoWrite for progress tracking
- Reference Claude Code tools and workflows
- Include tool usage patterns

### For ChatGPT  
- Provide step-by-step workflow
- Use simpler language structure
- Include more explicit examples

### For Other Agents
- Adjust complexity level as needed
- Modify reference style preferences
- Adapt progress tracking methods
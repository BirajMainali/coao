# COAO — Collaborative Agent Operating Organization

A structured multi-agent engineering environment powered by [OpenCode](https://opencode.ai). COAO defines the rules, agents, and tools needed for AI agents to collaborate effectively on software projects.

## Capabilities

### Organizational Rules

Policies that govern agent behavior, decision-making, and operations:

- **Behavior** — Communication protocols, decision frameworks, quality standards, research methodology
- **Governance** — Decision recording, knowledge management, standards lifecycle
- **Operations** — Workspace layout, collaboration model, session continuity, handoff protocols, artifact management

### Specialized Agents

Four subagents with distinct roles, permissions, and operating principles:

| Agent | Role | Permissions |
|---|---|---|
| **Product Owner** | Business requirements and value delivery | Read-only |
| **Solution Architect** | Technical design and architecture | Edit + Bash |
| **Software Engineer** | Production implementation | Edit + Bash |
| **QA Engineer** | Quality validation and release confidence | Read-only |

### MCP Servers

Additional tools available to agents during development:

- **Serena** — Symbolic code retrieval, editing, and refactoring via language-server-backed IDE. Enables cross-file refactoring, symbol navigation, and deep code understanding.
- **Chrome DevTools** — Browser automation and performance analysis. Used for web testing, debugging, performance audits, and screenshots.
- **fixture-mcp** — Stateful API testing with persistent sessions, key-value context store, event audit logs, and multi-step workflows.

### Skills

- **caveman** — Ultra-compressed communication mode (~75% fewer output tokens). Activates on `/caveman` or request for brevity.
- **git-worktree** — Git worktree management for isolated mission-based development.
- **grill-with-docs** — Stress-tests plans against the existing domain model, sharpens terminology, and updates docs (CONTEXT.md, ADRs) inline.
- **domain-modeling** — Builds and sharpens a project's domain model, glossary, and architectural decisions.

## Getting Started

This project requires [OpenCode](https://opencode.ai) as the AI client. Configuration is in `opencode.json`.

```bash
# Install global dependencies
npm install -g fixture-mcp
uv tool install -p 3.13 serena-agent
serena init
```

## Project Structure

```
.opencode/
├── agents/          # Subagent definitions (PO, QA, SE, SA)
├── skills/          # Reusable skills (caveman, git-worktree)
rules/
├── behavior/        # Communication, decisions, quality, research
├── governance/      # Decisions, knowledge, standards
└── operations/      # Workspace, collaboration, session, handoff, artifacts
AGENTS.md            # Primary opencode instructions
opencode.json         # OpenCode configuration with MCP servers
```

## Conventions

- Communicate through artifacts, not conversation history
- Read before asking; update before creating
- Every mission uses an isolated workspace under `.coao/workspace/active/<mission-slug>/`
- Source code belongs in the repo; mission artifacts belong in the workspace
- Knowledge outlives missions; memory is archived with the workspace

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
- **grilling** — Grills you relentlessly about a plan or design, one question at a time.

## Getting Started

### Install in your project

```bash
curl -fsSL https://raw.githubusercontent.com/BirajMainali/coao/main/install.sh | bash
```

The script will ask whether to install project-wide (`.opencode/` in your current directory) or globally (`~/.config/opencode/`).

### Install global dependencies

```bash
npm install -g fixture-mcp
uv tool install -p 3.13 serena-agent
serena init
```

## Project Structure

```
.opencode/
├── AGENTS.md          # Primary opencode instructions
├── opencode.json      # OpenCode configuration with MCP servers
├── agents/            # Subagent definitions (PO, QA, SE, SA)
├── skills/            # Reusable skills
│   ├── caveman/
│   ├── git-worktree/
│   └── grilling/
└── rules/             # Organizational policies
    ├── behavior/      # Communication, decisions, quality, research
    ├── governance/    # Decisions, knowledge, standards
    └── operations/    # Workspace, collaboration, session, handoff, artifacts
AGENTS.md → .opencode/AGENTS.md          # Symlink
opencode.json → .opencode/opencode.json  # Symlink
install.sh           # Install script for other projects
```

## Conventions

- Communicate through artifacts, not conversation history
- Read before asking; update before creating
- Every mission uses an isolated workspace under `.coao/workspace/active/<mission-slug>/`
- Source code belongs in the repo; mission artifacts belong in the workspace
- Knowledge outlives missions; memory is archived with the workspace

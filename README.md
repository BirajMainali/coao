# COAO — Multi-Agent Engineering Environment

Powered by [OpenCode](https://opencode.ai). Defines agents, rules, and tools for AI agents to collaborate on software projects.

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/BirajMainali/coao/main/install.sh | bash
```

Prompts for project-wide (`.opencode/`) or global (`~/.config/opencode/`) install.

## Agents

| Agent | Role | Permissions |
|---|---|---|
| **Product Owner** | Business requirements, value delivery | Edit + Bash |
| **Solution Architect** | Technical design, architecture | Edit + Bash |
| **Software Engineer** | Production implementation | Edit + Bash |
| **QA Engineer** | Quality validation, release confidence | Edit + Bash |

## MCP Servers

- **Serena** — Symbolic code retrieval/editing via language-server-backed IDE
- **Chrome DevTools** — Browser automation, web testing, performance audits
- **fixture-mcp** — Stateful API testing with persistent sessions

## Skills

- **caveman** — Ultra-compressed communication (~75% fewer tokens via `/caveman`)
- **git-worktree** — Isolated mission-based development
- **grilling** — Stress-test plans and designs

## Rules

Organizational policies in `.opencode/rules/`: behavior (communication, decisions, quality), governance (decisions, knowledge, standards), operations (workspace, collaboration, handoff, artifacts).

## Project Structure

```
.opencode/
├── AGENTS.md        # Primary instructions
├── opencode.json    # Config + MCP servers
├── agents/          # Subagent definitions
├── skills/          # caveman, git-worktree, grilling
└── rules/           # behavior/, governance/, operations/
AGENTS.md → .opencode/AGENTS.md
opencode.json → .opencode/opencode.json
install.sh
```

## Conventions

- Communicate through artifacts, not conversation history
- Read before asking; update before creating
- Missions use isolated workspaces under `.coao/workspace/active/<slug>/`; knowledge outlives missions

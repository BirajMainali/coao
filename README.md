<img src="https://img.shields.io/badge/license-Proprietary-red" alt="License"> <img src="https://img.shields.io/badge/status-active-success" alt="Status"> <img src="https://img.shields.io/badge/powered_by-OpenCode-6C47FF" alt="OpenCode">

# COAO — Collaborative Agent Operating Organization

A turnkey multi-agent engineering environment for [OpenCode](https://opencode.ai). COAO organizes AI agents into a structured engineering organization with specialized roles, codified rules, and mission-based workspaces — so they collaborate on software projects like a real team, not a chat session.

## Table of Contents

- [Why COAO?](#why-coao)
- [Quick Start](#quick-start)
- [Architecture](#architecture)
  - [Agents](#agents)
  - [Rules](#rules)
  - [MCP Servers](#mcp-servers)
  - [Skills](#skills)
- [Project Structure](#project-structure)
- [Contributing](#contributing)

## Why COAO?

Most agent setups treat every interaction as an isolated prompt — no structure, no separation of concerns, no persistence. COAO is different.

### Mission-Based, Not Task-Based

Work is organized into **missions** — bounded units with clear objectives, scope, and completion criteria. Each mission gets an isolated workspace (`.coao/workspace/active/<slug>/`) so state, context, and artifacts from one mission never leak into another. No context pollution, no hidden side effects.

### Organizational Structure Over Ad-Hoc Prompts

Instead of a single general-purpose agent, COAO defines **four specialized roles** — Product Owner, Solution Architect, Software Engineer, QA Engineer — mirroring a real engineering org. Each has a distinct decision framework, quality checklist, and constraints. The result: better separation of concerns, higher-quality output, and a clear chain of responsibility.

### Rules as Codified Policy

Rules aren't vague guidelines. They're structured policies organized by domain — **behavior** (how agents act), **governance** (how decisions and knowledge persist), and **operations** (how work flows). Agents load and follow these rules at the start of each session, ensuring consistency across missions and over time.

### Artifact-Driven, Not Conversation-Driven

Agents communicate through **persistent artifacts** — specs, test plans, ADRs, risk assessments — not chat history. This makes handoffs clean, sessions auditable, and recovery trivial. When a mission ends, the artifacts remain. Knowledge outlives the conversation.

### Learning Organization

When a mission is archived, the knowledge gained — architecture decisions, quality lessons, new standards — is promoted to persistent memory. The organization improves with every mission instead of starting from scratch.

## Quick Start

```bash
curl -fsSL https://raw.githubusercontent.com/BirajMainali/coao/main/install.sh | bash
```

The script prompts for **project-wide** install (`.opencode/` in current directory) or **global** install (`~/.config/opencode/`). Once installed, launch OpenCode in your project and the agents, rules, and tools are ready.

### Global dependencies

```bash
npm install -g fixture-mcp
uv tool install -p 3.13 serena-agent
serena init
```

## Architecture

### Agents

Four subagents with distinct responsibilities, each with full **Edit + Bash** permissions:

| Agent | Role |
|---|---|
| **Product Owner** | Business requirements, value delivery |
| **Solution Architect** | Technical design, architecture |
| **Software Engineer** | Production implementation |
| **QA Engineer** | Quality validation, release confidence |

Agent definitions live in `.opencode/agents/` as markdown files with YAML front-matter containing descriptions, temperature, and permission settings.

### MCP Servers

| Server | Purpose |
|---|---|
| **Serena** | Symbolic code retrieval, editing, and cross-file refactoring via language-server-backed IDE |
| **Chrome DevTools** | Browser automation, web testing, debugging, performance audits, and screenshots |
| **fixture-mcp** | Stateful API testing with persistent sessions, context store, event audit logs, and multi-step workflows |

### Skills

| Skill | Description |
|---|---|
| **caveman** | Ultra-compressed communication mode (~75% fewer tokens). Activate with `/caveman`. |
| **git-worktree** | Isolated mission-based development using Git worktrees. |
| **grilling** | Interactive session that stress-tests a plan or design one question at a time. |

### Rules

Rules are the operating system of the organization. Each domain is designed to achieve a specific goal:

| Domain | Goal | What It Covers |
|---|---|---|
| **behavior/** | Consistency & quality | Communication protocols, evidence-based decision frameworks, deliverable quality standards, research methodology |
| **governance/** | Organizational memory | Decision recording (ADRs), knowledge vs. memory promotion, standards lifecycle and compliance |
| **operations/** | Flow & reliability | Workspace layout and lifecycle, multi-agent collaboration model, session continuity and recovery, ownership handoff protocols, artifact-driven communication |

Every agent loads the relevant rules at session start. Rules ensure agents make consistent decisions, persist what matters, and hand off work cleanly — regardless of which agent or mission is involved.

This is what makes COAO an _organization_, not just a collection of prompts. Rules define the culture, and the culture produces predictable outcomes.

## Project Structure

```
.
├── .opencode/                    # COAO configuration root
│   ├── AGENTS.md                 # Primary OpenCode instructions
│   ├── opencode.json             # OpenCode configuration + MCP servers
│   ├── agents/                   # Subagent definitions (product-owner, qa-engineer, software-engineer, solution-architect)
│   ├── skills/                   # Reusable skills (caveman, git-worktree, grilling)
│   └── rules/                    # Organizational policies (behavior/, governance/, operations/)
├── AGENTS.md -> .opencode/AGENTS.md           # Symlink for OpenCode discovery
├── opencode.json -> .opencode/opencode.json   # Symlink for OpenCode discovery
└── install.sh                                 # Bootstrap script for other projects
```

## Contributing

Open an issue or pull request on [GitHub](https://github.com/BirajMainali/coao).

---

Built with [OpenCode](https://opencode.ai).

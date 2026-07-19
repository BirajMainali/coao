# COAO — Collaborative Agent Operating Organization

**The engineering organization for AI agents.** COAO transforms OpenCode agents from isolated assistants into a structured, role-based engineering team with codified rules, persistent knowledge, and mission-driven workflows.

<p align="center">
  <img src="https://img.shields.io/badge/license-MIT-blue" alt="MIT License">
  <img src="https://img.shields.io/badge/platform-opencode-purple" alt="OpenCode Platform">
</p>

## Table of Contents

- [What is COAO?](#what-is-coao)
- [Why COAO?](#why-coao)
- [Quick Start](#quick-start)
- [Architecture](#architecture)
  - [Agents](#agents)
  - [Rules](#rules)
  - [MCP Servers](#mcp-servers)
  - [Skills](#skills)
- [Project Structure](#project-structure)
- [Comparison](#comparison)
- [Contributing](#contributing)

---

## What is COAO?

COAO is a **turnkey multi-agent engineering environment** for [OpenCode](https://opencode.ai). It organizes AI agents into a structured engineering organization — with specialized roles, codified policies, and mission-based workspaces — so agents collaborate on software projects like a real team, not a chat session.

Think of it as the **operating system for agent collaboration** — defining not just what agents do, but how they interact, how decisions are made, how knowledge persists, and how the organization improves over time.

---

## Why COAO?

### The Problem

Most agent setups treat every interaction as an isolated prompt:
- No separation of concerns — one agent does everything
- No persistent memory — knowledge vanishes after the conversation
- No structured handoffs — context is lost between sessions
- No codified standards — every interaction reinvents the process
- No learning organization — mistakes repeat, insights evaporate

### The COAO Difference

#### Organizational Structure > Ad-Hoc Prompts

Instead of a single general-purpose agent, COAO defines **five specialized roles** — Product Owner, Solution Architect, Software Engineer, QA Engineer, and True Researcher — mirroring a real engineering org. Each agent has:
- A distinct decision framework
- A quality checklist specific to its domain
- Clear constraints on what it can and cannot do
- Defined ownership boundaries and handoff protocols

The result: **separation of concerns, higher quality output, and a clear chain of responsibility.**

#### Mission-Based > Task-Based

Work is organized into **missions** — bounded units with clear objectives, scope, and completion criteria. Each mission gets an isolated workspace (`.coao/<type>s/<slug>/`) so state, context, and artifacts never leak between missions. The types — project, feature, fix, task, spike, chore, release — each have their own lifecycle, agent involvement, and completion criteria.

The result: **no context pollution, no hidden side effects, clean boundaries.**

#### Artifact-Driven > Conversation-Driven

Agents communicate through **persistent artifacts** — specs, ADRs, test plans, risk assessments — not chat history. Shared workspace files (`context.md`, `decisions.md`, `research.md`) are the source of truth. Every agent reads before acting and updates before finishing. Handoffs are clean, sessions are auditable, and recovery is trivial.

The result: **knowledge outlives the conversation.**

#### Codified Rules > Vague Guidelines

Rules aren't suggestions. They're structured policies organized by domain — **behavior** (how agents act), **governance** (how decisions and knowledge persist), and **operations** (how work flows). Agents load and follow these rules at session start, ensuring consistency across missions and over time.

The result: **predictable, repeatable outcomes.**

#### Learning Organization > Stateless Assistant

When a mission is archived, reusable knowledge — architecture decisions, quality lessons, proven patterns — is promoted to persistent memory via a staged pipeline: **collect → curate → promote → validate**. The organization becomes smarter with every mission instead of starting from scratch.

The result: **continuous improvement, not repeated rediscovery.**

---

## Quick Start

```bash
curl -fsSL https://raw.githubusercontent.com/BirajMainali/coao/master/install.sh | bash
```

The script prompts for **project-wide** install (`.opencode/` in current directory) or **global** install (`~/.config/opencode/`). Once installed, launch OpenCode in your project — agents, rules, and tools are ready.

### Global Dependencies

```bash
npm install -g fixture-mcp
uv tool install -p 3.13 serena-agent
serena init
```

### What You Get

- 5 specialized agents with role-specific instructions
- 10+ codified organizational rules across 3 domains
- 3 MCP servers for code intelligence, browser testing, and API testing
- 3 ready-to-use skills for git workflows, communication, and design reviews
- A workspace system for mission isolation
- A knowledge pipeline for organizational learning

---

## Architecture

### Agents

| Agent | Type | Role | Tool Access |
|-------|------|------|-------------|
| **Product Owner** | Requirements | Business requirements, value delivery | Edit + Bash |
| **Solution Architect** | Design | Technical design, architecture decisions | Edit + Bash |
| **Software Engineer** | Implementation | Production code, unit tests | Edit + Bash |
| **QA Engineer** | Validation | Quality assurance, test strategy | Edit + Bash |
| **True Researcher** | Research | Unbiased, context-free industry research | Edit only (research.md), Bash: none |

Each agent is defined in `.opencode/agents/` as a Markdown file with YAML front-matter containing:
- **description** — what the agent does
- **mode** — subagent (invocable via `task` tool)
- **temperature** — creativity vs. determinism balance
- **permission** — which tools are allowed (`edit`, `bash`)
- **instructions** — the agent's complete behavioral prompt

The **True Researcher** is unique: it has no `bash` access and strict constraints against reading any project code or documentation. It produces unbiased findings using only web search and domain expertise, eliminating anchoring bias from existing context.

#### How Agents Work Together

```
                ┌──────────────────┐
                │  Product Owner   │  Defines WHAT to build
                └────────┬─────────┘
                         │
                ┌────────▼─────────┐
                │Solution Architect│  Designs HOW to build it
                └────────┬─────────┘
                         │
                ┌────────▼─────────┐
                │Software Engineer │  Builds it
                └────────┬─────────┘
                         │
                ┌────────▼─────────┐
                │   QA Engineer    │  Validates it's correct
                └──────────────────┘

    ┌─────────────────────────────────────┐
    │          True Researcher            │  Researches WHAT should be done
    │  (context-free, invoked on demand)  │  (industry unbiased)
    └─────────────────────────────────────┘
```

Each agent is self-contained and consults others on demand — not as a pipeline step but as a collaboration. Ownership stays with the primary agent throughout.

### Rules

Rules are the operating system of the organization. Organized into three domains, each designed for a specific purpose:

| Domain | Goal | What It Covers |
|--------|------|----------------|
| **Behavior** | Consistency & quality | Communication protocols, evidence-based decisions, quality standards, research methodology, tool discipline |
| **Governance** | Organizational memory | Decision recording (ADRs), knowledge vs. memory promotion, standards lifecycle and compliance |
| **Operations** | Flow & reliability | Work item types & lifecycles, workspace layout, multi-agent collaboration, session recovery, handoff protocols, artifact management |

Rules are loaded on a need-to-know basis at session start. They ensure agents make consistent decisions, persist what matters, and hand off work cleanly — regardless of which agent or mission is involved.

### MCP Servers

| Server | Purpose | Use When |
|--------|---------|----------|
| **Serena** | Symbolic code retrieval & cross-file refactoring (language-server-backed IDE) | Deep code understanding, refactoring across files |
| **Chrome DevTools** | Browser automation, web testing, debugging, performance audits, screenshots | Frontend testing, performance analysis |
| **fixture-mcp** | Stateful API testing with sessions, context store, event audit logs, multi-step workflows | API integration testing, session-persistent workflows |

### Skills

| Skill | Description | When To Use |
|-------|-------------|-------------|
| **caveman** | Ultra-compressed communication (~75% fewer tokens) | Requested brevity, `/caveman` |
| **git-worktree** | Isolated mission development with Git worktrees | Multi-branch work, isolated environments |
| **grilling** | Interactive stress-test of a plan or design | Design review, architecture validation |

---

## Project Structure

```
.
├── .opencode/                    # COAO configuration root
│   ├── AGENTS.md                 # Primary OpenCode instructions (entry point)
│   ├── opencode.json             # OpenCode configuration + MCP servers
│   ├── agents/                   # Subagent definitions with YAML front-matter
│   │   ├── product-owner.md
│   │   ├── qa-engineer.md
│   │   ├── software-engineer.md
│   │   ├── solution-architect.md
│   │   └── true-researcher.md
│   ├── skills/                   # Reusable skill definitions
│   │   ├── caveman/
│   │   ├── git-worktree/
│   │   └── grilling/
│   └── rules/                    # Organizational policies by domain
│       ├── behavior/             # Communication, decisions, quality, research, discipline
│       ├── governance/           # Decisions, knowledge, standards
│       └── operations/           # Work items, workspace, collaboration, session, handoff, artifacts
│
├── AGENTS.md -> .opencode/AGENTS.md           # Symlink for OpenCode discovery
├── opencode.json -> .opencode/opencode.json   # Symlink for OpenCode discovery
├── install.sh                                 # Bootstrap installer
│
├── knowledge/                    # Reusable organizational intelligence
│   ├── decisions/                # Architecture Decision Records (ADRs)
│   ├── standards/                # Proven standards and conventions
│   ├── patterns/                 # Reusable implementation patterns
│   ├── runbooks/                 # Operational procedures
│   └── lessons/                  # Lessons learned from missions
│
└── .coao/                        # Active mission workspaces
    ├── projects/                 # Long-lived product workspaces
    ├── features/                 # Feature delivery workspaces
    ├── fixes/                    # Bug fix workspaces
    ├── tasks/                    # Atomic action workspaces
    ├── spikes/                   # Research workspaces
    ├── chores/                   # Maintenance workspaces
    └── releases/                 # Release workspaces
```

---

## Comparison

| Capability | COAO | Basic Prompt | Cursor/Claude Projects |
|-----------|------|--------------|----------------------|
| **Multi-agent roles** | 5 specialized agents with permissions | Single agent does everything | Single agent |
| **Codified rules** | 10+ policies across 3 domains | None | Custom instructions |
| **Persistent knowledge** | Staged promotion pipeline with review | None | Some memory, no curation |
| **Mission isolation** | Workspaces per type (7 types) | None | Basic folders |
| **Artifact-driven** | context.md, decisions.md, research.md | Chat-only | Some docs |
| **Tool discipline policy** | When to use what (built-in vs. MCP vs. skills) | None | None |
| **Agent consultation** | Formalized ownership + handoff protocols | None | None |
| **Learning org** | Collect → curate → promote → validate | None | None |
| **Decision governance** | ADR lifecycle with alternatives & trade-offs | None | Some history |
| **Installable** | Single curl command | Not applicable | App-dependent |

---

## Contributing

Open an issue or pull request on [GitHub](https://github.com/BirajMainali/coao). Contributions to rules, agents, skills, and documentation are welcome.

---

COAO is built on the premise that **structure enables creativity**. Clear boundaries, roles, and processes don't constrain agents — they free them to focus on what matters: building great software.

# COAO - Collaborative Agent Operating Organization

A structured multi-agent engineering environment for [OpenCode](https://opencode.ai). COAO defines specialized agent roles, codified organizational policies, and a knowledge governance system that separates working memory from reusable knowledge.

---

## Table of Contents

- [Overview](#overview)
- [Problem](#problem)
- [Solution](#solution)
- [Core Concepts](#core-concepts)
  - [Memory vs Knowledge](#memory-vs-knowledge)
  - [Work Items](#work-items)
  - [Artifact-Driven Communication](#artifact-driven-communication)
  - [Agent Roles](#agent-roles)
- [Architecture](#architecture)
  - [Agent Layer](#agent-layer)
  - [Policy Layer](#policy-layer)
  - [Tool Layer](#tool-layer)
- [Project Structure](#project-structure)
- [Installation](#installation)
- [Comparison](#comparison)
- [Contributing](#contributing)

---

## Overview

COAO organizes AI agents into a structured engineering organization with specialized roles, codified rules, and workspace-based work items. It provides:

- **Role separation** - five agent types with distinct responsibilities and constraints
- **Organizational policies** - codified rules for behavior, governance, and operations
- **Knowledge governance** - a staged pipeline separating transient memory from permanent knowledge
- **Workspace isolation** - per-mission directories preventing context leakage
- **Tool discipline** - guidelines for selecting between built-in tools, MCP servers, and skills

COAO is not a library or framework. It is a configuration layer that runs on OpenCode and is installable into any project.

---

## Problem

Most AI-assisted software development setups share common structural weaknesses:

| Issue | Consequence |
|-------|------------|
| Single general-purpose agent | No separation of concerns |
| No persistent knowledge | Insights vanish after each session |
| No structured handoffs | Context lost between sessions |
| No codified standards | Every interaction reinvents the process |
| Conversation-driven communication | History is the only record |
| No learning mechanism | Same mistakes recur across sessions |

These are organizational problems, not technical ones. COAO addresses them by imposing structure on how agents collaborate, make decisions, and persist what they learn.

---

## Solution

COAO provides a structured operating model for agent collaboration:

1. **Specialized agent roles** - each with defined ownership, decision frameworks, quality checklists, and constraints
2. **Codified organizational policies** - rules organized by domain (behavior, governance, operations) loaded at session start
3. **Knowledge governance pipeline** - collect, curate, promote, and validate reusable intelligence
4. **Workspace-based work items** - per-mission isolation with type-specific lifecycles
5. **Tool selection guidelines** - when to use built-in tools, MCP servers, or skills

---

## Core Concepts

### Memory vs Knowledge

A central distinction in COAO is the separation between **memory** and **knowledge**. These are frequently conflated in other systems; COAO treats them as distinct constructs with different lifecycles and governance rules.

| | Memory | Knowledge |
|--|--------|-----------|
| **Scope** | Work-item-specific | Organization-wide |
| **Lifetime** | Transient (archived with mission) | Persistent (survives workspaces) |
| **Location** | `.coao/<type>s/<slug>/` | `knowledge/` at repository root |
| **Examples** | Progress notes, open questions, working assumptions, handoff documents | Architecture decisions, proven patterns, standards, runbooks, lessons learned |
| **Governance** | No formal review needed | Staged pipeline: collect → curate → promote → validate |
| **Promotion** | Never promoted | Curated from memory candidates |

Memory supports execution. Knowledge supports future decisions.

The knowledge pipeline operates in four stages:

1. **Collect** - during work, agents flag reusable findings with `[KNOWLEDGE-CANDIDATE]` prefix
2. **Curate** - at work item completion, candidates are evaluated against promotion criteria (reusable, evidence-based, valuable, stable, relevant)
3. **Promote** - approved findings are written to `knowledge/` with appropriate categorization (decisions, standards, patterns, runbooks, lessons)
4. **Validate** - future agents reference and verify knowledge; stale entries are updated, deprecated, or archived

### Work Items

Work is organized into typed work items. Each type defines its lifecycle, agent involvement, and workspace contents:

| Type | Scale | Lifecycle | Agents |
|------|-------|-----------|--------|
| **project** | Weeks–months | active → archived | PO, SA, SE, QA |
| **feature** | Days–weeks | proposed → designed → implemented → validated → merged | PO → SA → SE → QA |
| **fix** | Hours–days | reported → reproduced → fixed → verified → merged | SE → QA |
| **task** | Minutes–hours | assigned → done → merged | SE |
| **spike** | Hours–days | started → researched → documented → resolved | SA (or True Researcher) |
| **chore** | Hours | started → done → merged | SE |
| **release** | Hours | prepared → tested → shipped | SE → QA |

Each work item creates an isolated workspace under `.coao/<type>s/<slug>/` containing shared artifacts (`context.md`, `decisions.md`, `research.md`, `attachments/`, `knowledge-candidates/`).

### Artifact-Driven Communication

Agents communicate through shared workspace artifacts, not conversation history. The three core artifacts are:

- **`context.md`** - single living document with sections for summary, status, requirements, design, implementation notes, validation results, risks, and next actions
- **`decisions.md`** - decision log recording context, problem, alternatives, rationale, and trade-offs
- **`research.md`** - investigation notes with findings, evidence, assumptions, and recommendations

This approach ensures that any agent can continue work by reading the workspace without needing prior conversation context.

### Agent Roles

COAO defines five agent roles. Each has a distinct domain of ownership, decision framework, quality checklist, and tool permissions:

| Agent | Domain | Tool Access |
|-------|--------|-------------|
| **Product Owner** | Business requirements, value delivery | Edit + Bash |
| **Solution Architect** | Technical design, architecture decisions | Edit + Bash |
| **Software Engineer** | Production implementation | Edit + Bash |
| **QA Engineer** | Quality validation, release confidence | Edit + Bash |
| **True Researcher** | Context-free industry research | Edit (research.md only), Bash: none |

The True Researcher is a specialized agent that conducts unbiased research using only web search and domain expertise. It has no access to project code, documentation, or execution, which prevents anchoring bias from existing context.

Agents are self-contained and consult each other on demand using the `task` tool with the target agent's type. Ownership remains with the consulting agent throughout.

---

## Architecture

### Agent Layer

Five subagent definitions in `.opencode/agents/`, each a Markdown file with YAML front-matter specifying description, temperature, mode (subagent), and tool permissions. Agents are invoked via the `task` tool.

### Policy Layer

Ten codified policies organized into three domains, loaded on a need-to-know basis:

| Domain | Policy | Purpose |
|--------|--------|---------|
| **Behavior** | communication.md | Agent collaboration and artifact usage |
| | decision-making.md | Evidence-based decision process |
| | quality.md | Deliverable quality standards |
| | research.md | Investigation and uncertainty reduction |
| | discipline.md | Tool and technology selection |
| **Governance** | decisions.md | Decision recording and ADR lifecycle |
| | knowledge.md | Memory vs knowledge distinction and promotion pipeline |
| | standards.md | Standards lifecycle and compliance |
| **Operations** | work-items.md | Work item types, lifecycles, and agent involvement |
| | workspace.md | Workspace layout and lifecycle |
| | collaboration.md | Multi-agent consultation model |
| | session.md | Session continuity and recovery |
| | handoff.md | Ownership transfer protocol |
| | artifacts.md | Artifact-driven communication |

### Tool Layer

Three MCP servers and three skills extend agent capabilities:

**MCP Servers:**

| Server | Capability |
|--------|------------|
| **Serena** | Language-server-backed code retrieval, editing, and refactoring |
| **Chrome DevTools** | Browser automation, web testing, debugging, performance auditing |
| **fixture-mcp** | Stateful API testing with session persistence and event audit logs |

**Skills:**

| Skill | Purpose |
|-------|---------|
| **caveman** | Compressed communication mode (~75% token reduction) |
| **git-worktree** | Isolated branch-based development with Git worktrees |
| **grilling** | Interactive design and plan review |

Tool discipline policy provides selection guidelines: prefer built-in tools for standard operations, MCP servers for specialized capabilities, and skills for guided workflows.

---

## Project Structure

```
.
├── .opencode/                    # COAO configuration
│   ├── AGENTS.md                 # Primary OpenCode instructions
│   ├── opencode.json             # OpenCode configuration with MCP servers
│   ├── agents/                   # Agent definitions
│   │   ├── product-owner.md
│   │   ├── solution-architect.md
│   │   ├── software-engineer.md
│   │   ├── qa-engineer.md
│   │   └── true-researcher.md
│   ├── rules/                    # Organizational policies
│   │   ├── behavior/             # communication, decision-making, quality, research, discipline
│   │   ├── governance/           # decisions, knowledge, standards
│   │   └── operations/           # work-items, workspace, collaboration, session, handoff, artifacts
│   └── skills/                   # Skill definitions
│       ├── caveman/
│       ├── git-worktree/
│       └── grilling/
│
├── AGENTS.md -> .opencode/AGENTS.md
├── opencode.json -> .opencode/opencode.json
├── install.sh                    # Bootstrap installer
│
├── knowledge/                    # Reusable organizational intelligence
│   ├── decisions/                # Architecture Decision Records
│   ├── standards/                # Organizational standards
│   ├── patterns/                 # Reusable patterns
│   ├── runbooks/                 # Operational procedures
│   └── lessons/                  # Lessons learned
│
└── .coao/                        # Active work item workspaces
    ├── projects/
    ├── features/
    ├── fixes/
    ├── tasks/
    ├── spikes/
    ├── chores/
    └── releases/
```

Key structural notes:

- `AGENTS.md` at root is a symlink to `.opencode/AGENTS.md` for OpenCode discovery
- `opencode.json` at root is similarly symlinked
- `knowledge/` persists across work items and is never archived
- `.coao/` contains active workspaces; each is archived on work item completion

---

## Installation

### Prerequisites

- [OpenCode](https://opencode.ai) installed
- `fixture-mcp` (optional, for API testing): `npm install -g fixture-mcp`
- `serena-agent` (optional, for code intelligence): `uv tool install -p 3.13 serena-agent && serena init`

### Install

```bash
curl -fsSL https://raw.githubusercontent.com/BirajMainali/coao/master/install.sh | bash
```

The install script copies agent definitions, rules, skills, and configuration into your project's `.opencode/` directory. It supports two installation modes:

- **Project-wide** - files are placed in `<project>/.opencode/`
- **Global** - files are placed in `~/.config/opencode/`

After installation, launch OpenCode in the project directory. The agents, rules, and skills defined by COAO are automatically loaded.

### Contents

Installing COAO adds to your project:

- 5 agent definitions
- 14 codified policies across 3 domains
- 3 MCP server configurations (Serena, Chrome DevTools, fixture-mcp)
- 3 skill definitions
- Workspace initialization templates
- Knowledge governance pipeline configuration

---

## Comparison

| Capability | COAO | Unstructured Agent Setup |
|-----------|------|--------------------------|
| Agent roles | 5 specialized roles with defined ownership | Single general-purpose agent |
| Organizational policies | 14 codified rules across 3 domains | None or ad-hoc instructions |
| Knowledge vs memory | Explicit separation with governance pipeline | No distinction; insights are lost |
| Work item types | 7 types with distinct lifecycles and agent maps | No formal classification |
| Workspace isolation | Per-mission directories with shared artifacts | No isolation |
| Artifact-driven communication | context.md, decisions.md, research.md | Conversation history |
| Tool selection guide | Policy-based (built-in > MCP > skill) | No guidance |
| Session recovery | Read workspace, restore context | Start from scratch |
| Knowledge persistence | Staged pipeline (collect → curate → promote → validate) | Not addressed |

---

## Contributing

Contributions to agent definitions, rules, skills, and documentation are welcome. Open an issue or pull request on [GitHub](https://github.com/BirajMainali/coao).

---

COAO is built on the premise that structured collaboration produces better outcomes than ad-hoc interaction. Clear roles, policies, and knowledge governance enable agents to focus on their domain without reinventing process or losing what they learn.

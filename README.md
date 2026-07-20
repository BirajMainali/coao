# COAO - Collaborative Agent Operating Organization

A multi-agent tuning layer for [OpenCode](https://opencode.ai). COAO connects specialized agent roles with shared context and persistent knowledge — guiding agents to collaborate like a real engineering team without forcing them into rigid boxes.

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

COAO tunes AI agents to work together naturally. Instead of one agent doing everything, each agent has a clear role — product owner, architect, engineer, QA, researcher — and the framework connects them through shared context and persistent knowledge. It provides:

- **Role-matched agents** - five types, each tuned for what it does best
- **Guiding policies** - gentle structure for behavior, governance, and operations
- **Knowledge that sticks** - a pipeline that turns working memory into reusable intelligence
- **Focused workspaces** - per-task isolation that keeps context clean without overhead
- **Tool awareness** - guidance on when to use built-in tools vs specialized skills

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

These are organizational problems, not technical ones. COAO addresses them by connecting the dots — guiding agents to collaborate naturally, make better decisions, and keep what they learn.

---

## Solution

COAO connects the right agent capabilities to the right workflow:

1. **Matched agent roles** - each tuned for its domain, with decision frameworks and quality checks that amplify natural strengths
2. **Guiding policies** - lightweight structure for behavior, governance, and operations loaded at session start
3. **Knowledge that persists** - collect, curate, promote, and validate so insights don't vanish
4. **Workspace per task** - isolated workspaces with a shared ticket and role-specific work areas
5. **Tool guidance** - know when to use built-in tools or specialized skills

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

Work items tune the AI's approach to match the task. Each type connects the right agents and workflow naturally — no forcing, just fitting the tool to the job:

| Type | Scale | Lifecycle | Agents |
|------|-------|-----------|--------|
| **project** | Weeks–months | active → archived | PO, SA, SE, QA |
| **feature** | Days–weeks | proposed → designed → implemented → validated → merged | PO → SA → SE → QA |
| **fix** | Hours–days | reported → reproduced → fixed → verified → merged | SE → QA |
| **task** | Minutes–hours | assigned → done → merged | SE |
| **spike** | Hours–days | started → researched → documented → resolved | SA (or True Researcher) |
| **chore** | Hours | started → done → merged | SE |
| **release** | Hours | prepared → tested → shipped | SE → QA |

Each work item creates an isolated workspace under `.coao/<type>s/<slug>/` with a shared ticket (`context.md`) and role-specific directories (`product-owner/`, `solution-architect/`, `software-engineer/`, `qa-engineer/`).

### Artifact-Driven Communication

Agents communicate through shared workspace artifacts, not conversation history. The workspace is organized like a Jira ticket:

- **`context.md`** - the shared ticket: summary, workflow, requirements, design overview, implementation summary, validation results, status, risks, and next actions. Each agent owns their domain's section; no one edits another agent's contribution.
- **`decisions.md`** - decision log recording context, problem, alternatives, rationale, and trade-offs
- **Role directories** (`product-owner/`, `solution-architect/`, `software-engineer/`, `qa-engineer/`) - deep work, research, and tracking owned by each role, with no prescribed structure

The boundary rule: if every agent needs it, it goes in `context.md`. If one role owns it, it goes in their directory. Duplication is a violation.

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

Three skills extend agent capabilities:

**Skills:**

| Skill | Purpose |
|-------|---------|
| **caveman** | Compressed communication mode (~75% token reduction) |
| **git-worktree** | Isolated branch-based development with Git worktrees |
| **grilling** | Interactive design and plan review |

The tool policy guides selection: built-in tools for standard operations, skills for specialized workflows.

---

## Project Structure

```
.
├── .opencode/                    # COAO configuration
│   ├── AGENTS.md                 # Primary OpenCode instructions
│   ├── opencode.json             # OpenCode configuration
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

- 3 skill definitions
- Workspace initialization templates
- Knowledge governance pipeline configuration

---

## Comparison

| Capability | COAO | Unstructured Agent Setup |
|-----------|------|--------------------------|
| Agent roles | 5 roles tuned for their domain | Single general-purpose agent |
| Guiding policies | 14 lightweight policies across 3 domains | None or ad-hoc instructions |
| Knowledge vs memory | Clear separation with promotion pipeline | No distinction; insights are lost |
| Work item types | 7 types matching task to workflow | No task matching |
| Workspace isolation | Per-task directories with shared context | No isolation |
| Artifact-driven communication | context.md (shared ticket), decisions.md, role-specific artifacts | Conversation history |
| Tool guidance | Built-in > skill when appropriate | No guidance |
| Session recovery | Read workspace, pick up where you left off | Start from scratch |
| Knowledge persistence | Collect → curate → promote → validate | Not addressed |

---

## Contributing

Contributions to agent definitions, rules, skills, and documentation are welcome. Open an issue or pull request on [GitHub](https://github.com/BirajMainali/coao).

---

COAO is built on a simple premise: agents perform best when their strengths are matched to the right task, they have the context they need, and what they learn doesn't disappear. The structure exists to reduce friction, not to constrain.

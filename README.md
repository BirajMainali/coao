# COAO - Collaborative Agent Operating Organization

A configuration layer for [OpenCode](https://opencode.ai) that tunes AI agents to collaborate like a real engineering team - with roles, shared context, and memory that outlives individual sessions.

Nothing is enforced. Everything is tuned.

## Philosophy

Most AI coding setups treat agents as interchangeable workers: drop a task in, get code out. It works for simple things. It breaks down when work requires research, validation, multiple perspectives, or knowledge that carries across sessions.

COAO takes a different approach. Instead of forcing agents into rigid pipelines, it provides lightweight patterns - roles with clear domains, a shared workspace for context, separation between working memory and permanent knowledge - and lets agents decide how to apply them. The structure exists to reduce friction, not to constrain.

The task determines the workflow, not the other way around.

## Core Mental Models

### Memory vs Knowledge

The most important distinction in COAO.

**Memory** is work-item-specific - progress notes, open questions, working assumptions, handoff documents. It lives in `.coao/<type>s/<slug>/` and is archived when the work item completes. It supports execution.

**Knowledge** is organizational - architecture decisions, proven patterns, standards, runbooks, lessons learned. It lives in `knowledge/` at the repository root and survives across work items. It supports future decisions.

Memory is never promoted automatically. Knowledge is curated through a pipeline:

```
Collect (during work) -> Curate (at completion) -> Promote (to knowledge/) -> Validate (across future work)
```

Every work item must produce a knowledge outcome - either something was promoted, or a clear reason why nothing qualified.

### Work Items

Work comes in different shapes. A bug fix, a new feature, a research spike - each has a natural lifecycle and needs different agent involvement. COAO defines seven types:

| Type | Scale | When |
|------|-------|------|
| project | Weeks-months | Building or evolving a system |
| feature | Days-weeks | Adding a new capability |
| fix | Hours-days | Repairing a bug |
| task | Minutes-hours | A single atomic action |
| spike | Hours-days | Research to reduce uncertainty |
| chore | Hours | Maintenance, tech debt |
| release | Hours | Cutting a version |

The agent reads the task, picks the type, selects the right agents, and executes. Smaller types skip unnecessary ceremony - a config change is done in minutes, a feature runs through research -> design -> implement -> validate.

### Artifact-Driven Communication

Agents communicate through shared workspace artifacts, not conversation history.

Each work item creates an isolated workspace:

```
.coao/<type>s/<slug>/
├── context.md              - Shared ticket (like a Jira issue)
├── decisions.md            - Decision log
├── product-owner/          - Requirements, user stories
├── solution-architect/     - Design, architecture research
├── software-engineer/      - Implementation notes
├── qa-engineer/            - Test plans, validation results
├── attachments/
└── knowledge-candidates/
```

`context.md` is the shared ticket - every agent reads it to understand the current state, and each agent owns their domain's sections (PO owns requirements, SA owns design, SE owns implementation, QA owns validation). No one edits another agent's contribution without agreement.

The boundary rule: if every agent needs it, it goes in `context.md`. If one role owns it, it goes in their directory. Duplication is a violation.

A new agent should understand the work item by reading the workspace without needing prior conversation.

## How It Works

A concrete example - a bug report:

1. **Initiate** - the agent reads the report, classifies it as a `fix`, creates `.coao/fixes/login-error/`, and writes the initial plan to `context.md`.
2. **Investigate** - Software Engineer reproduces the bug, diagnoses the root cause, documents findings in `software-engineer/`. Updates `context.md` with status.
3. **Fix** - SE implements the fix, notes the approach and any trade-offs in `software-engineer/`. Updates `context.md` - ready for review.
4. **Validate** - QA Engineer reads `context.md` and the implementation notes, writes test scenarios, validates the fix works and nothing regressed. Signs off in `context.md`.
5. **Merge** - the branch is merged. `context.md` is finalized.
6. **Knowledge review** - any reusable findings (a testing pattern, a root cause category) are flagged as knowledge candidates. A knowledge outcome is recorded.
7. **Archive** - workspace is archived. Knowledge lives on in `knowledge/`.

The same structure scales down (a chore skips steps 2-4, no workspace needed) and up (a feature runs PO -> SA -> SE -> QA in sequence).

## What's Included

### 5 Agents

| Agent | Domain | Key constraint |
|-------|--------|----------------|
| Product Owner | Requirements, business value, user stories | Never reads source code |
| Solution Architect | Technical design, trade-offs, architecture | Reduces technical uncertainty |
| Software Engineer | Implementation, debugging, code changes | Production delivery |
| QA Engineer | Validation, testing, release confidence | Quality sign-off |
| True Researcher | Unbiased external research | Never reads project files ("eliminate X") |

Each agent has YAML front-matter (mode, temperature, permissions), a decision framework, a quality checklist, defined edit scope, and consultation protocols. Agents are invoked through OpenCode's `task` tool with `subagent_type`.

### 8 Policies

| Domain | Policy | What it guides |
|--------|--------|----------------|
| Behavior | communication.md | Artifact-driven collaboration |
| | discipline.md | Tool and technology selection |
| Governance | decisions.md | Decision recording and ADR lifecycle |
| | knowledge.md | Memory vs knowledge distinction and pipeline |
| Operations | initiation.md | Work item classification and workflow design |
| | collaboration.md | Multi-agent consultation model |
| | work-items.md | Types, lifecycles, and agent involvement |
| | workspace.md | Workspace layout and lifecycle |

Policies are loaded at session start through `opencode.json`. They follow a consistent pattern: Purpose -> Principles -> Mechanics -> Anti-patterns -> Success criteria.

### 3 Skills

- **git-branching** - consistent naming, safe merge workflow
- **git-worktree** - isolated development environments per work item
- **prototype** - throwaway exploration to validate design decisions

## Quick Start

```bash
curl -fsSL https://raw.githubusercontent.com/BirajMainali/coao/main/install.sh | bash
```

Choose **project-wide** (`.opencode/` in current directory) or **global** (`~/.config/opencode/`). Launch OpenCode - agents, policies, and skills are loaded automatically.

To verify: start a task and watch the agent classify it, set up the workspace, and begin the workflow.

## Contributing

Contributions are welcome. Open an issue or pull request on [GitHub](https://github.com/BirajMainali/coao).

---

COAO is built on a simple premise: agents perform best when their strengths are matched to the right task, they have the context they need, and what they learn doesn't disappear. The structure exists to reduce friction, not to constrain.

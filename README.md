# COAO - Collaborative Agent Operating Organization

A configuration layer for [OpenCode](https://opencode.ai) that tunes AI agents to collaborate like a real engineering team — with roles, shared context, and memory that outlives individual sessions.

Nothing is enforced. Everything is tuned.

## Philosophy

Most AI coding setups treat agents as interchangeable workers: drop a task in, get code out. It works for simple things. It breaks down when work requires research, validation, multiple perspectives, or knowledge that carries across sessions.

COAO takes a different approach. Instead of forcing agents into rigid pipelines, it provides lightweight patterns — roles with clear domains, a shared workspace for context, separation between working memory and permanent knowledge — and lets agents decide how to apply them. Agents own work end-to-end. They consult domain experts when they hit boundaries; they never hand off ownership.

The task determines the workflow, not the other way around.

## Core Mental Models

### Memory vs Knowledge

The most important distinction in COAO.

**Memory** is work-item-specific — progress notes, open questions, working assumptions, research findings. It lives in `.coao/<type>s/<slug>/` and is archived when the work item completes. It supports execution.

**Knowledge** is organizational — architecture decisions, proven patterns, standards, runbooks, lessons learned. It lives in `knowledge/` at the repository root and survives across work items. It supports future decisions.

Memory is never promoted automatically. Knowledge is curated through a pipeline:

```
Collect (during work) -> Curate (at completion) -> Promote (to knowledge/) -> Validate (across future work)
```

### Work Items

Work comes in different shapes. A bug fix, a new feature, a research spike — each has a natural lifecycle and needs different agent involvement. COAO defines seven types:

| Type | Scale | When |
|------|-------|------|
| project | Weeks-months | Building or evolving a system |
| feature | Days-weeks | Adding a new capability |
| fix | Hours-days | Repairing a bug |
| task | Minutes-hours | A single atomic action |
| spike | Hours-days | Research to reduce uncertainty |
| chore | Hours | Maintenance, tech debt |
| knowledge | Continuous | Knowledge curation and improvement |

The agent reads the task, picks the type, and decides what level of structure the work warrants. A config change might skip the workspace entirely. A complex task might involve multiple agents through consultation, each owning their piece end-to-end.

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
└── attachments/            - Supporting files
```

`context.md` is the shared ticket — every agent reads it to understand the current state, and each agent owns their domain's sections (PO owns requirements, SA owns design, SE owns implementation, QA owns validation).

The boundary rule: if every agent needs it, it goes in `context.md`. If one role owns it, it goes in their directory. Duplication is a violation.

A new agent should understand the work item by reading the workspace without needing prior conversation.

## How It Works

A concrete example — a bug report:

1. **Initiate** — the agent reads the report, classifies it as a `fix`, creates `.coao/fixes/login-error/`, and writes the initial plan to `context.md`.
2. **Own** — Software Engineer reads context.md, investigates, diagnoses root cause, fixes the bug. Documents findings in `software-engineer/`.
3. **Consult** — SE asks QA Engineer for validation. QA runs tests, finds edge cases, reports back. SE fixes them.
4. **Complete** — SE finalizes context.md, flags knowledge candidates, runs validate.sh, merges.
5. **Knowledge review** — any reusable findings are promoted to `knowledge/`.

No baton pass. No pipeline. The SE owns it from report to merge, consulting QA when needed.

## What's Included

### 6 Agents

| Agent | Domain | Key constraint |
|-------|--------|----------------|
| Product Owner | Requirements, business value, user stories | Never reads source code |
| Solution Architect | Technical design, trade-offs, architecture | Never writes production code |
| Software Engineer | Implementation, debugging, code changes | Never redesigns architecture without consultation |
| QA Engineer | Validation, testing, release confidence | Never modifies production code |
| True Researcher | Unbiased external research | Never reads project files ("eliminate X") |
| Knowledge Steward | Knowledge lifecycle, curation, continuous improvement | Organizational intelligence |

Each agent has YAML front-matter (mode, temperature, permissions), role-specific responsibilities and constraints, and defined consultation paths. Agents are invoked through OpenCode's `task` tool with `subagent_type`.

### 9 Policies

| Domain | Policy | What it guides |
|--------|--------|----------------|
| Behavior | communication.md | Artifact-driven collaboration |
| | discipline.md | Tool and technology selection |
| | elicit.md | Structured business and technical discovery |
| Governance | decisions.md | Decision recording and ADR lifecycle |
| | knowledge.md | Memory vs knowledge distinction and pipeline |
| Operations | initiation.md | Work item classification and workflow design |
| | collaboration.md | Multi-agent consultation model |
| | work-items.md | Types, lifecycles, and completion criteria |
| | workspace.md | Workspace layout and lifecycle |

Policies are loaded at session start through `opencode.json`.

### 3 Skills

- **git-branching** — consistent naming, safe merge workflow
- **git-worktree** — isolated development environments per work item
- **prototype** — throwaway exploration to validate design decisions

## Quick Start

```bash
curl -fsSL https://raw.githubusercontent.com/BirajMainali/coao/master/install.sh | bash
```

Choose **project-wide** (`.opencode/` in current directory) or **global** (`~/.config/opencode/`). Launch OpenCode — agents, policies, and skills are loaded automatically.

## Contributing

Contributions are welcome. Open an issue or pull request on [GitHub](https://github.com/BirajMainali/coao).

---

COAO is built on a simple premise: agents perform best when their strengths are matched to the right task, they have the context they need, and what they learn doesn't disappear. The structure exists to reduce friction, not to constrain.

# COAO — Collaborative Agent Operating Organization

This is a multi-agent engineering organization. The project defines rules, agents, and skills for structured agent collaboration.

## Project Structure

- `rules/` — Organizational policies organized by domain
  - `behavior/` — Communication, decision-making, quality, research
  - `governance/` — Decisions, knowledge, standards
  - `operations/` — Workspace, collaboration, session, handoff, artifacts
- `agents/` — Subagent definitions with YAML front-matter (PO, QA, SE, SA)
- `.opencode/` — OpenCode project config: agents, skills
- `skills/` — Reusable skill definitions

## Rules

Rules are loaded on a need-to-know basis. Use your Read tool to load relevant rules when the task requires them.

### Behavior

- @rules/behavior/communication.md — Agent communication and collaboration principles
- @rules/behavior/decision-making.md — Evidence-based decision process
- @rules/behavior/quality.md — Deliverable quality standards
- @rules/behavior/research.md — Investigation and uncertainty reduction

### Governance

- @rules/governance/decisions.md — Decision recording and lifecycle
- @rules/governance/knowledge.md — Knowledge vs memory, promotion criteria
- @rules/governance/standards.md — Standards lifecycle and compliance

### Operations

- @rules/operations/workspace.md — Workspace layout and lifecycle
- @rules/operations/collaboration.md — Multi-agent collaboration model
- @rules/operations/session.md — Session continuity and recovery
- @rules/operations/handoff.md — Ownership transfer protocol
- @rules/operations/artifacts.md — Artifact-driven communication

## Agents

- `.opencode/agents/product-owner.md` — Business requirements and value delivery
- `.opencode/agents/qa-engineer.md` — Quality validation and release confidence
- `.opencode/agents/software-engineer.md` — Production implementation
- `.opencode/agents/solution-architect.md` — Technical design and architecture

## Available Skills

- `caveman` — Ultra-compressed communication mode. Cuts token usage ~75%. Use `caveman` when asked for brevity.
- `git-worktree` — Git worktree management for mission-based development.
- `grill-me` — A relentless interview to sharpen a plan or design. Use when user wants to stress-test a plan, get grilled on their design, or mentions "grill me".

## MCP Servers

The following MCP servers are configured and provide additional tools:

- `serena` — Symbolic code retrieval, editing, and refactoring (language-server-backed IDE for agents). Use when you need cross-file refactoring, symbol navigation, or deep code understanding.
- `chrome-devtools` — Browser automation and performance analysis via Chrome DevTools. Use for web testing, debugging, performance audits, and screenshots.
- `fixture-mcp` — Stateful API testing with persistent sessions, context store, event audit logs, and multi-step workflows. Use for API testing with session persistence.

## Key Conventions

- Communicate through artifacts, not conversation history
- Read before asking; update before creating
- Every mission has an isolated workspace under `.coao/workspace/active/<mission-slug>/`
- Source code belongs in the repo; mission artifacts belong in the workspace
- Knowledge outlives missions; memory is archived with the workspace

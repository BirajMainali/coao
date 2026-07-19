# COAO — Collaborative Agent Operating Organization

This is a multi-agent engineering organization. The project defines rules, agents, and skills for structured agent collaboration.

## Project Structure

- `.opencode/rules/` — Organizational policies organized by domain
  - `behavior/` — Communication, decision-making, quality, research
  - `governance/` — Decisions, knowledge, standards
  - `operations/` — Workspace, collaboration, session, handoff, artifacts
- `.opencode/agents/` — Subagent definitions with YAML front-matter (PO, QA, SE, SA)
- `.opencode/skills/` — Reusable skill definitions
- `.opencode/AGENTS.md` — Primary opencode instructions
- `.opencode/opencode.json` — OpenCode configuration with MCP servers

## Rules

Rules are loaded on a need-to-know basis. Use your Read tool to load relevant rules when the task requires them.

### Behavior

- @.opencode/rules/behavior/communication.md — Agent communication and collaboration principles
- @.opencode/rules/behavior/decision-making.md — Evidence-based decision process
- @.opencode/rules/behavior/quality.md — Deliverable quality standards
- @.opencode/rules/behavior/research.md — Investigation and uncertainty reduction
- @.opencode/rules/behavior/discipline.md — Tool & technology agnosticism, MCP server, and skill selection

### Governance

- @.opencode/rules/governance/decisions.md — Decision recording and lifecycle
- @.opencode/rules/governance/knowledge.md — Knowledge vs memory, promotion criteria
- @.opencode/rules/governance/standards.md — Standards lifecycle and compliance

### Operations

- @.opencode/rules/operations/work-items.md — Work item types, lifecycles, and agent involvement
- @.opencode/rules/operations/workspace.md — Workspace layout and lifecycle
- @.opencode/rules/operations/collaboration.md — Multi-agent collaboration model
- @.opencode/rules/operations/session.md — Session continuity and recovery
- @.opencode/rules/operations/handoff.md — Ownership transfer protocol
- @.opencode/rules/operations/artifacts.md — Artifact-driven communication

## Agents

- `.opencode/agents/product-owner.md` — Business requirements and value delivery
- `.opencode/agents/qa-engineer.md` — Quality validation and release confidence
- `.opencode/agents/software-engineer.md` — Production implementation
- `.opencode/agents/solution-architect.md` — Technical design and architecture

## Available Skills

- `caveman` — Ultra-compressed communication mode. Cuts token usage ~75%. Use `caveman` when asked for brevity.
- `git-branching` — Consistent Git branching conventions: branch from production branches, safe merge workflow, human-style commits.
- `git-worktree` — Git worktree management for work-item-based development.
- `grilling` — Grills you relentlessly about a plan or design, one question at a time.

## MCP Servers

The following MCP servers are configured and provide additional tools:

- `serena` — Symbolic code retrieval, editing, and refactoring (language-server-backed IDE for agents). Use when you need cross-file refactoring, symbol navigation, or deep code understanding.
- `chrome-devtools` — Browser automation and performance analysis via Chrome DevTools. Use for web testing, debugging, performance audits, and screenshots.
- `fixture-mcp` — Stateful API testing with persistent sessions, context store, event audit logs, and multi-step workflows. Use for API testing with session persistence.

## Key Conventions

- Communicate through artifacts, not conversation history
- Read before asking; update before creating
- Every work item has an isolated workspace under `.coao/<type>s/<slug>/`
- Source code belongs in the repo; work item artifacts belong in the workspace
- Knowledge outlives work items; memory is archived with the workspace

## Install

To install COAO in your project, run:

```bash
curl -fsSL https://raw.githubusercontent.com/BirajMainali/coao/main/install.sh | bash
```

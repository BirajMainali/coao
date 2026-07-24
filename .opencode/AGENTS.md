# COAO - Collaborative Agent Operating Organization

This is a multi-agent engineering organization. The project defines rules, agents, and skills for structured agent collaboration.

## Entry Point

Every new task starts here: @.opencode/rules/operations/initiation.md

Follow the initiation sequence (classify → validate → plan → workspace → confirm) before doing anything else. This auto-routes the task to the correct agents, skills, and workflow. Before planning, always search `knowledge/` for relevant existing patterns, decisions, or standards. Also check `.coao/context-graph.md` for related work items. The sequence scales with the work item — task and chore skip the workspace and confirmation steps.

## Project Structure

- `.opencode/rules/` - Organizational policies organized by domain
  - `behavior/` - Communication, discipline
  - `governance/` - Decisions, knowledge
  - `operations/` - Initiation, work-items, workspace, collaboration
- `.opencode/agents/` - Subagent definitions with YAML front-matter (PO, QA, SE, SA, TR)
- `.opencode/skills/` - Reusable skill definitions
- `.opencode/AGENTS.md` - Primary opencode instructions
- `.opencode/opencode.json` - OpenCode configuration

## Rules

Rules are loaded automatically by domain. Available domains:

- **behavior/** — Communication, discipline
- **governance/** — Decisions, knowledge
- **operations/** — Initiation, work-items, workspace, collaboration

## Agents

- `.opencode/agents/product-owner.md` - Business requirements and value delivery
- `.opencode/agents/qa-engineer.md` - Quality validation and release confidence
- `.opencode/agents/software-engineer.md` - Production implementation
- `.opencode/agents/solution-architect.md` - Technical design and architecture
- `.opencode/agents/true-researcher.md` - Unbiased, context-free research using web search and domain expertise (eliminates X)
- `.opencode/agents/knowledge-steward.md` - Organizational knowledge lifecycle: discovery, triage, promotion, validation, and retirement

## Available Skills

- `git-branching` - Consistent Git branching conventions: branch from production branches, safe merge workflow, human-style commits.
- `git-worktree` - Git worktree management for work-item-based development.
- `prototype` - Throwaway HTML/CSS/JS prototype for UI and domain validation.

## Key Conventions

- Communicate through artifacts, not conversation history
- Read before asking; update before creating
- Every work item has an isolated workspace under `.coao/<type>s/<slug>/`
- Source code belongs in the repo; work item artifacts belong in the workspace
- Knowledge outlives work items; memory is archived with the workspace
- Work items declare relationships to each other via `relationships.md`; relationships are indexed in `.coao/context-graph.md`

## Install

To install COAO in your project, run:

```bash
curl -fsSL https://raw.githubusercontent.com/BirajMainali/coao/main/install.sh | bash
```

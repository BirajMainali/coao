# Work Item Initiation Policy

## Purpose

Every work item begins with an intelligence step: understand the task, then design a workflow.

This rule provides the building blocks — available agents and work item types — and leaves the workflow design to the agent's judgment.

## Building Blocks

### Agents

| Agent | Strengths | When to involve |
|-------|-----------|-----------------|
| Product Owner | Requirements, business value, user stories | Task needs business clarity, requirements definition, prioritization |
| Solution Architect | Technical design, trade-offs, architecture | Task needs design decisions, technology choices, risk reduction |
| Software Engineer | Implementation, code, bug fixes | Task needs code written, changed, or debugged |
| QA Engineer | Validation, testing, release confidence | Task needs verification, edge case analysis, sign-off |
| True Researcher | Unbiased external research | Task needs industry comparison, technology evaluation, answers outside project context |
| Knowledge Steward | Knowledge lifecycle, curation, continuous improvement | Task needs knowledge triage, promotion, or stale detection |

Agents own their work end-to-end. They consult other agents when they hit domain boundaries — they do not hand off ownership.

### Work Item Types

| Type | When | Scale |
|------|------|-------|
| project | Building or evolving a system over weeks+ | Weeks–months |
| feature | Adding a discrete new capability | Days–weeks |
| fix | Repairing a bug or regression | Hours–days |
| task | Single atomic action (rename, config change) | Minutes–hours |
| spike | Research to reduce uncertainty | Hours–days |
| chore | Maintenance, dependency updates, tech debt | Hours |
| knowledge | Knowledge discovery, curation, improvement | Continuous |

## Workflow Design

Given a task, the agent designs the workflow. The sequence scales with the work item — smaller types skip unnecessary ceremony.

1. **Pick the type** — What kind of work is this?
2. **Validate classification** — Only when the type is ambiguous. Skip for obvious classifications.
3. **Search existing knowledge** — Required for feature, project, spike. Write a note in context.md listing what was consulted.
4. **Plan** — Create the workspace and sketch the plan in context.md. For feature, project, spike: create `relationships.md` from `.opencode/templates/relationships.md`. During planning:
   - PO must complete business elicitation (Dimensions 1-12 in @.opencode/rules/behavior/elicit.md) before writing requirements
   - SA must complete technical elicitation (Dimensions 13-26) before writing design
   - All answers documented in context.md and decisions.md before implementation proceeds
   Skip for task, chore (no workspace needed, no elicitation).
5. **Confirm** — Present the plan for user approval. Skip for task, chore.

The task determines the workflow, not the other way around. A simple config change picks type + does it — done. A complex task may involve multiple agents through consultation, each owning their piece end-to-end.

## context.md

Create `.coao/<type>s/<slug>/context.md` as the living document for the work item.

The workflow lives in `context.md`. It starts with the initial plan — type, summary, status. As work progresses, agents update context.md with findings, decisions, and open questions. This is how context survives across sessions — not through conversation history, but through a shared artifact.

## Workspace

```bash
mkdir -p .coao/<type>s/<slug>/
```

## Confirm

Present the plan to the user:
- **Type**: `<work item type>`
- **Plan**: `<summary>`

Ask for confirmation or adjustments before proceeding.

## Anti-patterns

- Shipping without classifying — skipping the intelligence step leads to wrong approach
- Designing the workflow to fit a preferred agent rather than the task
- Over-engineering the workflow — a simple task needs a simple plan
- Skipping confirmation — the user should agree to the plan before work starts
- Starting work before setting up the workspace

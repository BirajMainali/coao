# Work Item Initiation Policy

## Purpose

Every work item begins with an intelligence step: understand the task, then design a workflow.

This rule provides the building blocks - available agents and work item types - and leaves the workflow design to the agent's judgment.

## Building Blocks

### Agents

| Agent | Strengths | When to involve |
|-------|-----------|-----------------|
| Product Owner | Requirements, business value, user stories | Task needs business clarity, requirements definition, prioritization |
| Solution Architect | Technical design, trade-offs, architecture | Task needs design decisions, technology choices, risk reduction |
| Software Engineer | Implementation, code, bug fixes | Task needs code written, changed, or debugged |
| QA Engineer | Validation, testing, release confidence | Task needs verification, edge case analysis, sign-off |
| True Researcher | Unbiased external research | Task needs industry comparison, technology evaluation, answers outside project context |

Agents can be combined in any sequence. Multiple agents can work in parallel when their work is independent. An agent can be skipped when the task doesn't need their domain.

### Work Item Types

| Type | When | Scale |
|------|------|-------|
| project | Building or evolving a system over weeks+ | Weeks–months |
| feature | Adding a discrete new capability | Days–weeks |
| fix | Repairing a bug or regression | Hours–days |
| task | Single atomic action (rename, config change) | Minutes–hours |
| spike | Research to reduce uncertainty | Hours–days |
| chore | Maintenance, dependency updates, tech debt | Hours |
| release | Cutting and shipping a version | Hours |

## Workflow Design

Given a task, the agent designs the workflow. The sequence scales with the work item — smaller types skip unnecessary ceremony.

1. **Pick the type** - What kind of work is this? (reference the types above)
2. **Validate classification** - Only when the type is ambiguous (e.g., "fix" vs "feature"). Skip for obvious classifications.
3. **Pick the agents** - Which agents are needed? Single-agent work (task, chore) skips agent selection.
4. **Search existing knowledge** - Required for feature, project, spike. Skip for task, chore.
5. **Plan** - Create the workspace and sketch the plan in `context.md`. Skip for task, chore (no workspace needed).
6. **Confirm** - Present the plan for user approval. Skip for task, chore.

The task determines the workflow, not the other way around. A simple config change picks type + does it — done. A new feature runs the full sequence through multiple agents. A complex bug might need SE investigating, then QA verifying.

## context.md

Create `.coao/<type>s/<slug>/context.md` as the living document for the work item.

The workflow lives in `context.md`. It starts with the initial plan - type, agents, sequence, summary. As each agent works, they update their section: progress, decisions, outputs, open questions. The next agent reads the current state and continues.

This is how the workflow survives across agents and sessions - not through conversation history, but through a shared artifact that always reflects the latest state.

## Workspace

```bash
mkdir -p .coao/<type>s/<slug>/
```

## Confirm

Present the plan to the user:
- **Type**: `<work item type>`
- **Agents**: `<agent sequence>`
- **Plan**: `<summary>`

Ask for confirmation or adjustments before proceeding.

## Anti-patterns

- Shipping without classifying - skipping the intelligence step leads to wrong agent choices
- Designing the workflow to fit a preferred agent rather than the task
- Over-engineering the workflow - a simple task needs a simple plan
- Skipping confirmation - the user should agree to the plan before work starts
- Starting work before setting up the workspace

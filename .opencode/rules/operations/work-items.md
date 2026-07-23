# Work Items Policy

## Purpose

Work comes in different shapes. A bug fix, a feature, a research spike - each has a different lifecycle, different agent involvement, and different completion criteria.

Every unit of work in this organization is a **work item** with a declared type. The type determines how the item is handled.

---

## Work Item Types

| Type | Scale | Purpose | Agents |
|------|-------|---------|--------|
| **knowledge** | Continuous | Knowledge discovery, curation, and improvement. Output is organizational intelligence. | Knowledge Steward (always); any agent can contribute |
| **project** | Weeks–months | Build or evolve a product. No fixed end; iterates. | PO (always), SA, SE, QA (on-demand) |
| **feature** | Days–weeks | Add a new capability. Clear definition of done. | PO → SA → SE → QA |
| **fix** | Hours–days | Repair a bug or regression. | SE → QA |
| **task** | Minutes–hours | Single atomic action (rename, config tweak, etc.). | SE (or any) |
| **spike** | Hours–days | Research to reduce uncertainty. Output is knowledge. | SA only |
| **chore** | Hours | Maintenance, dependency updates, tech debt. | SE only |
| **release** | Hours | Cut and ship a release. | SE → QA |

---

## Lifecycle by Type

### knowledge
active → curated → (repeats) — never archives; runs continuously

### project
active → archived (when the project ends)

### feature
proposed → designed → implemented → validated → merged

### fix
reported → reproduced → fixed → verified → merged

### task
assigned → done → merged

### spike
started → researched → documented → resolved

### chore
started → done → merged

### release
prepared → tested → shipped

---

## Workspace by Type

```
.coao/<type>s/<slug>/
├── context.md
├── decisions.md
├── product-owner/         (if PO involved)
├── solution-architect/    (if SA involved)
├── software-engineer/     (if SE involved)
├── qa-engineer/           (if QA involved)
└── attachments/
```

All types get a workspace directory. The required contents vary:

| Type | context.md | decisions.md | attachments |
|------|-----------|-------------|-------------|
| knowledge | ✓ | ✓ | ✓ |
| project | ✓ | ✓ | ✓ |
| feature | ✓ | ✓ | ✓ |
| fix | ✓ | optional | optional |
| task | ✓ | - | - |
| spike | ✓ | ✓ | ✓ |
| chore | ✓ | - | - |
| release | ✓ | ✓ | ✓ |

Role directories (product-owner/, solution-architect/, software-engineer/, qa-engineer/) exist when the work item type involves that agent. See Agent Involvement table below.

---

## Agent Involvement by Type

| Type | Who drives | Who reviews |
|------|-----------|-------------|
| knowledge | Knowledge Steward discovers, triages, and promotes | Outcomes reviewed by PO or SA |
| project | PO defines → SA architects → SE builds → QA validates (iterative cycles) | PO & SA review each cycle |
| feature | PO defines requirements → SA designs → SE implements → QA validates | QA signs off |
| fix | SE diagnoses and fixes → QA verifies | QA signs off |
| task | SE does it | Direct merge unless risk |
| spike | SA researches and documents | PO or SA reviews findings |
| chore | SE does it | Quick review |
| release | SE prepares → QA tests → SE ships | QA signs off |

---

## Completion

A work item is complete when:

1. Its type-specific definition of done is met.
2. Workspace artifacts are final (context.md, decisions.md if applicable).
3. Knowledge candidates are promoted or a Knowledge Outcome is documented in context.md (see @.opencode/rules/governance/knowledge.md).
4. The associated branch is merged.
5. The workspace is archived.

Knowledge-type items run continuously and never archive. Project-type items archive when the project ends. All other types archive immediately on completion.

---

## Directory Structure

```
.coao/
├── knowledge/      - Continuous knowledge curation workspaces
├── projects/       - Long-lived product workspaces
├── features/       - Feature delivery workspaces
├── fixes/          - Bug fix workspaces
├── tasks/          - Atomic action workspaces
├── spikes/         - Research workspaces
├── chores/         - Maintenance workspaces
└── releases/       - Release workspaces
```

Every workspace under these directories follows the same internal layout.

# Work Items Policy

## Purpose

Work comes in different shapes. A bug fix, a feature, a research spike — each has a different lifecycle, different agent involvement, and different completion criteria.

Every unit of work in this organization is a **work item** with a declared type. The type determines how the item is handled.

---

## Work Item Types

| Type | Scale | Purpose | Agents |
|------|-------|---------|--------|
| **project** | Weeks–months | Build or evolve a product. No fixed end; iterates. | PO (always), SA, SE, QA (on-demand) |
| **feature** | Days–weeks | Add a new capability. Clear definition of done. | PO → SA → SE → QA |
| **fix** | Hours–days | Repair a bug or regression. | SE → QA |
| **task** | Minutes–hours | Single atomic action (rename, config tweak, etc.). | SE (or any) |
| **spike** | Hours–days | Research to reduce uncertainty. Output is knowledge. | SA only |
| **chore** | Hours | Maintenance, dependency updates, tech debt. | SE only |
| **release** | Hours | Cut and ship a release. | SE → QA |

---

## Lifecycle by Type

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
├── research.md
├── attachments/
└── knowledge-candidates/
```

All types get a workspace directory. The required contents vary:

| Type | context.md | decisions.md | research.md | attachments | knowledge-candidates |
|------|-----------|-------------|------------|-------------|-------------------|
| project | ✓ | ✓ | optional | ✓ | ✓ (curated quarterly) |
| feature | ✓ | ✓ | optional | ✓ | ✓ (curated on completion) |
| fix | ✓ | optional | — | optional | — |
| task | ✓ | — | — | — | — |
| spike | ✓ | ✓ | ✓ | ✓ | ✓ (curated on completion) |
| chore | ✓ | — | — | — | — |
| release | ✓ | ✓ | — | ✓ | — |

Files not listed for a type should not be created.

---

## Agent Involvement by Type

| Type | Who drives | Who reviews |
|------|-----------|-------------|
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
3. Knowledge candidates are promoted (if applicable per type).
4. The associated branch is merged.
5. The workspace is archived.

Project-type items archive when the project ends. All other types archive immediately on completion.

---

## Directory Structure

```
.coao/
├── projects/       — Long-lived product workspaces
├── features/       — Feature delivery workspaces
├── fixes/          — Bug fix workspaces
├── tasks/          — Atomic action workspaces
├── spikes/         — Research workspaces
├── chores/         — Maintenance workspaces
└── releases/       — Release workspaces
```

Every workspace under these directories follows the same internal layout.

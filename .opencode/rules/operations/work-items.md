# Work Items Policy

## Purpose

Work comes in different shapes. A bug fix, a feature, a research spike — each has a different lifecycle and needs different agent involvement.

Every unit of work is a **work item** with a declared type. The type determines how the item is handled.

---

## Work Item Types

| Type | Scale | Purpose | Agents |
|------|-------|---------|--------|
| **knowledge** | Continuous | Knowledge discovery, curation, improvement | Knowledge Steward; any agent contributes |
| **project** | Weeks–months | Build or evolve a product | Consults PO, SA, SE, QA as needed |
| **feature** | Days–weeks | Add a new capability | Multiple agents consult as needed |
| **fix** | Hours–days | Repair a bug or regression | SE consults QA for validation |
| **task** | Minutes–hours | Single atomic action | SE (or any) |
| **spike** | Hours–days | Research to reduce uncertainty | SA consults others as needed |
| **chore** | Hours | Maintenance, dependency updates, tech debt | SE only |

Agents own work end-to-end. They consult domain experts when hitting boundaries, not hand off.

---

## Lifecycle by Type

| Type | Lifecycle |
|------|-----------|
| knowledge | active → curated → (repeats) — never archives |
| project | active → archived |
| feature | active → done → merged |
| fix | active → fixed → verified → merged |
| task | assigned → done → merged |
| spike | active → researched → documented → resolved |
| chore | started → done → merged |

---

## Workspace Requirements

```
.coao/<type>s/<slug>/
├── context.md
├── decisions.md        (not for task, chore)
├── relationships.md    (required for feature, project, spike)
├── research-brief.md   (when True Researcher is consulted)
├── product-owner/      (PO involved)
├── solution-architect/ (SA involved)
├── software-engineer/  (SE involved)
├── qa-engineer/        (QA involved)
└── attachments/
```

| Type | context.md | decisions.md | relationships.md | attachments |
|------|-----------|-------------|-----------------|-------------|
| knowledge | ✓ | ✓ | optional | ✓ |
| project | ✓ | ✓ | ✓ | ✓ |
| feature | ✓ | ✓ | ✓ | ✓ |
| fix | ✓ | optional | optional | optional |
| task | ✓ | - | - | - |
| spike | ✓ | ✓ | ✓ | ✓ |
| chore | ✓ | - | - | - |

---

## Completion

A work item is complete when:
1. Type-specific definition of done is met
2. Workspace artifacts are final (context.md, decisions.md)
3. Knowledge outcome is documented or knowledge was promoted
4. Associated branch is merged
5. Workspace is archived

Knowledge items run continuously. All other types archive on completion.

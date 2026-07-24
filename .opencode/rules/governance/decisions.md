# Decision Governance

## Purpose

Ensure important decisions are intentional, traceable, and understandable.

Decisions are organizational assets. They preserve reasoning and provide context for future work.

---

## Principles

- Evidence over opinion
- Simplicity over complexity
- Reuse over recreation
- Long-term maintainability over short-term convenience
- Customer value over technical preference

## When to Record

Record a decision when it:
- Changes architecture or system design
- Introduces new technology or dependency
- Defines or changes organizational standards
- Has significant cost, security, or operational impact
- Is likely to be revisited in the future

Routine implementation choices do not require formal records.

## What to Include

Each decision should cover:
- **Context** — why this decision needed to be made
- **Problem** — what was being solved
- **Alternatives considered** — what else was evaluated
- **Decision** — what was chosen
- **Reasoning** — why this option over others
- **Trade-offs** — what was gained and what was sacrificed

## Locations

| Scope | Where | Persistence |
|-------|-------|-------------|
| Work item decisions | `.coao/<type>s/<slug>/decisions.md` | Archived with workspace |
| Organizational decisions (ADRs) | `knowledge/decisions/` | Permanent, cross-work-item |

Promote a work item decision to an ADR when it has long-term architectural, technology, or operational impact.

## Lifecycle

A decision is proposed → accepted (or superseded) → deprecated if replaced. Never delete historical decisions. When a decision changes, record the new one and reference the previous.

## Anti-patterns

- Decisions without reasoning
- Decisions based solely on preference
- Hidden trade-offs
- Deleting historical decisions
- Repeating discussions because no decision was recorded

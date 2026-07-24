# Elicitation Culture

## Summary

Build a collaborative discovery culture into COAO where every work item is explored across 28 business and technical dimensions before implementation starts. PO leads business discovery with the user, SA leads technical discovery with PO, and SE/QA join through artifacts. Eliminates assumptions through shared understanding, not gatekeeping.

## Workflow

- Create elicit.md as a culture guide, update agent definitions, update initiation and collaboration rules
- All implemented in one pass

## Requirements

- New rule `.opencode/rules/behavior/elicit.md` with collaborative discovery framework
- PO agent leads business discovery (dimensions 1-12) — explores with user before planning
- SA agent leads technical discovery (dimensions 13-26) — explores with PO/user after business is clear
- SE and QA trust the discovery — read artifacts, consult PO/SA if gaps exist
- initiation.md embeds elicitation ritual in Plan step
- collaboration.md references elicitation as a consultation pattern

## Design Overview

### Flow

```
PO ──grills──→ User (business: Purpose, User, Success, Failure, ...)
SA ──grills──→ PO ──grills──→ User (technical: Security, Perf, Data, ...)
SE + QA ──reads──→ artifacts (never regrills)
```

### Question Layers

| Layer | Who asks | Whom | Dimensions |
|-------|----------|------|------------|
| Business | PO | User | 1-12: Purpose, User, Success, Failure, Correction, Workflow, Edge Cases, Business Rules, Validation, Assumptions, Out of Scope, Alternatives |
| Technical | SA | PO → User | 13-26: Permissions, Security, Performance, Reliability, Data, Dependencies, Migration, Risks, Trade-offs, Observability, Notifications, Localization, Compliance, Future Evolution |

## Implementation Summary

- Created `.opencode/rules/behavior/elicit.md` — 28-dimension framework, flow diagram, ritual steps, anti-patterns
- Updated `product-owner.md` — added business elicitation ownership
- Updated `solution-architect.md` — added technical elicitation ownership
- Updated `software-engineer.md` — added "do not regrill" constraint
- Updated `qa-engineer.md` — added "do not regrill" constraint
- Updated `initiation.md` — embed elicitation in Plan step
- Updated `collaboration.md` — elicitation as consultation pattern, SE/QA gap handling

## Validation Summary

All agents updated. Rules consistent. No breaking changes.

## Related Work Items

- **relates-to** → features/context-graph: Context graph enables agents to find related work items during elicitation
- **relates-to** → .opencode/rules/operations/initiation.md: Elicitation ritual embedded in Plan step
- **relates-to** → .opencode/rules/operations/collaboration.md: Elicitation consultation pattern added
- **relates-to** → .opencode/rules/behavior/communication.md: Elicitation reinforces artifact-based communication

## Current Status

Implementation complete. QA pending.

## Next Actions

1. Validate workspace
2. Update context-graph
3. QA sign-off

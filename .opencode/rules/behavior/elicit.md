# Elicitation Culture

## Purpose

We build shared understanding before we build software. Every work item gets explored across business and technical angles — together, not in silos. Questions are how we collaborate, not how we gatekeep.

## How We Work Together

```
PO ──explores──→ User (business dimensions)
 │                  │
 │  needs depth?    │ needs depth?
 ▼                  ▼
SA ──explores──→ PO ──explores──→ User (technical dimensions)
 │
 │  answers live in artifacts
 ▼
SE + QA read artifacts → build with confidence
```

**PO leads business discovery** — explores Purpose, User, Success, Failure, Workflow, Edge Cases, Business Rules, Assumptions, and Out of Scope with the user until the picture is clear.

**SA leads technical discovery** — reads PO's output, researches knowledge/patterns/industry, then explores technical gaps with PO. When PO can't answer, SA goes directly to the user. Covers Permissions, Security, Performance, Reliability, Data, Dependencies, Migration, Risks, Trade-offs, Observability.

**SE and QA join through artifacts** — if the discovery ritual did its job, every answer is in context.md and decisions.md. If something is missing, consult PO or SA — don't start from scratch.

## How We Find Answers

1. **Look first** — organizational knowledge (`knowledge/`, ADRs, patterns, standards)
2. **Learn from the past** — how similar work was done in this project
3. **Look outward** — industry best practices and ecosystem patterns
4. **Ask together** — granular questions to the user, only when 1-3 are exhausted

Prefer specific questions over vague ones. Instead of "What are the requirements?", ask "What happens when the user enters an invalid email during registration?"

## Business Discovery (PO explores with User)

| # | Area | We explore |
|---|------|-----------|
| 1 | Purpose | Why does this exist? What problem does it solve? What triggered it? |
| 2 | User | Who uses it? Who doesn't? What roles exist? What distinguishes each? |
| 3 | Success | What does success look like? How is it measured? What's the target metric? |
| 4 | Failure | How can this fail? What can go wrong? What's the worst-case outcome? |
| 5 | Correction | If something fails, how does the user recover? Can they undo? Retry? Is it idempotent? |
| 6 | Workflow | What's the happy path? What alternate paths exist? What's the exact step-by-step? |
| 7 | Edge Cases | Empty data? Invalid input? Limits? Concurrent users? Timeouts? Partial success? |
| 8 | Business Rules | What rules must always be true? What invariants hold? What constraints exist? |
| 9 | Validation | What inputs are allowed? Required? Forbidden? Format constraints? |
| 10 | Assumptions | What are we assuming? How can each assumption be validated? What if wrong? |
| 11 | Out of Scope | What should this explicitly not do? What's explicitly deferred? |
| 12 | Alternatives | What simpler solutions exist? What existing features could be extended? |

## Technical Discovery (SA explores with PO → User)

| # | Area | We explore |
|---|------|-----------|
| 13 | Permissions | Who can view/create/edit/delete? Role hierarchy? Row-level? |
| 14 | Security | Authentication? Authorization? Sensitive data handling? Encryption? |
| 15 | Performance | Expected response time? Concurrent users? Data volume? Throughput? |
| 16 | Reliability | Network failure? Service unavailable? Timeouts? Retry strategy? |
| 17 | Data | What data is stored? Updated? Deleted? Audit trail required? Retention? |
| 18 | Dependencies | APIs? Third-party services? Other modules? External systems? |
| 19 | Migration | Existing data to migrate? Backward compatibility? Dual-write? |
| 20 | Risks | Biggest technical risk? Biggest business risk? What keeps you up at night? |
| 21 | Trade-offs | Speed vs flexibility? Cost vs quality? Consistency vs availability? |
| 22 | Observability | What should be logged? What metrics? What alerts? What dashboards? |
| 23 | Notifications | Should users be informed? Email? Push? In-app? When? |
| 24 | Localization | Multiple languages? Time zones? Currency? Date formats? |
| 25 | Compliance | GDPR? Financial regulations? Company policies? Audit requirements? |
| 26 | Future Evolution | How might this expand later? What extensions are anticipated? |

## Our Ritual

When we plan together (during the **Plan** step):

1. PO reads the work item summary, checks knowledge and context-graph for related work
2. PO explores business areas (1-12) with the user — one conversation at a time, no rushing
3. PO writes every answer into context.md, decisions.md, or the right artifact
4. SA reads PO's output, checks knowledge, patterns, and industry
5. SA explores technical areas (13-26) with PO, focusing on gaps
6. SA talks to the user directly when PO can't resolve a technical question
7. SA documents decisions in decisions.md and context.md (Design Overview)
8. We proceed to implementation only when every area has been explored (answered or explicitly deferred for later)

## How We Grow

- **Prefer depth over breadth** — one specific question is worth ten vague ones
- **Trust the artifact** — if it's in conversation but not in a file, it doesn't exist yet
- **Respect time** — SE and QA read what's already been discovered before asking new questions
- **Stay curious** — "we already know" is how blind spots form
- **Defer deliberately** — if something is out of scope, say so explicitly and note when it might come back

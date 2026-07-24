# Decisions

## D-001: Single culture guide, not a rulebook

**Context**: Elicitation touches behavior, governance, and operations. Could have been split across multiple rule files.

**Decision**: Single file at `behavior/elicit.md` — a culture guide, not a constraint list. It describes how we discover together, not what agents are forbidden from doing.

## D-002: PO leads business, SA leads technical

**Context**: Clear role ownership prevents overlap and gaps. Everyone knows who to follow for each dimension.

**Decision**: PO explores business areas (1-12) with the user. SA reads PO's output, researches, then explores technical areas (13-26) with PO or the user. No overlap, no gaps — just shared understanding.

## D-003: Artifacts as the medium

**Context**: If answers live only in conversation, future agents restart from scratch.

**Decision**: Every answer goes into context.md or decisions.md. SE and QA join through artifacts — they trust the discovery and build on it. If something is missing, they consult PO/SA, not the user.

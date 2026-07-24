# Context Graph System

## Summary

Add a cross-work-item relationship layer to COAO so agents can discover connections between work items, decisions, and knowledge without manual searching.

## Workflow

- SA: Design the relationship model, template files, ritual updates ✓
- SE: Implement templates, graph root generator script, rule updates ✓
- QA: Validate coherence, test the ritual, verify no broken links

## Requirements

- Work items declare typed relationships to other work items, ADRs, knowledge entries ✓
- context.md gains Related Work Items and Related Knowledge sections ✓
- `.coao/context-graph.md` indexes all relationships across workspaces (auto-generated) ✓
- Agents search context-graph before starting work (ritual) ✓
- True Researcher gets a research-brief.md bridge so context is provided without violating Eliminate X ✓
- Rules updated: workspace.md, collaboration.md, initiation.md, work-items.md ✓
- AGENTS.md entry point references context-graph.md ✓

## Design Overview

### Relationship Model

| Component | Location | Purpose |
|-----------|----------|---------|
| Template | `.opencode/templates/relationships.md` | Schema + relationship types |
| Manifest | `.coao/<type>s/<slug>/relationships.md` | Per-work-item declarations |
| Index | `.coao/context-graph.md` | Auto-generated unified view |

### Research Brief Bridge

| Component | Location | Purpose |
|-----------|----------|---------|
| Template | `.opencode/templates/research-brief.md` | Context bridge for TR |
| Output | `.coao/<type>s/<slug>/research-brief.md` | Per-spike context |

### Ritual Changes

- Agents check `.coao/context-graph.md` at work item start
- Initiation step 4 includes `relationships.md` creation for feature/project/spike
- Workspace lifecycle includes graph regeneration before archiving

## Implementation Summary

- Created `.opencode/templates/relationships.md` with 7 relationship types and examples
- Created `.opencode/templates/research-brief.md` for True Researcher context bridge
- Created `.opencode/scripts/generate-context-graph.sh` — scans all relationships.md, outputs unified index
- Updated `workspace.md` — added relationships.md, research-brief.md to layout; added cross-ref sections to context.md; added context graph root section
- Updated `collaboration.md` — added context-graph.md lookup to communication model
- Updated `initiation.md` — added relationships.md creation step in workflow
- Updated `work-items.md` — added relationships.md and research-brief.md to workspace requirements table
- Updated `AGENTS.md` — added context-graph.md check to entry point; added relationships convention
- Created test `relationships.md` for this work item — verified generator output is correct

## Validation Summary

- Generator produces valid markdown with correct relative links
- Tested with 1 relationships.md — parsed type, target, description correctly
- Links from `.coao/context-graph.md` resolve to repo-root paths via `../` prefix

## Related Work Items

- **relates-to** → `.opencode/rules/operations/workspace.md`: Updated workspace layout and context.md sections
- **relates-to** → `.opencode/rules/operations/collaboration.md`: Added context graph lookup ritual
- **relates-to** → `.opencode/rules/operations/initiation.md`: Added relationships.md creation step
- **relates-to** → `.opencode/rules/operations/work-items.md`: Updated workspace requirements table

## Related Knowledge

- `.opencode/templates/relationships.md`: Relationship manifest template
- `.opencode/templates/research-brief.md`: Research brief template for True Researcher
- `.opencode/scripts/generate-context-graph.sh`: Context graph generator script

## Current Status

Implementation complete. QA pending.

## Open Questions & Risks

None resolved.

## Next Actions

1. QA: Run validate.sh, verify coherence
2. Generate final context-graph.md
3. Archive workspace

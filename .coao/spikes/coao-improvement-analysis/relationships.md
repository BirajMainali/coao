# Work Item Relationships

```yaml
work_item:
  id: spikes/coao-improvement-analysis
  type: spike
  title: COAO Improvement Analysis
  status: active

relationships:
  - type: relates-to
    target: features/context-graph
    description: Context graph generation could be automated via CI
  - type: relates-to
    target: features/elicitation-discipline
    description: Elicitation framework could be applied to COAO's own evolution
  - type: references
    target: .opencode/scripts/scaffold.sh
    description: Missing project type handling — structural bug
  - type: references
    target: .opencode/scripts/validate.sh
    description: Missing research.md and research-brief.md validation
  - type: references
    target: .opencode/rules/governance/knowledge.md
    description: Knowledge store is empty — opportunity to bootstrap
  - type: references
    target: install.sh
    description: Hardcoded branch, no versioning, no upgrade path
  - type: references
    target: README.md
    description: Workspace layout out of sync with actual design
```

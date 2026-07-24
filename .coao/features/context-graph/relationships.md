work_item:
  id: features/context-graph
  type: feature
  title: "Context Graph System"
  status: active

relationships:
  - type: relates-to
    target: ".opencode/rules/operations/workspace.md"
    description: "Updated workspace layout with relationships.md, research-brief.md, context graph root"
  - type: relates-to
    target: ".opencode/rules/operations/collaboration.md"
    description: "Added context graph lookup ritual to communication model"
  - type: relates-to
    target: ".opencode/rules/operations/initiation.md"
    description: "Added relationships.md creation step in workflow design"
  - type: relates-to
    target: ".opencode/rules/operations/work-items.md"
    description: "Updated workspace requirements table with relationships.md"
  - type: references
    target: ".opencode/templates/relationships.md"
    description: "Relationship manifest template created"
  - type: references
    target: ".opencode/templates/research-brief.md"
    description: "Research brief template created for True Researcher bridge"
  - type: references
    target: ".opencode/scripts/generate-context-graph.sh"
    description: "Context graph generator script created"
  - type: relates-to
    target: "features/elicitation-discipline"
    description: "Elicitation ritual uses context graph for discovery"

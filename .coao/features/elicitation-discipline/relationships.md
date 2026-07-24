work_item:
  id: features/elicitation-discipline
  type: feature
  title: "Elicitation Discipline"
  status: active

relationships:
  - type: relates-to
    target: features/context-graph
    description: "Context graph enables agents to discover related work items during elicitation"
  - type: relates-to
    target: .opencode/rules/behavior/elicit.md
    description: "Created — 28-dimension elicitation framework"
  - type: relates-to
    target: .opencode/agents/product-owner.md
    description: "Added business elicitation ownership"
  - type: relates-to
    target: .opencode/agents/solution-architect.md
    description: "Added technical elicitation ownership"
  - type: relates-to
    target: .opencode/agents/software-engineer.md
    description: "Added do-not-regrill constraint"
  - type: relates-to
    target: .opencode/agents/qa-engineer.md
    description: "Added do-not-regrill constraint"
  - type: relates-to
    target: .opencode/rules/operations/initiation.md
    description: "Embedded elicitation ritual in Plan step"
  - type: relates-to
    target: .opencode/rules/operations/collaboration.md
    description: "Added elicitation consultation pattern"

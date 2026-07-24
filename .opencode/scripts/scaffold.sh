#!/usr/bin/env bash
set -euo pipefail

usage() {
  echo "Usage: scaffold.sh <type> <slug>"
  echo "Types: knowledge feature fix task spike chore"
  echo "Creates .coao/<type>s/<slug>/ with role directories + attachments/"
  exit 1
}

[ $# -lt 2 ] && usage
TYPE="$1"; SLUG="$2"

case "$TYPE" in
  knowledge|feature|fix|task|spike|chore) ;;
  *) echo "Error: invalid type '$TYPE'"; usage ;;
esac

# Plural mapping
case "$TYPE" in
  knowledge) P="knowledge" ;; feature) P="features" ;;
  fix) P="fixes" ;; task) P="tasks" ;; spike) P="spikes" ;; chore) P="chores" ;;
esac

WORKSPACE=".coao/${P}/${SLUG}"
echo "Scaffolding: $WORKSPACE"

mkdir -p "$WORKSPACE/attachments"

# Role dirs based on agent involvement
case "$TYPE" in
  knowledge) ROLES="knowledge-steward" ;;
  feature)   ROLES="product-owner solution-architect software-engineer qa-engineer" ;;
  fix)       ROLES="software-engineer qa-engineer" ;;
  task|chore) ROLES="software-engineer" ;;
  spike)     ROLES="solution-architect" ;;
esac

for role in $ROLES; do mkdir -p "$WORKSPACE/$role"; done

# context.md + research.md
cat > "$WORKSPACE/context.md" <<EOF
# Context: ${SLUG}

## Current Status

<!-- Current phase, who is working, progress -->

## Next Actions

<!-- What should happen next -->

## Open Questions & Risks
EOF

cat > "$WORKSPACE/research.md" <<EOF
# Research: ${SLUG}

<!-- Findings, sources, recommendations -->
EOF

# decisions.md (task/chore skip)
case "$TYPE" in task|chore) ;; *)
  cat > "$WORKSPACE/decisions.md" <<< "# Decisions\n" ;;
esac

# relationships.md (required for feature, project, spike)
# Write a fresh stub — never copy the template (its examples pollute context graph)
case "$TYPE" in feature|spike)
  cat > "$WORKSPACE/relationships.md" <<EOF
# Work Item Relationships

\`\`\`yaml
work_item:
  id: "${P}/${SLUG}"
  type: ${TYPE}
  title: ""
  status: active

relationships: []
\`\`\`
EOF
  ;;
esac

# research-brief.md (required for spike)
# Copy from template if available, fall back to inline stub
case "$TYPE" in spike)
  SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
  TEMPLATE="$SCRIPT_DIR/../templates/research-brief.md"
  if [ -f "$TEMPLATE" ]; then
    cp "$TEMPLATE" "$WORKSPACE/research-brief.md"
  else
    cat > "$WORKSPACE/research-brief.md" <<EOF
# Research Brief

Created by: \`<SA | PO>\`
For: True Researcher
Date: \`$(date +%Y-%m-%d)\`

## Question

## Domain Context

## Constraints

## Success Criteria

## Out of Scope
EOF
  fi
  ;;
esac

echo "Done: $WORKSPACE/"
echo "Roles: $ROLES"

#!/usr/bin/env bash
set -euo pipefail

usage() {
  echo "Usage: scaffold.sh <type> <slug>"
  echo ""
  echo "Types: project, feature, fix, task, spike, chore, release"
  echo ""
  echo "Creates .coao/<type>s/<slug>/ with proper workspace structure."
  exit 1
}

if [ $# -lt 2 ]; then usage; fi

TYPE="$1"
SLUG="$2"

# Validate type
case "$TYPE" in
  project|feature|fix|task|spike|chore|release) ;;
  *) echo "Error: invalid type '$TYPE'"; usage ;;
esac

# Map type to plural directory name
case "$TYPE" in
  project) PLURAL="projects" ;;
  feature) PLURAL="features" ;;
  fix)     PLURAL="fixes" ;;
  task)    PLURAL="tasks" ;;
  spike)   PLURAL="spikes" ;;
  chore)   PLURAL="chores" ;;
  release) PLURAL="releases" ;;
esac

WORKSPACE=".coao/${PLURAL}/${SLUG}"

# Determine role directories based on agent involvement
# Based on work-items.md Agent Involvement table
declare -a ROLES
case "$TYPE" in
  project) ROLES=( "product-owner" "solution-architect" "software-engineer" "qa-engineer" ) ;;
  feature) ROLES=( "product-owner" "solution-architect" "software-engineer" "qa-engineer" ) ;;
  fix)     ROLES=( "software-engineer" "qa-engineer" ) ;;
  task)    ROLES=( "software-engineer" ) ;;
  spike)   ROLES=( "solution-architect" ) ;;
  chore)   ROLES=( "software-engineer" ) ;;
  release) ROLES=( "software-engineer" "qa-engineer" ) ;;
esac

echo "Scaffolding $TYPE workspace: $WORKSPACE"

# Create directory structure
mkdir -p "$WORKSPACE"

has_decisions="true"
has_knowledge="true"

case "$TYPE" in
  task|chore) has_decisions="false" ;;
esac

case "$TYPE" in
  fix|task|chore|release) has_knowledge="false" ;;
esac

for role in "${ROLES[@]}"; do
  mkdir -p "$WORKSPACE/$role"
done

mkdir -p "$WORKSPACE/attachments"

if [ "$has_knowledge" = "true" ]; then
  mkdir -p "$WORKSPACE/knowledge-candidates"
fi

# Write context.md
# Determine which sections go in context.md
SECTIONS="Summary Workflow Current_Status Open_Questions_&_Risks Next_Actions"

case "$TYPE" in
  project|feature) SECTIONS="$SECTIONS Requirements Design_Overview" ;;
  spike)          SECTIONS="$SECTIONS Design_Overview" ;;
esac

case "$TYPE" in
  project|feature|fix|release) SECTIONS="$SECTIONS Implementation_Summary Validation_Summary" ;;
esac

case "$TYPE" in
  project|feature|spike) SECTIONS="$SECTIONS Knowledge_Outcome" ;;
esac

# Build context.md
{
  echo "# Context: ${SLUG}"
  echo ""
  for section_name in $SECTIONS; do
    section_display="${section_name//_/ }"
    echo "## ${section_display}"
    echo ""
    echo "<!-- TODO: Write ${section_display} -->"
    echo ""
  done
} > "$WORKSPACE/context.md"

# Write decisions.md if required
if [ "$has_decisions" = "true" ]; then
  cat > "$WORKSPACE/decisions.md" << DECISIONSMD
# Decisions

<!-- Format:
## Decision: <Title>

- **Context**: 
- **Problem**: 
- **Alternatives**: 
- **Decision**: 
- **Reasoning**: 
- **Trade-offs**: 
- **Date**: 
-->
DECISIONSMD
fi

echo "✓ Created $WORKSPACE/"
echo "  context.md      $(if [ "$has_decisions" = "true" ]; then echo "decisions.md     "; fi)${ROLES[*]}"
echo ""
echo "Run validate.sh when workspace is complete."

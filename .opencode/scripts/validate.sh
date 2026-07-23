#!/usr/bin/env bash
set -euo pipefail

usage() {
  echo "Usage: validate.sh <workspace-path>"
  echo ""
  echo "Validates a COAO workspace against type-specific requirements."
  exit 1
}

if [ $# -lt 1 ]; then usage; fi

WORKSPACE="$1"
ERRORS=0
WARNINGS=0

# Derive type from path
# Path format: .coao/<plural>/<slug>
PARENT_DIR="$(basename "$(dirname "$WORKSPACE")")"
SLUG="$(basename "$WORKSPACE")"

case "$PARENT_DIR" in
  knowledge) TYPE="knowledge" ;;
  projects)  TYPE="project" ;;
  features)  TYPE="feature" ;;
  fixes)     TYPE="fix" ;;
  tasks)     TYPE="task" ;;
  spikes)    TYPE="spike" ;;
  chores)    TYPE="chore" ;;
  releases)  TYPE="release" ;;
  *)
    echo "ERROR: Cannot determine type from parent directory '$PARENT_DIR'"
    echo "Expected one of: knowledge, projects, features, fixes, tasks, spikes, chores, releases"
    exit 1
    ;;
esac

echo "============================================"
echo "COAO Workspace Validation"
echo "  Type:      $TYPE"
echo "  Slug:      $SLUG"
echo "  Workspace: $WORKSPACE"
echo "============================================"
echo ""

# ---- 1. Workspace directory exists ----
if [ ! -d "$WORKSPACE" ]; then
  echo "ERROR: Workspace directory does not exist: $WORKSPACE"
  exit 1
fi

# ---- 2. Required role directories exist ----
declare -a REQUIRED_ROLES
declare -a OPTIONAL_ROLES

case "$TYPE" in
  knowledge) REQUIRED_ROLES=( "knowledge-steward" ) ;;
  project)   REQUIRED_ROLES=( "product-owner" "solution-architect" "software-engineer" "qa-engineer" ) ;;
  feature)   REQUIRED_ROLES=( "product-owner" "solution-architect" "software-engineer" "qa-engineer" ) ;;
  fix)       REQUIRED_ROLES=( "software-engineer" "qa-engineer" ) ;;
  task)      REQUIRED_ROLES=( "software-engineer" ) ;;
  spike)     REQUIRED_ROLES=( "solution-architect" ) ;;
  chore)     REQUIRED_ROLES=( "software-engineer" ) ;;
  release)   REQUIRED_ROLES=( "software-engineer" "qa-engineer" ) ;;
esac

echo "--- Role Directories ---"
for role in "${REQUIRED_ROLES[@]}"; do
  if [ ! -d "$WORKSPACE/$role" ]; then
    echo "ERROR: Missing required role directory: $WORKSPACE/$role/"
    ERRORS=$((ERRORS + 1))
  else
    echo "  OK   $role/"
  fi
done

# ---- 3. attachments/ directory ----
if [ ! -d "$WORKSPACE/attachments" ]; then
  echo "WARN: Missing attachments/ directory"
  WARNINGS=$((WARNINGS + 1))
else
  echo "  OK   attachments/"
fi

# ---- 4. Knowledge Outcome check (type-dependent) ----
check_knowledge_outcome="false"
case "$TYPE" in
  knowledge|project|feature|spike) check_knowledge_outcome="true" ;;
esac

# ---- 5. context.md exists and has required sections ----
echo ""
echo "--- context.md ---"
CONTEXT_FILE="$WORKSPACE/context.md"

if [ ! -f "$CONTEXT_FILE" ]; then
  echo "ERROR: Missing context.md"
  ERRORS=$((ERRORS + 1))
else
  echo "  OK   context.md exists"

  declare -a SECTIONS
  SECTIONS+=( "Summary" )
  SECTIONS+=( "Workflow" )
  SECTIONS+=( "Current Status" )
  SECTIONS+=( "Open Questions & Risks" )
  SECTIONS+=( "Next Actions" )

  case "$TYPE" in
    project|feature) SECTIONS+=( "Requirements" ) ;;
  esac

  case "$TYPE" in
    project|feature|spike) SECTIONS+=( "Design Overview" ) ;;
  esac

  case "$TYPE" in
    project|feature|fix|release) SECTIONS+=( "Implementation Summary" ) ;;
  esac

  case "$TYPE" in
    project|feature|fix|release) SECTIONS+=( "Validation Summary" ) ;;
  esac

  case "$TYPE" in
    project|feature|spike) SECTIONS+=( "Knowledge Outcome" ) ;;
  esac

  for section in "${SECTIONS[@]}"; do
    if grep -q "^## ${section}" "$CONTEXT_FILE" 2>/dev/null; then
      echo "  OK   ## $section"
    else
      echo "ERROR: Missing section '## $section' in context.md"
      ERRORS=$((ERRORS + 1))
    fi
  done
fi

# ---- 6. decisions.md (type-dependent) ----
has_decisions="true"
case "$TYPE" in
  task|chore) has_decisions="false" ;;
esac

echo ""
echo "--- decisions.md ---"
DECISIONS_FILE="$WORKSPACE/decisions.md"

if [ "$has_decisions" = "false" ]; then
  if [ -f "$DECISIONS_FILE" ]; then
    echo "  OK   decisions.md (exists, optional for $TYPE)"
  fi
else
  if [ ! -f "$DECISIONS_FILE" ]; then
    echo "ERROR: Missing required decisions.md"
    ERRORS=$((ERRORS + 1))
  else
    echo "  OK   decisions.md exists"
  fi
fi

# ---- 7. Knowledge Outcome ----
echo ""
echo "--- Knowledge Outcome ---"
if [ "$check_knowledge_outcome" = "true" ]; then
  if grep -q '^## Knowledge Outcome' "$CONTEXT_FILE" 2>/dev/null; then
    if grep -qE '\[KNOWLEDGE-PROMOTED\]|\[KNOWLEDGE-CANDIDATE-FILED\]|\[KNOWLEDGE-NONE\]' "$CONTEXT_FILE" 2>/dev/null; then
      echo "  OK   Knowledge Outcome documented"
    else
      echo "WARN: Knowledge Outcome section exists but no outcome recorded"
      WARNINGS=$((WARNINGS + 1))
    fi
  else
    echo "WARN: Missing Knowledge Outcome section in context.md"
    WARNINGS=$((WARNINGS + 1))
  fi
fi

echo ""
echo "============================================"
if [ "$ERRORS" -gt 0 ] || [ "$WARNINGS" -gt 0 ]; then
  echo "  $ERRORS errors, $WARNINGS warnings"
fi
if [ "$ERRORS" -gt 0 ]; then
  echo "  RESULT: FAIL"
  exit 1
else
  echo "  RESULT: PASS"
  exit 0
fi

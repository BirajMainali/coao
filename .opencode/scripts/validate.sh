#!/usr/bin/env bash
set -euo pipefail

usage() { echo "Usage: validate.sh <workspace-path>"; exit 1; }
[ $# -lt 1 ] && usage

WORKSPACE="$1"
PARENT="$(basename "$(dirname "$WORKSPACE")")"
SLUG="$(basename "$WORKSPACE")"

# Derive type from plural directory
case "$PARENT" in
  knowledge) T="knowledge" ;; projects) T="project" ;;
  features) T="feature" ;; fixes) T="fix" ;;
  tasks) T="task" ;; spikes) T="spike" ;; chores) T="chore" ;;
  *) echo "ERROR: Unknown type from '$PARENT'"; exit 1 ;;
esac

echo "=== Validate: $T/$SLUG ==="
ERRORS=0

[ -d "$WORKSPACE" ] || { echo "ERROR: missing $WORKSPACE"; ERRORS=$((ERRORS+1)); }

# Required role dirs
case "$T" in
  knowledge) REQ="knowledge-steward" ;;
  project|feature) REQ="product-owner solution-architect software-engineer qa-engineer" ;;
  fix) REQ="software-engineer qa-engineer" ;;
  task|chore) REQ="software-engineer" ;;
  spike) REQ="solution-architect" ;;
esac
for role in $REQ; do
  [ -d "$WORKSPACE/$role" ] || { echo "ERROR: missing $role/"; ERRORS=$((ERRORS+1)); }
done

# context.md
[ -f "$WORKSPACE/context.md" ] || { echo "ERROR: missing context.md"; ERRORS=$((ERRORS+1)); }

# decisions.md (not for task/chore)
case "$T" in task|chore) ;;
  *) [ -f "$WORKSPACE/decisions.md" ] || { echo "ERROR: missing decisions.md"; ERRORS=$((ERRORS+1)); } ;;
esac

# research.md (all work items get this from scaffold)
[ -f "$WORKSPACE/research.md" ] || { echo "ERROR: missing research.md"; ERRORS=$((ERRORS+1)); }

# research-brief.md (required for spike)
case "$T" in spike)
  [ -f "$WORKSPACE/research-brief.md" ] || { echo "ERROR: missing research-brief.md"; ERRORS=$((ERRORS+1)); } ;;
esac

# relationships.md (required for feature, project, spike)
case "$T" in feature|project|spike)
  [ -f "$WORKSPACE/relationships.md" ] || { echo "ERROR: missing relationships.md"; ERRORS=$((ERRORS+1)); } ;;
esac

[ "$ERRORS" -gt 0 ] && { echo "FAIL ($ERRORS errors)"; exit 1; } || echo "PASS"

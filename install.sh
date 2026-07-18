#!/usr/bin/env bash
set -euo pipefail

REPO="BirajMainali/coao"
BRANCH="master"

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}  COAO — Collaborative Agent Operating Org${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

TMP_DIR=$(mktemp -d)
cleanup() { rm -rf "$TMP_DIR"; }
trap cleanup EXIT

echo -e "${YELLOW}Downloading COAO...${NC}"
git clone --depth=1 --branch "$BRANCH" "https://github.com/$REPO.git" "$TMP_DIR/repo" 2>/dev/null

SOURCE="$TMP_DIR/repo/.opencode"

echo ""
echo "Where do you want to install COAO?"
echo ""
echo "  1) Project-wide  — .opencode/ in current directory"
echo "  2) Global        — ~/.config/opencode/"
echo ""
read -rp "Select [1/2]: " choice

case "$choice" in
  2)
    TARGET="$HOME/.config/opencode"
    mkdir -p "$TARGET"
    echo ""

    echo -e "${YELLOW}Installing globally to $TARGET...${NC}"

    cp -r "$SOURCE/agents" "$TARGET/agents" 2>/dev/null || true
    cp -r "$SOURCE/skills" "$TARGET/skills" 2>/dev/null || true
    cp -r "$SOURCE/rules" "$TARGET/rules" 2>/dev/null || true
    cp "$SOURCE/AGENTS.md" "$TARGET/AGENTS.md"

    # Adjust opencode.json paths for global install (remove .opencode/ prefix)
    sed 's|"\.opencode/AGENTS\.md"|"AGENTS.md"|g; s|"\.opencode/rules/|"rules/|g' "$SOURCE/opencode.json" > "$TARGET/opencode.json"

    echo ""
    echo -e "${GREEN}Installed to ~/.config/opencode/${NC}"
    echo "  AGENTS.md       ~/.config/opencode/AGENTS.md"
    echo "  opencode.json   ~/.config/opencode/opencode.json"
    echo "  agents/         ~/.config/opencode/agents/"
    echo "  skills/         ~/.config/opencode/skills/"
    echo "  rules/          ~/.config/opencode/rules/"
    ;;
  *)
    TARGET=".opencode"
    echo ""

    if [ -d "$TARGET" ]; then
      echo -e "${YELLOW}$TARGET already exists. Merge? Files will be overwritten.${NC}"
      read -rp "Continue? [y/N]: " confirm
      if [ "$confirm" != "y" ] && [ "$confirm" != "Y" ]; then
        echo "Aborted."
        exit 0
      fi
    fi

    echo -e "${YELLOW}Installing project-wide to $TARGET...${NC}"

    mkdir -p "$TARGET"
    cp -r "$SOURCE/." "$TARGET/"

    # Symlink AGENTS.md and opencode.json to root for opencode discovery
    ln -sf ".opencode/AGENTS.md" "AGENTS.md"
    ln -sf ".opencode/opencode.json" "opencode.json"

    echo ""
    echo -e "${GREEN}Installed to .opencode/${NC}"
    echo "  .opencode/AGENTS.md"
    echo "  .opencode/opencode.json"
    echo "  .opencode/agents/"
    echo "  .opencode/skills/"
    echo "  .opencode/rules/"
    echo "  AGENTS.md              → symlink -> .opencode/AGENTS.md"
    echo "  opencode.json          → symlink -> .opencode/opencode.json"
    ;;
esac

echo ""
echo -e "${GREEN}Done. COAO is ready.${NC}"

#!/usr/bin/env bash
set -euo pipefail

REPO="BirajMainali/coao"
BRANCH="master"

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}  COAO — Collaborative Agent Operating Org${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

# Requirements
command -v curl >/dev/null || {
  echo -e "${RED}Error: curl not found.${NC}"
  exit 1
}

command -v tar >/dev/null || {
  echo -e "${RED}Error: tar not found.${NC}"
  exit 1
}

TMP_DIR="$(mktemp -d)"

cleanup() {
  rm -rf "$TMP_DIR"
}
trap cleanup EXIT

echo -e "${YELLOW}Downloading COAO...${NC}"

ARCHIVE_URL="https://github.com/${REPO}/archive/refs/heads/${BRANCH}.tar.gz"

if ! curl -fsSL "$ARCHIVE_URL" | tar -xz -C "$TMP_DIR"; then
  echo ""
  echo -e "${RED}Failed to download COAO.${NC}"
  echo "Repository: https://github.com/${REPO}"
  echo "Branch: ${BRANCH}"
  exit 1
fi

SOURCE="$TMP_DIR/coao-${BRANCH}/.opencode"

if [ ! -d "$SOURCE" ]; then
  echo ""
  echo -e "${RED}Repository does not contain .opencode directory.${NC}"
  exit 1
fi

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

    echo ""
    echo -e "${YELLOW}Installing globally...${NC}"

    mkdir -p "$TARGET"

    cp -R "$SOURCE/agents" "$TARGET/" 2>/dev/null || true
    cp -R "$SOURCE/skills" "$TARGET/" 2>/dev/null || true
    cp -R "$SOURCE/rules" "$TARGET/" 2>/dev/null || true
    cp "$SOURCE/AGENTS.md" "$TARGET/"
    cp "$SOURCE/opencode.json" "$TARGET/"

    # Rewrite paths for global install
    if command -v sed >/dev/null; then
      sed \
        -e 's|"\.opencode/AGENTS\.md"|"AGENTS.md"|g' \
        -e 's|"\.opencode/rules/|"rules/|g' \
        "$SOURCE/opencode.json" > "$TARGET/opencode.json"
    fi

    echo ""
    echo -e "${GREEN}✓ Installed globally${NC}"
    echo ""
    echo "  ~/.config/opencode/"
    echo "    ├── AGENTS.md"
    echo "    ├── opencode.json"
    echo "    ├── agents/"
    echo "    ├── skills/"
    echo "    └── rules/"
    ;;

  1)
    TARGET=".opencode"

    echo ""

    if [ -d "$TARGET" ]; then
      echo -e "${YELLOW}${TARGET} already exists.${NC}"
      read -rp "Overwrite existing files? [y/N]: " confirm

      case "$confirm" in
        y|Y) ;;
        *)
          echo "Aborted."
          exit 0
          ;;
      esac
    fi

    echo -e "${YELLOW}Installing project-wide...${NC}"

    mkdir -p "$TARGET"
    cp -R "$SOURCE/." "$TARGET/"

    ln -sfn ".opencode/AGENTS.md" AGENTS.md
    ln -sfn ".opencode/opencode.json" opencode.json

    echo ""
    echo -e "${GREEN}✓ Installed into current project${NC}"
    echo ""
    echo "  .opencode/"
    echo "    ├── AGENTS.md"
    echo "    ├── opencode.json"
    echo "    ├── agents/"
    echo "    ├── skills/"
    echo "    └── rules/"
    echo ""
    echo "  AGENTS.md      -> .opencode/AGENTS.md"
    echo "  opencode.json  -> .opencode/opencode.json"
    ;;

  *)
    echo -e "${RED}Invalid selection.${NC}"
    exit 1
    ;;
esac

echo ""
echo -e "${GREEN}Done. COAO is ready.${NC}"

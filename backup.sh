#!/usr/bin/env bash
# ══════════════════════════════════════════════════════════════════════
#  backup.sh — sync live nvim config back into this repo and push
#
#  Usage:
#    bash backup.sh                        # uses default commit message
#    bash backup.sh "feat: add rust lsp"   # custom commit message
# ══════════════════════════════════════════════════════════════════════
set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MSG="${1:-chore: update nvim config}"

echo ""
echo "→ Syncing live config into repo..."
mkdir -p "$REPO_DIR/lua/configs"
cp ~/.config/nvim/lua/plugins/init.lua      "$REPO_DIR/lua/plugins/init.lua"
cp ~/.config/nvim/lua/configs/lspconfig.lua "$REPO_DIR/lua/configs/lspconfig.lua"
cp ~/.config/nvim/lua/options.lua           "$REPO_DIR/lua/options.lua"
cp ~/.config/nvim/lua/mappings.lua          "$REPO_DIR/lua/mappings.lua"
echo "  Done."

echo ""
echo "→ Pushing to GitHub..."
cd "$REPO_DIR"
git add -A
git diff --cached --quiet && echo "  Nothing changed." && exit 0
git commit -m "$MSG"
git push
echo "  Pushed: $MSG"
echo ""

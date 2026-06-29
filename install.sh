#!/usr/bin/env bash
# ══════════════════════════════════════════════════════════════════════
#  Christopher Odhiambo's Neovim Setup
#
#  One-liner install on a fresh machine:
#  bash <(curl -s https://raw.githubusercontent.com/thecodingmontana/nvim-config/main/install.sh)
#
#  Or after cloning:
#  git clone https://github.com/thecodingmontana/nvim-config.git
#  cd nvim-config && bash install.sh
# ══════════════════════════════════════════════════════════════════════
set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo ""
echo "══════════════════════════════════════════════════════════"
echo "  Neovim Setup — Christopher Odhiambo"
echo "══════════════════════════════════════════════════════════"

# ── 1. Wipe old config ──────────────────────────────────────────
echo ""
echo "→ Removing old Neovim config..."
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
echo "  Done."

# ── 2. System dependencies ──────────────────────────────────────
echo ""
echo "→ Installing system dependencies..."
sudo apt-get update -qq
sudo apt-get install -y -qq \
  git curl unzip wget build-essential \
  ripgrep fd-find xclip wl-clipboard \
  python3 python3-pip nodejs npm luarocks

# fd is called fdfind on Ubuntu — symlink it
if ! command -v fd &>/dev/null && command -v fdfind &>/dev/null; then
  mkdir -p ~/.local/bin
  ln -sf "$(which fdfind)" ~/.local/bin/fd
fi
echo "  Done."

# ── 3. Neovim >= 0.10 ───────────────────────────────────────────
echo ""
echo "→ Checking Neovim version..."
NVIM_OK=false
if command -v nvim &>/dev/null; then
  NVIM_VER=$(nvim --version | head -1 | grep -oP '\d+\.\d+' | head -1)
  MAJOR=$(echo "$NVIM_VER" | cut -d. -f1)
  MINOR=$(echo "$NVIM_VER" | cut -d. -f2)
  if [ "$MAJOR" -ge 1 ] || { [ "$MAJOR" -eq 0 ] && [ "$MINOR" -ge 10 ]; }; then
    NVIM_OK=true
    echo "  Neovim $NVIM_VER — OK"
  fi
fi

if [ "$NVIM_OK" = false ]; then
  echo "  Installing latest Neovim stable..."
  wget -q https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz \
    -O /tmp/nvim.tar.gz
  sudo tar -xzf /tmp/nvim.tar.gz -C /usr/local --strip-components=1
  rm /tmp/nvim.tar.gz
  echo "  Neovim installed."
fi

# ── 4. Rust ─────────────────────────────────────────────────────
echo ""
echo "→ Checking Rust..."
if ! command -v rustup &>/dev/null; then
  echo "  Installing rustup..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
fi
export PATH="$HOME/.cargo/bin:$PATH"
rustup component add rust-analyzer 2>/dev/null || true
echo "  Rust OK."

# ── 5. Node global tools ────────────────────────────────────────
echo ""
echo "→ Installing Node global tools..."
npm_globals=(
  typescript
  typescript-language-server
  vscode-langservers-extracted
  "@tailwindcss/language-server"
  prettier
  eslint
  eslint_d
  "@biomejs/biome"
  emmet-ls
  bash-language-server
)
for pkg in "${npm_globals[@]}"; do
  npm install -g "$pkg" --silent 2>/dev/null || true
done
echo "  Done."

# ── 6. Clone NvChad starter ─────────────────────────────────────
echo ""
echo "→ Cloning NvChad starter..."
git clone https://github.com/NvChad/starter ~/.config/nvim --depth=1
echo "  Done."

# ── 7. Copy custom config ───────────────────────────────────────
echo ""
echo "→ Installing custom config..."
mkdir -p ~/.config/nvim/lua/configs
cp "$REPO_DIR/lua/plugins/init.lua"      ~/.config/nvim/lua/plugins/init.lua
cp "$REPO_DIR/lua/configs/lspconfig.lua" ~/.config/nvim/lua/configs/lspconfig.lua
cp "$REPO_DIR/lua/options.lua"           ~/.config/nvim/lua/options.lua
cp "$REPO_DIR/lua/mappings.lua"          ~/.config/nvim/lua/mappings.lua
echo "  Done."

# ── 8. Bootstrap plugins ────────────────────────────────────────
echo ""
echo "→ Installing plugins (~2 min)..."
nvim --headless "+Lazy! sync" +qa 2>&1 | grep -E "^\[|Error" | tail -10 || true

echo ""
echo "══════════════════════════════════════════════════════════"
echo "  Setup complete!"
echo ""
echo "  Next step: open nvim and run :MasonInstallAll"
echo "  to install all LSPs, formatters, and linters."
echo ""
echo "  See README.md for all keybindings."
echo "══════════════════════════════════════════════════════════"
echo ""

# 🚀 Christopher's Neovim Config

> NvChad-based Neovim setup for full-stack development — TypeScript, Rust, React, Vue, CSS, TailwindCSS and more.

---

## ⚡ Fresh Machine Setup

### Option A — One-liner (no clone needed)
```bash
bash <(curl -s https://raw.githubusercontent.com/thecodingmontana/nvim-config/main/install.sh)
```

### Option B — Clone then install
```bash
git clone https://github.com/thecodingmontana/nvim-config.git
cd nvim-config
bash install.sh
```

### After install
Open Neovim and run:
```
:MasonInstallAll
```
This installs all LSPs, formatters, and linters. Wait for it to finish, then restart nvim.

---

## 💾 Backing Up Changes

After tweaking your config, save it back to this repo:

```bash
cd ~/path/to/nvim-config
bash backup.sh                          # default commit message
bash backup.sh "feat: add go lsp"       # custom message
```

---

## 🗂 Opening a Project

Always `cd` into the project first, then open nvim:

```bash
cd ~/my-project
nvim .
```

> Do **not** open as `nvim ~/my-project` from home — that sets the wrong working directory and breaks the file tree root.

---

## 📦 What's Included

### Language Support
| Language | LSP | Formatter | Linter |
|---|---|---|---|
| TypeScript / JavaScript | ts_ls | Biome → Prettier | ESLint |
| TSX / JSX | ts_ls | Biome → Prettier | ESLint |
| Vue | volar | Prettier | ESLint |
| CSS / SCSS | cssls | Prettier | — |
| HTML | html + emmet | Prettier | — |
| TailwindCSS | tailwindcss | — | — |
| JSON / JSONC | jsonls | Biome → Prettier | — |
| YAML | yamlls | Prettier | — |
| TOML | taplo | — | — |
| Rust | rust-analyzer | rustfmt (clippy) | — |
| Bash | bashls | shfmt | — |
| Lua | — | stylua | — |

### Plugins
- **NvChad** — base UI, theme, statusline
- **nvim-lspconfig** + **Mason** — LSP management
- **conform.nvim** — format on save
- **nvim-lint** — async linting
- **nvim-treesitter** — syntax highlighting
- **nvim-ts-autotag** — auto close/rename HTML/JSX/Vue tags
- **nvim-autopairs** — auto close brackets and quotes
- **nvim-tree** — file explorer sidebar
- **toggleterm** — VS Code-style bottom terminal
- **Telescope** — fuzzy finder
- **gitsigns** — git diff in gutter
- **Trouble** — diagnostics panel
- **nvim-colorizer** — CSS color preview
- **schemastore** — JSON schema validation

---

## ⌨️ Keybindings

> `<leader>` = **Space**

### File Explorer (nvim-tree)
| Key | Action |
|---|---|
| `Ctrl+b` | Toggle sidebar open/close |
| `Space+e` | Focus sidebar |
| `Enter` | Open file |
| `a` | New file (end with `/` for folder) |
| `d` | Delete file/folder |
| `r` | Rename |
| `c` | Copy |
| `p` | Paste |
| `x` | Cut |
| `H` | Toggle hidden files |
| `q` | Close tree |

### Terminal
| Key | Action |
|---|---|
| `Ctrl+t` | Toggle bottom terminal |
| `i` | Enter insert mode (start typing) |
| `Esc` | Exit insert mode (back to normal) |
| `Space+t1` | Switch to terminal 1 |
| `Space+t2` | Switch to terminal 2 |
| `Space+t3` | Switch to terminal 3 |
| `Space+tn` | Open new terminal |

### Buffers (open files)
| Key | Action |
|---|---|
| `Tab` | Next buffer |
| `Shift+Tab` | Previous buffer |
| `Space+x` | Close current buffer |

### Window Splits
| Key | Action |
|---|---|
| `Ctrl+h` | Move to left window |
| `Ctrl+l` | Move to right window |
| `Ctrl+j` | Move to bottom window |
| `Ctrl+k` | Move to top window |

### File Search (Telescope)
| Key | Action |
|---|---|
| `Space+ff` | Find files |
| `Space+fw` | Search text in project (live grep) |
| `Space+fb` | List open buffers |
| `Space+fh` | Help tags |
| `Space+fo` | Recent files |

### LSP (code intelligence)
| Key | Action |
|---|---|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | List references |
| `gi` | Go to implementation |
| `K` | Hover documentation |
| `Space+ca` | Code action |
| `Space+rn` | Rename symbol |
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |
| `Space+d` | Show diagnostic float |

### Formatting & Linting
| Key | Action |
|---|---|
| `Space+fm` | Format current buffer |
| `Space+xx` | Toggle diagnostics panel |
| `Space+xb` | Toggle buffer diagnostics |

### Saving
| Key | Action |
|---|---|
| `Ctrl+s` | Save file (normal + insert mode) |

### Plugin Management
| Command | Action |
|---|---|
| `:Lazy` | Open plugin manager |
| `:Lazy sync` | Install + update all plugins |
| `:MasonInstallAll` | Install all LSPs and tools |
| `:Mason` | Open Mason UI |

---

## 🔧 Common Vim Basics

### Modes
| Key | Mode |
|---|---|
| `i` | Insert mode (type code) |
| `Esc` | Back to Normal mode |
| `v` | Visual mode (select) |
| `V` | Visual line mode |
| `:` | Command mode |

### Navigation (Normal mode)
| Key | Action |
|---|---|
| `h j k l` | Left / Down / Up / Right |
| `w` | Jump forward one word |
| `b` | Jump back one word |
| `0` | Start of line |
| `$` | End of line |
| `gg` | Top of file |
| `G` | Bottom of file |
| `Ctrl+d` | Scroll down half page |
| `Ctrl+u` | Scroll up half page |
| `{` / `}` | Jump between paragraphs |

### Editing (Normal mode)
| Key | Action |
|---|---|
| `dd` | Delete line |
| `yy` | Copy (yank) line |
| `p` | Paste below |
| `P` | Paste above |
| `u` | Undo |
| `Ctrl+r` | Redo |
| `ciw` | Change inner word |
| `di"` | Delete inside quotes |
| `o` | New line below + insert |
| `O` | New line above + insert |
| `A` | Append to end of line |
| `x` | Delete character |
| `.` | Repeat last action |

### Search
| Key | Action |
|---|---|
| `/text` | Search forward |
| `?text` | Search backward |
| `n` | Next match |
| `N` | Previous match |
| `*` | Search word under cursor |

### Splits
| Command | Action |
|---|---|
| `:vs` | Vertical split |
| `:sp` | Horizontal split |
| `:q` | Close split / buffer |

---

## 📁 Config Structure

```
~/.config/nvim/
├── lua/
│   ├── plugins/
│   │   └── init.lua        # all plugin definitions
│   ├── configs/
│   │   └── lspconfig.lua   # LSP server setup
│   ├── options.lua          # editor settings
│   └── mappings.lua         # keybindings
└── init.lua                 # NvChad entry point
```

---

## 🔄 Updating Plugins

```bash
# Inside nvim
:Lazy sync
```

---

## 🐛 Troubleshooting

**LSP not working?**
```
:Mason
```
Check if the server is installed. If not, press `i` on it.

**Formatter not running on save?**
```
:ConformInfo
```
Shows which formatters are active for the current file.

**Check health:**
```
:checkhealth
```

**See what LSP is attached:**
```
:LspInfo
```

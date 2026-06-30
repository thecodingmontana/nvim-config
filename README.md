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
- **inc-rename.nvim** — rename symbols with live preview
- **nvim-surround** — change/add/delete surrounding quotes, brackets, tags
- **todo-comments.nvim** — highlight and jump between TODO/FIXME/HACK comments
- **better-escape.nvim** — exit insert mode with `jk` or `jj`
- **harpoon2** — instant jump to frequently used files
- **nvim-spectre** — project-wide find & replace
- **diffview.nvim** — proper git diff/merge UI
- **crates.nvim** — Cargo.toml version completion + update notifications
- **typescript-tools.nvim** — fast TS/JS LSP with auto-import + inline type hints
- **nvim-cmp** — completion engine (auto-import suggestions, snippets, Tab to cycle)
- **vim-visual-multi** — multi-cursor editing (VS Code Ctrl+D style)
- **lazygit.nvim** — full git UI (stage, commit, branch, push) without leaving nvim
- **mini.indentscope** — highlights the current function/block boundary
- **which-key.nvim** — shows available keybindings when you pause on `<leader>`

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
| `Space+rn` | Rename symbol (live preview popup) |
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |
| `Space+d` | Show diagnostic float |
| `Space+fs` | Workspace symbol search |
| `Space+fS` | Document symbol search |

### Text Objects (nvim-surround)
| Key | Action |
|---|---|
| `ys"` (then motion) | Add surrounding `"` — e.g. `ysiw"` wraps word in quotes |
| `cs"'` | Change surrounding `"` to `'` |
| `ds"` | Delete surrounding `"` |
| `ds(` | Delete surrounding `()` |
| `cst"` | Change surrounding tag to `"` |

### TODO Comments
| Key | Action |
|---|---|
| `]t` | Jump to next TODO/FIXME/HACK |
| `[t` | Jump to previous TODO/FIXME/HACK |
| `Space+ft` | List all TODOs in project (Telescope) |

### Harpoon (quick file jumping)
| Key | Action |
|---|---|
| `Space+ha` | Add current file to Harpoon |
| `Space+hh` | Open Harpoon quick menu |
| `Space+h1` | Jump to Harpoon file 1 |
| `Space+h2` | Jump to Harpoon file 2 |
| `Space+h3` | Jump to Harpoon file 3 |
| `Space+h4` | Jump to Harpoon file 4 |

### Find & Replace / Git Diff
| Key | Action |
|---|---|
| `Space+sr` | Open Spectre (project-wide find & replace) |
| `Space+gd` | Open git diff view |
| `Space+gh` | Open git file history |
| `Space+gc` | Close diff view |

### Git UI (LazyGit)
| Key | Action |
|---|---|
| `Space+lg` | Open LazyGit (stage, commit, push, branch, all in a TUI) |
| `q` | Close LazyGit and return to nvim |

Inside LazyGit itself (standard LazyGit keys): `space` stage/unstage a file, `c` commit, `P` push, `p` pull, `b` branches, `Enter` view file diff.

### Multi-Cursor (vim-visual-multi)
| Key | Action |
|---|---|
| `Ctrl+n` | Select word under cursor, press again to select next match |
| `Ctrl+Down` / `Ctrl+Up` | Add cursor on line below / above |
| `Tab` (while multi-cursor active) | Switch between cursor/extend mode |
| `n` / `N` | Go to next/previous match while selecting |
| `q` | Skip current match, go to next |
| `Esc` | Exit multi-cursor mode |

Typical flow: put cursor on a word → `Ctrl+n` → `Ctrl+n` again to add the next occurrence → type to edit all selected occurrences at once.

### Auto-Import & Completion (nvim-cmp + typescript-tools)
| Key | Action |
|---|---|
| `Ctrl+Space` | Manually trigger completion menu |
| `Tab` | Select next completion item / expand snippet |
| `Shift+Tab` | Select previous completion item |
| `Enter` | Confirm selected completion |
| `Space+ca` | Code action menu — includes **"Add missing import"** for TS/JS |

As you type in `.ts`/`.tsx`/`.js`/`.jsx` files, unimported symbols show up in the completion list — selecting one auto-inserts the import at the top of the file. If it doesn't show in completion, place cursor on the symbol and run `Space+ca` to see "Add import from..." as a code action.

### Keybinding Helper (which-key)
Just press `Space` and pause — a popup shows every available keybinding grouped by category (Find/Format, Terminal, Diagnostics, Git, Harpoon, etc). No need to memorize everything above; this is your live cheat sheet.

### Insert Mode Quick Exit
| Key | Action |
|---|---|
| `jk` or `jj` | Exit insert mode (instead of reaching for Esc) |

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

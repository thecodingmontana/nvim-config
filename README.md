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
cd ~/the-going-mary/nvim-config
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
| TypeScript / JavaScript | ts_ls + typescript-tools | Biome → Prettier | ESLint |
| TSX / JSX | ts_ls + typescript-tools | Biome → Prettier | ESLint |
| Vue | volar | Prettier | ESLint |
| CSS / SCSS | cssls | Prettier | — |
| HTML | html + emmet | Prettier | — |
| TailwindCSS | tailwindcss | — | — |
| JSON / JSONC | jsonls | Biome → Prettier | — |
| YAML | yamlls | Prettier | — |
| TOML | taplo | — | — |
| Rust | rust-analyzer | rustfmt | — |
| Bash | bashls | shfmt | — |
| Lua | — | stylua | — |

### Plugins
- **NvChad** — base UI, theme, statusline
- **nvim-lspconfig** + **Mason** — LSP management
- **typescript-tools.nvim** — fast TS/JS LSP with auto-import + inline type hints
- **nvim-cmp** — completion engine (auto-import suggestions, snippets, Tab to cycle)
- **conform.nvim** — format on save (Biome → Prettier priority)
- **nvim-lint** — async linting
- **nvim-treesitter** — syntax highlighting for all languages
- **nvim-ts-autotag** — auto close/rename HTML/JSX/Vue tags
- **nvim-autopairs** — auto close brackets and quotes
- **nvim-surround** — change/add/delete surrounding quotes, brackets, tags
- **vim-visual-multi** — multi-cursor editing (VS Code Ctrl+n style)
- **better-escape.nvim** — exit insert mode with `jk` or `jj`
- **inc-rename.nvim** — rename symbols with live preview
- **harpoon2** — instant jump between your most-used files
- **nvim-spectre** — project-wide find & replace
- **nvim-tree** — project file explorer sidebar
- **toggleterm** — VS Code-style bottom terminal (multiple instances)
- **Telescope** — fuzzy file/text finder
- **gitsigns** — git diff indicators in the gutter
- **lazygit.nvim** — full git TUI (stage, commit, branch, push) inside nvim
- **diffview.nvim** — git diff and merge conflict UI
- **Trouble** — diagnostics panel
- **todo-comments.nvim** — highlight and jump between TODO/FIXME/HACK comments
- **which-key.nvim** — keybinding popup when you pause on `<leader>`
- **mini.indentscope** — highlights current function/block boundary
- **nvim-colorizer** — inline CSS color preview
- **crates.nvim** — Cargo.toml version completion + update hints
- **schemastore** — JSON schema validation

---

## ⌨️ Keybindings

> `<leader>` = **Space**
>
> **Tip:** Press `Space` and pause — a popup shows every available keybinding grouped by category. This is your live cheat sheet, no need to memorize everything here.

---

### File Explorer (nvim-tree)
| Key | Action |
|---|---|
| `Ctrl+b` | Toggle sidebar open/close |
| `Space+e` | Focus sidebar |
| `Enter` | Open file |
| `a` | New file (end name with `/` for folder) |
| `d` | Delete file/folder |
| `r` | Rename |
| `c` | Copy |
| `p` | Paste |
| `x` | Cut |
| `H` | Toggle hidden files (.env, .gitignore etc) |
| `q` | Close tree |

---

### Terminal
| Key | Action |
|---|---|
| `Ctrl+t` | Toggle bottom terminal |
| `Space+t` | Toggle bottom terminal (same as Ctrl+t) |
| `i` | Enter insert mode (start typing commands) |
| `Esc` | Exit insert mode (back to normal) |
| `Space+t1` | Switch to / open terminal 1 |
| `Space+t2` | Switch to / open terminal 2 |
| `Space+t3` | Switch to / open terminal 3 |
| `Space+tn` | Open a new terminal instance |

> Use multiple terminals for different tasks: terminal 1 for git, terminal 2 for `pnpm dev`, terminal 3 for anything else.

---

### Buffers (open files tabs)
| Key | Action |
|---|---|
| `Tab` | Next buffer |
| `Shift+Tab` | Previous buffer |
| `Space+x` | Close current buffer |

---

### Window Splits
| Key | Action |
|---|---|
| `Ctrl+h` | Move to left window |
| `Ctrl+l` | Move to right window |
| `Ctrl+j` | Move to bottom window (e.g. into terminal) |
| `Ctrl+k` | Move to top window (e.g. back to editor) |
| `:vs` | Open vertical split |
| `:sp` | Open horizontal split |

---

### File Search (Telescope)
| Key | Action |
|---|---|
| `Space+ff` | Find files in project |
| `Space+fw` | Search text in project (live grep) |
| `Space+fb` | List open buffers |
| `Space+fh` | Help tags |
| `Space+fo` | Recent files |
| `Space+ft` | List all TODOs/FIXMEs in project |
| `Space+fs` | Workspace symbol search |
| `Space+fS` | Document symbol search |

---

### LSP (code intelligence)
| Key | Action |
|---|---|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | List all references |
| `gi` | Go to implementation |
| `K` | Hover documentation |
| `Space+ca` | Code actions (fix, refactor, add import...) |
| `Space+rn` | Rename symbol with live preview |
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |
| `Space+d` | Show diagnostic in float popup |

---

### Import Management (TS / JS / Vue)
| Key | Action |
|---|---|
| `Space+ia` | Add missing import (opens code action menu) |
| `Space+io` | Organize all imports (sort + remove unused) |
| `Space+iu` | Remove unused imports only |
| `Ctrl+Space` | Trigger completion menu (auto-import suggestions appear here) |

**How auto-import works:**
As you type a symbol (e.g. `useState`, `cn`, `z`), it appears in the completion list with the import source shown next to it. Press `Enter` to confirm — the import is automatically added at the top of the file.

If it doesn't show in completion, put your cursor on the unresolved symbol and press `Space+ca` → pick "Add import from...".

---

### Completion Menu
| Key | Action |
|---|---|
| `Ctrl+Space` | Manually open completion menu |
| `Tab` | Select next item / expand snippet |
| `Shift+Tab` | Select previous item |
| `Enter` | Confirm selected item |

---

### Formatting & Linting
| Key | Action |
|---|---|
| `Space+fm` | Format current buffer manually |
| `Space+xx` | Toggle diagnostics panel (Trouble) |
| `Space+xb` | Toggle buffer diagnostics only |
| `Ctrl+s` | Save file (also triggers format on save) |

> Format on save is automatic. Priority: Biome first, Prettier as fallback.

---

### Git UI (LazyGit)
| Key | Action |
|---|---|
| `Space+lg` | Open LazyGit TUI |
| `q` | Close LazyGit |

**Inside LazyGit:**
| Key | Action |
|---|---|
| `Space` | Stage / unstage file |
| `c` | Commit |
| `P` | Push |
| `p` | Pull |
| `b` | Branches |
| `Enter` | View file diff |

---

### Git Diff (diffview)
| Key | Action |
|---|---|
| `Space+gd` | Open git diff view |
| `Space+gh` | Open git file history |
| `Space+gc` | Close diff view |

---

### Harpoon (instant file jumping)
Pin your most-used files and jump to them instantly without searching.

| Key | Action |
|---|---|
| `Space+ha` | Pin current file to Harpoon |
| `Space+hh` | Open Harpoon menu (see/reorder pinned files) |
| `Space+h1` | Jump to pinned file 1 |
| `Space+h2` | Jump to pinned file 2 |
| `Space+h3` | Jump to pinned file 3 |
| `Space+h4` | Jump to pinned file 4 |

> Typical flow: open a file you'll return to often → `Space+ha` → do the same for 3-4 files → use `Space+h1`/`h2`/`h3` to teleport between them instantly.

---

### Surround Editing (nvim-surround)
| Key | Action |
|---|---|
| `ysiw"` | Wrap word under cursor in `"quotes"` |
| `ysiw(` | Wrap word in `(parens)` |
| `cs"'` | Change surrounding `"` to `'` |
| `cs({` | Change surrounding `()` to `{}` |
| `ds"` | Delete surrounding `"` |
| `ds(` | Delete surrounding `()` |
| `dst` | Delete surrounding HTML/JSX tag |
| `cst<div>` | Change surrounding tag to `<div>` |

---

### Multi-Cursor (vim-visual-multi)
| Key | Action |
|---|---|
| `Ctrl+n` | Select word under cursor; press again for next match |
| `Ctrl+Down` / `Ctrl+Up` | Add cursor on line below / above |
| `Tab` | Switch between cursor/extend mode |
| `n` / `N` | Next / previous match |
| `q` | Skip current match |
| `Esc` | Exit multi-cursor |

> Typical flow: cursor on a variable → `Ctrl+n` repeatedly to select all occurrences → type to rename all at once.

---

### Find & Replace (Spectre)
| Key | Action |
|---|---|
| `Space+sr` | Open Spectre (project-wide find & replace) |

---

### TODO Comments
| Key | Action |
|---|---|
| `]t` | Jump to next TODO/FIXME/HACK |
| `[t` | Jump to previous TODO/FIXME/HACK |
| `Space+ft` | List all TODOs in Telescope |

---

### Insert Mode Quick Exit
| Key | Action |
|---|---|
| `jk` | Exit insert mode (instead of reaching for Esc) |
| `jj` | Exit insert mode |

---

### Saving
| Key | Action |
|---|---|
| `Ctrl+s` | Save file (works in normal and insert mode) |

---

### Plugin Management
| Command | Action |
|---|---|
| `:Lazy` | Open plugin manager |
| `:Lazy sync` | Install + update all plugins |
| `:MasonInstallAll` | Install all LSPs, formatters, linters |
| `:Mason` | Open Mason UI |

---

## 🔧 Common Vim Basics

### Modes
| Key | Mode |
|---|---|
| `i` | Insert mode — type code |
| `Esc` or `jk` | Back to Normal mode |
| `v` | Visual mode — character select |
| `V` | Visual line mode — select whole lines |
| `Ctrl+v` | Visual block mode — column select |
| `:` | Command mode |

### Navigation (Normal mode)
| Key | Action |
|---|---|
| `h j k l` | Left / Down / Up / Right |
| `w` | Jump forward one word |
| `b` | Jump back one word |
| `e` | Jump to end of word |
| `0` | Start of line |
| `$` | End of line |
| `gg` | Top of file |
| `G` | Bottom of file |
| `Ctrl+d` | Scroll down half page |
| `Ctrl+u` | Scroll up half page |
| `{` / `}` | Jump between blank-line separated blocks |
| `%` | Jump to matching bracket |

### Editing (Normal mode)
| Key | Action |
|---|---|
| `dd` | Delete (cut) current line |
| `yy` | Copy (yank) current line |
| `3dd` | Delete 3 lines |
| `3yy` | Copy 3 lines |
| `p` | Paste below cursor |
| `P` | Paste above cursor |
| `u` | Undo |
| `Ctrl+r` | Redo |
| `ciw` | Change inner word (delete word + enter insert) |
| `cit` | Change inside tag (HTML/JSX) |
| `di"` | Delete inside quotes |
| `yi"` | Copy inside quotes |
| `di{` | Delete inside `{}` block |
| `o` | New line below + insert mode |
| `O` | New line above + insert mode |
| `A` | Append to end of line |
| `I` | Insert at start of line |
| `x` | Delete character under cursor |
| `.` | Repeat last change |
| `~` | Toggle case of character |

### Visual Mode (selecting)
| Key | Action |
|---|---|
| `v` then `hjkl` | Select characters |
| `V` | Select whole lines |
| `ggVG` | Select entire file |
| `y` | Copy selection |
| `d` | Cut selection |
| `gc` | Toggle comment on selection |

### Search
| Key | Action |
|---|---|
| `/text` | Search forward |
| `?text` | Search backward |
| `n` | Next match |
| `N` | Previous match |
| `*` | Search word under cursor |
| `:noh` | Clear search highlight |

### Exiting Nvim
| Command | Action |
|---|---|
| `:w` | Save |
| `:q` | Quit (close window) |
| `:wq` | Save and quit |
| `:qa` | Quit all windows/buffers |
| `:qa!` | Force quit without saving |
| `:wqa` | Save all and quit |

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
│   └── mappings.lua         # all keybindings
└── init.lua                 # NvChad entry point
```

**Repo structure (for backup/restore):**
```
nvim-config/
├── lua/
│   ├── plugins/init.lua
│   ├── configs/lspconfig.lua
│   ├── options.lua
│   └── mappings.lua
├── install.sh    # fresh machine setup
├── backup.sh     # push live config to GitHub
└── README.md
```

---

## 🔄 Updating Plugins

```bash
# Inside nvim
:Lazy sync
```

---

## 🐛 Troubleshooting

**LSP not attaching to a file?**
```
:LspInfo
```
Shows which LSP servers are active for the current buffer.

**LSP server not installed?**
```
:Mason
```
Find the server, press `i` to install it.

**Formatter not running on save?**
```
:ConformInfo
```
Shows which formatters are configured and whether their binaries are found.

**General health check:**
```
:checkhealth
```

**ESLint errors about missing plugins (e.g. `eslint-plugin-import`)?**
Either install the missing package in your project:
```bash
pnpm add -D eslint-plugin-import
```
Or if the project uses Biome instead of ESLint, create a `.nvim.lua` in the project root to stop the ESLint LSP from loading there:
```lua
vim.defer_fn(function()
  for _, client in ipairs(vim.lsp.get_active_clients()) do
    if client.name == "eslint" then client.stop() end
  end
end, 1000)
```
Then add `vim.o.exrc = true` and `vim.o.secure = true` to `options.lua`.

**Plugins not loading after config change?**
```
:qa
```
Then reopen nvim. Lua configs are not hot-reloaded — always restart after changes.

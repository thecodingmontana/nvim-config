return {
  -- ─── LSP ──────────────────────────────────────────────────────────────
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- ─── Treesitter (syntax highlighting) ─────────────────────────────────
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua", "luadoc",
        "vim", "vimdoc",
        "javascript", "typescript", "tsx", "jsdoc",
        "css", "html",
        "json", "jsonc",
        "yaml", "toml",
        "rust",
        "markdown", "markdown_inline",
        "bash", "regex",
        "vue", "graphql", "prisma", "dockerfile",
      },
      highlight = { enable = true },
      indent    = { enable = true },
      autotag   = { enable = true },
    },
  },

  -- ─── Auto-close/rename HTML/JSX/Vue tags ──────────────────────────────
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    opts  = {},
  },

  -- ─── Auto-pairs: brackets, quotes ─────────────────────────────────────
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts  = { check_ts = true },
  },

  -- ─── Mason: LSP / formatter / linter installer ────────────────────────
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "typescript-language-server",
        "tailwindcss-language-server",
        "css-lsp", "html-lsp", "json-lsp",
        "eslint-lsp", "rust-analyzer",
        "emmet-ls", "bash-language-server",
        "yaml-language-server", "taplo",
        "vue-language-server",
        "prettier", "biome", "stylua", "shfmt",
      },
    },
  },

  -- ─── mason-lspconfig bridge ───────────────────────────────────────────
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = { automatic_installation = false },
  },

  -- ─── conform.nvim: format on save ─────────────────────────────────────
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = {
      formatters_by_ft = {
        javascript      = { "biome", "prettier", stop_after_first = true },
        typescript      = { "biome", "prettier", stop_after_first = true },
        javascriptreact = { "biome", "prettier", stop_after_first = true },
        typescriptreact = { "biome", "prettier", stop_after_first = true },
        vue             = { "prettier" },
        css             = { "prettier" },
        html            = { "prettier" },
        json            = { "biome", "prettier", stop_after_first = true },
        jsonc           = { "biome" },
        yaml            = { "prettier" },
        markdown        = { "prettier" },
        lua             = { "stylua" },
        rust            = { "rustfmt" },
        sh              = { "shfmt" },
      },
      format_on_save = { lsp_fallback = true, timeout_ms = 2000 },
    },
  },

  -- ─── nvim-lint: async linting ─────────────────────────────────────────
  {
    "mfussenegger/nvim-lint",
    event = { "BufWritePost", "BufReadPost", "InsertLeave" },
    config = function()
      local lint = require "lint"
      lint.linters_by_ft = {
        javascript      = { "eslint" },
        typescript      = { "eslint" },
        javascriptreact = { "eslint" },
        typescriptreact = { "eslint" },
        vue             = { "eslint" },
      }
      vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
        callback = function() lint.try_lint() end,
      })
    end,
  },

  -- ─── Toggleterm: bottom terminal like VS Code ─────────────────────────
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    lazy    = false,
    keys    = { "<C-t>" },
    opts = {
      open_mapping    = [[<C-t>]],
      direction       = "horizontal",
      size            = 12,
      shade_terminals = false,
      persist_size    = true,
      persist_mode    = true,
      start_in_insert = true,
      on_open = function(_)
        vim.cmd "startinsert!"
      end,
    },
  },

  -- ─── nvim-tree: project sidebar ───────────────────────────────────────
  {
    "nvim-tree/nvim-tree.lua",
    cmd  = { "NvimTreeToggle", "NvimTreeFocus" },
    keys = {
      { "<C-b>",     "<cmd>NvimTreeToggle<cr>", desc = "Toggle file tree" },
      { "<leader>e", "<cmd>NvimTreeFocus<cr>",  desc = "Focus file tree" },
    },
    opts = {
      sync_root_with_cwd  = true,
      respect_buf_cwd     = true,
      update_focused_file = { enable = true, update_root = true },
      view = {
        width = 35,
        side  = "left",
        preserve_window_proportions = true,
      },
      renderer = {
        group_empty   = true,
        highlight_git = true,
        icons = {
          show = { file = true, folder = true, folder_arrow = true, git = true },
        },
      },
      filters = {
        dotfiles = false,
        custom   = { "^.git$", "node_modules", ".DS_Store" },
      },
      git = { enable = true, ignore = false },
      actions = {
        open_file = {
          quit_on_open  = false,
          window_picker = { enable = true },
        },
      },
    },
  },

  -- ─── CSS color preview ────────────────────────────────────────────────
  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPost",
    opts  = {},
  },

  -- ─── Git signs in gutter ──────────────────────────────────────────────
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPost",
    opts  = {
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 300,
        virt_text_pos = "eol",
      },
    },
  },

  -- ─── Trouble: diagnostics panel ───────────────────────────────────────
  {
    "folke/trouble.nvim",
    cmd  = "Trouble",
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>",              desc = "Diagnostics" },
      { "<leader>xb", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics" },
    },
    opts = {},
  },

  -- ─── JSON schema store ────────────────────────────────────────────────
  { "b0o/schemastore.nvim", lazy = true },

  -- ─── inc-rename: rename with live preview ─────────────────────────────
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = function()
      require("inc_rename").setup()
    end,
    keys = {
      {
        "<leader>rn",
        function()
          return ":IncRename " .. vim.fn.expand "<cword>"
        end,
        expr = true,
        desc = "Rename symbol (live preview)",
      },
    },
  },

  -- ─── nvim-surround: change/add/delete quotes, brackets, tags ──────────
  {
    "kylechui/nvim-surround",
    version = "*",
    event   = "InsertEnter",
    opts    = {},
  },

  -- ─── todo-comments: highlight + jump TODO/FIXME/HACK ──────────────────
  {
    "folke/todo-comments.nvim",
    event = "BufReadPost",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    keys = {
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next TODO" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Prev TODO" },
      { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Find TODOs" },
    },
  },

  -- ─── better-escape: exit insert mode with jk / jj (v2 API) ─────────────
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    opts = {
      default_mappings = false,
      mappings = {
        i = { j = { k = "<Esc>", j = "<Esc>" } },
        v = { j = { k = "<Esc>" } },
      },
    },
  },

  -- ─── Harpoon2: instant jump to files you work in repeatedly ───────────
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require "harpoon"
      harpoon:setup()

      local map = vim.keymap.set
      map("n", "<leader>ha", function() harpoon:list():add() end,            { desc = "Harpoon add file" })
      map("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon menu" })
      map("n", "<leader>h1", function() harpoon:list():select(1) end,        { desc = "Harpoon file 1" })
      map("n", "<leader>h2", function() harpoon:list():select(2) end,        { desc = "Harpoon file 2" })
      map("n", "<leader>h3", function() harpoon:list():select(3) end,        { desc = "Harpoon file 3" })
      map("n", "<leader>h4", function() harpoon:list():select(4) end,        { desc = "Harpoon file 4" })
    end,
  },

  -- ─── Spectre: project-wide find & replace ─────────────────────────────
  {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    keys = {
      { "<leader>sr", "<cmd>lua require('spectre').toggle()<cr>", desc = "Find & Replace (Spectre)" },
    },
    opts = {},
  },

  -- ─── Diffview: proper git diff / merge UI ─────────────────────────────
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>",        desc = "Git diff view" },
      { "<leader>gh", "<cmd>DiffviewFileHistory<cr>", desc = "Git file history" },
      { "<leader>gc", "<cmd>DiffviewClose<cr>",       desc = "Close diff view" },
    },
  },

  -- ─── crates.nvim: Cargo.toml version completion & updates ─────────────
  {
    "saecki/crates.nvim",
    event = "BufRead Cargo.toml",
    opts = {
      completion = {
        cmp = { enabled = true },
      },
    },
  },

  -- ─── Auto-import / smarter TS completion ──────────────────────────────
  -- typescript-tools gives faster, more reliable auto-import + organize
  -- imports + inline type hints than plain ts_ls alone.
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    opts = {
      settings = {
        expose_as_code_action = "all", -- adds "Add missing import" to code actions
        tsserver_file_preferences = {
          includeInlayParameterNameHints              = "all",
          includeInlayFunctionParameterTypeHints       = true,
          includeInlayVariableTypeHints                = true,
          includeInlayPropertyDeclarationTypeHints     = true,
          includeInlayFunctionLikeReturnTypeHints      = true,
        },
      },
    },
  },

  -- ─── nvim-cmp: completion engine ─────────────────────────────────────────
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "onsails/lspkind.nvim",  -- VS Code-style icons in completion menu
    },
    config = function()
      local cmp     = require "cmp"
      local luasnip = require "luasnip"
      local lspkind = require "lspkind"

      cmp.setup {
        snippet = {
          expand = function(args) luasnip.lsp_expand(args.body) end,
        },
        window = {
          completion    = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        formatting = {
          format = lspkind.cmp_format {
            mode        = "symbol_text",   -- show icon + text like VS Code
            maxwidth    = 50,
            ellipsis_char = "...",
            -- show source name (LSP, Buffer, Path, Snippet)
            before = function(entry, vim_item)
              vim_item.menu = ({
                nvim_lsp = "[LSP]",
                luasnip  = "[Snip]",
                buffer   = "[Buf]",
                path     = "[Path]",
                nvim_lua = "[Lua]",
              })[entry.source.name]
              return vim_item
            end,
          },
        },
        mapping = cmp.mapping.preset.insert {
          ["<C-Space>"] = cmp.mapping.complete(),          -- trigger menu
          ["<C-e>"]     = cmp.mapping.abort(),             -- close menu
          ["<CR>"]      = cmp.mapping.confirm { select = true },
          ["<C-d>"]     = cmp.mapping.scroll_docs(4),
          ["<C-u>"]     = cmp.mapping.scroll_docs(-4),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
          -- Arrow keys also work in menu
          ["<Down>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
          ["<Up>"]   = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp", priority = 1000 },  -- LSP first (auto-imports here)
          { name = "luasnip",  priority = 750 },
          { name = "nvim_lua", priority = 500 },
        }, {
          { name = "buffer",   priority = 250 },
          { name = "path",     priority = 200 },
        }),
        -- Auto-select first item so Enter always confirms
        completion = { completeopt = "menu,menuone,noinsert" },
      }
    end,
  },

  -- ─── Multi-cursor (VS Code style: Ctrl+n to add next match) ───────────
  {
    "mg979/vim-visual-multi",
    branch = "master",
    event  = "VeryLazy",
  },

  -- ─── LazyGit: full git UI inside nvim ──────────────────────────────────
  {
    "kdheepak/lazygit.nvim",
    cmd = { "LazyGit" },
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- ─── mini.indentscope: highlights current block/function scope ────────
  {
    "echasnovski/mini.indentscope",
    version = false,
    event   = "BufReadPost",
    opts = {
      symbol  = "│",
      options = { try_as_border = true },
    },
  },

  -- ─── which-key: shows available keybindings on <leader> press ─────────
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "modern",
      delay  = 300,
    },
    config = function(_, opts)
      local wk = require "which-key"
      wk.setup(opts)
      wk.add {
        { "<leader>f",  group = "Find / Format" },
        { "<leader>t",  group = "Terminal" },
        { "<leader>x",  group = "Diagnostics / Close" },
        { "<leader>c",  group = "Code Action" },
        { "<leader>r",  group = "Rename" },
        { "<leader>g",  group = "Git / Diff" },
        { "<leader>h",  group = "Harpoon" },
        { "<leader>s",  group = "Search / Replace" },
        { "<leader>l",  group = "LazyGit" },
        { "<leader>e",  desc  = "Focus file tree" },
        { "<leader>d",  desc  = "Diagnostic float" },
        { "<leader>i",  group = "Imports" },
      }
    end,
  },

  -- ─── TypeScript import helpers (organize, add missing, remove unused) ─
  -- Keymaps wired below; works alongside typescript-tools.nvim
  {
    "neovim/nvim-lspconfig",
    keys = {
      {
        "<leader>io",
        function()
          vim.lsp.buf.execute_command {
            command = "_typescript.organizeImports",
            arguments = { vim.api.nvim_buf_get_name(0) },
          }
        end,
        desc = "Organize imports",
      },
      {
        "<leader>ia",
        function() vim.lsp.buf.code_action() end,
        desc = "Add missing imports (code action)",
      },
      {
        "<leader>iu",
        function()
          vim.lsp.buf.execute_command {
            command = "_typescript.removeUnusedImports",
            arguments = { vim.api.nvim_buf_get_name(0) },
          }
        end,
        desc = "Remove unused imports",
      },
    },
  },
}

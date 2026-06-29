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
    opts  = {},
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
}

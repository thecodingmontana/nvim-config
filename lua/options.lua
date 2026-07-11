require "nvchad.options"

local o = vim.opt

-- Line numbers
o.relativenumber = true
o.number         = true
o.cursorline     = true

-- Scroll padding
o.scrolloff     = 8
o.sidescrolloff = 8

-- No line wrap
o.wrap        = false
o.breakindent = true

-- Indentation (2 spaces default — JS/TS/Lua)
o.tabstop     = 2
o.shiftwidth  = 2
o.expandtab   = true
o.smartindent = true

-- Search
o.ignorecase = true
o.smartcase  = true
o.hlsearch   = false

-- Splits open right and below (natural)
o.splitright = true
o.splitbelow = true

-- Faster response
o.timeoutlen = 300
o.updatetime = 200

-- System clipboard
o.clipboard = "unnamedplus"

-- Rust uses 4-space indent
vim.api.nvim_create_autocmd("FileType", {
  pattern  = "rust",
  callback = function()
    vim.opt_local.tabstop   = 4
    vim.opt_local.shiftwidth = 4
  end,
})

-- Auto-enter insert mode when switching to terminal buffer
vim.api.nvim_create_autocmd({ "TermOpen", "BufEnter" }, {
  pattern  = "term://*",
  callback = function()
    vim.cmd "startinsert!"
  end,
})

-- Suppress nvim-lspconfig v2 deprecation warning
vim.deprecate = function() end

-- ── Diagnostics: inline errors like VS Code ───────────────────────────────
vim.diagnostic.config {
  -- Show error/warning text inline at end of line
  virtual_text = {
    prefix   = "●",   -- dot before message
    spacing  = 4,
    severity = { min = vim.diagnostic.severity.HINT },
  },
  -- Show signs in the gutter (E W I H)
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN]  = " ",
      [vim.diagnostic.severity.INFO]  = " ",
      [vim.diagnostic.severity.HINT]  = "󰌵 ",
    },
  },
  underline        = true,   -- underline the offending code
  update_in_insert = false,  -- don't distract while typing
  severity_sort    = true,   -- errors first
  float = {
    border  = "rounded",
    source  = true,          -- show which linter/LSP the error came from
    header  = "",
    prefix  = "",
  },
}

-- LSP config using vim.lsp.config (nvim 0.11+ native API)
-- Suppress nvim-lspconfig v2 deprecation warning
vim.deprecate = function() end

local capabilities = vim.tbl_deep_extend(
  "force",
  vim.lsp.protocol.make_client_capabilities(),
  require("cmp_nvim_lsp").default_capabilities()
)

local on_attach = function(_, bufnr)
  local map = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
  end
  map("n", "gd",         vim.lsp.buf.definition,     "Go to Definition")
  map("n", "gD",         vim.lsp.buf.declaration,    "Go to Declaration")
  map("n", "gr",         vim.lsp.buf.references,     "References")
  map("n", "gi",         vim.lsp.buf.implementation, "Implementation")
  map("n", "K",          vim.lsp.buf.hover,          "Hover Docs")
  map("n", "<leader>ca", vim.lsp.buf.code_action,    "Code Action")
  -- Note: <leader>rn is mapped by inc-rename.nvim (live preview rename)
end

-- Default capabilities applied to all servers
local lspconfig = require "lspconfig"

local servers = {
  ts_ls       = {},
  cssls       = {},
  html        = {},
  jsonls      = {},
  yamlls      = {},
  taplo       = {},
  bashls      = {},
  volar       = {},
  tailwindcss = {
    filetypes = {
      "html", "css", "javascript", "javascriptreact",
      "typescript", "typescriptreact", "vue",
    },
  },
  emmet_ls = {
    filetypes = { "html", "css", "scss", "javascriptreact", "typescriptreact", "vue" },
  },
  rust_analyzer = {
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = { command = "clippy" },
        cargo       = { allFeatures = true },
      },
    },
  },
  eslint = {
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer  = bufnr,
        callback = function()
          pcall(vim.cmd, "EslintFixAll")
        end,
      })
    end,
  },
}

for name, config in pairs(servers) do
  lspconfig[name].setup(vim.tbl_deep_extend("force", {
    on_attach    = on_attach,
    capabilities = capabilities,
  }, config))
end

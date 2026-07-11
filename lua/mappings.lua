require "nvchad.mappings"

local map = vim.keymap.set

-- ── Buffer navigation ──────────────────────────────────────────
map("n", "<Tab>",   "<cmd>bnext<cr>",  { desc = "Next buffer" })
map("n", "<S-Tab>", "<cmd>bprev<cr>",  { desc = "Prev buffer" })
map("n", "<leader>x", "<cmd>bd<cr>",   { desc = "Close buffer" })

-- ── Window navigation ──────────────────────────────────────────
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })

-- ── Save ──────────────────────────────────────────────────────
map({ "n", "i" }, "<C-s>", "<cmd>w<cr>", { desc = "Save file" })

-- ── Format buffer ─────────────────────────────────────────────
map("n", "<leader>fm", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "Format buffer" })

-- ── Diagnostics ───────────────────────────────────────────────
map("n", "[d", vim.diagnostic.goto_prev,        { desc = "Prev diagnostic" })
map("n", "]d", vim.diagnostic.goto_next,        { desc = "Next diagnostic" })
map("n", "<leader>d", vim.diagnostic.open_float, { desc = "Diagnostic float" })

-- ── Terminal (Ctrl+t = toggle, like VS Code) ───────────────────
-- open_mapping is set in toggleterm opts; Esc exits terminal insert mode
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal insert mode" })

-- Multiple terminal instances
map("n", "<leader>t1", "<cmd>1ToggleTerm<cr>", { desc = "Terminal 1" })
map("n", "<leader>t2", "<cmd>2ToggleTerm<cr>", { desc = "Terminal 2" })
map("n", "<leader>t3", "<cmd>3ToggleTerm<cr>", { desc = "Terminal 3" })
map("n", "<leader>tn", "<cmd>ToggleTerm<cr>",   { desc = "New terminal" })
map("n", "<leader>t",  "<cmd>1ToggleTerm<cr>",  { desc = "Toggle terminal" })

-- ── Telescope: LSP symbol search ────────────────────────────────
map("n", "<leader>fs", "<cmd>Telescope lsp_workspace_symbols<cr>", { desc = "Workspace symbols" })
map("n", "<leader>fS", "<cmd>Telescope lsp_document_symbols<cr>",  { desc = "Document symbols" })

-- ── Imports (TS/JS/Vue) ───────────────────────────────────────
map("n", "<leader>io", function()
  vim.lsp.buf.execute_command {
    command   = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
  }
end, { desc = "Organize imports" })

map("n", "<leader>ia", function()
  vim.lsp.buf.code_action()
end, { desc = "Add missing import" })

map("n", "<leader>iu", function()
  vim.lsp.buf.execute_command {
    command   = "_typescript.removeUnusedImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
  }
end, { desc = "Remove unused imports" })

-- ── Ctrl+click: go to definition (like VS Code) ───────────────────────────
vim.keymap.set("n", "<C-LeftMouse>", function()
  vim.lsp.buf.definition()
end, { desc = "Go to definition (Ctrl+click)" })

-- Also map gf to open file under cursor (for import paths)
vim.keymap.set("n", "gf", function()
  -- Try LSP definition first, fall back to file open
  local ok = pcall(vim.lsp.buf.definition)
  if not ok then
    vim.cmd "normal! gf"
  end
end, { desc = "Go to file / definition" })

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
map("n", "<leader>tn", "<cmd>ToggleTerm<cr>",  { desc = "New terminal" })
map("n", "<leader>t",  "<cmd>ToggleTerm<cr>",  { desc = "Toggle terminal" })

-- ── Telescope: LSP symbol search ────────────────────────────────
map("n", "<leader>fs", "<cmd>Telescope lsp_workspace_symbols<cr>", { desc = "Workspace symbols" })
map("n", "<leader>fS", "<cmd>Telescope lsp_document_symbols<cr>",  { desc = "Document symbols" })

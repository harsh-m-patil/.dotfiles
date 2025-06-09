vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true })
vim.api.nvim_set_keymap("n", "n", "nzzzv", { noremap = true })
vim.api.nvim_set_keymap("n", "N", "Nzzzv", { noremap = true })

local map = vim.keymap.set

map("n", "<Esc>", "<cmd>nohlsearch<CR>")
map("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- yank and paste
map({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
map({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from system clipboard" })

-- diagnostics
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- buffers
map("n", "]b", "<cmd>bn<CR>", { desc = "go to next buffer" })
map("n", "[b", "<cmd>bp<CR>", { desc = "go to prev buffer" })
map("n", "<leader>bp", "<cmd>bp<CR>", { desc = "go to previous buffer" })
map("n", "<leader>bd", "<cmd>bd<CR>", { desc = "delete current buffer" })

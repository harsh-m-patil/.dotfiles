local map = vim.keymap.set

-- ; opens command mode in normal mode
map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true })
vim.api.nvim_set_keymap("n", "n", "nzzzv", { noremap = true })
vim.api.nvim_set_keymap("n", "N", "Nzzzv", { noremap = true })

map("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
map("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
map("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
map("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

local builtin = require("telescope.builtin")
-- builtin
map("n", "<leader>ff", builtin.find_files, { desc = " [F]ind files" })
map("n", "<leader>fg", builtin.live_grep, { desc = " [F]ind by live grep" })
map("n", "<leader>fh", builtin.help_tags, { desc = " [F]ind help" })
map("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
map("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" })
map("n", "<leader>fs", builtin.builtin, { desc = "[F]ind [S]elect Telescope" })
map("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind current [W]ord" })
map("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
map("n", "<leader>fr", builtin.resume, { desc = "[F]ind [R]esume" })
map("n", "<leader>f.", builtin.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' })

-- lsp
-- Jump to the definition of the word under your cursor.
--  This is where a variable was first declared, or where a function is defined, etc.
--  To jump back, press <C-t>.
map("n", "<leader>gd", builtin.lsp_definitions, { desc = "[G]oto [D]efinition" })

-- Find references for the word under your cursor.
map("n", "<leader>gr", builtin.lsp_references, { desc = "[G]oto [R]eferences" })

-- Jump to the implementation of the word under your cursor.
--  Useful when your language has ways of declaring types without an actual implementation.
map("n", "<leader>gI", builtin.lsp_implementations, { desc = "[G]oto [I]mplementation" })

-- Jump to the type of the word under your cursor.
--  Useful when you're not sure what type a variable is and you want to see
--  the definition of its *type*, not where it was *defined*.
map("n", "<leader>D", builtin.lsp_type_definitions, { desc = "Type [D]efinition" })

-- Fuzzy find all the symbols in your current document.
--  Symbols are things like variables, functions, types, etc.
map("n", "<leader>ds", builtin.lsp_document_symbols, { desc = "[D]ocument [S]ymbols" })

-- Fuzzy find all the symbols in your current workspace.
--  Similar to document symbols, except searches over your entire project.
map("n", "<leader>ws", builtin.lsp_dynamic_workspace_symbols, { desc = "[W]orkspace [S]ymbols" })

local opts = {}
map("n", "gD", vim.lsp.buf.declaration, opts)
map("n", "gd", vim.lsp.buf.definition, opts)
map("n", "K", vim.lsp.buf.hover, opts)
map("n", "gi", vim.lsp.buf.implementation, opts)
map({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })
map("n", "gr", vim.lsp.buf.references, opts)

map("n", "<leader>n", ":Oil<CR>", { desc = "Open Oil.nvim" })

map("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Open undotree" })

map("n", "<leader>fm", require("conform").format, { desc = "format document" })

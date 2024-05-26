vim.wo.number = true
vim.wo.relativenumber = true
vim.cmd("set scrolloff=10")
vim.cmd("set expandtab")
vim.cmd("set smartindent")
vim.cmd("set shiftwidth=4")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.g.mapleader = " "

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true })
vim.api.nvim_set_keymap("n", "n", "nzzzv", { noremap = true })
vim.api.nvim_set_keymap("n", "N", "Nzzzv", { noremap = true })

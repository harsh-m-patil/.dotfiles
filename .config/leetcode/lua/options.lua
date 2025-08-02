vim.cmd("set mouse= ")
vim.o.breakindent = true
vim.o.signcolumn = "yes"

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Preview substitutions live, as you type!
vim.o.inccommand = "split"

vim.opt.scrolloff = 18
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.undofile = true
-- vim.opt.guicursor = ""

-- split behaviour
vim.opt.splitright = true
vim.opt.splitbelow = true

-- higlight on search
vim.opt.hlsearch = true

-- display cursorline
vim.opt.cursorline = true

-- display colorcolumn
vim.opt.colorcolumn = "80"

vim.cmd("set mouse= ")
vim.o.breakindent = true
vim.g.have_nerd_font = true
vim.o.winborder = "rounded"

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

vim.opt.list = true
vim.opt.listchars = {
	tab = "→ ",
	trail = "·",
	nbsp = "␣",
}
-- Preview substitutions live, as you type!
vim.o.inccommand = "split"

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

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
-- vim.opt.colorcolumn = "80"

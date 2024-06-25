vim.cmd("set mouse= ")

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.scrolloff = 10
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.undofile = true

-- split behaviour
vim.opt.splitright = true
vim.opt.splitbelow = true

-- higlight on search
vim.opt.hlsearch = true

-- display cursorline
vim.opt.cursorline = true

function Transparent()
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

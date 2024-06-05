return {
	"catppuccin/nvim",
	lazy = false,
	name = "catppuccin",
	priority = 8000,
	config = function()
		vim.cmd.colorscheme("catppuccin-macchiato")
	end,
}

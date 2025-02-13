return {
	{
		"catppuccin/nvim",
		lazy = true,
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				-- transparent_background = true,
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				styles = {
					functions = { "italic" },
				},
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					treesitter = true,
				},
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				vim.cmd.colorscheme("tokyonight-night"),
			})
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = true,
	},
}

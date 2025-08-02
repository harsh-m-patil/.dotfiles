return {
	{
		"folke/tokyonight.nvim",
		lazy = true,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				transparent = true, -- Enable this to disable setting the background color
			})
			vim.cmd.colorscheme("tokyonight-moon")
		end,
	},
	{
		"rose-pine/neovim",
		lazy = true,
		name = "rose-pine",
		config = function()
			vim.cmd("colorscheme rose-pine")
		end,
	},
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 8000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				color_overrides = {
					mocha = {
						base = "#11111b",
					},
				},
				auto_integrations = true,
			})

			vim.cmd.colorscheme("catppuccin")
		end,
	},
}

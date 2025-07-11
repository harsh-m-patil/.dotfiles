return {
	{
		"folke/tokyonight.nvim",
		lazy = true,
		priority = 1000,
		config = function()
			require("tokyonight").setup()
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
		"rebelot/kanagawa.nvim",
		lazy = true,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("kanagawa-wave")
		end,
	},
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		-- opts = {
		-- 	transparent_background = true,
		-- },
		priority = 8000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				-- transparent_background = true,
			})

			vim.cmd.colorscheme("catppuccin")
		end,
	},
}

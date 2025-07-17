return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				light_style = "day",
				transparent = false,
				terminal_colors = true,
				style = "night",
				styles = {
					comments = { italic = true },
					keywords = { italic = true },
				},
				on_colors = function(colors)
					colors.bg = colors.black
				end,
			})
			vim.cmd.colorscheme("tokyonight-night")
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
		lazy = true,
		name = "catppuccin",
		-- opts = {
		-- 	transparent_background = true,
		-- },
		priority = 8000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				-- transparent_background = true,
				color_overrides = {
					mocha = {
						-- more darker background
						base = "#000000",
					},
				},
			})

			vim.cmd.colorscheme("catppuccin")
		end,
	},
}

return {
	{
		"folke/tokyonight.nvim",
		lazy = true,
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

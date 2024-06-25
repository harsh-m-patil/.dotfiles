return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
	config = function()
		require("lualine").setup({
			options = {
				component_separators = "",
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {},
				lualine_c = { "buffers" },
				lualine_x = { "diff", "diagnostics" },
				lualine_y = { "progress" },
				lualine_z = {},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "filetype" },
				lualine_y = { "location" },
				lualine_z = {},
			},
		})
	end,
}

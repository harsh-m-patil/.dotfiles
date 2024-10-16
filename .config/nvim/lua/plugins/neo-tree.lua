return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	cmd = {
		"Neotree",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	config = function()
		require("neo-tree").setup({
			window = {
				position = "right",
				width = 35,
			},
		})
	end,
	vim.keymap.set("n", "<leader>tr", "<CMD>Neotree<CR>", { desc = "Open neotree" }),
}

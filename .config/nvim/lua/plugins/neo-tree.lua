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
	vim.keymap.set("n", "<leader>tr", "<CMD>Neotree reveal filesystem right<CR>", { desc = "Open neotree" }),
}

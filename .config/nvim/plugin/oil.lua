vim.pack.add({ "https://github.com/stevearc/oil.nvim" })

require("oil").setup({
	view_options = {
		show_hidden = true,
	},
	skip_confirm_for_simple_edits = true,
})

vim.keymap.set("n", "<leader>n", "<cmd>Oil<cr>", { desc = "Open Oil.nvim" })

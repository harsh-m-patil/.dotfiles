return {
	"kawre/leetcode.nvim",
	build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
	dependencies = {
		-- include a picker of your choice, see picker section for more details
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("leetcode").setup({
			lang = "typescript",
			image_support = true,
		})

		vim.keymap.set("n", "<leader>lq", "<cmd>Leet list<cr>", { desc = "LeetCode: Questions" })
		vim.keymap.set("n", "<leader>ll", "<cmd>Leet lang<cr>", { desc = "LeetCode: Langs" })
		vim.keymap.set("n", "<leader>lt", "<cmd>Leet tabs<cr>", { desc = "LeetCode: Tabs" })
		vim.keymap.set("n", "<leader>lr", "<cmd>Leet run<cr>", { desc = "LeetCode: Run" })
		vim.keymap.set("n", "<leader>ls", "<cmd>Leet submit<cr>", { desc = "LeetCode: Submit" })
	end,
}

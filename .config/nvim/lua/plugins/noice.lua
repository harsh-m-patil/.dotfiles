return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		-- add any options here
	},
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		"rcarriga/nvim-notify",
	},
	config = function()
		require("noice").setup({})

		local noice = require("noice")
		local map = vim.keymap.set

		map("n", "<leader>nl", function()
			noice.cmd("last")
		end)

		map("n", "<leader>nh", function()
			noice.cmd("history")
		end)

		map("n", "<leader>nd", function()
			noice.cmd("dismiss")
		end)
	end,
}

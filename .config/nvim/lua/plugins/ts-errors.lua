return {
	"OlegGulevskyy/better-ts-errors.nvim",
	dependencies = { "MunifTanjim/nui.nvim" },
	ft = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" },
	config = {
		keymaps = {
			toggle = "<leader>dd", -- default '<leader>dd'
			go_to_definition = "<leader>dx", -- default '<leader>dx'
		},
	},
}

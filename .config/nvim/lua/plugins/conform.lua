return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				html = { "prettierd" },
				css = { "prettierd" },
				rust = { "rustfmt" },
				javascript = { "prettierd" },
			},
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_fallback = true,
			},
		})
	end,
}

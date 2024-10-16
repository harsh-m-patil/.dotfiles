return {
	"stevearc/conform.nvim",
	event = "VeryLazy",
	config = function()
		local conform = require("conform")
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				java = { "google_java_format" },
				go = { "gofumpt" },
				c = { "clang_format" },
				cpp = { "clang_format" },
			},
			format_on_save = {
				-- Enable auto-formatting on save
				lsp_fallback = true,
			},
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			callback = function(args)
				conform.format({ bufnr = args.buf })
			end,
		})

		vim.keymap.set("n", "<leader>fm", function()
			conform.format({ async = true })
		end, { desc = "Format buffer" })
	end,
}

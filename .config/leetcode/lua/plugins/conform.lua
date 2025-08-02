return {
	"stevearc/conform.nvim",
	event = "VeryLazy",
	config = function()
		local conform = require("conform")
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		conform.setup({
			formatters_by_ft = {
				javascript = { "biome" },
				json = { "biome" },
				html = { "prettierd" },
				css = { "prettierd" },
				markdown = { "prettierd" },
				typescript = { "biome" },
				javascriptreact = { "biome" },
				typescriptreact = { "biome" },
				java = { "clang_format" },
				go = { "gofumpt" },
			},
			format_on_save = {
				-- Enable auto-formatting on save
				timeout_ms = 500,
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

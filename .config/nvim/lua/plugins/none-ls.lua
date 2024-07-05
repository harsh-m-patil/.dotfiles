return {
	"nvimtools/none-ls.nvim",
	event = "VeryLazy",
	-- dependencies = {
	-- 	"nvimtools/none-ls-extras.nvim",
	-- },
	config = function()
		local null_ls = require("null-ls")
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.google_java_format,
				null_ls.builtins.formatting.gofumpt,
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({
						group = augroup,
						buffer = bufnr,
					})
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ bufnr = bufnr })
						end,
					})
				end
			end,
			vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, {}),
		})
	end,
}

vim.pack.add({
	'https://github.com/neovim/nvim-lspconfig',
})

local servers = {
	lua_ls = {},
	gopls = {},
	vtsls = {},
}

for server in pairs(servers) do
	vim.lsp.enable(server)
end

vim.api.nvim_create_autocmd('LspAttach', {
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" }),
	vim.keymap.set("n", "g.", vim.lsp.buf.code_action, { desc = "Code Actions" }),
	group = vim.api.nvim_create_augroup('my.lsp', {}),
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		if not client then return end

		if client:supports_method('textDocument/formatting') then
			vim.keymap.set("n", "<leader>fm",
				function() vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 }) end,
				{ desc = "Format Document", buffer = args.buf })
			-- autoformat
			-- vim.api.nvim_create_autocmd('BufWritePre', {
			--   group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
			--   buffer = args.buf,
			--   callback = function()
			--     vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
			--   end,
			-- })
		end
	end,
})

return {
	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonUpdate" },
		config = function()
			require("mason").setup({
				ensure_installed = {
					"stylua",
					"prettierd",
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"tailwindcss",
					"lua_ls",
					"bashls",
					"html",
					"eslint",
					"gopls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },

		-- example using `opts` for defining servers
		opts = {
			servers = {
				lua_ls = {},
			},
		},
		config = function(_, opts)
			local lspconfig = require("lspconfig")
			for server, config in pairs(opts.servers) do
				config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
				lspconfig[server].setup(config)
			end

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local map = vim.keymap.set
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					local mapOpts = { buffer = ev.buf, silent = true }
					map("n", "gD", vim.lsp.buf.declaration, mapOpts)
					map("n", "gd", vim.lsp.buf.definition, mapOpts)
					map("n", "K", vim.lsp.buf.hover, mapOpts)
					map("n", "gi", vim.lsp.buf.implementation, mapOpts)
					map({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, mapOpts)
					map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })
					map("n", "gr", vim.lsp.buf.references, mapOpts)
					local builtin = require("telescope.builtin")
					map("n", "<leader>gd", builtin.lsp_definitions, { desc = "[G]oto [D]efinition" })
					map("n", "<leader>gr", builtin.lsp_references, { desc = "[G]oto [R]eferences" })
					-- Jump to the implementation of the word under your cursor.
					--  Useful when your language has ways of declaring types without an actual implementation.
					map("n", "<leader>gI", builtin.lsp_implementations, { desc = "[G]oto [I]mplementation" })

					-- Jump to the type of the word under your cursor.
					--  Useful when you're not sure what type a variable is and you want to see
					--  the definition of its *type*, not where it was *defined*.
					map("n", "<leader>D", builtin.lsp_type_definitions, { desc = "Type [D]efinition" })

					-- Fuzzy find all the symbols in your current document.
					--  Symbols are things like variables, functions, types, etc.
					map("n", "<leader>ds", builtin.lsp_document_symbols, { desc = "[D]ocument [S]ymbols" })

					-- Fuzzy find all the symbols in your current workspace.
					--  Similar to document symbols, except searches over your entire project.
					map("n", "<leader>ws", builtin.lsp_dynamic_workspace_symbols, { desc = "[W]orkspace [S]ymbols" })
				end,
			})
		end,
	},
	{
		"j-hui/fidget.nvim",
		event = "VeryLazy",
		opts = {
			-- options
		},
	},
}

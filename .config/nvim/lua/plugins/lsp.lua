return {
	-- Mason: install formatters, linters
	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonUpdate" },
		config = function()
			require("mason").setup({
				ensure_installed = {
					"prettierd",
					"biome",
					"stylua",
				},
			})
		end,
	},

	-- Mason LSPConfig
	{
		"williamboman/mason-lspconfig.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"vtsls",
					"tailwindcss",
					"lua_ls",
					"bashls",
					"html",
					-- "eslint",
					"gopls",
					"pylsp",
					"dockerls",
				},
			})
		end,
	},

	-- LSP config
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "saghen/blink.cmp" },
		opts = {
			servers = {
				html = {},
				tailwindcss = {},
				lua_ls = {},
				bashls = {},
				gopls = {},
				pylsp = {},
				dockerls = {},
				jsonls = {},
				prismals = {},
				cssls = {},
			},
		},

		config = function(_, opts)
			-- local customizations = {
			-- 	{ rule = "style/*", severity = "off", fixable = true },
			-- 	{ rule = "format/*", severity = "off", fixable = true },
			-- 	{ rule = "*-indent", severity = "off", fixable = true },
			-- 	{ rule = "*-spacing", severity = "off", fixable = true },
			-- 	{ rule = "*-spaces", severity = "off", fixable = true },
			-- 	{ rule = "*-order", severity = "off", fixable = true },
			-- 	{ rule = "*-dangle", severity = "off", fixable = true },
			-- 	{ rule = "*-newline", severity = "off", fixable = true },
			-- 	{ rule = "*quotes", severity = "off", fixable = true },
			-- 	{ rule = "*semi", severity = "off", fixable = true },
			-- }
			local lspconfig = require("lspconfig")
			for server, config in pairs(opts.servers) do
				config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
				lspconfig[server].setup(config)
			end

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local map = vim.keymap.set
					local mapOpts = { buffer = ev.buf, silent = true }
					map("n", "gD", vim.lsp.buf.declaration, { desc = "[G]oto [D]eclaration", unpack(mapOpts) })
					map("n", "gd", vim.lsp.buf.definition, { desc = "[G]oto [D]efinition", unpack(mapOpts) })
					map("n", "K", vim.lsp.buf.hover, { desc = "[K] Hover Docs", unpack(mapOpts) })
					map("n", "gi", vim.lsp.buf.implementation, { desc = "[G]oto [I]mplementation", unpack(mapOpts) })
					map(
						{ "n", "v" },
						"<space>ca",
						vim.lsp.buf.code_action,
						{ desc = "[C]ode [A]ction", unpack(mapOpts) }
					)
					map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })
					map("n", "gr", vim.lsp.buf.references, mapOpts)
					local builtin = require("telescope.builtin")
					map("n", "<leader>gd", builtin.lsp_definitions, { desc = "[G]oto [D]efinition" })
					map("n", "<leader>gr", builtin.lsp_references, { desc = "[G]oto [R]eferences" })
					map("n", "<leader>gI", builtin.lsp_implementations, { desc = "[G]oto [I]mplementation" })
					map("n", "<leader>D", builtin.lsp_type_definitions, { desc = "Type [D]efinition" })
					map("n", "<leader>ds", builtin.lsp_document_symbols, { desc = "[D]ocument [S]ymbols" })
					map("n", "<leader>ws", builtin.lsp_dynamic_workspace_symbols, { desc = "[W]orkspace [S]ymbols" })
				end,

				-- 		lspconfig.eslint.setup({
				-- 			filetypes = {
				-- 				"javascript",
				-- 				"javascriptreact",
				-- 				"javascript.jsx",
				-- 				"typescript",
				-- 				"typescriptreact",
				-- 				"typescript.tsx",
				-- 				"html",
				-- 				"markdown",
				-- 				"json",
				-- 				"jsonc",
				-- 				"css",
				-- 			},
				-- 			settings = {
				-- 				rulesCustomizations = customizations,
				-- 			},
				-- 			on_attach = function(client, bufnr)
				-- 				vim.api.nvim_create_autocmd("BufWritePre", {
				-- 					buffer = bufnr,
				-- 					command = "EslintFixAll",
				-- 				})
				-- 			end,
				-- 		}),
			})
		end,
	},
	{
		"j-hui/fidget.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{
		"smjonas/inc-rename.nvim",
		opts = {},
	},
}

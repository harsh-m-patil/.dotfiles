return {
	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonUpdate" },
		config = function()
			require("mason").setup({
				ensure_installed = {
					"stylua",
					"prettierd",
					"biome",
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
					"vtsls",
					"pylsp",
					"pyright",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "saghen/blink.cmp" },

		opts = {
			servers = {
				lua_ls = {},
				gopls = {},
				html = {},
				pylsp = {},
				tailwindcss = {},
				bashls = {},
				vtsls = {},
				eslint = {},
				dockerls = {},
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
					map("n", "<leader>gI", builtin.lsp_implementations, { desc = "[G]oto [I]mplementation" })
					map("n", "<leader>D", builtin.lsp_type_definitions, { desc = "Type [D]efinition" })
					map("n", "<leader>ds", builtin.lsp_document_symbols, { desc = "[D]ocument [S]ymbols" })
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

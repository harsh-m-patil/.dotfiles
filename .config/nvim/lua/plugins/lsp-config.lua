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
		event = "VeryLazy",
		config = function()
			local lspconfig = require("lspconfig")
			local servers = {
				"lua_ls",
				"eslint",
				"html",
				"jdtls",
				"clangd",
				"pyright",
				"bashls",
			}

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			for _, lsp in ipairs(servers) do
				lspconfig[lsp].setup({
					capabilities = capabilities,
				})
			end

			lspconfig.gopls.setup({
				capabilities = capabilities,
				settings = {
					gopls = {
						analyses = {
							unusedparams = true,
						},
						staticcheck = true,
						gofumpt = true,
					},
				},
			})

			lspconfig.denols.setup({
				root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
			})

			lspconfig.ts_ls.setup({
				root_dir = lspconfig.util.root_pattern("package.json"),
				single_file_support = false,
			})

			lspconfig.tailwindcss.setup({
				root_dir = lspconfig.util.root_pattern("tailwind.config.js"),
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local map = vim.keymap.set
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					local opts = { buffer = ev.buf, silent = true }
					map("n", "gD", vim.lsp.buf.declaration, opts)
					map("n", "gd", vim.lsp.buf.definition, opts)
					map("n", "K", vim.lsp.buf.hover, opts)
					map("n", "gi", vim.lsp.buf.implementation, opts)
					map({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
					map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })
					map("n", "gr", vim.lsp.buf.references, opts)
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

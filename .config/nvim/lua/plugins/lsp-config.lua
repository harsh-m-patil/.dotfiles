return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"tsserver",
					"rust_analyzer",
					"jdtls",
					"lua_ls",
					"html",
					"cssls",
					"bashls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",

		config = function()
			local lspconfig = require("lspconfig")
			local servers = {
				"tsserver",
				"rust_analyzer",
				"jdtls",
				"lua_ls",
				"html",
				"cssls",
				"bashls",
			}

			for _, lsp in ipairs(servers) do
				lspconfig[lsp].setup({})
			end
		end,
	},
	{ "j-hui/fidget.nvim", opts = {} },
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		-- use opts = {} for passing setup options
		-- this is equalent to setup({}) function
	},
}

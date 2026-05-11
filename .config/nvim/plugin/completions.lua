vim.pack.add({
	"https://github.com/folke/lazydev.nvim",
	"https://github.com/saghen/blink.cmp",
	"https://github.com/rafamadriz/friendly-snippets"
})

require('lazydev').setup({
	library = {
		-- See the configuration section for more details
		-- Load luvit types when the `vim.uv` word is found
		{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
	},
})

require('blink.cmp').setup({
	keymap = { preset = 'default' },

	appearance = {
		use_nvim_cmp_as_default = true,
		nerd_font_variant = 'mono'
	},
	sources = {
		default = { 'lsp', 'path', 'snippets', 'buffer' },
	},

	completion = { documentation = { auto_show = false } },
	signature = { enabled = true },

	fuzzy = { implementation = "lua" }
})

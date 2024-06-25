return {
	{
		"windwp/nvim-ts-autotag",
		ft = {
			"html",
			"javascriptreact",
			"typescriptreact",
		},
		config = function()
			require("nvim-ts-autotag").setup({})
		end,
	},
	{
		"tpope/vim-surround",
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"windwp/nvim-autopairs",
		event = { "BufReadPre", "BufNewFile" },
		config = true,
		-- use opts = {} for passing setup options
		-- this is equalent to setup({}) function
	},
}

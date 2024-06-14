return {
	{
		"windwp/nvim-ts-autotag",
		ft = {
			"javascript",
			"html",
			"javascriptreact",
			"typescriptreact",
			"typescript",
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
		event = "InsertEnter",
		config = true,
		-- use opts = {} for passing setup options
		-- this is equalent to setup({}) function
	},
}

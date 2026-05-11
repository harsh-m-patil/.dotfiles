vim.pack.add({
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/nvim-telescope/telescope-fzf-native.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-telescope/telescope-ui-select.nvim"
})

require("telescope").setup {
	pickers = {
		find_files = {
			theme = "ivy",
			previewer = false
		},
		help_tags = {
			theme = "ivy"
		}
	},
	extensions = {
		fzf = {},
		["ui-select"] = {
			require("telescope.themes").get_dropdown {}
		}
	}
}

require("telescope").load_extension "fzf"
require("telescope").load_extension "ui-select"

local builtin = require("telescope.builtin")
local map = vim.keymap.set

map("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
map("n", "<leader>fh", builtin.help_tags, { desc = "Find help" })
map("n", "<leader>fk", builtin.keymaps, { desc = "Find Keymaps" })
map("n", "<leader>fp", builtin.pickers, { desc = "Find Pickers" })
map("n", "<leader>en", function()
		builtin.find_files {
			cwd = vim.fn.stdpath "config"
		}
	end,
	{ desc = "find neovim files" }
)

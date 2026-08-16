vim.pack.add({
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/nvim-telescope/telescope-fzf-native.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-telescope/telescope-ui-select.nvim"
})

local fzf_native_path = vim.fn.stdpath("data") .. "/site/pack/core/opt/telescope-fzf-native.nvim"
local fzf_lib_path = fzf_native_path .. "/build/libfzf.so"

if vim.fn.filereadable(fzf_lib_path) == 0 and vim.fn.executable("make") == 1 then
	vim.fn.system({ "make", "-C", fzf_native_path })
end

local telescope = require("telescope")

telescope.setup {
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

local ok, err = pcall(telescope.load_extension, "fzf")
if not ok then
	vim.notify("telescope-fzf-native failed to load: " .. err, vim.log.levels.WARN)
end

telescope.load_extension "ui-select"

local builtin = require("telescope.builtin")
local map = vim.keymap.set

map("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
map("n", "<leader>fh", builtin.help_tags, { desc = "Find help" })
map("n", "<leader>fk", builtin.keymaps, { desc = "Find Keymaps" })
map("n", "<leader>fp", builtin.pickers, { desc = "Find Pickers" })
map("n", "<leader>fg", builtin.live_grep, { desc = "Find Grep" })
map("n", "<leader>en", function()
		builtin.find_files {
			cwd = vim.fn.stdpath "config"
		}
	end,
	{ desc = "find neovim files" }
)
map("n", "<leader>fn", function()
		print(vim.fn.expand("~/notes"))
		builtin.find_files {
			cwd = vim.fn.expand("~/notes")
		}
	end,
	{ desc = "find notes" }
)

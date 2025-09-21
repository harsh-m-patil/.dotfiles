return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make'
    },
    {
      'nvim-telescope/telescope-ui-select.nvim',
    }

  },
  config = function()
    require("telescope").setup {
      pickers = {
        find_files = {
          theme = "ivy"
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
    require "config.telescope.multigrep".setup()
  end,
}

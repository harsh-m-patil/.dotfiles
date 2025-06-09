return {
  {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    cmd = "Telescope",
    tag = "0.1.6",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = { "node_modules" },
          layout_config = {
            vertical = { width = 0.5 },
          },
        },
      })
      local map = vim.keymap.set
      local builtin = require("telescope.builtin")
      -- builtin
      map("n", "<leader>ff", builtin.find_files, { desc = " [F]ind files" })
      map("n", "<C-p>", builtin.find_files, { desc = " [F]ind files" })
      map("n", "<leader>gf", builtin.git_files, { desc = " [G]it files" })
      map("n", "<leader>fg", builtin.live_grep, { desc = " [F]ind by live grep" })
      map("n", "<leader>fh", builtin.help_tags, { desc = " [F]ind help" })
      map("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
      map("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" })
      map("n", "<leader>fs", builtin.builtin, { desc = "[F]ind [S]elect Telescope" })
      map("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind current [W]ord" })
      map("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
      map("n", "<leader>fr", builtin.registers, { desc = "[F]ind [R]egistors" })
      map("n", "<leader>f.", builtin.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' })
      map("n", "<leader>gc", builtin.git_commits, { desc = "[G]it [c]ommits" })
      map("n", "<leader>ft", builtin.treesitter, { desc = "[F]ind [t]reesitter symbols" })

      map("n", "<leader>/", function()
        builtin.current_buffer_fuzzy_find()
      end, { desc = "[/] Fuzzily search in current buffer" })
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    event = "VeryLazy",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}

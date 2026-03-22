return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    priority = 1000,
    opts = {},
    config = function ()
      vim.cmd[[colorscheme tokyonight]]
    end,
  },
  {
    "rose-pine/neovim",
    lazy = false,
    priority = 1000,
    name = "rose-pine",
    config = function()
      vim.cmd("colorscheme rose-pine")
    end
  }
}

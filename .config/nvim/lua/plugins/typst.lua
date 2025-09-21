return {
  'chomosuke/typst-preview.nvim',
  ft = 'typst',
  version = '1.*',
  opts = {}, -- lazy.nvim will implicitly calls `setup {}`
  keys = {
    { '<leader>tp', '<cmd>TypstPreview<cr>', desc = 'Typst Preview' },
  },
}

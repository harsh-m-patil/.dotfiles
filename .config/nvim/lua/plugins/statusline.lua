return {
  'nvim-mini/mini.statusline',
  config = function()
    local statusline = require "mini.statusline"
    statusline.setup { use_icons = true }
  end,
}

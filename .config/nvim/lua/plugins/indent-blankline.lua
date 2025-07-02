return {
	"echasnovski/mini.indentscope",
	version = false,
	config = function()
		require("mini.indentscope").setup({
			symbol = "╎", -- You can use "╎", "▏", etc.
			options = { try_as_border = true },
			draw = {
				delay = 0,
				animation = require("mini.indentscope").gen_animation.none(),
			},
		})
	end,
}

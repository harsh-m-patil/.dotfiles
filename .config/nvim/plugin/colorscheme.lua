vim.pack.add({
	'https://github.com/folke/tokyonight.nvim'
})

require('tokyonight').setup({
	on_colors = function(colors)
		colors.bg = '#0D1117';
	end
})

vim.cmd.colorscheme('tokyonight')

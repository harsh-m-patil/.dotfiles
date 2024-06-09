return {
	"mbbill/undotree",
	vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Open undotree" }),
}

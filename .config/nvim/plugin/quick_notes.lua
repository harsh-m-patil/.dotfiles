require("quick_notes").setup({
	-- Change this if you want the notes file somewhere else.
	-- file = vim.fn.expand("~/notes.md"),
})

vim.keymap.set("n", "<leader>nn", "<cmd>QuickNotesToggle<CR>", {
	desc = "Toggle quick notes",
})

local map = vim.keymap.set

map("n", "<Esc>", "<CMD>nohl<CR>")
map("n", "<leader>fm", vim.lsp.buf.format, { desc = "Format file" })
map("n", "<M-j>", "<CMD>cnext<CR>", { desc = "Next file from QuickfixList" })
map("n", "<M-k>", "<CMD>cprev<CR>", { desc = "Prev file from QuickfixList" })
map("n", "<leader>st", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 15)
end)
map('n', 'gK', function()
  local new_config = not vim.diagnostic.config().virtual_lines
  vim.diagnostic.config({ virtual_lines = new_config })
end, { desc = 'Toggle diagnostic virtual_lines' })

local M = {}

local state = {
	buf = nil,
	win = nil,
	config = nil,
}

local defaults = {
	file = vim.fn.stdpath("data") .. "/quick-notes.md",
	width = 0.8,
	height = 0.8,
	border = "rounded",
	title = " Quick Notes ",
}

local function resolve_size(value, total)
	if value > 0 and value < 1 then
		return math.floor(total * value)
	end

	return math.floor(value)
end

local function window_config()
	local columns = vim.o.columns
	local lines = vim.o.lines - vim.o.cmdheight
	local width = resolve_size(state.config.width, columns)
	local height = resolve_size(state.config.height, lines)

	width = math.max(20, math.min(width, columns))
	height = math.max(5, math.min(height, lines))

	return {
		relative = "editor",
		style = "minimal",
		border = state.config.border,
		title = state.config.title,
		title_pos = "center",
		width = width,
		height = height,
		col = math.floor((columns - width) / 2),
		row = math.floor((lines - height) / 2),
	}
end

local function ensure_file(path)
	local directory = vim.fn.fnamemodify(path, ":h")

	if vim.fn.isdirectory(directory) == 0 then
		vim.fn.mkdir(directory, "p")
	end

	if vim.fn.filereadable(path) == 0 then
		vim.fn.writefile({ "# Quick Notes", "" }, path)
	end
end

function M.open()
	if state.win and vim.api.nvim_win_is_valid(state.win) then
		vim.api.nvim_set_current_win(state.win)
		return
	end

	local file = vim.fn.expand(state.config.file)
	ensure_file(file)

	state.buf = vim.fn.bufadd(file)
	vim.fn.bufload(state.buf)

	state.win = vim.api.nvim_open_win(state.buf, true, window_config())

	vim.bo[state.buf].buflisted = false
	vim.bo[state.buf].filetype = "markdown"
	vim.wo[state.win].wrap = true
	vim.wo[state.win].number = false
	vim.wo[state.win].relativenumber = false
	vim.wo[state.win].signcolumn = "no"
	vim.wo[state.win].colorcolumn = ""

	vim.api.nvim_create_autocmd("WinClosed", {
		pattern = tostring(state.win),
		once = true,
		callback = function()
			state.win = nil
		end,
	})
end

function M.toggle()
	if state.win and vim.api.nvim_win_is_valid(state.win) then
		vim.api.nvim_win_close(state.win, false)
		state.win = nil
		return
	end

	M.open()
end

function M.setup(opts)
	state.config = vim.tbl_deep_extend("force", defaults, opts or {})

	vim.api.nvim_create_user_command("QuickNotes", M.open, {
		desc = "Open global quick notes in a floating window",
	})

	vim.api.nvim_create_user_command("QuickNotesToggle", M.toggle, {
		desc = "Toggle global quick notes floating window",
	})
end

return M

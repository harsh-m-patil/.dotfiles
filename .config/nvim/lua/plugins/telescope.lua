return {
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({})
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

			-- Slightly advanced example of overriding default behavior and theme
			map("n", "<leader>/", function()
				-- You can pass additional configuration to Telescope to change the theme, layout, etc.
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					previewer = false,
				}))
			end, { desc = "[/] Fuzzily search in current buffer" })

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
				callback = function(event)
					-- In this case, we create a function that lets us more easily define mappings specific
					-- for LSP related items. It sets the mode, buffer and description for us each time.
					-- lsp
					-- Jump to the definition of the word under your cursor.
					--  This is where a variable was first declared, or where a function is defined, etc.
					--  To jump back, press <C-t>.
					map("n", "<leader>gd", builtin.lsp_definitions, { desc = "[G]oto [D]efinition" })

					-- Find references for the word under your cursor.
					map("n", "<leader>gr", builtin.lsp_references, { desc = "[G]oto [R]eferences" })

					-- Jump to the implementation of the word under your cursor.
					--  Useful when your language has ways of declaring types without an actual implementation.
					map("n", "<leader>gI", builtin.lsp_implementations, { desc = "[G]oto [I]mplementation" })

					-- Jump to the type of the word under your cursor.
					--  Useful when you're not sure what type a variable is and you want to see
					--  the definition of its *type*, not where it was *defined*.
					map("n", "<leader>D", builtin.lsp_type_definitions, { desc = "Type [D]efinition" })

					-- Fuzzy find all the symbols in your current document.
					--  Symbols are things like variables, functions, types, etc.
					map("n", "<leader>ds", builtin.lsp_document_symbols, { desc = "[D]ocument [S]ymbols" })

					-- Fuzzy find all the symbols in your current workspace.
					--  Similar to document symbols, except searches over your entire project.
					map("n", "<leader>ws", builtin.lsp_dynamic_workspace_symbols, { desc = "[W]orkspace [S]ymbols" })
				end,
			})
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

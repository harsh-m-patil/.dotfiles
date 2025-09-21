return {
  {
    "mason-org/mason.nvim",
    opts = {}
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        lua_ls = {},
        gopls = {},
        jsonls = {},
        dockerls = {},
        prismals = {},
        tailwindcss = {},
        vtsls = {},
        tinymist = {},
        clangd = {},
        biome = {},
      }
    },
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function(_, opts)
      for server in pairs(opts.servers) do
        vim.lsp.enable(server)
      end

      vim.api.nvim_create_autocmd('LspAttach', {
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" }),
        vim.keymap.set("n", "g.", vim.lsp.buf.code_action, { desc = "Code Actions" }),
        group = vim.api.nvim_create_augroup('my.lsp', {}),
        callback = function(args)
          local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
          if not client then return end

          if client:supports_method('textDocument/formatting') then
            vim.keymap.set("n", "<leader>fm",
              function() vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 }) end,
              { desc = "Format Document", buffer = args.buf })
            -- vim.api.nvim_create_autocmd('BufWritePre', {
            --   group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
            --   buffer = args.buf,
            --   callback = function()
            --     vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
            --   end,
            -- })
          end
        end,
      })
    end,
  }
}

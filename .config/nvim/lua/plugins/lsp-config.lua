return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "tsserver",
                    "rust_analyzer",
                    "jdtls",
                    "lua_ls",
                    "html",
                    "cssls",
                    "bashls",
                }
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",

        config = function()
            local lspconfig = require('lspconfig')
            local  servers = {
                "tsserver",
                "rust_analyzer",
                "jdtls",
                "lua_ls",
                "html",
                "cssls",
                "bashls",
            }

            for _, lsp in ipairs(servers) do
                lspconfig[lsp].setup {
                }
            end

            local opts = {}
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
            vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        end,
    },
}

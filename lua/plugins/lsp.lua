-- plugins/lsp.lua returns only LSP-related plugin specifications.
-- This file does NOT set keymaps yet; it only installs the LSP stack.

return {
    {
        -- mason.nvim: installs external developer tools (LSP servers, etc.)
        "mason-org/mason.nvim",

        -- build runs when the plugin is installed/updated (not every startup).
        build = ":MasonUpdate",

        config = function()
            require("mason").setup({})
        end,
    },
    {
        -- nvim-lspconfig: provides configs for many LSP servers.
        "neovim/nvim-lspconfig",
        config = function()
            -- Load our LSP defaults and keymaps from a dedicated module.
            require("lsp")
        end,
    },

    {
        -- mason-lspconfig: bridges Mason-installed servers to lspconfig.
        -- but here,
        -- this plugin is only needed for ensure_installed functionality
        "mason-org/mason-lspconfig.nvim",

        dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },

        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "rust_analyzer",
                    "bashls",
                }
            })
        end,
    },
}

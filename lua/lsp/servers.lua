-- This file configures language servers.

-- Capabilities tell servers what the client supports.
-- cmp-nvim-lsp adds completion capabilities so servers send richer completion items.
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Configure rust-analyzer.
-- Mason provides the rust-analyzer binary; lspconfig starts it using this config.
vim.lsp.config("rust_analyzer", {
    capabilities = capabilities,
    -- connect directly to the lspmux server (instead of spawning rust-analyzer)
    cmd = vim.lsp.rpc.connect("127.0.0.1", 27631),
    settings = {
        ["rust-analyzer"] = {
            lspMux = {
                version = "1",
                method = "connect",
                server = "rust-analyzer",
            },
            check = {
                invocationStrategy = "once",
                overrideCommand = {
                    "cargo-subspace",
                    "clippy",
                    "$saved_file",
                },
            },
            workspace = {
                discoverConfig = {
                    command = {
                        "cargo-subspace",
                        "discover",
                        "{arg}",
                    },
                    progressLabel = "cargo-subspace",
                    filesToWatch = {
                        "Cargo.toml",
                    },
                },
            },
            procMacro = {
                enable = false,
            },
            diagnostics = {
                disabled = { "unresolved-proc-macro", "macro-error", "unresolved-macro-call" },
            },
            inlayHints = {
                bindingModeHints = { enable = true },
                chainingHints = { enable = true },
                closingBraceHints = { enable = true },
                closureReturnTypeHints = { enable = "always" },
                lifetimeElisionHints = { enable = "always" },
                parameterHints = { enable = true },
                typeHints = { enable = true },
            },
        }
    },
})

vim.lsp.enable("rust_analyzer")

vim.lsp.config("bashls", {
    capabilities = capabilities,
    settings = {
        -- https://github.com/bash-lsp/bash-language-server/blob/main/server/src/config.ts
        -- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/bashls.lua
        bashIde = {
            backgroundAnalysisMaxFiles = 1000,
            globPattern = "**/*@(.sh|.inc|.bash|.command)",
            includeAllWorkspaceSymbols = true,
            logLevel = "debug",
        },
    },
})
vim.lsp.enable("bashls")

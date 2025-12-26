-- This file configures language servers.

-- Capabilities tell servers what the client supports.
-- cmp-nvim-lsp adds completion capabilities so servers send richer completion items.
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Configure rust-analyzer.
-- Mason provides the rust-analyzer binary; lspconfig starts it using this config.
vim.lsp.config("rust_analyzer", {
    capabilities = capabilities,
    settings = {
        ["rust-analyzer"] = {
            cargo = {
                autoreload = false,
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

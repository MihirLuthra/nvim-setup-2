-- This file configures language servers.

-- Capabilities tell servers what the client supports.
-- cmp-nvim-lsp adds completion capabilities so servers send richer completion items.
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Configure rust-analyzer.
-- Mason provides the rust-analyzer binary; lspconfig starts it using this config.
vim.lsp.config("rust_analyzer", {
  capabilities = capabilities,
})
vim.lsp.enable("rust_analyzer")

vim.lsp.config("bashls", {
  capabilities = capabilities,
})
vim.lsp.enable("bashls")

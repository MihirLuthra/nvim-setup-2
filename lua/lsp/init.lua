-- lua/lsp/init.lua
-- Intention is to place these settings globally, and they are
-- imported during nvim-lspconfig setup

-- Configure how diagnostics are displayed globally.
vim.diagnostic.config({
  virtual_text = true,      -- inline diagnostic text
  signs = true,             -- gutter signs
  underline = true,         -- underline problems
  update_in_insert = false, -- don't update while typing
  severity_sort = true,     -- sort by severity
})

-- Define LSP keymaps only when an LSP attaches to a buffer.
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    -- Buffer-local mappings: they exist only for this buffer.
    local opts = { buffer = args.buf }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)   -- go to definition
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)         -- hover docs
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)   -- references

    vim.keymap.set("n", "<leader>ra", vim.lsp.buf.rename, opts)      -- rename
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- code action

    -- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- prev diagnostic
    -- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- next diagnostic
  end,
})

-- Configure all language servers
require("lsp.servers")

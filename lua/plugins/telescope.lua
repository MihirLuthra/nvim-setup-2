return {
    'nvim-telescope/telescope.nvim', tag = 'v0.2.0',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function ()
        vim.keymap.set("n", "<leader>fw", "<cmd>Telescope live_grep<CR>")
        vim.keymap.set("n", "<leader>ff", "<cmd>Telescope fd<CR>")
        vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
        vim.keymap.set("n", "<leader>fd", "<cmd>Telescope lsp_document_symbols<CR>")
    end
}


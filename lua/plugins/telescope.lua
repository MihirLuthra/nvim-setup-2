return {
    'nvim-telescope/telescope.nvim', tag = 'v0.2.0',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            "nvim-telescope/telescope-live-grep-args.nvim" ,
            -- This will not install any breaking changes.
            -- For major updates, this must be adjusted manually.
            version = "^1.0.0",
        },
    },
    config = function ()
        local telescope = require("telescope")
        telescope.setup({})

        telescope.load_extension("live_grep_args")

        vim.keymap.set("n", "<leader>fw", function() require("telescope").extensions.live_grep_args.live_grep_args() end)
        vim.keymap.set("n", "<leader>ff", "<cmd>Telescope fd<CR>")
        vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
        vim.keymap.set("n", "<leader>fd", "<cmd>Telescope lsp_document_symbols<CR>")
    end
}


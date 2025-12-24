return {
    "akinsho/bufferline.nvim",
    version = "^4.0.0",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("bufferline").setup {
            options = {
                numbers = "ordinal",
                diagnostics = "nvim_lsp",
                offsets = {
                    {
                        filetype = "neo-tree",
                    }
                },
                show_buffer_close_icons = false,
            },
        }

        require("plugins.bufferline.keymaps")
    end,
}


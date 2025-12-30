-- This file returns a list of plugin specifications to lazy.nvim.
-- Each entry describes: what to install, when to load, and how to configure.

local specs = {
    -- {
    --     'projekt0n/github-nvim-theme',
    --     name = 'github-theme',
    --     lazy = false, -- make sure we load this during startup if it is your main colorscheme
    --     priority = 1000, -- make sure to load this before all the other start plugins
    --     config = function()
    --         require('github-theme').setup()
    --
    --         vim.cmd('colorscheme github_light_high_contrast')
    --     end
    -- },
    {
        "navarasu/onedark.nvim",
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require('onedark').setup {
                style = 'light'
            }
            require('onedark').load()
        end
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        -- config runs after neo-tree is loaded
        config = function()
            require("neo-tree").setup({
                filesystem = {
                    follow_current_file = { enabled = true },
                },
                -- sources controls which trees neo-tree is allowed to open.
                -- If document_symbols is not listed here, :Neotree document_symbols can error.
                sources = {
                    "filesystem",        -- normal file explorer
                    "buffers",           -- list of open buffers
                    "git_status",        -- git view
                    "document_symbols",  -- document outline (from LSP symbols)
                },
                window = {
                    mappings = {
                        ["e"] = "expand_all_subnodes",
                        ["E"] = "expand_all_nodes",
                        ["C"] = "close_all_subnodes",
                        ["l"] = "preview",
                    },
                },
            })

            -- Optional: map Ctrl+q to open the filesystem tree (your main explorer).
            vim.keymap.set("n", "<C-q>", "<cmd>Neotree toggle filesystem<CR>", {
                desc = "Toggle Neo-tree filesystem",
            })
        end
    },
    {
        "antosha417/nvim-lsp-file-operations",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-neo-tree/neo-tree.nvim", -- makes sure that this loads after Neo-tree.
        },
        config = function()
            require("lsp-file-operations").setup()
        end,
    },
    {
        -- Status of LSP loading stuff, like indexing and all.
        "j-hui/fidget.nvim",
        opts = {
            -- options
        },
    },
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
    },
    {
        -- Git commands in nvim, like Git blame
        "tpope/vim-fugitive",
    },
    {
        -- github plugin for GBrowse
        "tpope/vim-rhubarb",
        dependencies = {
            "tpope/vim-fugitive"
        }
    },
    {
        -- bitbucket plugin for GBrowse
        "tommcdo/vim-fubitive",
        dependencies = {
            "tpope/vim-fugitive"
        }
    },
    {
        -- Mainly for case switching of words, like crs, cru, etc
        "tpope/vim-abolish",
    },
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
}

local cmp_specs = require("plugins.cmp")
local lsp_specs = require("plugins.lsp")
local bufferline_spec = require("plugins.bufferline")
local telescope_spec = require("plugins.telescope")
local harpoon_spec = require("plugins.harpoon")

vim.list_extend(specs, cmp_specs)
vim.list_extend(specs, lsp_specs)
vim.list_extend(specs, { bufferline_spec })
vim.list_extend(specs, { telescope_spec })
vim.list_extend(specs, { harpoon_spec })

return specs

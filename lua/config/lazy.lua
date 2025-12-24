-- This file bootstraps lazy.nvim (installs it if missing) and then starts it.

-- lazypath is where lazy.nvim will be cloned locally.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- fs_stat checks whether that path already exists.
local uv = vim.uv or vim.loop
if not uv.fs_stat(lazypath) then
    -- If lazy.nvim is missing, clone it from GitHub.
    vim.fn.system({
        "git", "clone",
        "--filter=blob:none", -- avoid downloading file history we don't need
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end

-- Prepend lazy.nvim to runtimepath so require("lazy") works.
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        -- import your plugins
        { import = "plugins" },
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    -- install = { colorscheme = { "habamax" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
})

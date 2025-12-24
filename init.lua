vim.g.mapleader = " "

-- set localleader (used by some plugins for filetype mappings).
vim.g.maplocalleader = " "

-- Load core editor settings
require("core.options")

-- Load core keybindings
require("core.keymaps")

-- Load lazy.nvim (plugin manager bootstrap + runtime).
require("config.lazy")

-- Load plugin specifications (the list of plugins to install/configure).
require("plugins")

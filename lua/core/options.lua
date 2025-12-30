-- Show line numbers.
vim.opt.number = true

-- A tab appears as 4 spaces 
vim.opt.tabstop = 4
-- Doing shift by >> or << shifts 4
vim.opt.shiftwidth = 4
-- tab expands to spaces
vim.opt.expandtab = true

-- A newline
vim.opt.smartindent = true

-- The whole line is highlighted where the cursor is
vim.opt.cursorline = true

-- Just adds space next to line numbers for signs like error or stuff
vim.opt.signcolumn = "yes"

-- Search doesn't ignore case
vim.opt.ignorecase = false

-- Disable mouse in neovim
vim.opt.mouse = ""

-- don't share system and neovim clipboard
vim.opt.clipboard = ""

-- Enable persistent undo by writing undo history to disk.
-- This lets you undo changes even after closing and reopening a file.
vim.opt.undofile = true

-- Choose where undo files are stored.
-- stdpath("state") is a Neovim-managed directory for stateful data.
-- We keep undo files out of your project folders.
local undo_dir = vim.fn.stdpath("state") .. "/undo"

-- Ensure the undo directory exists.
-- "p" means create parent directories as needed (like `mkdir -p`).
--
-- NOTE: looks like it is automatically managed by neovim even if dir doesn't exist
-- but still leaving this line here
-- vim.fn.mkdir(undo_dir, "p")
vim.opt.undodir = undo_dir

-- Extend the 'iskeyword' option to include the '-' character.
-- 'iskeyword' defines which characters are considered part of a word.
-- By default, '-' is treated as a word separator.
-- Adding it means motions like 'w', 'b', 'cw', and 'ciw'
-- will treat hyphenated text (e.g. my-variable-name) as a single word.
vim.opt.iskeyword:append("-")

-- vim.opt.nrformats = { "alpha", "bin", "hex" }


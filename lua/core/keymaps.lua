-- Map Ctrl + Right Arrow to 'w'.
-- Moves forward by one word.
vim.keymap.set({"n", "v"}, "<C-Right>", "w")

-- Map Ctrl + Left Arrow to 'b'.
-- Moves backward by one word.
vim.keymap.set({"n", "v"}, "<C-Left>", "b")

-- Map Ctrl + Up Arrow to move up 7 lines.
-- Equivalent to pressing Up Arrow 7 times.
vim.keymap.set({"n", "v"}, "<C-Up>", "7<Up>")

-- Map Ctrl + Down Arrow to move down 7 lines.
-- Equivalent to pressing Down Arrow 7 times.
vim.keymap.set({"n", "v"}, "<C-Down>", "7<Down>")

-- Extend the 'iskeyword' option to include the '-' character.
-- 'iskeyword' defines which characters are considered part of a word.
-- By default, '-' is treated as a word separator.
-- Adding it means motions like 'w', 'b', 'cw', and 'ciw'
-- will treat hyphenated text (e.g. my-variable-name) as a single word.
vim.opt.iskeyword:append("-")

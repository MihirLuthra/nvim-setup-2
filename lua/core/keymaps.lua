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

-- Copy to system clipboard only when using cp*
local cp_opts = { noremap = true, silent = true }

-- cp  -> copy visual selection
vim.keymap.set("v", "cp", '"+y', cp_opts)

-- cp$ -> copy from cursor to end of line
vim.keymap.set("n", "cp$", '"+y$', cp_opts)

-- cpw -> copy current word
vim.keymap.set("n", "cpw", '"+yiw', cp_opts)

-- cpp -> copy current line
vim.keymap.set("n", "cpp", '"+yy', cp_opts)

-- dp  -> copy visual selection
vim.keymap.set("v", "dp", '"+d', cp_opts)

-- dp$ -> copy from cursor to end of line
vim.keymap.set("n", "dp$", '"+d$', cp_opts)

-- dpw -> copy current word
vim.keymap.set("n", "dpw", '"+diw', cp_opts)

-- dpp -> copy current line
vim.keymap.set("n", "dpp", '"+dd', cp_opts)

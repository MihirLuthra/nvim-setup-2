vim.keymap.set({ "n", "i" }, "<M-a>", "<cmd>BufferLineCyclePrev<CR>")
vim.keymap.set({ "n", "i" }, "<M-s>", "<cmd>BufferLineCycleNext<CR>")

vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>")
vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>")

vim.keymap.set({ "n", "i" }, "<M-1>", function() require("bufferline").go_to_buffer(1, true) end)
vim.keymap.set({ "n", "i" }, "<M-2>", function() require("bufferline").go_to_buffer(2, true) end)
vim.keymap.set({ "n", "i" }, "<M-3>", function() require("bufferline").go_to_buffer(3, true) end)
vim.keymap.set({ "n", "i" }, "<M-4>", function() require("bufferline").go_to_buffer(4, true) end)
vim.keymap.set({ "n", "i" }, "<M-5>", function() require("bufferline").go_to_buffer(5, true) end)
vim.keymap.set({ "n", "i" }, "<M-6>", function() require("bufferline").go_to_buffer(6, true) end)
vim.keymap.set({ "n", "i" }, "<M-7>", function() require("bufferline").go_to_buffer(7, true) end)
vim.keymap.set({ "n", "i" }, "<M-8>", function() require("bufferline").go_to_buffer(8, true) end)
vim.keymap.set({ "n", "i" }, "<M-9>", function() require("bufferline").go_to_buffer(9, true) end)

-- Close current buffer and go to next ordinal buffer (wrap).
local function close_to_next_ordinal()
    -- Current buffer number (the one we will delete)
    local current = vim.api.nvim_get_current_buf()

    -- Get bufferline elements in visual (ordinal) order
    local elements = require("bufferline").get_elements()

    -- Normalize in case bufferline returns { elements = {...} }
    if elements.elements then
        elements = elements.elements
    end

    -- Collect listed buffer numbers in bufferline order
    local buffers = {}
    for _, elem in ipairs(elements) do
        local bufnr = elem.id
        if vim.bo[bufnr].buflisted then
            buffers[#buffers + 1] = bufnr
        end
    end

    -- Find the ordinal index of the current buffer
    local index = 1
    for i, bufnr in ipairs(buffers) do
        if bufnr == current then
            index = i
            break
        end
    end

    -- Compute next ordinal index with wrap-around
    local next_index = (index % #buffers) + 1

    -- Jump to the next ordinal buffer (absolute = true)
    require("bufferline").go_to_buffer(next_index, true)

    -- Delete the original buffer AFTER switching
    vim.cmd("bdelete " .. current)
end

vim.keymap.set("n", "<leader>x", close_to_next_ordinal)

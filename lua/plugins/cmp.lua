-- Plugin specs for completion

return {
  {
    -- nvim-cmp provides the completion popup and selection UI.
    "hrsh7th/nvim-cmp",

    -- Load only when entering Insert mode to keep startup light.
    event = "InsertEnter",

    dependencies = {
      -- This source lets nvim-cmp show completion items from the LSP client.
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },

    config = function()
      -- Require the completion engine.
      local cmp = require("cmp")

      cmp.setup({
        -- sources define where completion suggestions come from.
        -- nvim_lsp means: ask the attached language server (rust-analyzer, etc.).
        sources = {
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        },

        -- mapping defines key behavior when the completion menu is active.
        mapping = cmp.mapping.preset.insert({
          -- Up/Down select items in the completion menu.
          ["<Up>"] = cmp.mapping.select_prev_item(),
          ["<Down>"] = cmp.mapping.select_next_item(),

          -- Ctrl+Space opens the completion menu manually.
          ["<C-Space>"] = cmp.mapping.complete(),

          -- Enter confirms the selection.
          -- select = true means: if nothing is selected, take the first item.
          ["<CR>"] = cmp.mapping.confirm({ select = true }),

          -- Escape closes the completion menu if it is open.
          ["<Esc>"] = cmp.mapping.abort(),
        }),
      })
    end,
  },
}


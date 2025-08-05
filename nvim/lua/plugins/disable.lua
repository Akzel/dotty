return {
  {
    "folke/flash.nvim",
    enabled = false,
  },
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { "gI", false }
      keys[#keys + 1] = { "gi", false }
      keys[#keys + 1] = { "gK", false }
      keys[#keys + 1] = { "gD", false }
      keys[#keys + 1] = { "gy", false }
    end,
  },
}

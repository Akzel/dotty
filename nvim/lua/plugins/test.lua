-- lua/plugins/test.lua
return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'mrcjkb/rustaceanvim', -- Dependency for the adapter
    'williamboman/mason.nvim',
  },
  -- Use config function instead of opts
  config = function()
    -- Define options table here
    local neotest_opts = {
      icons = {
        pass = '✅',
        fail = '❌',
      },
      adapters = {
        -- Require the adapter inside the config function
        require 'rustaceanvim.neotest',
      },
      -- Add other neotest options here if needed
      -- e.g., status = { enabled = true }
    }
    -- Call neotest setup
    require('neotest').setup(neotest_opts)
  end,
}

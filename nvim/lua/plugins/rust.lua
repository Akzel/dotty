-- lua/plugins/rust.lua
return {
  'mrcjkb/rustaceanvim',
  version = '^5', -- Recommended
  ft = { 'rust' }, -- Trigger loading for rust files
  config = function()
    -- Set configuration via vim.g BEFORE the plugin initializes
    -- This structure mirrors how rustaceanvim expects configuration
    vim.g.rustaceanvim = {
      -- Plugin-specific options can go directly here if needed
      -- tools = { ... },
      -- dap = { ... },

      -- Server options (including on_attach) go under the 'server' key
      server = {
        on_attach = function(client, bufnr)
          -- Keymaps specific to rustaceanvim
          vim.keymap.set(
            'n',
            '<leader>a',
            function() vim.cmd.RustLsp 'codeAction' end,
            { silent = true, buffer = bufnr, desc = 'Rust Code Action' }
          )
          vim.keymap.set(
            'n',
            'K', -- Override Neovim's built-in hover keymap
            function() vim.cmd.RustLsp { 'hover', 'actions' } end,
            { silent = true, buffer = bufnr, desc = 'Rust Hover Actions' }
          )

          -- You can add other general LSP keymaps here as well if you
          -- want them specifically within the rustaceanvim on_attach
          -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr, desc = 'LSP Goto Definition' })
        end,

        -- Pass settings specific to rust-analyzer here
        -- settings = {
        --   ['rust-analyzer'] = {
        --     -- Example: Enable clippy on save
        --     -- checkOnSave = { command = "clippy" },
        --   },
        -- },

        -- Ensure capabilities are passed if using nvim-cmp
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
      },
    }

    -- IMPORTANT: We do not call require('rustaceanvim').setup() here.
    -- The plugin automatically sets itself up when loaded for a rust file,
    -- reading the vim.g.rustaceanvim variable.
  end,
}

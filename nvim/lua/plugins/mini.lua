return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()
      require('mini.bracketed').setup()
      require('mini.git').setup()
      require('mini.statusline').setup()
      require('mini.tabline').setup()

      require('mini.files').setup()
      MiniFiles.config.windows.preview = true
      MiniFiles.config.windows.max_number = 3
      MiniFiles.config.windows.width_focus = 30
      MiniFiles.config.windows.width_nofocus = 30
      MiniFiles.config.windows.width_preview = 80
      MiniFiles.config.mappings.go_in_plus = 'l'
      MiniFiles.config.mappings.go_in = 'L'

      local minifiles_toggle = function()
        if not MiniFiles.close() then
          MiniFiles.open(vim.api.nvim_buf_get_name(0))
        end
      end

      vim.keymap.set('n', '<Leader>e', minifiles_toggle, { noremap = true, silent = true})
      -- Shift-H to go to previous buffer (like [b)
      vim.keymap.set('n', 'H', ':bprevious<CR>', { noremap = true, silent = true })

      -- Shift-L to go to next buffer (like ]b)
      vim.keymap.set('n', 'L', ':bnext<CR>', { noremap = true, silent = true })

      local miniclue = require 'mini.clue'
      miniclue.setup {
        triggers = {
          -- Leader triggers
          { mode = 'n', keys = '<Leader>' },
          { mode = 'x', keys = '<Leader>' },

          -- Built-in completion
          { mode = 'i', keys = '<C-x>' },

          -- `g` key
          { mode = 'n', keys = 'g' },
          { mode = 'x', keys = 'g' },

          -- Marks
          { mode = 'n', keys = "'" },
          { mode = 'n', keys = '`' },
          { mode = 'x', keys = "'" },
          { mode = 'x', keys = '`' },

          -- Registers
          { mode = 'n', keys = '"' },
          { mode = 'x', keys = '"' },
          { mode = 'i', keys = '<C-r>' },
          { mode = 'c', keys = '<C-r>' },

          -- Window commands
          { mode = 'n', keys = '<C-w>' },

          -- `z` key
          { mode = 'n', keys = 'z' },
          { mode = 'x', keys = 'z' },
        },

        clues = {
          -- Enhance this by adding descriptions for <Leader> mapping groups
          miniclue.gen_clues.builtin_completion(),
          miniclue.gen_clues.g(),
          miniclue.gen_clues.marks(),
          miniclue.gen_clues.registers(),
          miniclue.gen_clues.windows(),
          miniclue.gen_clues.z(),
        },
        window = {
          delay = 100,
        },
      }
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et

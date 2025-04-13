return {
  {
    'toppair/peek.nvim',
    build = 'deno task --quiet build:fast',
    config = function()
      require('peek').setup()
      vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
      vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
    end,
  },
  {
    'serenevoid/kiwi.nvim',
    keys = {
      { '<leader>ww', ':lua require("kiwi").open_wiki_index()<cr>', desc = 'Open Wiki index' },
      { 'T', ':lua require("kiwi").todo.toggle()<cr>', desc = 'Toggle Markdown Task' },
    },
    lazy = true,
  },
}

return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    opts = {
      ensure_installed = {
        -- Core languages needed
        'bash',
        'c', -- Often needed by other parsers
        'diff',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'query', -- For Treesitter queries
        'vim',
        'vimdoc',
        'json', -- Common config format
        'yaml', -- Common config format

        -- Your target languages
        'rust',
        'ruby',
        'toml',
      },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- Disable regex highlighting for Ruby if it causes issues (already present)
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } }, -- Keep Ruby indent disabled if needed
    },
{ 'nvim-treesitter/nvim-treesitter-textobjects', dependencies = {'nvim-treesitter/nvim-treesitter'} }
  },
}
-- vim: ts=2 sts=2 sw=2 et

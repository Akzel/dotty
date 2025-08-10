local v = vim
local map = v.keymap.set

v.g.mapleader = " "

v.opt.winborder = "bold"
v.opt.tabstop = 2
v.opt.cursorcolumn = false
v.opt.ignorecase = true
v.opt.shiftwidth = 2
v.opt.smartindent = true
v.opt.wrap = false
-- v.opt.number = true
-- v.opt.relativenumber = true
v.opt.swapfile = false
v.opt.termguicolors = true
v.opt.undofile = true
v.opt.incsearch = true
v.opt.signcolumn = "yes"

v.pack.add({
	{ src = "https://github.com/EdenEast/nightfox.nvim" },
	{ src = "https://github.com/j-hui/fidget.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/CopilotC-Nvim/CopilotChat.nvim" },
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
	{ src = "https://github.com/echasnovski/mini.nvim" },
	{ src = "https://github.com/folke/which-key.nvim" },
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	{ src = "https://github.com/m4xshen/hardtime.nvim" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/tpope/vim-speeddating" }, -- increment <C-a> <C-x>
})

require "fidget".setup()
require "CopilotChat".setup()
require "hardtime".setup()
require "mason".setup()
require "fzf-lua".setup({ 'fzf-vim' })

require "mini.icons".setup()
require "mini.snippets".setup()
require "mini.indentscope".setup()
require "mini.completion".setup()
require "mini.files".setup()
require "mini.move".setup()

v.cmd("colorscheme retrobox")
require("fzf-lua").register_ui_select()

map('n', '<leader>f', ":FzfLua<CR>")
map('n', '<leader>e', ":lua MiniFiles.open()<CR>")
map('n', '<leader>bf', v.lsp.buf.format)
map('n', '<leader>bp', "%!prettier --stdin-filepath %<CR>")

map({ 'n' }, '<leader>o', ':update<CR> :source<CR>')
map({ 'n', 'i' }, '<c-s>', '<Esc>:write<CR>')
map({ 'n' }, '<leader>q', ':quit<CR>')

v.api.nvim_create_autocmd('BufEnter', { command = "filetype detect" })

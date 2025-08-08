local v = vim
v.g.mapleader = " "
v.opt.winborder = "bold"
v.opt.tabstop = 2
v.opt.cursorcolumn = false
v.opt.ignorecase = true
v.opt.shiftwidth = 2
v.opt.smartindent = true
v.opt.wrap = false
v.opt.number = true
v.opt.relativenumber = true
v.opt.swapfile = false
v.opt.termguicolors = true
v.opt.undofile = true
v.opt.incsearch = true
v.opt.signcolumn = "yes"

local map = v.keymap.set

map({ 'n' }, '<leader>o', ':update<CR> :source<CR>')
map({ 'n', 'i' }, '<c-s>', '<Esc>:write<CR>')
map({ 'n' }, '<leader>q', ':quit<CR>')
map({ 'n', 'v', 'x' }, '<leader>y', '"+y<CR>')
map({ 'n', 'v', 'x' }, '<leader>d', '"+d<CR>')

v.pack.add({
	{ src = "https://github.com/vague2k/vague.nvim" },
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/echasnovski/mini.surround" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/m4xshen/hardtime.nvim" },
	{ src = "https://github.com/mrcjkb/rustaceanvim" },
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
	-- dial.nvim
	-- flash/leap
	-- fzf-lua
	-- neorg?
	-- rustaceanvim
	-- scnvim --supercollider
})

require "mason".setup()
require "mini.surround".setup()
require "oil".setup()
require "hardtime".setup()

map('n', '<leader>f', ":FzfLua<CR>")
map('n', '<leader>e', ":Oil<CR>")

map('n', '<leader>bf', vim.lsp.buf.format)

v.cmd("colorscheme vague")
-- v.cmd(":hi statusline guibg=NONE")
--
v.api.nvim_create_autocmd('LspAttach', {
	callback = function(e)
		local c = v.lsp.get_client_by_id(e.data.client_id)
		if c:supports_method('textDocument/completion') then
			      vim.lsp.completion.enable(true, client.id, args.buf, {autotrigger = true})
					end
	end,
})

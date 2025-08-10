local v = vim
local map, o = v.keymap.set, v.opt

v.g.mapleader = " "

o.winborder = "bold"
-- o.tabstop = 2
-- o.cursorline = false
-- o.cursorcolumn = false
o.ignorecase = true
o.shiftwidth = 2
o.splitright = true
o.splitbelow = true
o.ruler = true
o.smartindent = true
o.wrap = false
o.splitkeep = 'screen' -- Reduce scroll during window split

o.mouse = 'a'
o.number = true
o.relativenumber = true
o.swapfile = false
o.termguicolors = true
o.undofile = true
o.incsearch = true
o.signcolumn = "yes"

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
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
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
require "mini.files".setup({ windows = { preview = true, max_number = 2, width_preview = 50 } })
require "mini.move".setup()

v.cmd("colorscheme retrobox")
require("fzf-lua").register_ui_select()

map('n', '<leader>f', ":FzfLua<CR>", { desc = 'Fzf' })
map('n', '<leader>b', '', { desc = 'Buffer' })
map('n', '<leader>e', ":lua MiniFiles.open()<CR>", { desc = 'filetreE' })
map('n', '<leader>bf', v.lsp.buf.format, { desc = 'Format' })
map('n', '<leader>bp', "%!prettier --stdin-filepath %<CR>", { desc = 'Prettier' })

map({ 'n' }, '<leader>o', ':update<CR> :source<CR>', { desc = 'sOurce' })
map({ 'n', 'i' }, '<c-s>', '<Esc>:write<CR>', { desc = 'Save' })
map({ 'n' }, '<leader>q', ':quit<CR>', { desc = 'Quit' })

-- Window navigation
map('n', '<C-H>', '<C-w>h', { desc = 'Focus on left window' })
map('n', '<C-J>', '<C-w>j', { desc = 'Focus on below window' })
map('n', '<C-K>', '<C-w>k', { desc = 'Focus on above window' })
map('n', '<C-L>', '<C-w>l', { desc = 'Focus on right window' })

-- Window resize (respecting `v:count`)
map('n', '<C-Left>', '"<Cmd>vertical resize -" . v:count1 . "<CR>"',
	{ expr = true, replace_keycodes = false, desc = 'Decrease window width' })
map('n', '<C-Down>', '"<Cmd>resize -"          . v:count1 . "<CR>"',
	{ expr = true, replace_keycodes = false, desc = 'Decrease window height' })
map('n', '<C-Up>', '"<Cmd>resize +"          . v:count1 . "<CR>"',
	{ expr = true, replace_keycodes = false, desc = 'Increase window height' })
map('n', '<C-Right>', '"<Cmd>vertical resize +" . v:count1 . "<CR>"',
	{ expr = true, replace_keycodes = false, desc = 'Increase window width' })

v.api.nvim_create_autocmd('BufEnter', { command = "filetype detect" })
v.api.nvim_set_hl(0, '@lsp.type.comment', { italic = true })

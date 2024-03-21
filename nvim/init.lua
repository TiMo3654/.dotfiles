local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('junegunn/vim-easy-align')

Plug('preservim/nerdtree')

Plug('itchyny/lightline.vim')
Plug('nvim-lua/plenary.nvim')
Plug('junegunn/fzf.vim')
Plug('nvim-telescope/telescope.nvim')
Plug('rose-pine/neovim')
Plug('akinsho/bufferline.nvim')

vim.call('plug#end')


vim.cmd("colorscheme rose-pine")
vim.wo.number = true


vim.g.mapleader=" "

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

vim.keymap.set('n','<leader>nt',':NERDTree')
vim.g.lightline = {colorscheme = 'rosepine'}

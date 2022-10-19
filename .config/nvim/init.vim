augroup skeleton
    autocmd!
    " add boilerplate to certain filetypes
    autocmd bufnewfile *.php 0r $HOME/.config/nvim/templates/skeleton.php
    autocmd bufnewfile *.php 5j
    autocmd bufnewfile *.sh 0r $HOME/.config/nvim/templates/skeleton.sh
    autocmd bufnewfile *.sh 3j
augroup END

lua << EOF
-- slowly move config here until we can fully migrate to init.lua
local Plug = vim.fn['plug#']

vim.call('plug#begin')
    Plug 'neovim/nvim-lspconfig'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'vim-airline/vim-airline'
    Plug 'ThePrimeagen/vim-be-good'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'tmsvg/pear-tree'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-commentary'
    Plug 'Lokaltog/vim-monotone'
    Plug 'gruvbox-community/gruvbox'
vim.call('plug#end')

vim.g.mapleader = ' '

vim.cmd('colorscheme monotone')

vim.g.airline_theme = 'minimalist'
vim.g.airline_section_z = '%l:%c'
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_altv = 1

vim.opt.autoindent = true
vim.opt.exrc = true
vim.opt.relativenumber = true
vim.opt.number = false
vim.opt.clipboard = 'unnamed'
vim.opt.wrap = false
vim.opt.colorcolumn = '80' -- dont't need this one for work repos
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.swapfile = false
vim.opt.shiftwidth = 4
vim.opt.updatetime = 300
vim.opt.scrolloff = 10

-- NORMAL MODE REMAPS -- 
vim.keymap.set('n', '<leader>rl', ':set relativenumber! <cr>')
vim.keymap.set('n', '<leader>x', ':w<CR> :so %<CR>')
vim.keymap.set('n', '<leader>[', ":call append(line('.')-1, '')<CR>")
vim.keymap.set('n', '<leader>]', ":call append(line('.'), '')<CR>")

-- git-fugitive
vim.keymap.set('n', '<leader>gd', '<cmd>Git diff<cr>')
vim.keymap.set('n', '<leader>gb', '<cmd>Git blame<cr>')
vim.keymap.set('n', '<leader>gp', '<cmd>Git push<cr>')
vim.keymap.set('n', '<leader>gs', ':G<cr>')

-- telescope
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>gg', '<cmd>Telescope git_branches<cr>')
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')

-- VISUAL MODE REMAPS -- 
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

require'future'
require'lsp'
EOF


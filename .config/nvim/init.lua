local Plug = vim.fn['plug#']

vim.call('plug#begin')
    -- my plugins
    Plug '~/plugins/case_manager.nvim'
    Plug '$HOME/plugins/snake.nvim'
    -- third party
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'L3MON4D3/LuaSnip'
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'vim-airline/vim-airline'
    Plug 'ThePrimeagen/vim-be-good'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'tmsvg/pear-tree'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-commentary'
    Plug 'airblade/vim-gitgutter'
    Plug 'Lokaltog/vim-monotone'
    -- Plug 'arcticicestudio/nord-vim'
    Plug 'theoboldalex/nord-night-vim'
    Plug 'mattn/vim-goimports'
    Plug 'gruvbox-community/gruvbox'
vim.call('plug#end')

vim.g.mapleader = ' '

vim.cmd('colorscheme nord')
vim.cmd('hi Normal guibg=NONE ctermbg=NONE')

vim.g.airline_theme = 'nord'
vim.g.airline_section_z = '%l:%c'
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_altv = 1
vim.g.goimports = 1

vim.opt.termguicolors = false
vim.opt.autoindent = true
vim.opt.exrc = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.clipboard = 'unnamed'
vim.opt.wrap = false
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.swapfile = false
vim.opt.shiftwidth = 4
vim.opt.updatetime = 300
vim.opt.scrolloff = 10

-- NORMAL MODE REMAPS -- 
vim.keymap.set('n', '<leader>1', ':E<cr>')
vim.keymap.set('n', '<leader>rl', ':set relativenumber! <cr>')
vim.keymap.set('n', '<leader>x', ':w<CR> :so %<CR>')
vim.keymap.set('n', '<leader>[', ":call append(line('.')-1, '')<CR>")
vim.keymap.set('n', '<leader>]', ":call append(line('.'), '')<CR>")
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<leader>h', '<cmd>nohlsearch<cr>')

-- git-fugitive
vim.keymap.set('n', '<leader>gd', '<cmd>Git diff<cr>')
vim.keymap.set('n', '<leader>gb', '<cmd>Git blame<cr>')
vim.keymap.set('n', '<leader>gp', '<cmd>Git push<cr>')
vim.keymap.set('n', '<leader>gs', ':G<cr>')

-- telescope
vim.keymap.set('n', '<C-p>', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>gg', '<cmd>Telescope git_branches<cr>')
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')

-- VISUAL MODE REMAPS -- 
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- JSON to PHP Associative array - visual select region first
vim.keymap.set('c', '<leader>php', "s/{\\|}\\|\":/\\={'{':'[', '}':']', '\":':'\" =>'}[submatch(0)]/g<cr>")

require'telescope_setup'
require'lsp'
require'skeleton'

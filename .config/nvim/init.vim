call plug#begin()
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'gruvbox-community/gruvbox'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'vim-airline/vim-airline'
    Plug 'ThePrimeagen/vim-be-good'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'tmsvg/pear-tree'
    Plug 'tpope/vim-fugitive'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

let g:coc_global_extensions = [
    \'coc-lua',
    \'coc-json', 
    \'coc-git', 
    \'coc-phpls', 
    \'coc-sql', 
    \'coc-yaml',
    \'coc-eslint',
    \'coc-tsserver',
    \'coc-python',
    \'coc-go',
    \'coc-snippets'
\]

set autoindent
set exrc
set relativenumber
set number
set clipboard=unnamed
set nowrap
set colorcolumn=80
set hidden
set mouse=a
set expandtab
set ignorecase
set noswapfile
set shiftwidth=4
set background=dark
set updatetime=300
set scrolloff=10

let g:airline_theme = "gruvbox"
let g:airline_section_z = "%l:%c"

let g:coc_snippet_next = '<tab>'

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_altv = 1

colorscheme gruvbox

let mapleader=" "

nnoremap <leader>x :w<CR> :so %<CR>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>gg <cmd>Telescope git_branches<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <leader>gd <cmd>Git diff<cr>
nnoremap <leader>gb <cmd>Git blame<cr>
nnoremap <leader>gp <cmd>Git push<cr>
nnoremap <leader>gs :G<CR>

nnoremap <leader>rl :set relativenumber! <CR>
nnoremap <leader>st :let &bg=(&bg=='light'?'dark':'light')<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

map <leader>[ :call append(line('.')-1, '')<CR>
map <leader>] :call append(line('.'), '')<CR>
map <leader>ft <C-w>v :E<CR> :vertical resize 30<CR>

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ?
      \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

augroup skeleton
    autocmd!
    " add boilerplate to certain filetypes
    autocmd bufnewfile *.php 0r $HOME/.config/nvim/templates/skeleton.php
    autocmd bufnewfile *.sh 0r $HOME/.config/nvim/templates/skeleton.sh
augroup END

lua << EOF
require"future"
EOF

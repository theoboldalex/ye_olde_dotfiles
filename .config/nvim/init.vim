call plug#begin()
    Plug 'Mofiqul/vscode.nvim'
    Plug 'morhetz/gruvbox'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ThePrimeagen/vim-be-good'
    Plug 'vim-airline/vim-airline'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'tmsvg/pear-tree'
    Plug 'tpope/vim-fugitive'
call plug#end()

let g:coc_global_extensions = [
    \'coc-json', 
    \'coc-git', 
    \'coc-phpls', 
    \'coc-sql', 
    \'coc-yaml',
    \'coc-eslint',
    \'coc-tsserver',
    \'coc-python'
\]

set relativenumber
set colorcolumn=80
set hidden
set number
set mouse=a
set expandtab
set ignorecase
set noswapfile
set shiftwidth=4
set background=dark

let g:airline_theme = "gruvbox"
let g:coc_snippet_next = '<tab>'
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_altv = 1

colorscheme gruvbox

let mapleader=" "

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>

nnoremap <leader>gd <cmd>Git diff<cr>
nnoremap <leader>gb <cmd>Git blame<cr>
nmap <leader>gs :G<CR>

noremap <leader>rl :set relativenumber! <CR>
nnoremap <leader>st :let &bg=(&bg=='light'?'dark':'light')<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)

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

lua << EOF
require('telescope')
    .setup {
        defaults = {
            file_ignore_patterns = {
                "node%_modules/.*", 
                "vendor",
                ".git",
                ".idea",
            } 
        },
        pickers = {
            find_files = {
                theme = "dropdown",
                previewer = false,
                hidden = true,
                no_ignore = true,
            },
            buffers = {
                theme = "dropdown",
                previewer = false,
            },
            live_grep = {
                theme = "dropdown",
                hidden = true,
                no_ignore = true
            }
        }   
    }
EOF

call plug#begin()
    Plug 'Mofiqul/vscode.nvim'
    Plug 'Lokaltog/vim-monotone'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ThePrimeagen/vim-be-good'
    Plug 'vim-airline/vim-airline'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'tmsvg/pear-tree'
    Plug 'tpope/vim-fugitive'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

let g:coc_global_extensions = [
    \'coc-json', 
    \'coc-git', 
    \'coc-phpls', 
    \'coc-sql', 
    \'coc-yaml',
    \'coc-eslint',
    \'coc-go',
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
set termguicolors

let g:vscode_style = "dark"
let g:airline_theme = "minimalist"
let g:monotone_contrast_factor = 0.9
let g:coc_snippet_next = '<tab>'

colorscheme vscode

let mapleader=" "
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_altv = 1

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>

nnoremap <leader>gd <cmd>Git diff<cr>
nnoremap <leader>gb <cmd>Git blame<cr>
nmap <leader>gs :G<CR>

noremap <leader>rl :set relativenumber! <CR>

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

" golang config

nnoremap <leader>gt <cmd>GoTest<cr>
nnoremap <leader>gf <cmd>GoTestFunc<cr>

" disable all linters as that is taken care of by coc.nvim
let g:go_diagnostics_enabled = 0
let g:go_metalinter_enabled = []

" don't jump to errors after metalinter is invoked
let g:go_jump_to_error = 0

" run go imports on file save
let g:go_fmt_command = "goimports"

" automatically highlight variable your cursor is on
let g:go_auto_sameids = 0

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

"TODO - Break out lua config to seperate file
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
            }
        }   
    }
EOF
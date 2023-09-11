vim.g.mapleader = " "
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_altv = 1
vim.g.goimports = 1
vim.g.nord_italic = false

vim.opt.termguicolors = true
vim.opt.guicursor = ""
vim.opt.swapfile = false
vim.opt.exrc = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.clipboard = 'unnamed'
vim.opt.ignorecase = true
vim.opt.wrap = false
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.updatetime = 100
vim.opt.scrolloff = 10
vim.opt.signcolumn = "no"
vim.opt.hlsearch = false

-- adds current git branch to status line
vim.opt.statusline="%<%f %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%) %P"

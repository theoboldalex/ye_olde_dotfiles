-- NORMAL MODE REMAPS -- 
vim.keymap.set("n", "<leader>1", ":E<cr>")
vim.keymap.set("n", "<leader>rl", ":set relativenumber! <cr>")
vim.keymap.set("n", "<leader>x", ":w<CR> :so %<CR>")
vim.keymap.set("n", "<leader>[", ":call append(line('.')-1, '')<CR>")
vim.keymap.set("n", "<leader>]", ":call append(line('.'), '')<CR>")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<leader>h", "<cmd>nohlsearch<cr>")

-- vim-fugitive
vim.keymap.set("n", "<leader>gd", "<cmd>Git diff<cr>")
vim.keymap.set("n", "<leader>gb", "<cmd>Git blame<cr>")
vim.keymap.set("n", "<leader>gp", "<cmd>Git push<cr>")
vim.keymap.set("n", "<leader>gc", ":Git checkout ")
vim.keymap.set("n", "<leader>gs", ":G<cr>")

-- telescope
vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>gg", "<cmd>Telescope git_branches<cr>")
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

-- VISUAL MODE REMAPS -- 
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- JSON to PHP Associative array - visual select region first
vim.keymap.set("c", "<leader>php", "s/{\\|}\\|\":/\\={'{':'[', '}':']', '\":':'\" =>'}[submatch(0)]/g<cr>")

-- Some common stuff
vim.keymap.set("n", "<leader>r", "<cmd>!php %<cr>")
vim.keymap.set("n", "<leader>mx", "<cmd>!chmod +x %<cr>")
vim.keymap.set("n", "<leader>cm", "<cmd>CaseManager<cr>")
vim.keymap.set("n", "<leader>jq", "<cmd>%!jq '.'<cr><cmd>w<cr>")

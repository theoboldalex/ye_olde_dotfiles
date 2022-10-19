-- Nvim built in LSP config

require'lspconfig'.intelephense.setup {
    on_attach = function()
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer = 0})
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {buffer = 0})
        vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, {buffer = 0})
        vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, {buffer = 0})
        vim.keymap.set('n', '<leader>df', ':Telescope diagnostics<cr>', {buffer = 0})
    end
}


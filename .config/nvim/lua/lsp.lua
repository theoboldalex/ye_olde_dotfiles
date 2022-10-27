-- Nvim built in LSP config

local capabilities = require('cmp_nvim_lsp').default_capabilities()
vim.opt.completeopt={'menu', 'menuone', 'noselect'}

-- LSP highlight groups
vim.cmd('hi DiagnosticError guifg=#ff4444')
vim.cmd('hi DiagnosticWarn guifg=#dd9922')
vim.cmd('hi DiagnosticInfo guifg=#3399ff')
vim.cmd('hi DiagnosticHint guifg=#3399ff')

require'lspconfig'.intelephense.setup {
    capabilities = capabilities,
    on_attach = function()
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer = 0})
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {buffer = 0})
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, {buffer = 0})
        vim.keymap.set('n', '<leader>dj', vim.diagnostic.goto_next, {buffer = 0})
        vim.keymap.set('n', '<leader>dk', vim.diagnostic.goto_prev, {buffer = 0})
        vim.keymap.set('n', '<leader>df', '<cmd>Telescope diagnostics<cr>', {buffer = 0})
    end
}

require'lspconfig'.sumneko_lua.setup {
    capabilities = capabilities,
    on_attach = function()
        -- DRY this up
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer = 0})
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {buffer = 0})
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, {buffer = 0})
        vim.keymap.set('n', '<leader>dj', vim.diagnostic.goto_next, {buffer = 0})
        vim.keymap.set('n', '<leader>dk', vim.diagnostic.goto_prev, {buffer = 0})
        vim.keymap.set('n', '<leader>df', '<cmd>Telescope diagnostics<cr>', {buffer = 0})
    end,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}

local cmp = require'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
    })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = 'buffer' },
    })
})


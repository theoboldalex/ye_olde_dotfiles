-- Nvim built in LSP config

local nvim_lsp = require'lspconfig'
local capabilities = require('cmp_nvim_lsp').default_capabilities()
vim.opt.completeopt={'menu', 'menuone', 'noselect'}

-- LSP highlight groups
vim.cmd('hi DiagnosticError guifg=#ff4444')
vim.cmd('hi DiagnosticWarn guifg=#dd9922')
vim.cmd('hi DiagnosticInfo guifg=#3399ff')
vim.cmd('hi DiagnosticHint guifg=#3399ff')

local get_intelephense_license = function ()
    local f = assert(io.open(os.getenv("HOME") .. "/intelephense/license.txt", "rb"))
    local content = f:read("*a")
    f:close()
    return string.gsub(content, "%s+", "")
end

local on_attach = function()
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer = 0})
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {buffer = 0})
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, {buffer = 0})
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {buffer = 0})
    vim.keymap.set('n', '<leader>dj', vim.diagnostic.goto_next, {buffer = 0})
    vim.keymap.set('n', '<leader>dk', vim.diagnostic.goto_prev, {buffer = 0})
    vim.keymap.set('n', '<leader>df', '<cmd>Telescope diagnostics<cr>', {buffer = 0})
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {buffer = 0})
    vim.keymap.set('n', '<C-h>', vim.lsp.buf.signature_help, {buffer = 0})
    vim.keymap.set('n', '<leader>do', '<cmd>lua vim.diagnostic.open_float()<CR>')
    vim.keymap.set('n', '<leader>dp', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
    vim.keymap.set('n', '<leader>dn', '<cmd>lua vim.diagnostic.goto_next()<CR>')
end

nvim_lsp.intelephense.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    init_options = {
        licenceKey = get_intelephense_license()
    }
}

nvim_lsp.sumneko_lua.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}

nvim_lsp.tsserver.setup {
    capabilities = capabilities,
    on_attach = on_attach
}

nvim_lsp.pyright.setup {
    capabilities = capabilities,
    on_attach = on_attach
}

nvim_lsp.rust_analyzer.setup({
    on_attach = on_attach,
    settings = {
        ["rust-analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true
            },
        }
    }
})

nvim_lsp.gopls.setup {
    capabilities = capabilities,
    on_attach = on_attach
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



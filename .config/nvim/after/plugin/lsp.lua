local lsp = require("lsp-zero").preset("recommended")

local get_intelephense_license = function ()
    local f = assert(io.open(os.getenv("HOME") .. "/intelephense/license.txt", "rb"))
    local content = f:read("*a")
    f:close()
    return string.gsub(content, "%s+", "")
end

local on_attach = function ()
    local opts = {buffer = 0}
    vim.diagnostic.config({
        virtual_text = true,
    })

    vim.keymap.set("n", "<leader>df", "<cmd>Telescope diagnostics<cr>", opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
end

lsp.ensure_installed({
  "intelephense",
  "pyright",
  "lua_ls",
  "tsserver",
  "gopls"
})

lsp.nvim_workspace()

lsp.configure("lua_ls", {
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }
            }
        }
    }
})

lsp.configure("intelephense", {
    on_attach = on_attach,
    init_options = {
        licenceKey = get_intelephense_license()
    }
})

lsp.configure("pyright", {
    on_attach = on_attach
})

lsp.configure("tsserver", {
    on_attach = on_attach
})

lsp.configure("gopls", {
    on_attach = on_attach
})

lsp.setup()

-- cmp config
local cmp = require("cmp")

cmp.setup({
    sources = {
        {name = "nvim_lsp"},
        {name = "nvim_lua"},
        {name = "luasnip"},
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = {
        ["<CR>"] = cmp.mapping.confirm({select = true}),
    }
})


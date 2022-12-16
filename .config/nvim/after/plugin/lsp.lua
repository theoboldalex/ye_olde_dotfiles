local lsp = require("lsp-zero")
lsp.preset("recommended")

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

    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>df", "<cmd>Telescope diagnostics<cr>", opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<C-h>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<leader>do", "<cmd>lua vim.diagnostic.open_float()<CR>")
    vim.keymap.set("n", "<leader>dp", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
    vim.keymap.set("n", "<leader>dn", "<cmd>lua vim.diagnostic.goto_next()<CR>")
end

lsp.ensure_installed({
  "tsserver",
  "sumneko_lua",
  "intelephense",
  "pyright"
})

lsp.configure("sumneko_lua", {
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
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

lsp.setup()

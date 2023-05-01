vim.api.nvim_create_autocmd({"BufWritePre"}, {
    pattern = {"*.go"},
    callback = function ()
        vim.lsp.buf.formatting_sync()
    end
})

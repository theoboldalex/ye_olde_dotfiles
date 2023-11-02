require('nvim-treesitter.configs').setup({
    ensure_installed = { "c", "lua", "php", "python", "javascript" },
    highlight = {
        enable = true,
        disable = { "php", "javascript" },
        additional_vim_regex_highlighting = false -- set to true to step around PHP jank
    }
})

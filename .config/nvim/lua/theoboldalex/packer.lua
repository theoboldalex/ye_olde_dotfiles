vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"
    -- use "nvim-lualine/lualine.nvim"
    use "nvim-treesitter/nvim-treesitter"
    use {
        "nvim-telescope/telescope.nvim", tag = "0.1.1",
        requires = { {"nvim-lua/plenary.nvim"} }
    }
    use "nvim-tree/nvim-web-devicons"

    -- colorschemes
    use "shaunsingh/nord.nvim"

    -- VCS
    use("tpope/vim-fugitive")
    use("airblade/vim-gitgutter")

    -- QoL
    use("tpope/vim-commentary")
    use("ThePrimeagen/harpoon")

    -- LSP-ZERO
    use {
        "VonHeikemen/lsp-zero.nvim",
        requires = {
            -- LSP Support
            {"neovim/nvim-lspconfig"},
            {"williamboman/mason.nvim"},
            {"williamboman/mason-lspconfig.nvim"},

            -- Autocompletion
            {"hrsh7th/nvim-cmp"},
            {"hrsh7th/cmp-buffer"},
            {"hrsh7th/cmp-path"},
            {"saadparwaiz1/cmp_luasnip"},
            {"hrsh7th/cmp-nvim-lsp"},
            {"hrsh7th/cmp-nvim-lua"},

            -- Snippets
            {"L3MON4D3/LuaSnip"},
            {"rafamadriz/friendly-snippets"},
        }
    }

    -- HOME ROLLED
    use("theoboldalex/case_manager.nvim")
end)

return {
    { "lewis6991/impatient.nvim" },
    { "wbthomason/packer.nvim" },

    { "williamboman/mason.nvim",
        config = function() require("mason").setup() end
    },
    { "jose-elias-alvarez/null-ls.nvim", },
    {
        "neovim/nvim-lspconfig",
        config = require("lsp"),
        requires = {
            { "hrsh7th/cmp-nvim-lsp" },
        }
    },

    {
        "nvim-telescope/telescope.nvim",
        requires = {
            { "nvim-lua/plenary.nvim" },
            { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
        },
        config = function()
            require("tele_scope").setup()
        end,
        cmd = { "Telescope" },
    },

    { "Mofiqul/vscode.nvim",
        config = function()
            require('vscode').setup({ italic_comments = true })
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("lualine").setup { options = { theme = "vscode" } }
        end

    },
    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        config = require("treesitter"),
    },
    {
        "terrortylor/nvim-comment",
        config = function()
            require("nvim_comment").setup {
                comment_empty = false,
            }
        end,
        event = "BufReadPost",
    },

    -- NvimTree
    { "kyazdani42/nvim-web-devicons" },
    {
        "kyazdani42/nvim-tree.lua",
        config = function() require("nvim-tree").setup {} end,
        cmd = { "NvimTreeOpen", "NvimTreeToggle" },
    },
    {
        "romgrk/barbar.nvim",
        event = "BufReadPost",
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function() require("indent_blankline").setup {} end,
        event = "BufReadPost",
    },

    -- cmp
    { "rafamadriz/friendly-snippets" },
    {
        "L3MON4D3/LuaSnip",
        config = require("lua_snip"),
    },

    {
        "hrsh7th/nvim-cmp",
        config = require("nvimcmp"),
    },
    { "hrsh7th/cmp-buffer" },
    { "saadparwaiz1/cmp_luasnip" },

    -- autopairs
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup({})
        end,
    },
    {
        "akinsho/toggleterm.nvim",
        config = function() require("toggleterm").setup { open_mapping = [[<c-t>]] } end
    },
}

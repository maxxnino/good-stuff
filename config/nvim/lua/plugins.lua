return {
    { "lewis6991/impatient.nvim" },
    { "wbthomason/packer.nvim" },

    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            { 'williamboman/mason.nvim' }, -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' }, -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'hrsh7th/cmp-buffer' }, -- Optional
            { 'hrsh7th/cmp-path' }, -- Optional
            -- {'saadparwaiz1/cmp_luasnip'}, -- Optional
            -- {'hrsh7th/cmp-nvim-lua'},     -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' }, -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        },
        config = function()
            -- Learn the keybindings, see :help lsp-zero-keybindings
            -- Learn to configure LSP servers, see :help lsp-zero-api-showcase
            local lsp = require('lsp-zero')
            lsp.preset('recommended')

            -- -- When you don't have mason.nvim installed
            -- -- You'll need to list the servers installed in your system
            -- lsp.setup_servers({'tsserver', 'eslint'})

            -- -- (Optional) Configure lua language server for neovim
            -- lsp.nvim_workspace()

            lsp.setup()
        end
    },
    { "jose-elias-alvarez/null-ls.nvim", },
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

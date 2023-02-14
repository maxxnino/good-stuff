return {
    { "Mofiqul/vscode.nvim",
        config = function()
            require('vscode').setup({ italic_comments = true })
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        config = function()
            require("lualine").setup { options = { theme = "vscode" } }
        end
    },
    { "kyazdani42/nvim-web-devicons" },
    {
        "kyazdani42/nvim-tree.lua",
        config = function() require("nvim-tree").setup {} end,
        cmd = { "NvimTreeOpen", "NvimTreeToggle" },
    },
    {
        "romgrk/barbar.nvim",
        event = "VeryLazy",
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPost", "BufNewFile" },
        config = function() require("indent_blankline").setup {} end,
        event = "BufReadPost",
    },
}

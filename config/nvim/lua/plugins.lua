return {
	{ "lewis6991/impatient.nvim" },
	{ "wbthomason/packer.nvim" },
	{ "neovim/nvim-lspconfig" },
	-- { "jose-elias-alvarez/null-ls.nvim" },
	{ "williamboman/nvim-lsp-installer" },

	{
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				run = "make",
			},
		},
		config = function()
			require("tele_scope").setup()
		end,
		cmd = { "Telescope" },
	},
	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		config = require("treesitter"),
		-- run = ":TSUpdate",
	},
	{
		"terrortylor/nvim-comment",
        config = function()
            require('nvim_comment').setup({
                comment_empty = false,
            })
        end,
		event = "BufReadPost",
	},

	-- NvimTree
	{ "kyazdani42/nvim-web-devicons" },
	{
		"kyazdani42/nvim-tree.lua",
		config = require("nvimtree"),
		cmd = { "NvimTreeOpen", "NvimTreeToggle" },
	},
	{
		"romgrk/barbar.nvim",
		event = "BufWinEnter",
	},

    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("lualine").setup({
                options = {theme = 'horizon'},
                extensions = {'nvim-tree'}
            })
        end,
    },

	-- cmp
	{
		"hrsh7th/nvim-cmp",
		config = require("nvimcmp"),
	},
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-nvim-lsp" },

	-- autopairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},

	{
		"nathom/filetype.nvim",
		config = function()
			require("filetype").setup({
				overrides = {
					literal = {
						[".gitignore"] = "conf",
					},
				},
			})
		end,
	},
    {
        "ThePrimeagen/harpoon",
        event = "BufReadPost",
    },
}

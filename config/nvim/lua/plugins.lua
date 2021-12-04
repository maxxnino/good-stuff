return {
	{ "lewis6991/impatient.nvim" },
	{ "wbthomason/packer.nvim" },
	{ "neovim/nvim-lspconfig" },
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = require("null_ls"),
		event = "BufReadPost",
	},
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
	{
		"LunarVim/Colorschemes",
	},
	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		config = require("treesitter"),
	},
	{
		"terrortylor/nvim-comment",
		config = function()
			require("nvim_comment").setup({
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
		event = "BufReadPost",
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		config = require("indent"),
		event = "BufReadPost",
	},
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({
				options = { theme = "ayu_mirage", disabled_filetypes = { "gitcommit" } },
				extensions = { "nvim-tree" },
			})
		end,
	},

	-- cmp
	{
		"hrsh7th/nvim-cmp",
		after = "cmp-nvim-lsp",
		config = function()
			require("nvimcmp")()
			require("lsp")()
		end,
	},
	{
		"hrsh7th/cmp-buffer",
		after = "nvim-cmp",
	},
	{
		"hrsh7th/cmp-nvim-lsp",
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
		"nathom/filetype.nvim",
		config = require("file_type"),
	},
	{
		"ThePrimeagen/harpoon",
		event = "BufReadPost",
	},
}

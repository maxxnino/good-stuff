return {
	{ "lewis6991/impatient.nvim" },
	{ "wbthomason/packer.nvim" },

	{ "williamboman/nvim-lsp-installer" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{
		"neovim/nvim-lspconfig",
		event = "BufRead",
		config = require("lsp"),
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = require("null_ls"),
		event = "BufReadPost",
	},

	{
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				run = "zig cc src/fzf.c -O3 -Wall -Werror -fpic -shared src/fzf.c -o build/libfzf.dll",
			},
			{
				"AckslD/nvim-neoclip.lua",
				config = require("neo_clip"),
			},
			{
				"nvim-telescope/telescope-project.nvim",
			},
		},
		config = function()
			require("tele_scope").setup()
		end,
		cmd = { "Telescope" },
	},
	{ "LunarVim/Colorschemes" },
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
		config = require("lua_line"),
	},

	-- cmp
	{
		"L3MON4D3/LuaSnip",
		config = require("lua_snip"),
	},

	{
		"hrsh7th/nvim-cmp",
		after = "nvim-lspconfig",
		config = require("nvimcmp"),
	},
	{
		"hrsh7th/cmp-buffer",
		after = "nvim-cmp",
	},
	{
		"saadparwaiz1/cmp_luasnip",
		after = "nvim-cmp",
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
		"akinsho/toggleterm.nvim",
		config = require("terminal"),
	},
	{
		"ellisonleao/glow.nvim",
		cmd = "Glow",
	},
}

return {
	{ "lewis6991/impatient.nvim" },
	{ "wbthomason/packer.nvim" },
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPost",
		requires = {
			{ "williamboman/nvim-lsp-installer" },
			{ "hrsh7th/cmp-nvim-lsp" },
		},
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
		after = "nvim-lspconfig",
		config = function()
			require("nvimcmp")()
			require("lsp")()
		end,
	},
	{
		"hrsh7th/cmp-buffer",
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
		"AckslD/nvim-neoclip.lua",
		event = "BufReadPost",
		config = require("neo_clip"),
	},
	{
		"nvim-telescope/telescope-project.nvim",
		opt = true,
	},
	-- {
	-- 	"ThePrimeagen/harpoon",
	-- 	event = "BufReadPost",
	-- },
}

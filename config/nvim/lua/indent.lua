return function()
	require("indent_blankline").setup({
		bufname_exclude = { "README.md" },
		buftype_exclude = { "terminal", "nofile" },
		filetype_exclude = {
			"alpha",
			"gitcommit",
			"vimwiki",
			"markdown",
			"json",
			"txt",
			"NvimTree",
			"git",
			"TelescopePrompt",
			"help",
			"startify",
			"dashboard",
			"packer",
			"neogitstatus",
			"NvimTree",
			"lspinfo",
			"", -- for all buffers without a file type
		},
		-- char_list = { "", "┊", "┆", "¦", "|", "¦", "┆", "┊", "" },
		-- show_trailing_blankline_indent = false,
		space_char_blankline = " ",
	})
	vim.wo.colorcolumn = "99999"
end

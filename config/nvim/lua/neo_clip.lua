return function()
	require("neoclip").setup({
        default_register = '+',
		keys = {
			i = {
				select = "<cr>",
				paste = "<c-j>",
				paste_behind = "<c-k>",
				custom = {},
			},
			n = {
				select = "<cr>",
				paste = "p",
				paste_behind = "P",
				custom = {},
			},
		},
	})
    require('telescope').load_extension('neoclip')
end

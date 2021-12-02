return function()
	require("filetype").setup({
		overrides = {
			extensions = {
				vert = "glsl",
				frag = "glsl",
			},
			literal = {
				[".gitignore"] = "conf",
				["zig.mod"] = "yaml",
			},
		},
	})
end

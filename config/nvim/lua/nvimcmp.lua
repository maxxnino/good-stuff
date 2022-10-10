return function()
	local cmp = require("cmp")
	UXI.cmp = {
		completion = {
			---@usage The minimum length of a word to complete on.
			keyword_length = 0,
		},
		experimental = {
			ghost_text = true,
		},
		view = {
			entries = "native", -- can be "custom", "wildmenu" or "native"
		},
		formatting = {
			fields = { "kind", "abbr", "menu" },
			kind_icons = {
				Class = " ",
				Color = " ",
				Constant = "ﲀ ",
				Constructor = " ",
				Enum = "練",
				EnumMember = " ",
				Event = " ",
				Field = " ",
				File = "",
				Folder = " ",
				Function = " ",
				Interface = "ﰮ ",
				Keyword = " ",
				Method = " ",
				Module = " ",
				Operator = "",
				Property = " ",
				Reference = " ",
				Snippet = " ",
				Struct = " ",
				Text = " ",
				TypeParameter = " ",
				Unit = "塞",
				Value = " ",
				Variable = " ",
			},
			source_names = {
				nvim_lsp = "(LSP)",
				emoji = "(Emoji)",
				path = "(Path)",
				calc = "(Calc)",
				cmp_tabnine = "(Tabnine)",
				vsnip = "(Snippet)",
				luasnip = "(Snippet)",
				buffer = "(Buffer)",
			},
			duplicates = {
				buffer = 1,
				path = 1,
				nvim_lsp = 0,
				luasnip = 1,
			},
			duplicates_default = 0,
			format = function(entry, vim_item)
				vim_item.kind = UXI.cmp.formatting.kind_icons[vim_item.kind]
				vim_item.menu = UXI.cmp.formatting.source_names[entry.source.name]
				vim_item.dup = UXI.cmp.formatting.duplicates[entry.source.name] or UXI.cmp.formatting.duplicates_default
				return vim_item
			end,
		},
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},
		sources = {
			{ name = "nvim_lsp" },
			{ name = "buffer", max_item_count = 3 },
			{ name = "path", max_item_count = 3 },
			{ name = "luasnip", max_item_count = 3 },
			{ name = "nvim_lua" },
			{ name = "calc" },
			{ name = "emoji" },
			{ name = "treesitter" },
		},
		mapping = {
			["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
			["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
			["<C-y>"] = cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Insert,
				select = true,
			}), -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
			["<C-e>"] = cmp.mapping({
				i = cmp.mapping.abort(),
				c = cmp.mapping.close(),
			}),
			-- ["<CR>"] = cmp.mapping.confirm({ select = true }),
		},
	}
	cmp.setup(UXI.cmp)
end

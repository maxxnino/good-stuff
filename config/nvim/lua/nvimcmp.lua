return function()
	local cmp = require("cmp")
	-- local luasnip = require("luasnip")
	UXI.cmp = {
		confirm_opts = {
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		},
		completion = {
			---@usage The minimum length of a word to complete on.
			keyword_length = 1,
		},
		experimental = {
			ghost_text = true,
			native_menu = false,
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
				-- luasnip = "(Snippet)",
				buffer = "(Buffer)",
			},
			duplicates = {
				buffer = 1,
				path = 1,
				nvim_lsp = 0,
				-- luasnip = 1,
			},
			duplicates_default = 0,
			format = function(entry, vim_item)
				vim_item.kind = UXI.cmp.formatting.kind_icons[vim_item.kind]
				vim_item.menu = UXI.cmp.formatting.source_names[entry.source.name]
				vim_item.dup = UXI.cmp.formatting.duplicates[entry.source.name] or UXI.cmp.formatting.duplicates_default
				return vim_item
			end,
		},
		-- snippet = {
		-- 	expand = function(args)
		-- 		luasnip.lsp_expand(args.body)
		-- 	end,
		-- },
		documentation = {
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		},
		sources = {
			{ name = "nvim_lsp" },
			{ name = "path" },
			{ name = "luasnip" },
			{ name = "cmp_tabnine" },
			{ name = "nvim_lua" },
			{ name = "buffer", keyword_length = 4 },
			{ name = "calc" },
			{ name = "emoji" },
			{ name = "treesitter" },
		},
		mapping = {
			["<C-d>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-e>"] = cmp.mapping.abort(),
		},
	}
	-- require("luasnip/loaders/from_vscode").lazy_load()
	require("cmp").setup(UXI.cmp)
end

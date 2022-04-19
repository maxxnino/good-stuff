return function()
	local ls = require("luasnip")
	-- local types = require("luasnip.util.types")
	--
	ls.config.set_config({
		history = true,
		updateevents = "TextChanged, TextChangedI",
		enable_autosnippets = true,
	})

	-- keymap
	local opts = { silent = true }
	vim.keymap.set({ "i", "s" }, "<C-k>", function()
		if ls.expand_or_jumpable() then
			ls.expand_or_jump()
		end
	end, opts)

	vim.keymap.set({ "i", "s" }, "<C-j>", function()
		if ls.jumpable(-1) then
			ls.jump(-1)
		end
	end, opts)

	vim.keymap.set({ "i" }, "<C-l>", function()
		if ls.choice_active() then
			ls.change_choice()
		end
	end, opts)

	-- custom snippet
	local s = ls.s
	local sn = ls.snippet_node
	local t = ls.text_node
	local c = ls.choice_node
	local i = ls.insert_node
	local fmta = require("luasnip.extras.fmt").fmta
	local rep = require("luasnip.extras").rep
	ls.snippets = {
		-- all = {},
		zig = {
			ls.parser.parse_snippet("unr", "unreachable"),
			ls.parser.parse_snippet("und", "undefined"),
			ls.parser.parse_snippet("con", "continue"),
			ls.parser.parse_snippet("opa", "*const anyopaque"),
			ls.parser.parse_snippet("any", "anytype"),
			ls.parser.parse_snippet("log", '${1:std.log.info}("${2:message}", .{${3:value}});'),
			ls.parser.parse_snippet("ass", '${1:std.debug.assert}(${2:true});'),

			ls.parser.parse_snippet("for", "for (${1:items}) |${2:value}| {\n\t${3:body};\n}"),
			ls.parser.parse_snippet("swi", "switch (${1:item}) {\n\t.${2:value} => ${3:value},\n}"),

			s(
				"fn",
				fmta("<1>fn <2>(<3>) <4> {\n\t<5>;\n}", {
					c(1, { t("pub "), t("") }),
					i(2, "fnName"),
					i(3, "args: Type"),
					i(4, "void"),
					i(5, "body"),
				})
			),

			s(
				"while",
				fmta("while (<1>) <2>{\n\t<3>;\n}", {
					i(1, "true"),
					c(2, { t(""), sn(nil, fmta(": (<1>) ", { i(1, "next") })) }),
					i(3, "body"),
				})
			),

			s(
				"blk",
				fmta("<>: {\n\t<>\n\tbreak :<> <>;\n}", { i(1, "blk"), i(2, "body;"), i(3, "blk"), i(4, "value") })
			),

			s(
				"dec",
				fmta("<1>const <2> = <3><4> {\n\t<5>\n};", {
					c(1, { t("pub "), t("") }),
					i(2, "Type"),
					c(3, { t(""), t("packed "), t("extern ") }),
					c(4, { { t("struct"), i(1) }, { t("enum"), i(1) }, { t("union"), i(1) } }),
					i(5, "field: Type,"),
				})
			),

			s("imp", fmta('<1>const <2> = @import("<3>");', { c(1, { t(""), t("pub ") }), i(2, "std"), rep(2) })),
			s(
				"impl",
				fmta(
					'<1>const <2> = @import("<3>")<4>.<5>;',
					{ c(1, { t(""), t("pub ") }), i(2, "std"), i(3, "file.zig"), i(4), rep(2) }
				)
			),

			s(
				"if",
				fmta("if (<1>) <2>{\n\t<3>\n}", {
					i(1, "true"),
					c(2, { t(""), sn(nil, fmta("|<1>| ", { i(1, "payload") })) }),
					i(3, "body;"),
				})
			),
			s(
				"el",
				fmta("<1> <2>{\n\t<3>\n}", {
					c(1, { t("else"), t("else if") }),
					c(2, { t(""), sn(nil, fmta("|<1>| ", { i(1, "payload") })) }),
					i(3, "body;"),
				})
			),
			s(
				"ifs",
				fmta("if (<1>) <2><3> else <4>;", {
					i(1, "true"),
					c(2, { t(""), sn(nil, fmta("|<1>| ", { i(1, "payload") })) }),
					i(3, "true"),
					i(4, "false"),
				})
			),
		},
	}
end

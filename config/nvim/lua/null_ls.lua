return function()
	local null_ls = require("null-ls")
	null_ls.config({
		sources = {
			null_ls.builtins.formatting.stylua,
            null_ls.builtins.formatting.prettierd,
            null_ls.builtins.formatting.yapf,
		},
	})
	require("lspconfig")["null-ls"].setup({})
end

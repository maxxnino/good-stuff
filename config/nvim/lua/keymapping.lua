return function()
	local generic_opts_any = { noremap = true, silent = true }

	vim.keymap.set({ "i" }, "<C-s>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", generic_opts_any)

	-- switch/close buffer
	vim.keymap.set({ "n" }, "<S-l>", ":BufferNext<cr>", generic_opts_any)
	vim.keymap.set({ "n" }, "<S-h>", ":BufferPrevious<cr>", generic_opts_any)
	vim.keymap.set({ "n" }, "<Space>c", ":BufferClose<cr>", generic_opts_any)
	vim.keymap.set({ "n" }, "<Space>bc", ":BufferCloseAllButCurrent<cr>", generic_opts_any)

	-- Save
	vim.keymap.set({ "n" }, "<Space>w", ":w<cr>", generic_opts_any)

	--Telescope
	vim.keymap.set({ "n" }, "<Space>e", ":NvimTreeToggle<cr>", generic_opts_any)
	vim.keymap.set({ "n" }, "<Space>sf", ":Telescope find_files<cr>", generic_opts_any)
	vim.keymap.set({ "n" }, "<Space>st", ":Telescope live_grep<cr>", generic_opts_any)
	vim.keymap.set({ "n" }, "<Space>sc", ":Telescope neoclip<cr>", generic_opts_any)
	vim.keymap.set({ "n" }, "<Space>sp", ":lua require'telescope'.extensions.project.project{}<cr>", generic_opts_any)

	-- Lsp
	vim.keymap.set({ "n" }, "<Space>lr", ":Telescope lsp_references<cr>", generic_opts_any)
	vim.keymap.set({ "n" }, "<Space>le", ":Telescope diagnostics bufrn=0<cr>", generic_opts_any)
	vim.keymap.set({ "n" }, "<Space>lf", ":lua vim.lsp.buf.formatting()<cr>", generic_opts_any)
	vim.keymap.set({ "n" }, "K", ":lua vim.lsp.buf.hover()<cr>", generic_opts_any)
	vim.keymap.set({ "n" }, "gd", ":lua vim.lsp.buf.definition()<cr>", generic_opts_any)
	vim.keymap.set(
		{ "n" },
		"<Space>lj",
		":lua vim.diagnostics.goto_next({float = {border = 'rounded', focusable = false, source = 'always'}})<cr>",
		generic_opts_any
	)
	vim.keymap.set(
		{ "n" },
		"<Space>lk",
		":lua vim.diagnostics.goto_prev({float = {border = 'rounded', focusable = false, source = 'always'}})<cr>",
		generic_opts_any
	)

	-- Surround selection with anything
	vim.keymap.set({ "n" }, '<Space>"', [[ciw"<c-r>""<esc>]], generic_opts_any)
	vim.keymap.set({ "n" }, "<Space>'", [[ciw'<c-r>"'<esc>]], generic_opts_any)
	vim.keymap.set({ "n" }, "<Space>.", [[ciw.{<c-r>"}<esc>]], generic_opts_any)
	vim.keymap.set({ "n" }, "<Space>[", [[ciw[<c-r>"]<esc>]], generic_opts_any)
	vim.keymap.set({ "n" }, "<Space>{", [[ciw{<c-r>"}<esc>]], generic_opts_any)
	vim.keymap.set({ "n" }, "<Space>(", [[ciw(<c-r>")<esc>]], generic_opts_any)

	--Glow markdown preview
	vim.keymap.set({ "n" }, "<Space>md", ":Glow<CR><C-w>z<C-w>|<C-w>_", generic_opts_any)

	-- Move current line / block with Alt-j/k a la vscode.
	-- vim.keymap.set({ "n" }, "<A-j>", ":m .+1<cr>==", generic_opts_any)
	-- vim.keymap.set({ "n" }, "<A-k>", ":m .-2<cr>==", generic_opts_any)
    --
	-- Better indenting
	vim.keymap.set({ "s" }, "<", "<gv", generic_opts_any)
	vim.keymap.set({ "s" }, ">", ">gv", generic_opts_any)

	-- Surround selection with anything
	vim.keymap.set({ "s" }, "<Space>'", [[c'<c-r>"'<esc>]], generic_opts_any)
	vim.keymap.set({ "s" }, "<Space>.", [[c.{<c-r>"}<esc>]], generic_opts_any)
	vim.keymap.set({ "s" }, "<Space>[", [[c[<c-r>"]<esc>]], generic_opts_any)
	vim.keymap.set({ "s" }, "<Space>{", [[c{<c-r>"}<esc>]], generic_opts_any)
	vim.keymap.set({ "s" }, "<Space>(", [[c(<c-r>")<esc>]], generic_opts_any)
end

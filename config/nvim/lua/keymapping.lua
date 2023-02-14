local generic_opts_any = { noremap = true, silent = true }
-- better copy and paste
vim.keymap.set({ "x" }, "<Space>p", "\"_dP", generic_opts_any)

vim.keymap.set({ "v" }, "<Space>y", "\"+y", generic_opts_any)
vim.keymap.set({ "n" }, "<Space>y", "\"+y", generic_opts_any)
vim.keymap.set({ "n" }, "<Space>Y", "\"+Y", { noremap = false })

vim.keymap.set({ "n" }, "<Space>d", "\"_d", generic_opts_any)
vim.keymap.set({ "v" }, "<Space>d", "\"_d", generic_opts_any)

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

-- Lsp
vim.keymap.set({ "n" }, "<Space>lr", ":Telescope lsp_references<cr>", generic_opts_any)
vim.keymap.set({ "n" }, "<Space>le", ":Telescope diagnostics bufrn=0<cr>", generic_opts_any)
vim.keymap.set({ "n" }, "<Space>lf", ":LspZeroFormat<cr>", generic_opts_any)

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

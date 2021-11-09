return function()
	local keys = {
		---@usage change or add keymappings for insert mode
		insert_mode = {
			["<A-i>"] = "<C-o>I",
			["<A-a>"] = "<C-o>A",
			["<C-e>"] = "<C-o>de",
			["<C-h>"] = "<C-o>b",
			["<C-l>"] = "<C-o>w",
			["<C-s>"] = "<cmd>lua vim.lsp.buf.signature_help()<cr>",
		},

		---@usage change or add keymappings for normal mode
		normal_mode = {
			-- Better window movement
			["<C-h>"] = "<C-w>h",
			["<C-j>"] = "<C-w>j",
			["<C-k>"] = "<C-w>k",
			["<C-l>"] = "<C-w>l",

			-- Tab switch buffer
			["<S-l>"] = ":BufferNext<CR>",
			["<S-h>"] = ":BufferPrevious<CR>",
			["<Space>c"] = ":BufferClose<CR>",
			["<Space>bc"] = ":BufferCloseAllButCurrent<CR>",

			-- Move current line / block with Alt-j/k a la vscode.
			["<A-j>"] = ":m .+1<CR>==",
			["<A-k>"] = ":m .-2<CR>==",

			["<Space>e"] = ":NvimTreeToggle<CR>",
			["<Space>sf"] = ":Telescope find_files<CR>",
			["<Space>st"] = ":Telescope live_grep<CR>",

			-- Lsp
			["<Space>lr"] = ":Telescope lsp_references<CR>",
			["<Space>le"] = ":Telescope lsp_document_diagnostics<CR>",
			["<Space>lf"] = ":lua vim.lsp.buf.formatting()<CR>",
			["K"] = ":lua vim.lsp.buf.hover()<CR>",
			["gd"] = ":lua vim.lsp.buf.definition()<CR>",

			-- harpoon
			["<Space>m"] = ":lua require('harpoon.mark').add_file()<CR>",
			["<Space>h"] = ":lua require('harpoon.ui').toggle_quick_menu()<CR>",
			["<Space>j"] = ":lua require('harpoon.ui').nav_file(1)<CR>",
			["<Space>k"] = ":lua require('harpoon.ui').nav_file(2)<CR>",
		},

		---@usage change or add keymappings for terminal mode
		term_mode = {},

		---@usage change or add keymappings for visual mode
		visual_mode = {
			-- Better indenting
			["<"] = "<gv",
			[">"] = ">gv",
		},

		---@usage change or add keymappings for visual block mode
		visual_block_mode = {},

		---@usage change or add keymappings for command mode
		command_mode = {},
	}
	local mode_adapters = {
		insert_mode = "i",
		normal_mode = "n",
		term_mode = "t",
		visual_mode = "v",
		visual_block_mode = "x",
		command_mode = "c",
	}

	local generic_opts_any = { noremap = true, silent = true }

	local generic_opts = {
		insert_mode = generic_opts_any,
		normal_mode = generic_opts_any,
		visual_mode = generic_opts_any,
		visual_block_mode = generic_opts_any,
		command_mode = generic_opts_any,
		term_mode = { silent = true },
	}
	for key, mapping in pairs(keys) do
		local mode = mode_adapters[key]
		local opts = generic_opts[key]
		for k, v in pairs(mapping) do
			if type(v) == "table" then
				vim.api.nvim_set_keymap(mode, k, v[1], v[2])
			else
				vim.api.nvim_set_keymap(mode, k, v, opts)
			end
		end
	end
end

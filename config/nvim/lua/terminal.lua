return function()
	require("toggleterm").setup({
		size = 20,
		open_mapping = [[<c-t>]],
		start_in_insert = true,
		insert_mappings = false, -- whether or not the open mapping applies in insert mode
		direction = "tab",
		close_on_exit = true, -- close the terminal window when the process exits
	})
	local Terminal = require("toggleterm.terminal").Terminal
	local pwsh = Terminal:new({
		cmd = "pwsh -NoLogo",
		direction = "tab",
	})

	function _pwsh_toggle()
		pwsh:toggle()
	end
	vim.api.nvim_set_keymap("n", "<c-t>", "<cmd>lua _pwsh_toggle()<CR>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("i", "<c-t>", "<cmd>lua _pwsh_toggle()<CR>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("t", "<c-t>", "<cmd>lua _pwsh_toggle()<CR>", { noremap = true, silent = true })
end

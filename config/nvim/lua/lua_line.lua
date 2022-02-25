return function()
	local colors = {
		bg = "#202328",
		fg = "#bbc2cf",
		yellow = "#ECBE7B",
		cyan = "#008080",
		darkblue = "#081633",
		green = "#98be65",
		orange = "#FF8800",
		violet = "#a9a1e1",
		magenta = "#c678dd",
		purple = "#c678dd",
		blue = "#51afef",
		red = "#ec5f67",
	}
	local components = {
		treesitter = {
			function()
				local b = vim.api.nvim_get_current_buf()
				if next(vim.treesitter.highlighter.active[b]) then
					return "  "
				end
				return ""
			end,
			color = { fg = colors.green },
		},
		lsp = {
			function()
				local buf_clients = vim.lsp.buf_get_clients()
				-- if next(buf_clients) == nil then
				-- 	-- TODO: clean up this if statement
				-- 	if type(msg) == "boolean" or #msg == 0 then
				-- 		return "LS Inactive"
				-- 	end
				-- 	return msg
				-- end

				local buf_ft = vim.bo.filetype
				local buf_client_names = {}

				-- add client
				for _, client in pairs(buf_clients) do
					if client.name ~= "null-ls" then
						table.insert(buf_client_names, client.name)
					end
				end

				-- add formatter
				local formatters = require("lvim.lsp.null-ls.formatters")
				local supported_formatters = formatters.list_registered_providers(buf_ft)
				vim.list_extend(buf_client_names, supported_formatters)

				-- add linter
				local linters = require("lvim.lsp.null-ls.linters")
				local supported_linters = linters.list_registered_providers(buf_ft)
				vim.list_extend(buf_client_names, supported_linters)

				return "[" .. table.concat(buf_client_names, ", ") .. "]"
			end,
			icon = " ",
			color = { gui = "bold" },
		},
		spaces = {
			function()
				if not vim.api.nvim_buf_get_option(0, "expandtab") then
					return "ﮊ: " .. vim.api.nvim_buf_get_option(0, "tabstop") .. " "
				end
				local size = vim.api.nvim_buf_get_option(0, "shiftwidth")
				if size == 0 then
					size = vim.api.nvim_buf_get_option(0, "tabstop")
				end
				return size .. " "
			end,
			-- color = { fg = colors.fg },
		},
		scrollbar = {
			function()
				local current_line = vim.fn.line(".")
				local total_lines = vim.fn.line("$")
				local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
				local line_ratio = current_line / total_lines
				local index = math.ceil(line_ratio * #chars)
				return chars[index]
			end,
			padding = { left = 0, right = 0 },
			color = { fg = colors.yellow, bg = colors.bg },
		},
	}

	require("lualine").setup({
		options = {
			theme = "ayu_mirage",
			icons_enabled = true,
			-- component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = { "dashboard", "NvimTree", "Outline" },
		},
		sections = {
			lualine_a = {
				"mode",
			},
			lualine_b = {
				"branch",
				"filename",
			},
			lualine_c = {
				"diff",
			},
			lualine_x = {
				"nvim_diagnostics",
				"nvim_lsp",
				components.treesitter,
				"encoding",
				"fileformat",
				"filetype",
			},
			lualine_y = {
				components.spaces,
			},
			lualine_z = {
				components.scrollbar,
			},
		},
		inactive_sections = {
			lualine_a = {
				"filename",
			},
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		extensions = { "nvim-tree" },
	})
end

local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	}, _config or {})
end

local function install_server(lsp_installer_servers, server_name, opts)
	local server_available, requested_server = lsp_installer_servers.get_server(server_name)
	if server_available then
		requested_server:on_ready(function()
			requested_server:setup(opts)
		end)
		if not requested_server:is_installed() then
			-- Queue the server to be installed
			requested_server:install()
		end
	end
end

return function()
	local servers = { "zls", "sumneko_lua" }
	local lsp_installer_servers = require("nvim-lsp-installer.servers")
	local cmp_lsp = require("cmp_nvim_lsp")
	for _, v in pairs(servers) do
		install_server(lsp_installer_servers, v, {
			capabilities = cmp_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities()),
		})
		-- install_server(lsp_installer_servers, v, {})
	end
	-- require("lspconfig").maxx.setup(config())
	-- install_server(lsp_installer_servers, "zls", {})
end

return function()
	local servers = { "zls", "sumneko_lua", "pyright" }
	local lsp_installer_servers = require("nvim-lsp-installer.servers")
	local cmp_lsp = require("cmp_nvim_lsp")
	for _, server_name in pairs(servers) do
		local server_available, requested_server = lsp_installer_servers.get_server(server_name)
		if server_available then
			requested_server:on_ready(function()
				requested_server:setup({
					capabilities = cmp_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities()),
				})
			end)
			if not requested_server:is_installed() then
				-- Queue the server to be installed
				requested_server:install()
			end
		end
	end
end

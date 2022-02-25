local plugin_loader = {}

function plugin_loader.init(plugins)
	local fn = vim.fn
	local install_path = DATA .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		packer_bootstrap = fn.system({
			"git",
			"clone",
			"--depth",
			"1",
			"https://github.com/wbthomason/packer.nvim",
			install_path,
		})
	end

	require("packer").startup(function(use)
		for _, plugin in ipairs(plugins) do
			use(plugin)
		end
		if packer_bootstrap then
			require("packer").sync()
		end
	end)
end

return plugin_loader

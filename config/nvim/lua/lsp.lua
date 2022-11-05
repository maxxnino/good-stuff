
return function()
    local cmp_lsp = require("cmp_nvim_lsp")
    local lspconfig = require("lspconfig")

    local servers = { "zls", "sumneko_lua", "pyright", "rust_analyzer" }
    local extend_lsp = {
        ["sumneko_lua"] = function(opts)
            opts.settings = {
                Lua = {
                    runtime = {
                        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                        version = "Lua5.4",
                        -- Setup your lua path
                        path = { "?.lua" },
                    },
                    diagnostics = {
                    	-- Get the language server to recognize the `vim` global
                    	globals = { "vim" },
                    },
                    workspace = {
                        -- Make the server aware of Neovim runtime files
                        library = { "~/Repo/autotouchlib" },
                    },
                    -- -- Do not send telemetry data containing a randomized but unique identifier
                    -- telemetry = {
                    -- 	enable = false,
                    -- },
                },
            }
        end,
    }

    for _, server_name in pairs(servers) do
        local opts = { capabilities = cmp_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities()) }
        if extend_lsp[server_name] then
            extend_lsp[server_name](opts)
        end
        lspconfig[server_name].setup(opts)
    end
end

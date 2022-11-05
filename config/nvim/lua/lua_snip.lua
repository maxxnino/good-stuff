return function()
    local ls = require("luasnip")
    -- local types = require("luasnip.util.types")
    --
    ls.config.set_config({
        history = true,
        updateevents = "TextChanged, TextChangedI",
        enable_autosnippets = true,
    })

    -- keymap
    local opts = { silent = true }
    vim.keymap.set({ "i", "s" }, "<C-k>", function()
        if ls.expand_or_jumpable() then
            ls.expand_or_jump()
        end
    end, opts)

    vim.keymap.set({ "i", "s" }, "<C-j>", function()
        if ls.jumpable(-1) then
            ls.jump(-1)
        end
    end, opts)

    vim.keymap.set({ "i" }, "<C-l>", function()
        if ls.choice_active() then
            ls.change_choice()
        end
    end, opts)
    require("luasnip.loaders.from_vscode").lazy_load()

end

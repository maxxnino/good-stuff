return {
    {
        "nvim-treesitter/nvim-treesitter",
        version = false, -- last release is way too old and doesn't work on Windows
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        -- keys = {
        --     { "<c-space>", desc = "Increment selection" },
        --     { "<bs>", desc = "Schrink selection", mode = "x" },
        -- },
        opts = {
            ensure_installed = {}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
            highlight = {
                enable = true, -- false will disable the whole extension
                additional_vim_regex_highlighting = false,
            },
            context_commentstring = {
                enable = true,
                enable_autocmd = false,
                config = {
                    -- Languages that have a single comment style
                    typescript = "// %s",
                    css = "/* %s */",
                    scss = "/* %s */",
                    html = "<!-- %s -->",
                    svelte = "<!-- %s -->",
                    vue = "<!-- %s -->",
                    json = "",
                    zig = "// %s",
                },
            },
            -- playground = {
            --     enable = true,
            --     disable = {},
            --     updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
            --     persist_queries = false, -- Whether the query persists across vim sessions
            --     keybindings = {
            --         toggle_query_editor = "o",
            --         toggle_hl_groups = "i",
            --         toggle_injected_languages = "t",
            --         toggle_anonymous_nodes = "a",
            --         toggle_language_display = "I",
            --         focus_language = "f",
            --         unfocus_language = "F",
            --         update = "R",
            --         goto_node = "<cr>",
            --         show_help = "?",
            --     },
            -- },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    -- { "nvim-treesitter/playground" },
}

return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            -- { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
        },
        config       = function()
            local telescope = require("telescope")
            telescope.setup({
                defaults = {
                    prompt_prefix = " ",
                    selection_caret = " ",
                    entry_prefix = "  ",
                    initial_mode = "insert",
                    selection_strategy = "reset",
                    sorting_strategy = "descending",
                    layout_strategy = "horizontal",
                    layout_config = {
                        width = 0.9,
                        preview_cutoff = 120,
                        horizontal = { mirror = false },
                        vertical = { mirror = false },
                    },
                    vimgrep_arguments = {
                        "rg",
                        "--color=never",
                        "--no-heading",
                        "--with-filename",
                        "--line-number",
                        "--column",
                        "--smart-case",
                        "--hidden",
                    },
                    file_ignore_patterns = {},
                    path_display = { shorten = 5 },
                    winblend = 0,
                    border = {},
                    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
                    color_devicons = true,
                    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
                    pickers = {
                        find_files = {
                            find_command = { "fd", "--type=file", "--hidden", "--smart-case" },
                        },
                        live_grep = {
                            --@usage don't include the filename in the search results
                            only_sort_text = true,
                        },
                    },
                },
                -- extensions = {
                --     fzf = {
                --         fuzzy = true, -- false will only do exact matching
                --         override_generic_sorter = true, -- override the generic sorter
                --         override_file_sorter = true, -- override the file sorter
                --         case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                --     },
                -- },
            })
            -- telescope.load_extension("fzf")
        end,
        cmd          = { "Telescope" },
    },

    {
        "terrortylor/nvim-comment",
        config = function()
            require("nvim_comment").setup {
                comment_empty = false,
            }
        end,
        event = "BufReadPost",
    },

    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup({})
        end,
    },
    {
        "akinsho/toggleterm.nvim",
        config = function() require("toggleterm").setup { open_mapping = [[<c-t>]] } end
    },
}

-- return function()
--     -- vim.opt.shada = "!,'0,f0,<50,s10,h"
--     -- vim.opt.wrapscan = true -- Searches wrap around the end of the file
--     vim.wo.foldmethod = "expr"
--     vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
--     vim.wo.foldlevel = 4
--     vim.wo.foldtext =
--     [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) . ' (' . (v:foldend - v:foldstart + 1) . ' lines)']]
--     vim.wo.foldnestmax = 3
--     vim.wo.foldminlines = 1
--     -- vim.opt.pumblend = 10
--     vim.opt.joinspaces = false
--     vim.opt.list = true
--     vim.opt.confirm = true -- make vim prompt me to save before doing destructive things
--     vim.opt.autowriteall = true -- automatically :write before running commands and changing files
--     vim.opt.fillchars = {
--         fold = " ",
--         msgsep = "‾",
--         foldopen = "▾",
--         foldsep = "│",
--         foldclose = "▸",
--     }
--     vim.opt.formatoptions = {
--         ["1"] = true,
--         ["2"] = true, -- Use indent from 2nd line of a paragraph
--         q = true, -- continue comments with gq"
--         c = true, -- Auto-wrap comments using textwidth
--         r = true, -- Continue comments when pressing Enter
--         n = true, -- Recognize numbered lists
--         t = false, -- autowrap lines using text width value
--         j = true, -- remove a comment leader when joining lines.
--         -- Only break if the line was not longer than 'textwidth' when the insert
--         -- started and only at a white character that has been entered during the
--         -- current insert command.
--         l = true,
--         v = true,
--     }
--     vim.opt.listchars = {
--         tab = "│ ",
--         extends = "›", -- Alternatives: … »
--         precedes = "‹", -- Alternatives: … «
--         trail = "•", -- BULLET (U+2022, UTF-8: E2 80 A2)
--     }
--     local default_options = {
--         backup = false, -- creates a backup file
--         -- clipboard = "unnamedplus", -- allows neovim to access the system clipboard
--         colorcolumn = "99999", -- fixes indentline for now
--         completeopt = { "menuone", "noselect" },
--         fileencoding = "utf-8", -- the encoding written to a file
--         ignorecase = true, -- ignore case in search patterns
--         pumheight = 10, -- pop up menu height
--         showmode = false, -- we don't need to see things like -- INSERT -- anymore
--         showtabline = 2, -- always show tabs
--         smartcase = true, -- smart case
--         smartindent = true, -- make indenting smarter again
--         splitbelow = true, -- force all horizontal splits to go below current window
--         splitright = true, -- force all vertical splits to go to the right of current window
--         swapfile = false, -- creates a swapfile
--         termguicolors = true, -- set term gui colors (most terminals support this)
--         timeoutlen = 500, -- time to wait for a mapped sequence to complete (in milliseconds)
--         mouse = "a",
--         undodir = vim.fn.stdpath("cache") .. "/undo", -- set an undo directory
--         undofile = true, -- enable persistent undo
--         updatetime = 500, -- faster completion
--         writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
--         expandtab = true, -- convert tabs to spaces
--         shiftwidth = 4, -- the number of spaces inserted for each indentation
--         tabstop = 4, -- insert 2 spaces for a tab
--         cursorline = true, -- highlight the current line
--         number = true, -- set numbered lines
--         relativenumber = true, -- set relative numbered lines
--         numberwidth = 4, -- set number column width to 2 {default 4}
--         wrap = false, -- display lines as one long line
--         spell = false,
--         spelllang = "en",
--         scrolloff = 8, -- is one of my fav
--         sidescrolloff = 8,
--         fileformats = "unix",
--     }

--     ---  SETTINGS  ---

--     vim.opt.shortmess:append("c")
--     for k, v in pairs(default_options) do
--         vim.opt[k] = v
--     end
-- end

-- This file is automatically loaded by plugins.config

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

opt.autowrite = true -- Enable auto write
opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 3 -- Hide * markup for bold and italic
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.cursorline = true -- Enable highlighting of the current line
opt.expandtab = true -- Use spaces instead of tabs
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true -- Ignore case
opt.inccommand = "nosplit" -- preview incremental substitute
opt.laststatus = 0
opt.cmdheight = 0
opt.list = true -- Show some invisible characters (tabs...
opt.mouse = "a" -- Enable mouse mode
opt.number = true -- Print line number
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.relativenumber = true -- Relative line numbers
opt.scrolloff = 4 -- Lines of context
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.shiftround = true -- Round indent
opt.shiftwidth = 4 -- Size of an indent
opt.shortmess:append { W = true, I = true, c = true }
opt.showmode = false -- Dont show mode since we have a statusline
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.spelllang = { "en" }
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current
opt.tabstop = 4 -- Number of spaces tabs count for
opt.termguicolors = true -- True color support
opt.timeoutlen = 300
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width
opt.wrap = false -- Disable line wrap

-- opt.splitkeep = "screen"
-- opt.shortmess:append { C = true }

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

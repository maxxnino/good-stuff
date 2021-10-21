load_options = function()
  local default_options = {
    clipboard = "unnamedplus", -- allows neovim to access the system clipboard
    completeopt = { "menuone", "noselect" },
    conceallevel = 0, -- so that `` is visible in markdown filesgs
    hlsearch = true, -- highlight all matches on previous search pattern
    ignorecase = true, -- ignore case in search patterns
    mouse = "a", -- allow the mouse to be used in neovim
    pumheight = 10, -- pop up menu height
    smartcase = true, -- smart case
    smartindent = true, -- make indenting smarter again
    termguicolors = true, -- set term gui colors (most terminals support this)
    expandtab = true, -- convert tabs to spaces
    shiftwidth = 2, -- the number of spaces inserted for each indentation
    tabstop = 2, -- insert 2 spaces for a tab
    cursorline = true, -- highlight the current line
    number = true, -- set numbered lines
    scrolloff = 8, -- is one of my fav
    sidescrolloff = 8,
  }

  ---  SETTINGS  ---

  vim.opt.shortmess:append "c"
  for k, v in pairs(default_options) do
    vim.opt[k] = v
  end
end

load_options()
vim.cmd("colorscheme sitruuna")
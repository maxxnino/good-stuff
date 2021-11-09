-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "C:\\Users\\user\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?.lua;C:\\Users\\user\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?\\init.lua;C:\\Users\\user\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?.lua;C:\\Users\\user\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?\\init.lua"
local install_cpath_pattern = "C:\\Users\\user\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\lua\\5.1\\?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["barbar.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\user\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\barbar.nvim",
    url = "https://github.com/romgrk/barbar.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "C:\\Users\\user\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "C:\\Users\\user\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["filetype.nvim"] = {
    config = { "\27LJ\2\nu\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\14overrides\1\0\0\fliteral\1\0\0\1\0\1\15.gitignore\tconf\nsetup\rfiletype\frequire\0" },
    loaded = true,
    path = "C:\\Users\\user\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\filetype.nvim",
    url = "https://github.com/nathom/filetype.nvim"
  },
  harpoon = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\user\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\harpoon",
    url = "https://github.com/ThePrimeagen/harpoon"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "C:\\Users\\user\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\user\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n�\1\0\2\4\0\f\0\0306\2\1\0009\2\2\0029\2\3\0029\2\4\0029\3\0\0018\2\3\2=\2\0\0016\2\1\0009\2\2\0029\2\3\0029\2\6\0029\3\a\0009\3\b\0038\2\3\2=\2\5\0016\2\1\0009\2\2\0029\2\3\0029\2\n\0029\3\a\0009\3\b\0038\2\3\2\14\0\2\0X\3\4�6\2\1\0009\2\2\0029\2\3\0029\2\v\2=\2\t\1L\1\2\0\23duplicates_default\15duplicates\bdup\tname\vsource\17source_names\tmenu\15kind_icons\15formatting\bcmp\bUXI\tkind�\n\1\0\a\0/\0K6\0\0\0'\2\1\0B\0\2\0026\1\2\0005\2\a\0005\3\5\0009\4\3\0009\4\4\4=\4\6\3=\3\b\0025\3\t\0=\3\n\0025\3\v\0=\3\f\0025\3\14\0005\4\r\0=\4\15\0035\4\16\0=\4\17\0035\4\18\0=\4\19\0035\4\20\0=\4\21\0033\4\22\0=\4\23\3=\3\24\0025\3\26\0005\4\25\0=\4\27\3=\3\28\0024\3\n\0005\4\29\0>\4\1\0035\4\30\0>\4\2\0035\4\31\0>\4\3\0035\4 \0>\4\4\0035\4!\0>\4\5\0035\4\"\0>\4\6\0035\4#\0>\4\a\0035\4$\0>\4\b\0035\4%\0>\4\t\3=\3&\0025\3)\0009\4'\0009\4(\4)\6��B\4\2\2=\4*\0039\4'\0009\4(\4)\6\4\0B\4\2\2=\4+\0039\4'\0009\4,\4B\4\1\2=\4-\3=\3'\2=\2\1\0016\1\0\0'\3\1\0B\1\2\0029\1.\0016\3\2\0009\3\1\3B\1\2\1K\0\1\0\nsetup\n<C-e>\nabort\n<C-f>\n<C-d>\1\0\0\16scroll_docs\fmapping\fsources\1\0\1\tname\15treesitter\1\0\1\tname\nemoji\1\0\1\tname\tcalc\1\0\2\tname\vbuffer\19keyword_length\3\4\1\0\1\tname\rnvim_lua\1\0\1\tname\16cmp_tabnine\1\0\1\tname\fluasnip\1\0\1\tname\tpath\1\0\1\tname\rnvim_lsp\18documentation\vborder\1\0\0\1\t\0\0\b╭\b─\b╮\b│\b╯\b─\b╰\b│\15formatting\vformat\0\15duplicates\1\0\3\vbuffer\3\1\tpath\3\1\rnvim_lsp\3\0\17source_names\1\0\a\nvsnip\14(Snippet)\vbuffer\r(Buffer)\tpath\v(Path)\rnvim_lsp\n(LSP)\nemoji\f(Emoji)\16cmp_tabnine\14(Tabnine)\tcalc\v(Calc)\15kind_icons\1\0\25\tText\t \vModule\t \rConstant\tﲀ \rVariable\t \vStruct\t \vMethod\t \16Constructor\t \fKeyword\t \fSnippet\t \14Interface\tﰮ \tEnum\b練\rFunction\t \14Reference\t \vFolder\t \15EnumMember\t \tFile\b\rProperty\t \nField\t \nEvent\t \nValue\t \rOperator\b\tUnit\b塞\nClass\t \18TypeParameter\t \nColor\t \vfields\1\0\1\23duplicates_default\3\0\1\4\0\0\tkind\tabbr\tmenu\17experimental\1\0\2\16native_menu\1\15ghost_text\2\15completion\1\0\1\19keyword_length\3\1\17confirm_opts\1\0\0\rbehavior\1\0\1\vselect\2\vInsert\20ConfirmBehavior\bUXI\bcmp\frequire\0" },
    loaded = true,
    path = "C:\\Users\\user\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-comment"] = {
    config = { "\27LJ\2\nP\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\18comment_empty\1\nsetup\17nvim_comment\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\user\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\nvim-comment",
    url = "https://github.com/terrortylor/nvim-comment"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "C:\\Users\\user\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "C:\\Users\\user\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeOpen", "NvimTreeToggle" },
    config = { "\27LJ\2\n�\b\0\0\r\0*\0D5\0\1\0005\1\0\0=\1\2\0005\1\3\0=\1\4\0005\1\5\0005\2\6\0=\2\a\0015\2\b\0=\2\t\1=\1\n\0006\1\v\0009\1\f\0016\2\r\0\18\4\0\0B\2\2\4H\5\4�'\a\14\0\18\b\5\0&\a\b\a<\6\a\1F\5\3\3R\5�6\2\15\0'\4\16\0B\2\2\0029\2\17\0026\3\15\0'\5\18\0B\3\2\0029\3\19\0035\5\20\0005\6\21\0=\6\22\0055\6\23\0=\6\24\0055\6\25\0005\a\26\0=\a\n\6=\6\27\0055\6\28\0005\a\29\0004\b\4\0005\t\31\0005\n\30\0=\n \t\18\n\2\0'\f!\0B\n\2\2=\n\"\t>\t\1\b5\t#\0\18\n\2\0'\f$\0B\n\2\2=\n\"\t>\t\2\b5\t%\0\18\n\2\0'\f&\0B\n\2\2=\n\"\t>\t\3\b=\b'\a=\a(\6=\6)\5B\3\2\1K\0\1\0\tview\rmappings\tlist\vvsplit\1\0\1\bkey\6v\15close_node\1\0\1\bkey\6h\acb\tedit\bkey\1\0\0\1\4\0\0\6l\t<CR>\6o\1\0\1\16custom_only\1\1\0\3\tside\tleft\16auto_resize\1\nwidth\3\30\16diagnostics\1\0\4\tinfo\b\thint\b\fwarning\b\nerror\b\1\0\1\venable\2\24update_focused_file\1\0\1\venable\2\vignore\1\4\0\0\t.git\17node_modules\v.cache\1\0\4\18open_on_setup\1\15auto_close\2\18hide_dotfiles\2\16open_on_tab\1\nsetup\14nvim-tree\23nvim_tree_callback\21nvim-tree.config\frequire\15nvim_tree_\npairs\6g\bvim\nicons\vfolder\1\0\5\fdefault\b\fsymlink\b\topen\b\15empty_open\b\nempty\b\bgit\1\0\a\runstaged\b\14untracked\6U\fignored\b◌\vstaged\6S\frenamed\b➜\fdeleted\b\runmerged\b\1\0\2\fsymlink\b\fdefault\b\19auto_ignore_ft\1\3\0\0\rstartify\14dashboard\15show_icons\1\0\4\vgit_hl\3\1\25root_folder_modifier\a:t\17allow_resize\3\1\17quit_on_open\3\0\1\0\5\bgit\3\1\ffolders\3\1\nfiles\3\1\18folder_arrows\3\1\15tree_width\3\30\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\user\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n�\5\0\0\5\0\20\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0005\4\t\0=\4\n\3=\3\v\0025\3\f\0004\4\0\0=\4\r\0035\4\14\0=\4\15\3=\3\16\0025\3\17\0005\4\18\0=\4\r\3=\3\19\2B\0\2\1K\0\1\0\vindent\1\2\0\0\tyaml\1\0\1\venable\2\15playground\16keybindings\1\0\n\vupdate\6R\14goto_node\t<cr>\14show_help\6?\24toggle_query_editor\6o\21toggle_hl_groups\6i\30toggle_injected_languages\6t\27toggle_anonymous_nodes\6a\28toggle_language_display\6I\19focus_language\6f\21unfocus_language\6F\fdisable\1\0\3\15updatetime\3\25\venable\1\20persist_queries\1\26context_commentstring\vconfig\1\0\b\bvue\16<!-- %s -->\thtml\16<!-- %s -->\15typescript\n// %s\bcss\r/* %s */\vsvelte\16<!-- %s -->\bzig\n// %s\tjson\5\tscss\r/* %s */\1\0\2\19enable_autocmd\1\venable\2\14highlight\1\0\2&additional_vim_regex_highlighting\1\venable\2\21ensure_installed\1\0\0\1\4\0\0\blua\vpython\bzig\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "C:\\Users\\user\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "C:\\Users\\user\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "C:\\Users\\user\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "C:\\Users\\user\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "C:\\Users\\user\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    config = { "\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15tele_scope\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "C:\\Users\\user\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n�\5\0\0\5\0\20\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0005\4\t\0=\4\n\3=\3\v\0025\3\f\0004\4\0\0=\4\r\0035\4\14\0=\4\15\3=\3\16\0025\3\17\0005\4\18\0=\4\r\3=\3\19\2B\0\2\1K\0\1\0\vindent\1\2\0\0\tyaml\1\0\1\venable\2\15playground\16keybindings\1\0\n\vupdate\6R\14goto_node\t<cr>\14show_help\6?\24toggle_query_editor\6o\21toggle_hl_groups\6i\30toggle_injected_languages\6t\27toggle_anonymous_nodes\6a\28toggle_language_display\6I\19focus_language\6f\21unfocus_language\6F\fdisable\1\0\3\15updatetime\3\25\venable\1\20persist_queries\1\26context_commentstring\vconfig\1\0\b\bvue\16<!-- %s -->\thtml\16<!-- %s -->\15typescript\n// %s\bcss\r/* %s */\vsvelte\16<!-- %s -->\bzig\n// %s\tjson\5\tscss\r/* %s */\1\0\2\19enable_autocmd\1\venable\2\14highlight\1\0\2&additional_vim_regex_highlighting\1\venable\2\21ensure_installed\1\0\0\1\4\0\0\blua\vpython\bzig\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n�\1\0\2\4\0\f\0\0306\2\1\0009\2\2\0029\2\3\0029\2\4\0029\3\0\0018\2\3\2=\2\0\0016\2\1\0009\2\2\0029\2\3\0029\2\6\0029\3\a\0009\3\b\0038\2\3\2=\2\5\0016\2\1\0009\2\2\0029\2\3\0029\2\n\0029\3\a\0009\3\b\0038\2\3\2\14\0\2\0X\3\4�6\2\1\0009\2\2\0029\2\3\0029\2\v\2=\2\t\1L\1\2\0\23duplicates_default\15duplicates\bdup\tname\vsource\17source_names\tmenu\15kind_icons\15formatting\bcmp\bUXI\tkind�\n\1\0\a\0/\0K6\0\0\0'\2\1\0B\0\2\0026\1\2\0005\2\a\0005\3\5\0009\4\3\0009\4\4\4=\4\6\3=\3\b\0025\3\t\0=\3\n\0025\3\v\0=\3\f\0025\3\14\0005\4\r\0=\4\15\0035\4\16\0=\4\17\0035\4\18\0=\4\19\0035\4\20\0=\4\21\0033\4\22\0=\4\23\3=\3\24\0025\3\26\0005\4\25\0=\4\27\3=\3\28\0024\3\n\0005\4\29\0>\4\1\0035\4\30\0>\4\2\0035\4\31\0>\4\3\0035\4 \0>\4\4\0035\4!\0>\4\5\0035\4\"\0>\4\6\0035\4#\0>\4\a\0035\4$\0>\4\b\0035\4%\0>\4\t\3=\3&\0025\3)\0009\4'\0009\4(\4)\6��B\4\2\2=\4*\0039\4'\0009\4(\4)\6\4\0B\4\2\2=\4+\0039\4'\0009\4,\4B\4\1\2=\4-\3=\3'\2=\2\1\0016\1\0\0'\3\1\0B\1\2\0029\1.\0016\3\2\0009\3\1\3B\1\2\1K\0\1\0\nsetup\n<C-e>\nabort\n<C-f>\n<C-d>\1\0\0\16scroll_docs\fmapping\fsources\1\0\1\tname\15treesitter\1\0\1\tname\nemoji\1\0\1\tname\tcalc\1\0\2\tname\vbuffer\19keyword_length\3\4\1\0\1\tname\rnvim_lua\1\0\1\tname\16cmp_tabnine\1\0\1\tname\fluasnip\1\0\1\tname\tpath\1\0\1\tname\rnvim_lsp\18documentation\vborder\1\0\0\1\t\0\0\b╭\b─\b╮\b│\b╯\b─\b╰\b│\15formatting\vformat\0\15duplicates\1\0\3\vbuffer\3\1\tpath\3\1\rnvim_lsp\3\0\17source_names\1\0\a\nvsnip\14(Snippet)\vbuffer\r(Buffer)\tpath\v(Path)\rnvim_lsp\n(LSP)\nemoji\f(Emoji)\16cmp_tabnine\14(Tabnine)\tcalc\v(Calc)\15kind_icons\1\0\25\tText\t \vModule\t \rConstant\tﲀ \rVariable\t \vStruct\t \vMethod\t \16Constructor\t \fKeyword\t \fSnippet\t \14Interface\tﰮ \tEnum\b練\rFunction\t \14Reference\t \vFolder\t \15EnumMember\t \tFile\b\rProperty\t \nField\t \nEvent\t \nValue\t \rOperator\b\tUnit\b塞\nClass\t \18TypeParameter\t \nColor\t \vfields\1\0\1\23duplicates_default\3\0\1\4\0\0\tkind\tabbr\tmenu\17experimental\1\0\2\16native_menu\1\15ghost_text\2\15completion\1\0\1\19keyword_length\3\1\17confirm_opts\1\0\0\rbehavior\1\0\1\vselect\2\vInsert\20ConfirmBehavior\bUXI\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: filetype.nvim
time([[Config for filetype.nvim]], true)
try_loadstring("\27LJ\2\nu\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\14overrides\1\0\0\fliteral\1\0\0\1\0\1\15.gitignore\tconf\nsetup\rfiletype\frequire\0", "config", "filetype.nvim")
time([[Config for filetype.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeOpen lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufReadPost * ++once lua require("packer.load")({'harpoon', 'nvim-comment'}, { event = "BufReadPost *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-autopairs'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufWinEnter * ++once lua require("packer.load")({'barbar.nvim'}, { event = "BufWinEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end

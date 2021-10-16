$env:LUNARVIM_RUNTIME_DIR = "$env:LOCALAPPDATA/lunarvim"
$env:LUNARVIM_CONFIG_DIR = "$env:LOCALAPPDATA/lvim"
$env:LUNARVIM_CACHE_DIR = "$env:TEMP/lvim"
$env:VIMRUNTIME = "$(scoop prefix neovim-nightly)/share/nvim/runtime"

nvim -u "$env:LUNARVIM_RUNTIME_DIR/lvim/init.lua" $args
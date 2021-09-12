$env:HOME = "$HOME"
$env:USER = "$HOME"
$env:SHELL = "cmd"
$env:TERMINAL = "$env:SHELL"
$env:VIMRUNTIME = "$(scoop prefix neovim-nightly)/share/nvim/runtime";
Set-Variable -name "LUNARVIM_RUNTIME_DIR" -Value "$HOME/.local/share/lunarvim"
Set-Variable -name "LUNARVIM_CONFIG_DIR" -Value "$HOME/.config/lvim"
nvim -u "$LUNARVIM_RUNTIME_DIR/lvim/init.lua" $args
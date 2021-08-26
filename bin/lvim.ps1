Set-Variable -name "LUNARVIM_RUNTIME_DIR" -Value "$HOME/.local/share/lunarvim"
Set-Variable -name "LUNARVIM_CONFIG_DIR" -Value "$HOME/.config/lvim"
#Write-Output $LUNARVIM_RUNTIME_DIR
#Write-Output $LUNARVIM_CONFIG_DIR
nvim -u "$LUNARVIM_RUNTIME_DIR/lvim/init.lua" $args
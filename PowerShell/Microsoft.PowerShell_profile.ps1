oh-my-posh --init --shell pwsh --config "$(scoop prefix oh-my-posh3)/themes/custom_gmay.omp.json" | Invoke-Expression
Set-Alias -Name v -Value "lvim.ps1"
Set-Variable -name "LUNARVIM_RUNTIME_DIR" -Value "$HOME/.local/share/lunarvim"
Set-Variable -name "LUNARVIM_CONFIG_DIR" -Value "$HOME/.config/lvim"
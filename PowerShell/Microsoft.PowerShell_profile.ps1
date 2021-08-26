oh-my-posh --init --shell pwsh --config "$(scoop prefix oh-my-posh3)\themes\custom_gmay.omp.json" | Invoke-Expression
Set-Alias -Name v -Value "lvim.ps1"
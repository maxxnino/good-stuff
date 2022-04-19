# set power shell theme
oh-my-posh --init --shell pwsh --config "$(scoop prefix oh-my-posh)/themes.original/huvix.omp.json" | Invoke-Expression

# neovim alias
Set-Alias -Name v -Value "nvim"

# vim mode
$env:VISUAL = "nvim"
Set-PSReadLineOption -EditMode Vi
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineOption -PredictionSource HistoryAndPlugin 
Set-PSReadLineOption -PredictionViewStyle ListView

Set-PSReadLineKeyHandler -Key Ctrl+n -Function NextHistory
Set-PSReadLineKeyHandler -Key Ctrl+p -Function PreviousHistory

# vulkan validation layer
$env:VK_LAYER_PATH= "$(scoop prefix vulkan)/bin"

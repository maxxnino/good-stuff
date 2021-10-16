# set power shell theme
oh-my-posh --init --shell pwsh --config "$(scoop prefix oh-my-posh3)/themes.original/amro.omp.json" | Invoke-Expression

#lunar vim alias
Set-Alias -Name v -Value "lvim.ps1"

# vim mode
$env:VISUAL = "nvim"
Set-PSReadLineOption -EditMode Vi
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

#change curso in insert/normal mode
function OnViModeChange {
	if ($args[0] -eq 'Command') {
		# Set the cursor to a blinking block.
		Write-Host -NoNewLine "`e[1 q"
	} else {
		# Set the cursor to a blinking line.
		Write-Host -NoNewLine "`e[5 q"
	}
}
Set-PSReadLineOption -ViModeIndicator Script -ViModeChangeHandler $function:OnViModeChange

Set-PSReadLineKeyHandler -Key Ctrl+j -Function NextHistory
Set-PSReadLineKeyHandler -Key Ctrl+k -Function PreviousHistory




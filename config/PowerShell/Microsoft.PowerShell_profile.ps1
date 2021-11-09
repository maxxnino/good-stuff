# set power shell theme
oh-my-posh --init --shell pwsh --config "$(scoop prefix oh-my-posh3)/themes.original/huvix.omp.json" | Invoke-Expression

#lunar vim alias
Set-Alias -Name v -Value "nvim"

# vim mode
$env:VISUAL = "nvim"
Set-PSReadLineOption -EditMode Vi
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineOption -PredictionSource History

# TODO: enable with pwsh 7.2
#Set-PSReadLineOption -PredictionSource HistoryAndPlugin 

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

#vulkan validation layer
$env:VK_LAYER_PATH= "$(scoop prefix vulkan)/bin"

#zig build self-hosted compiler
Set-Alias -Name zb -Value "zig-dev-build.ps1"





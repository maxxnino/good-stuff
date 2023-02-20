$base_dir = $pwd.Path
$config_dir = "$base_dir\config"
$local = $env:LOCALAPPDATA
$roaming = $env:APPDATA
$user = $env:USERPROFILE
$document = "$user\Documents"
$links = @{}

#minimal nvim config for powershell and git
$links.nvim = @("$local\nvim", "$config_dir\nvim")

#mpv config
$links.mpv = @("$roaming\mpv", "$config_dir\mpv")

#powershell profile
$links.PowerShell = @(
  "$document\PowerShell\Microsoft.PowerShell_profile.ps1", 
  "$config_dir\PowerShell\Microsoft.PowerShell_profile.ps1"
)

#yt-dlp
$links.ytdlp = @("$roaming\yt-dlp", "$config_dir\yt-dlp")

$stepCounter = 0
foreach ( $k in $links.Keys ) {
  $pair = $links[$k]
  try {
    New-Item -ItemType SymbolicLink -Path $pair[0] -Target $pair[1] -ErrorAction Stop | Out-Null
    $stepCounter++
  }
  catch {
    Write-Error $Error[0]
  }
}
Write-Output "Completed: $stepCounter/$($links.Count)"

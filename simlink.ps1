$base_dir = $args[0]
$config_dir = "$base_dir\config"
$local = $env:LOCALAPPDATA
$roaming = $env:APPDATA
$user = $env:USERPROFILE
$document = "$user\Documents"

#minimal nvim config for powershell and git
New-Item -ItemType SymbolicLink -Path "$local\nvim" -Target "$config_dir\nvim"

#mpv config
New-Item -ItemType SymbolicLink -Path "$roaming\mpv" -Target "$config_dir\mpv"

#powershell profile
New-Item -ItemType SymbolicLink `
         -Path "$document\PowerShell\Microsoft.PowerShell_profile.ps1" `
         -Target "$config_dir\PowerShell\Microsoft.PowerShell_profile.ps1"

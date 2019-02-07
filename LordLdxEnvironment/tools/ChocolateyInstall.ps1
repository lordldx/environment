# general windows settings

Update-ExecutionPolicy Unrestricted
Disable-UAC
Disable-InternetExplorerESC
Disable-BingSearch
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions

# choco tools
cinst GoogleChrome
cinst sysinternals
cinst putty
cinst filezilla
cinst skype
cinst fiddler
cinst virtualbox
cinst wget
cinst curl
cinst resharper
cinst gimp
cinst 7zip
cinst dotPeek
cinst spotify --ignore-checksums
cinst StrawberryPerl
cinst emacs64
cinst treesizefree
cinst SQLite
cinst dotnetcore-sdk
cinst aspnetmvc4.install
cinst sql-server-express
cinst sql-server-management-studio
cinst reflector --ignore-checksums
cinst virtuawin
cinst soapui
cinst cloudberryexplorer.azurestorage
cinst mongodb
cinst robomongo
cinst docker
cinst checksum
cinst todoist-outlook
cinst firefox
cinst opera
cinst tor-browser
cinst vscode
cinst vscode-powershell
cinst vscode-csharp
cinst vscode-docker
cinst vscode-mssql
cinst visualstudio2017professional
cinst wireshark
cinst rdcman
cinst nodejs
cinst python
cinst staruml
cinst redis-64
cinst sketchup
cinst azure-data-studio
cinst steam
cinst jing
cinst xmind
cinst winscp
cinst iisexpress --ignore-checksums
cinst microsoft-teams

# own tools
Copy-Item (Join-Path -Path (Get-PackageRoot($MyInvocation)) -ChildPath "1. Install\bin") -Force c:\tools
Copy-Item (Join-Path -Path (Get-PackageRoot($MyInvocation)) -ChildPath "1. Install\smtp4dev") -Force c:\tools
Copy-Item (Join-Path -Path (Get-PackageRoot($MyInvocation)) -ChildPath "1. Install\SQLite") -Force c:\tools
[System.Environment]::SetEnvironmentVariable("PATH", $Env:Path + ";C:\tools\bin", "Machine")
Copy-Item (Join-Path -Path (Get-PackageRoot($MyInvocation)) -ChildPath "2. Config\NazCommander_commands.xml") -Force c:\tools\bin\NazCommander_commands.xml
Copy-Item (Join-Path -Path (Get-PackageRoot($MyInvocation)) -ChildPath "2. Config\.emacs") -Force $env:appdata\.emacs
Copy-Item (Join-Path -Path (Get-PackageRoot($MyInvocation)) -ChildPath "2. Config\yaml-mode.el") -Force $env:appdata\yaml-mode.el
Copy-Item (Join-Path -Path (Get-PackageRoot($MyInvocation)) -ChildPath "2. Config\FileZilla") -Force $env:appdata\FileZilla2
Copy-Item (Join-Path -Path (Get-PackageRoot($MyInvocation)) -ChildPath "2. Config\robomongo.json") -Force $env:homedrive$env:homepath\.config\.robomongo\0.9

# Add registry keys
reg import (Join-Path -Path (Get-PackageRoot($MyInvocation)) -ChildPath "2. Config\putty.reg")
Push-Location
Set-Location HKLM:
New-ItemProperty -Path .\SOFTWARE\Microsoft\Windows\CurrentVersion\Run -Name NazCommander -Value "c:\tools\bin\NazCommander.exe"
Pop-Location


# windows features
cinst Microsoft-Hyper-V-All -source windowsFeatures
cinst IIS-WebServerRole -source windowsfeatures
cinst TelnetClient -source windowsFeatures
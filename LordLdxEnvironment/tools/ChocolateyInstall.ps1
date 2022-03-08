# local functions
Function Enable-Numlock {
    Write-Host "Enabling NumLock after startup..."
    If (!(Test-Path "HKU:")) {
        New-PSDrive -Name HKU -PSProvider Registry -Root HKEY_USERS | Out-Null
    }
    Set-ItemProperty -Path "HKU:\.DEFAULT\Control Panel\Keyboard" -Name "InitialKeyboardIndicators" -Type DWord -Value 2147483650
    Add-Type -AssemblyName System.Windows.Forms
    If (!([System.Windows.Forms.Control]::IsKeyLocked('NumLock'))) {
        $wsh = New-Object -ComObject WScript.Shell
        $wsh.SendKeys('{NUMLOCK}')
    }
}

# general windows settings

Update-ExecutionPolicy Unrestricted
Disable-UAC
Disable-InternetExplorerESC
Disable-BingSearch
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions

# choco tools
choco install GoogleChrome
choco install sysinternals
choco install putty
choco install filezilla
choco install fiddler
choco install wget
choco install curl
choco install gimp
choco install 7zip
choco install dotPeek
choco install treesizefree
choco install SQLite
choco install dotnet
choco install dotnetcore-sdk
choco install dotnet-5.0-sdk
choco install dotnet-6.0-sdk
choco install visualstudio2022professional
choco install visualstudio2022-workload-netweb
choco install visualstudio2022-workload-azure
choco install sql-server-express
choco install sql-server-management-studio
choco install reflector --ignore-checksums
choco install checksum
choco install todoist-outlook
choco install firefox
choco install opera
choco install tor-browser
choco install vscode
choco install vscode-powershell
choco install vscode-csharp
choco install vscode-mssql
choco install vscode-azurerm-tools
choco install azureaccount-vscode
choco install vscode-drawio
choco install wireshark
choco install rdcman
choco install nodejs
choco install python
choco install staruml
choco install redis-64
choco install sketchup
choco install azure-data-studio
choco install steam
choco install battle.net
choco install xmind
choco install winscp
choco install iisexpress --ignore-checksums
choco install fiddler
choco install garmin-express
choco install postman
choco install microsoft-windows-terminal
choco install bitwarden
choco install azure-functions-core-tools
choco install azure-cosmosdb-emulator
choco install azurestorageemulator
choco install grep
choco install azure-cli
choco install NuGet.CommandLine

# allnex
choco install forticlientvpn

# own tools
Copy-Item (Join-Path -Path (Get-PackageRoot($MyInvocation)) -ChildPath "1. Install\bin") -Force c:\tools
Copy-Item (Join-Path -Path (Get-PackageRoot($MyInvocation)) -ChildPath "1. Install\smtp4dev") -Force c:\tools
Copy-Item (Join-Path -Path (Get-PackageRoot($MyInvocation)) -ChildPath "1. Install\SQLite") -Force c:\tools
[System.Environment]::SetEnvironmentVariable("PATH", $Env:Path + ";C:\tools\bin", "Machine")
Copy-Item (Join-Path -Path (Get-PackageRoot($MyInvocation)) -ChildPath "2. Config\NazCommander_commands.xml") -Force c:\tools\bin\NazCommander_commands.xml
Copy-Item (Join-Path -Path (Get-PackageRoot($MyInvocation)) -ChildPath "2. Config\.emacs") -Force $env:appdata\.emacs
Copy-Item (Join-Path -Path (Get-PackageRoot($MyInvocation)) -ChildPath "2. Config\yaml-mode.el") -Force $env:appdata\yaml-mode.el
Copy-Item (Join-Path -Path (Get-PackageRoot($MyInvocation)) -ChildPath "2. Config\FileZilla") -Force $env:appdata\FileZilla2

# Add registry keys
Push-Location
Set-Location HKLM:
New-ItemProperty -Path .\SOFTWARE\Microsoft\Windows\CurrentVersion\Run -Name NazCommander -Value "c:\tools\bin\NazCommander.exe"
Pop-Location


# windows features
choco install Microsoft-Hyper-V-All -source windowsFeatures
choco install IIS-WebServerRole -source windowsfeatures
choco install TelnetClient -source windowsFeatures

# windows config
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions -EnableShowFullPathInTitleBar
Disable-UAC
Enable-Numlock

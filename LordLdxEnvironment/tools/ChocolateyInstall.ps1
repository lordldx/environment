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
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions -EnableShowFullPathInTitleBar
# windows features
choco install Microsoft-Hyper-V-All -source windowsFeatures
choco install IIS-WebServerRole -source windowsfeatures
choco install TelnetClient -source windowsFeatures
choco install Printing-PrintToPDFServices-Features -source windowsFeatures
choco uninstall Printing-XPSServices-Features -source windowsFeatures
choco install NetFx3 -source windowsFeatures # .net framework 3.5; required for garmin express

# choco tools
choco install GoogleChrome
choco install sysinternals
choco install putty
choco install proxyman
choco install wget
choco install curl
choco install gimp
choco install inkscape
choco install 7zip
choco install treesizefree
choco install SQLite
choco install dotnet-sdk
choco install visualstudio2022professional
choco install visualstudio2022-workload-netweb
choco install visualstudio2022-workload-azure
choco install sql-server-express
choco install sql-server-2022
choco install sql-server-management-studio
choco install checksum
choco install firefox
choco install opera
choco install tor-browser
choco install wsl2
choco install podman-cli
choco install podman-desktop
choco install vscode
choco install wireshark
choco install rdcman
choco install nodejs
choco install python
choco install sketchup
choco install steam
choco install spotify
choco install iisexpress --ignore-checksums
choco install garmin-express
choco install microsoft-windows-terminal
choco install oh-my-posh
choco install bitwarden
choco install azure-functions-core-tools
choco install azure-cosmosdb-emulator
choco install azurestorageemulator
choco install grep
choco install azure-cli
choco install heroku-cli
choco install NuGet.CommandLine
choco install lockhunter
choco install ngrok
choco install todoist-desktop
choco install todoist-outlook

Invoke-Reboot  # Force reboot to ensure that the installed programs are "known" in the PATH before calling them to install extensions
# vscode extensions
code --install-extension ms-dotnettools.csdevkit
code --install-extension AzureADB2CTools.aadb2c
code --install-extension hediet.vscode-drawio
code --install-extension platformio.platformio-ide
code --install-extension ms-vscode.PowerShell
code --install-extension esbenp.prettier-vscode
code --install-extension humao.rest-client
code --install-extension Wokwi.wokwi-vscode
code --install-extension bierner.markdown-mermaid

# global node modules
npm install mermaid-cli -g

# also: make sure that things linke containers & mapped container configs are copied over.
# include browser profiles


# allnex
choco install forticlientvpn
choco install xrmtoolbox

# own tools
Copy-Item (Join-Path -Path (Get-PackageRoot($MyInvocation)) -ChildPath "1. Install\bin") -Force c:\tools
Copy-Item (Join-Path -Path (Get-PackageRoot($MyInvocation)) -ChildPath "1. Install\smtp4dev") -Force c:\tools
[System.Environment]::SetEnvironmentVariable("PATH", $Env:Path + ";C:\tools\bin", "Machine")

# Add registry keys
Push-Location
# No longer used, but leaving this in as a reference for possible future regkeys that need to be added
# Set-Location HKLM:
# New-ItemProperty -Path .\SOFTWARE\Microsoft\Windows\CurrentVersion\Run -Name NazCommander -Value "c:\tools\bin\NazCommander.exe"
Pop-Location


# Manual steps
# Configure windows terminal: https://www.hanselman.com/blog/my-ultimate-powershell-prompt-with-oh-my-posh-and-the-windows-terminal
# copy the src folder: c:\src
# copy browser profiles: C:\Users\dieryckxl\AppData\Local\Google\Chrome\User Data
# copy databases: c:\Users\dieryckxl\*.mdf & *.ldf
# copy podman containers: C:\Users\dieryckxl\.local
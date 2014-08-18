@echo off

REM THIS SCRIPT MUST BE RUN AS ADMIN

REM Install Chocolatey Packages
call "1. Install\Install-Chocolatey-Packages.bat"

REM Install other binary tools
copy "1. Install\bin" c:\tools
setx PATH "%PATH%;c:\tools\bin"

REM Install config
copy "2. Config\NazCommander_commands.xml" c:\tools\bin
copy "2. Config\.emacs" %APPDATA%

REM Install autostart applications
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v "NazCommander" /d "c:\tools\bin\NazCommander.exe" /f
pause

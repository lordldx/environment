@echo off

REM THIS SCRIPT MUST BE RUN AS ADMIN

REM Install Chocolatey Packages
cd "1. Install"
call "Install-Chocolatey-Packages.bat"
cd ..

REM Install other binary tools
mkdir c:\tools\bin\
copy "1. Install\bin" c:\tools\bin\
setx PATH "%PATH%;c:\tools\bin"

REM Install config
copy "2. Config\NazCommander_commands.xml" c:\tools\bin\
copy "2. Config\.emacs" %APPDATA%
copy "2. Config\yaml-mode.el" %APPDATA%
regedit /s "2. Config\putty.reg"
xcopy "2. Config\FileZilla" %appdata%\FileZilla2\ /s/h/e/k/f/c
copy "2. Config\robomongo.json" %HOMEDRIVE%%HOMEPATH%\.config\robomongo\0.9

REM Install autostart applications
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v "NazCommander" /d "c:\tools\bin\NazCommander.exe" /f
pause

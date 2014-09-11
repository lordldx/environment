@echo off
REM This script must be run as administrator
REM

powershell -NoProfile -ExecutionPolicy unrestricted .\Install-Chocolatey.ps1
chocolatey install GoogleChrome
chocolatey install sysinternals
chocolatey install putty
chocolatey install filezilla
chocolatey install dropbox
chocolatey install skype
chocolatey install fiddler
chocolatey install virtualbox
chocolatey install wget
chocolatey install curl
chocolatey install resharper
chocolatey install keepass
chocolatey install gimp
chocolatey install 7zip
chocolatey install dotPeek
chocolatey install spotify
chocolatey install StrawberryPerl
chocolatey install Emacs
chocolatey install treesizefree
chocolatey install genymotion
chocolatey install SQLite
chocolatey install aspnetmvc
chocolatey install SqlServer2012Express
chocolatey install AndroidStudio
chocolatey install android-sdk
chocolatey install reflector
chocolatey install virtuawin
chocolatey install soapui
pause
@echo off
REM Run as admin
REM

powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
choco install git
choco install GoogleChrome
choco install sysinternals
choco install putty
choco install filezilla
choco install dropbox
choco install skype
choco install fiddler
choco install virtualbox
choco install wget
choco install curl
choco install resharper
choco install keepass
choco install gimp
choco install 7zip
choco install dotPeek
choco install spotify
choco install StrawberryPerl
choco install Emacs
choco install treesizefree
choco install genymotion
choco install SQLite
choco install aspnetmvc
choco install SqlServer2012Express
choco install AndroidStudio
choco install reflector
choco install virtuawin
pause
@setlocal enableextensions
@cd /d "%~dp0"
@echo off

SET Version=0.5.3.4
SET Arch=x64
SET Location=C:\NSClient
SET Vagrant=C:\vagrant

REM "%Location%\nscp.exe" service --stop

msiexec /i "%Vagrant%\NSCP-%Version%-%Arch%.msi" /passive INSTALLLOCATION="%Location%"

"%Location%\nscp.exe" service --stop
 
xcopy "%Vagrant%\nsclient.ini" "%Location%\" /q /y

"%Location%\nscp.exe" service --start

pause>nul

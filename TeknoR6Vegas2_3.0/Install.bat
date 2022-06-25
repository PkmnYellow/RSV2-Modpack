@echo off
cd /D "%~dp0"
set var=%1

REM --Checks if the directory variable exists. Otherwise, the batch file will terminate.--
if defined var ( echo Universal variable defined...
goto :check_u
) else ( echo Universal variable undefined... 
goto :end )

REM --Checks if TeknoR6Vegas2.exe even exists. An easy way to check if it is installed.--
:check_u
if exist %var%\Binaries\TeknoR6Vegas2.exe" ( echo TeknoR6Vegas2 is already installed.
echo Exiting...
goto :end
) else ( goto :install_u )

REM --A folder and files are copied over containing TeknoR6Vegas2.--
:install_u
robocopy Binaries %var%\Binaries" /e
echo Installation Complete!
goto :config_TR6

:config_TR6
call "..\TeknoR6Vegas2 Configuration.bat" %var%
goto :modcheck

REM --Checks if installedmods.txt exists.--
:modcheck
cd /d "%~dp0"
cd ..
if exist installedmods.txt ( goto :modcheck2
) else ( echo TeknoR6Vegas2 >> installedmods.txt 
echo Installedmods.txt created...
goto :end )

REM --Checks if "TeknoR6Vegas2" is logged in installedmods.txt.--
:modcheck2
set results6=
for /f "tokens=1 delims=" %%h in ('findstr /i "TeknoR6Vegas2" installedmods.txt') do set results6=%%h

if defined results6 ( goto :end
) else ( echo TeknoR6Vegas2 >> installedmods.txt 
echo TeknoR6Vegas2 added to the mod list!
goto :end )

:end
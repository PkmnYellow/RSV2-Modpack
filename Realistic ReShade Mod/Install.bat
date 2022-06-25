@echo off
cd /D "%~dp0"
set var=%1

REM --Checks if the directory variable exists. Otherwise, the batch file will terminate.--
if defined var ( echo Universal variable defined...
goto :install_u
) else ( echo Universal variable undefined... 
goto :end )

REM --If checks are established to create the necessary backup files for installation.--
:install_u
echo Creating backups...
if exist %var%\Backup\KellerGame\Config\DefaultEngine.ini" ( echo DefaultEngine found... 
) else ( echo Adding DefaultEngine to Backup...
mkdir %var%\Backup\KellerGame\Config" 2>nul
copy /Y %var%\KellerGame\Config\DefaultEngine.ini" %var%\Backup\KellerGame\Config" )

if exist %var%\Backup\KellerGame\Config\PCKellerEngine.ini" ( echo PCKellerEngine found...
) else ( echo Adding PCKellerEngine to Backup...
mkdir %var%\Backup\KellerGame\Config" 2>nul
copy /Y %var%\KellerGame\Config\PCKellerEngine.ini" %var%\Backup\KellerGame\Config" )

if exist %var%\Backup\Engine\Config\BaseEngine.ini" ( echo BaseEngine found... 
) else ( echo Adding BaseEngine to Backup...
mkdir %var%\Backup\Engine\Config" 2>nul
copy /Y %var%\Engine\Config\BaseEngine.ini" %var%\Backup\Engine\Config" )

REM --An if check if the ReShade mod already exists.--
:check_u
if exist %var%\Binaries\ReShade" ( echo Reshaders is already installed.
echo Exiting...
goto :end ) else ( goto :install_umod )

REM --This copies all the necessary folders and files to their designated location.--
:install_umod
echo Installing Reshaders...
robocopy KellerGame %var%\KellerGame" /e
robocopy Engine %var%\Engine" /e
robocopy Binaries %var%\Binaries" /e
echo Installation complete!
goto :modcheck

REM --Checks if installedmods.txt exists or not.--
:modcheck
cd ..
if exist installedmods.txt ( goto :modcheck2
) else ( echo Realistic ReShade >> installedmods.txt 
echo Installedmods.txt created...
goto :end )

REM --Checks if "Realistic ReShade" is logged into installedmods.txt.--
:modcheck2
set results4=
for /f "tokens=1 delims=" %%e in ('findstr /i "Realistic ReShade" installedmods.txt') do set results4=%%e

if defined results4 ( goto :end
) else ( echo Realistic ReShade >> installedmods.txt 
echo Realistic ReShade added to the mod list!
goto :end )

:end
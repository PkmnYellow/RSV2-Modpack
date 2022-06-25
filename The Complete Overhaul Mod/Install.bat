@echo off
cd /D "%~dp0"
set var=%1

REM --Checks if the directory variable exists. Otherwise, the batch file will terminate.--
if defined var ( echo Universal variable defined...
goto :install_u
) else ( echo Universal variable undefined... 
goto :end )

REM --Checks if 2 .ini files are backed up or not.--
:install_u
if exist %var%\Backup\KellerGame\Config\DefaultWeaponsConfig.ini" ( echo DefaultWeaponsConfig found... 
) else ( echo Backing up DefaultWeaponsConfig...
mkdir %var%\Backup\KellerGame\Config" 2>nul
copy /Y %var%\KellerGame\Config\DefaultWeaponsConfig.ini" %var%\Backup\KellerGame\Config" )

if exist %var%\Backup\KellerGame\Config\PCKellerWeaponsConfig.ini" ( echo PCKellerWeaponsConfig found... 
) else ( echo Backing up PCKellerWeaponsConfig...
mkdir %var%\Backup\KellerGame\Config" 2>nul
copy /Y %var%\KellerGame\Config\PCKellerWeaponsConfig.ini" %var%\Backup\KellerGame\Config" )

REM --Installation of the Complete Overhaul mod, copying over the folder and files.--
:installmod_u
echo Installing Complete Overhaul Mod...
robocopy KellerGame %var%\KellerGame" /e
echo Installation completed!
goto :modcheck

REM --Checks if installedmods.txt exists.--
:modcheck
cd ..
if exist installedmods.txt ( goto :modcheck2
) else ( echo The Complete Overhaul >> installedmods.txt 
echo Installedmods.txt created...
goto :end )

REM --Checks if "The Complete Overhaul" is logged into installedmods.txt.--
:modcheck2
set results3=
for /f "tokens=1 delims=" %%d in ('findstr /i "The Complete Overhaul" installedmods.txt') do set results3=%%d

if defined results3 ( goto :end
) else ( echo The Complete Overhaul >> installedmods.txt 
echo The Complete Overhaul added to the mod list!
goto :end )

:end
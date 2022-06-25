@echo off
cd /D "%~dp0"
set var=%1

REM --Checks if the directory variable exists. Otherwise, the batch file will terminate.--
if defined var ( echo Universal variable defined...
goto :install_u
) else ( echo Universal variable undefined... 
goto :end )

REM --Checks if 15 .ini files are backed up or not.--
:install_u
if exist %var%\Backup\KellerGame\Config\DefaultDamageTypesConfig.ini" ( echo DefaultDamageTypesConfig found... 
) else ( echo Backing up DefaultDamageTypesConfig...
mkdir %var%\Backup\KellerGame\Config" 2>nul
copy /Y %var%\KellerGame\Config\DefaultDamageTypesConfig.ini" %var%\Backup\KellerGame\Config" )

if exist %var%\Backup\KellerGame\Config\DefaultGadgetsConfig.ini" ( echo DefaultGadgetsConfig found... 
) else ( echo Backing up DefaultGadgetsConfig...
mkdir %var%\Backup\KellerGame\Config" 2>nul
copy /Y %var%\KellerGame\Config\DefaultGadgetsConfig.ini" %var%\Backup\KellerGame\Config" )

if exist %var%\Backup\KellerGame\Config\DefaultProjectilesConfig.ini" ( echo DefaultProjectilesConfig found... 
) else ( echo Backing up DefaultProjectilesConfig...
mkdir %var%\Backup\KellerGame\Config" 2>nul
copy /Y %var%\KellerGame\Config\DefaultProjectilesConfig.ini" %var%\Backup\KellerGame\Config" )

if exist %var%\Backup\KellerGame\Config\DefaultWeaponsConfig.ini" ( echo DefaultWeaponsConfig found... 
) else ( echo Backing up DefaultWeaponsConfig...
mkdir %var%\Backup\KellerGame\Config" 2>nul
copy /Y %var%\KellerGame\Config\DefaultWeaponsConfig.ini" %var%\Backup\KellerGame\Config" )

if exist %var%\Backup\KellerGame\Config\KellerDamageTypesConfig.ini" ( echo KellerDamageTypesConfig found... 
) else ( echo Backing up KellerDamageTypesConfig...
mkdir %var%\Backup\KellerGame\Config" 2>nul
copy /Y %var%\KellerGame\Config\KellerDamageTypesConfig.ini" %var%\Backup\KellerGame\Config" )

if exist %var%\Backup\KellerGame\Config\KellerGadgetsConfig.ini" ( echo KellerGadgetsConfig found... 
) else ( echo Backing up KellerGadgetsConfig...
mkdir %var%\Backup\KellerGame\Config" 2>nul
copy /Y %var%\KellerGame\Config\KellerGadgetsConfig.ini" %var%\Backup\KellerGame\Config" )

if exist %var%\Backup\KellerGame\Config\KellerProjectilesConfig.ini" ( echo KellerProjectilesConfig found... 
) else ( echo Backing up KellerProjectilesConfig...
mkdir %var%\Backup\KellerGame\Config" 2>nul
copy /Y %var%\KellerGame\Config\KellerProjectilesConfig.ini" %var%\Backup\KellerGame\Config" )

if exist %var%\Backup\KellerGame\Config\MovieLoading.ini" ( echo MovieLoading found... 
) else ( echo Backing up MovieLoading...
mkdir %var%\Backup\KellerGame\Config" 2>nul
copy /Y %var%\KellerGame\Config\MovieLoading.ini" %var%\Backup\KellerGame\Config" )

if exist %var%\Backup\KellerGame\Config\PCKellerDamageTypesConfig.ini" ( echo PCKellerDamageTypesConfig found... 
) else ( echo Backing up PCKellerDamageTypesConfig...
mkdir %var%\Backup\KellerGame\Config" 2>nul
copy /Y %var%\KellerGame\Config\PCKellerDamageTypesConfig.ini" %var%\Backup\KellerGame\Config" )

if exist %var%\Backup\KellerGame\Config\PCKellerGadgetsConfig.ini" ( echo PCKellerGadgetsConfig found... 
) else ( echo Backing up PCKellerGadgetsConfig...
mkdir %var%\Backup\KellerGame\Config" 2>nul
copy /Y %var%\KellerGame\Config\PCKellerGadgetsConfig.ini" %var%\Backup\KellerGame\Config" )

if exist %var%\Backup\KellerGame\Config\PCKellerProjectilesConfig.ini" ( echo PCKellerProjectilesConfig found... 
) else ( echo Backing up PCKellerProjectilesConfig...
mkdir %var%\Backup\KellerGame\Config" 2>nul
copy /Y %var%\KellerGame\Config\PCKellerProjectilesConfig.ini" %var%\Backup\KellerGame\Config" )

if exist %var%\Backup\KellerGame\Config\PCKellerWeaponsConfig.ini" ( echo PCKellerWeaponsConfig found... 
) else ( echo Backing up PCKellerWeaponsConfig...
mkdir %var%\Backup\KellerGame\Config" 2>nul
copy /Y %var%\KellerGame\Config\PCKellerWeaponsConfig.ini" %var%\Backup\KellerGame\Config" )

if exist %var%\Backup\KellerGame\Localization\Int\R6Game.int" ( echo R6Game found... 
) else ( echo Backing up R6Game...
mkdir %var%\Backup\KellerGame\Localization\Int" 2>nul
copy /Y %var%\KellerGame\Localization\Int\R6Game.int" %var%\Backup\KellerGame\Localization\Int" )

if exist %var%\Backup\KellerGame\Localization\Int\R6Hud.int" ( echo R6Hud found... 
) else ( echo Backing up R6Hud...
mkdir %var%\Backup\KellerGame\Localization\Int" 2>nul
copy /Y %var%\KellerGame\Localization\Int\R6Hud.int" %var%\Backup\KellerGame\Localization\Int" )

if exist %var%\Backup\KellerGame\Localization\Int\R6Menus.int" ( echo R6Menus found... 
) else ( echo Backing up R6Menus...
mkdir %var%\Backup\KellerGame\Localization\Int" 2>nul
copy /Y %var%\KellerGame\Localization\Int\R6Menus.int" %var%\Backup\KellerGame\Localization\Int" )

REM --Installation, copying over 2 folders and its files.--
:installmod_u
echo Installing Vegas 2 Realism Mod...
robocopy KellerGame %var%\KellerGame" /e
robocopy Localization %var%\KellerGame" /e
echo Installation Completed!
goto :modcheck

REM --Checks if installedmods.txt exists.--
:modcheck
cd ..
if exist installedmods.txt ( goto :modcheck2
) else ( echo Vegas 2 Realism >> installedmods.txt 
echo Installedmods.txt created...
goto :end )

REM --Checks if "Vegas 2 Realism" is logged in installedmods.txt.--
:modcheck2
set results=
for /f "tokens=1 delims=" %%b in ('findstr /C:"Vegas 2 Realism" installedmods.txt') do set results=%%b

if defined results ( goto :end
) else ( echo Vegas 2 Realism >> installedmods.txt 
echo Vegas 2 Realism added to the mod list!
goto :end )

:end
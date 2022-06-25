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
if exist %var%\Backup\KellerGame\CookedPC\Packages\Camera\CameraConfig.uppc" ( echo CameraConfig found...
) else ( echo Adding CameraConfig.uppc to Backup...
mkdir %var%\Backup\KellerGame\CookedPC\Packages\Camera" 2>nul 
copy /Y %var%\KellerGame\CookedPC\Packages\Camera\CameraConfig.uppc" %var%\Backup\KellerGame\CookedPC\Packages\Camera" )

:installmod_u
echo Installing FOV...
robocopy KellerGame %var%\KellerGame" /e
echo Installation complete!
goto :modcheck

REM --Checks if installedmods.txt exists or not.--
:modcheck
cd ..\..
if exist installedmods.txt ( goto :modcheck2
) else ( echo FOV 100 >> installedmods.txt 
echo Installedmods.txt created...
goto :end )

REM --Checks if "FOV 100" is logged into installedmods.txt.--
:modcheck2
set results9=
for /f "tokens=1 delims=" %%e in ('findstr /i "FOV 100" installedmods.txt') do set results9=%%e

if defined results9 ( goto :end
) else ( echo FOV 100 >> installedmods.txt 
echo FOV 100 added to the mod list!
goto :end )

:end
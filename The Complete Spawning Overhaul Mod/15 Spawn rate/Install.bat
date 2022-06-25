@echo off
cd /D "%~dp0"
set var=%1

REM --Checks if the directory variable exists. Otherwise, the batch file will terminate.--
if defined var ( echo Universal variable defined...
goto :install_u
) else ( echo Universal variable undefined... 
goto :end )

REM --Installation, copying over the folder and file.--
:install_u
echo Installing Spawning Overhaul Mod...
robocopy KellerGame %var%\KellerGame" /e
echo Installation completed!
goto :modcheck

REM --Checks if installedmods.txt exists.--
:modcheck
cd ..\..
if exist installedmods.txt ( goto :modcheck2
) else ( echo The Complete Spawning Overhaul >> installedmods.txt 
echo Installedmods.txt created...
goto :end )

REM --Checks if "The Complete Spawning OVerhaul" is logged into installedmods.txt.--
:modcheck2
set results2=
for /f "tokens=1 delims=" %%c in ('findstr /c:"The Complete Spawning Overhaul" installedmods.txt') do set results2=%%c

if defined results2 ( goto :end
) else ( echo The Complete Spawning Overhaul >> installedmods.txt 
echo The Complete Spawning Overhaul added to the mod list!
goto :end )

:end
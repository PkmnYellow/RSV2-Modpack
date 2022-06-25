@echo off
cd /D "%~dp0"
set var=%1

REM --Checks if the directory variable exists. Otherwise, the batch file will terminate.--
if defined var ( echo Universal variable defined...
goto :install_u
) else ( echo Universal variable undefined... 
goto :end )

REM --Checks if 1 .ini file is backed up or not.--
:install_u
if exist %var%\Backup\KellerGame\Config\PC\R6VegasServerConfig.ini" ( echo R6VegasServerConfig found...
) else ( echo Backing up R6VegasServerConfig...
mkdir %var%\Backup\KellerGame\Config\PC" 2>nul 
copy /Y %var%\KellerGame\Config\PC\R6VegasServerConfig.ini" %var%\Backup\KellerGame\Config\PC" )

REM --Installation of the Vegas2THServer, copying over the .ini, and the .bats.--
:installmod_u
echo Installing Vegas2THServer...
robocopy KellerGame %var%\KellerGame" /e
robocopy Binaries %var%\Binaries" /e
echo Installation completed!
goto :modcheck

REM --Checks if installedmods.txt exists.--
:modcheck
cd ..
if exist installedmods.txt ( goto :modcheck2
) else ( echo Vegas2THServer >> installedmods.txt 
echo Installedmods.txt created...
goto :end )

REM --Checks if "Vegas2THServer" is logged into installedmods.txt.--
:modcheck2
set results8=
for /f "tokens=1 delims=" %%d in ('findstr /i "Vegas2THServer" installedmods.txt') do set results8=%%d

if defined results8 ( goto :end
) else ( echo Vegas2THServer >> installedmods.txt 
echo Vegas2THServer added to the mod list!
goto :end )

:end
@echo off
set main="%~dp0"
cd /D "%~dp0"
set var=%1

REM --Checks if the directory variable exists. Otherwise, the batch file will terminate.--
if defined var ( echo Universal variable defined...
goto :install_u
) else ( echo Universal variable undefined... 
goto :end )

REM --A single .ini file is backed up, or already backed up.--
:install_u
if exist %var%\Backup\KellerGame\Config\PCKellerInput.ini" ( echo PCKellerInput found... 
) else ( echo Backing up PCKellerInput...
mkdir %var%\Backup\KellerGame\Config" 2>nul
copy /Y %var%\KellerGame\Config\PCKellerInput.ini" %var%\Backup\KellerGame\Config" )

REM --Installation for THC, copying over a folder and the .ini.--
:installmod_u
echo Installing Terrorist Hunt Control Mod...
copy /Y "KellerGame\Config\PCKellerInput (New).ini" %var%\KellerGame\Config"
del /q %var%\KellerGame\Config\PCKellerInput.ini"
cd %var%\KellerGame\Config"
echo Reverting name back to default...
ren "PCKellerInput (New).ini" "PCKellerInput.ini"
cd /D %main%
echo Installation Completed!
goto :modcheck

REM --Checks if installedmods.txt exists.--
:modcheck
cd ..
if exist installedmods.txt ( goto :modcheck2
) else ( echo Terrorist Hunt Control [New] >> installedmods.txt 
echo Installedmods.txt created...
goto :end )

REM --Checks if "Terrorist Hunt Control" is logged in installedmods.txt.--
:modcheck2
set results5=
for /f "tokens=1 delims=" %%f in ('findstr /c:"Terrorist Hunt Control [New]" installedmods.txt') do set results5=%%f

if defined results5 ( goto :end
) else ( echo Terrorist Hunt Control [New] >> installedmods.txt 
echo Terrorist Hunt Control added to the mod list!
goto :end )

:end
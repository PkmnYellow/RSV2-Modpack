@echo off
set var=%1

REM --Checks if the directory variable exists. Otherwise, the batch file will terminate.--
if defined var ( echo Universal variable defined...
goto :uninstall_u
) else ( echo Universal variable undefined... 
goto :end )

REM --Checks if 1 .ini file is backed up. Otherwise, the batch file will terminate as a fail safe. Afterwards, the backups are copied.--
:uninstall_u
if not exist %var%\Backup\KellerGame\Config\PC\R6VegasServerConfig.ini" ( echo DefaultWeaponsConfig backup NOT FOUND, uninstall.bat terminated...
pause
goto :end 
)
echo Uninstalling Vegas2THServer pre-setup...

copy /Y %var%\Backup\KellerGame\Config\PC\R6VegasServerConfig.ini" %var%\KellerGame\Config\PC"
del /q %var%\Binaries\CalypsoCasino.bat" 2>nul
del /q %var%\Binaries\ComcastEvent.bat" 2>nul
del /q %var%\Binaries\ConventionCenter.bat" 2>nul
del /q %var%\Binaries\Import.bat" 2>nul
del /q %var%\Binaries\KillHouse.bat" 2>nul
del /q %var%\Binaries\Murdertown.bat" 2>nul
del /q %var%\Binaries\MurdertownN.bat" 2>nul
del /q %var%\Binaries\OilRefinery.bat" 2>nul
del /q %var%\Binaries\Penthouse.bat" 2>nul
del /q %var%\Binaries\Presidio.bat" 2>nul
del /q %var%\Binaries\Streets.bat" 2>nul
del /q %var%\Binaries\Theater.bat" 2>nul
del /q %var%\Binaries\ThreeKingdomsCasino.bat" 2>nul
del /q %var%\Binaries\Training.bat" 2>nul
del /q %var%\Binaries\TrainingN.bat" 2>nul
del /q %var%\Binaries\Trainyard.bat" 2>nul
del /q %var%\Binaries\VegasJunkyard.bat" 2>nul
echo Uninstalled!
goto :end

:end
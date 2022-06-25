@echo off
set var=%1

REM --Checks if the directory variable exists. Otherwise, the batch file will terminate.--
if defined var ( echo Universal variable defined...
goto :uninstall_u
) else ( echo Universal variable undefined... 
goto :end )

REM --If checks for each .ini backup needs to exist, otherwise the batch file will terminate. This is a fail safe, to prevent people from deleting the original files of the game.--
:uninstall_u
if not exist %var%\Backup\KellerGame\CookedPC\Packages\Camera\CameraConfig.uppc" ( echo DefaultEngine backup NOT FOUND, uninstall.bat terminated...
pause
goto :end
)

echo Uninstalling FOV...
echo Copying backup files...
copy /Y %var%\Backup\KellerGame\CookedPC\Packages\Camera\CameraConfig.uppc" %var%\KellerGame\CookedPC\Packages\Camera"
echo Done!
goto :end

:end
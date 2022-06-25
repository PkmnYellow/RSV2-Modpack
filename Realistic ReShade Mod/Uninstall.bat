@echo off
set var=%1

REM --Checks if the directory variable exists. Otherwise, the batch file will terminate.--
if defined var ( echo Universal variable defined...
goto :uninstall_u
) else ( echo Universal variable undefined... 
goto :end )

REM --If checks for each .ini backup needs to exist, otherwise the batch file will terminate. This is a fail safe, to prevent people from deleting the original files of the game. Afterwards, the ReShade files are deleted, and the backup files will be copied over.--
:uninstall_u
if not exist %var%\Backup\KellerGame\Config\DefaultEngine.ini" ( echo DefaultEngine backup NOT FOUND, uninstall.bat terminated...
pause
goto :end
)
if not exist %var%\Backup\KellerGame\Config\PCKellerEngine.ini" ( echo PCKellerEngine backup NOT FOUND, uninstall.bat terminated...
pause
goto :end 
)
if not exist %var%\Backup\Engine\Config\BaseEngine.ini" ( echo BaseEngine backup NOT FOUND, uninstall.bat terminated...
pause
goto :end
)
echo Uninstalling Realistic Reshade...
del /q %var%\Binaries\d3d9.dll"
del /q %var%\Binaries\ReShade.fx"
rmdir /s /q %var%\Binaries\ReShade"
echo Copying backup files...
copy /Y %var%\Backup\KellerGame\Config\DefaultEngine.ini" %var%\KellerGame\Config" 
copy /Y %var%\Backup\KellerGame\Config\PCKellerEngine.ini" %var%\KellerGame\Config"
copy /Y %var%\Backup\Engine\Config\BaseEngine.ini" %var%\Engine\Config"
echo Done!
goto :end

:end
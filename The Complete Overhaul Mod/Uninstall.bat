@echo off
set var=%1

REM --Checks if the directory variable exists. Otherwise, the batch file will terminate.--
if defined var ( echo Universal variable defined...
goto :uninstall_u
) else ( echo Universal variable undefined... 
goto :end )

REM --Checks if 2 .ini files are backed up. Otherwise, the batch file will terminate as a fail safe. Afterwards, the backups are copied, and 1 .ini file is deleted.--
:uninstall_u
if not exist %var%\Backup\KellerGame\Config\DefaultWeaponsConfig.ini" ( echo DefaultWeaponsConfig backup NOT FOUND, uninstall.bat terminated...
pause
goto :end 
)
if not exist %var%\Backup\KellerGame\Config\PCKellerWeaponsConfig.ini" ( echo PCKellerWeaponsConfig backup NOT FOUND, uninstall.bat terminated...
pause
goto :end
)
echo Uninstalling Complete Overhaul...
attrib -R %var%\KellerGame\Config\DefaultWeaponsConfig.ini"
attrib -R %var%\KellerGame\Config\KellerWeaponsConfig.ini"
attrib -R %var%\KellerGame\Config\PCKellerWeaponsConfig.ini"
echo Copying backup files...
copy /Y %var%\Backup\KellerGame\Config\DefaultWeaponsConfig.ini" %var%\KellerGame\Config"
del /q %var%\KellerGame\Config\KellerWeaponsConfig.ini"
copy /Y %var%\Backup\KellerGame\Config\PCKellerWeaponsConfig.ini" %var%\KellerGame\Config"
echo Uninstalled!
goto :end

:end
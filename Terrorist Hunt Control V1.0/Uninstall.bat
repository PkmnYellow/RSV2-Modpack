@echo off
set var=%1

REM --Checks if the directory variable exists. Otherwise, the batch file will terminate.--
if defined var ( echo Universal variable defined...
goto :uninstall_u
) else ( echo Universal variable undefined... 
goto :end )

REM --Checks if the original PCKellerInput.ini is backed up. Otherwise, the batch file will terminate. A fail safe. Afterwards, the original copy replaces the new one.--
:uninstall_u
if not exist %var%\Backup\KellerGame\Config\PCKellerInput.ini" ( echo PCKellerInput backup NOT FOUND, uninstall.bat terminated...
pause
goto :end 
)
echo Uninstalling Terrorist Hunt Control...
attrib -R %var%\KellerGame\Config\PCKellerInput.ini"
echo Copying backup files...
copy /Y %var%\Backup\KellerGame\Config\PCKellerInput.ini" %var%\KellerGame\Config"
echo Uninstalled!
goto :end

:end
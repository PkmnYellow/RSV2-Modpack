@echo off
set var=%1

REM --Checks if the directory variable exists. Otherwise, the batch file will terminate.--
if defined var ( echo Universal variable defined...
goto :uninstall_u
) else ( echo Universal variable undefined... 
goto :end )

REM --Uninstallation, 1 .ini file is deleted. This file is just an optional addition to RSV2, rather than a required one.--
:uninstall_u
echo Uninstalling Spawn Overhaul...
attrib -R %var%\KellerGame\Config\PlatformSpecificConfigPC.ini"
del /q %var%\KellerGame\Config\PlatformSpecificConfigPC.ini" 
echo Uninstallation complete!
goto :end

:end
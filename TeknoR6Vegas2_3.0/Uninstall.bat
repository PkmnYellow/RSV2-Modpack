@echo off
set var=%1

REM --Checks if the directory variable exists. Otherwise, the batch file will terminate.--
if defined var ( echo Universal variable defined...
goto :uninstall_u
) else ( echo Universal variable undefined... 
goto :end )

REM --Uninstallation for TeknoR6Vegas2. This is more simple than others, since TeknoR6Vegas2 doesn't require any RSV2 .ini files.--
:uninstall_u
echo Uninstalling TeknoR6Vegas2...
del /q %var%\Binaries\TeknoR6Vegas2.exe"
del /q %var%\Binaries\readme.txt"
del /q %var%\Binaries\Run*.bat" 2>nul
del /q "Run TeknoR6Vegas2*.lnk"
echo Uninstallation Complete!
goto :end

:end
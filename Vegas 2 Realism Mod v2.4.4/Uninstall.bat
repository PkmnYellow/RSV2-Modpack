@echo off
set var=%1

REM --Checks if the directory variable exists. Otherwise, the batch file will terminate.--
if defined var ( echo Universal variable defined...
goto :uninstall_u
) else ( echo Universal variable undefined... 
goto :end )

REM --Checks if 13 .ini files and 3 .int are backed up. Otherwise, the batch file will terminate as a fail safe. Afterwards, 11 original .ini files are copied over, 2 deleted, and the 3 .int files are deleted.--
:uninstall_u
if not exist %var%\Backup\KellerGame\Config\DefaultDamageTypesConfig.ini" ( echo DefaultDamageTypesConfig backup NOT FOUND, uninstall.bat terminated...
pause
goto :end 
)
if not exist %var%\Backup\KellerGame\Config\DefaultGadgetsConfig.ini" ( echo DefaultGadgetsConfig backup NOT FOUND, uninstall.bat terminated...
pause
goto :end 
)
if not exist %var%\Backup\KellerGame\Config\DefaultProjectilesConfig.ini" ( echo DefaultProjectilesConfig backup NOT FOUND, uninstall.bat terminated...
pause
goto :end 
)
if not exist %var%\Backup\KellerGame\Config\DefaultWeaponsConfig.ini" ( echo DefaultWeaponsConfig backup NOT FOUND, uninstall.bat terminated...
pause
goto :end 
)
if not exist %var%\Backup\KellerGame\Config\KellerDamageTypesConfig.ini" ( echo KellerDamageTypesConfig backup NOT FOUND, uninstall.bat terminated...
pause
goto :end 
)
if not exist %var%\Backup\KellerGame\Config\KellerGadgetsConfig.ini" ( echo KellerGadgetsConfig backup NOT FOUND, uninstall.bat terminated...
pause
goto :end 
)
if not exist %var%\Backup\KellerGame\Config\KellerProjectilesConfig.ini" ( echo KellerProjectilesConfig backup NOT FOUND, uninstall.bat terminated...
pause
goto :end 
)
if not exist %var%\Backup\KellerGame\Config\MovieLoading.ini" ( echo MovieLoading backup NOT FOUND, uninstall.bat terminated...
pause
goto :end 
)
if not exist %var%\Backup\KellerGame\Config\PCKellerDamageTypesConfig.ini" ( echo PCKellerDamageTypesConfig backup NOT FOUND, uninstall.bat terminated...
pause
goto :end 
)
if not exist %var%\Backup\KellerGame\Config\PCKellerGadgetsConfig.ini" ( echo PCKellerGadgetsConfig backup NOT FOUND, uninstall.bat terminated...
pause
goto :end 
)
if not exist %var%\Backup\KellerGame\Config\PCKellerProjectilesConfig.ini" ( echo PCKellerProjectilesConfig backup NOT FOUND, uninstall.bat terminated...
pause
goto :end 
)
if not exist %var%\Backup\KellerGame\Config\PCKellerWeaponsConfig.ini" ( echo PCKellerWeaponsConfig backup NOT FOUND, uninstall.bat terminated...
pause
goto :end
)
if not exist %var%\Backup\KellerGame\Localization\Int\R6Game.int" ( echo R6Game backup NOT FOUND, uninstall.bat terminated...
pause
goto :end
) 
if not exist %var%\Backup\KellerGame\Localization\Int\R6Hud.int" ( echo R6Hud backup NOT FOUND, uninstall.bat terminated...
pause
goto :end
)
if not exist %var%\Backup\KellerGame\Localization\Int\R6Menus.int" ( echo R6Menus backup NOT FOUND, uninstall.bat terminated...
pause
goto :end 
)
echo Uninstalling Vegas 2 Realism Mod...
attrib -R %var%\KellerGame\Config\DefaultDamageTypesConfig.ini"
attrib -R %var%\KellerGame\Config\DefaultGadgetsConfig.ini"
attrib -R %var%\KellerGame\Config\DefaultProjectilesConfig.ini"
attrib -R %var%\KellerGame\Config\DefaultWeaponsConfig.ini"
attrib -R %var%\KellerGame\Config\KellerDamageTypesConfig.ini"
attrib -R %var%\KellerGame\Config\KellerProjectilesConfig.ini"
attrib -R %var%\KellerGame\Config\MovieLoading.ini"
attrib -R %var%\KellerGame\Config\PCKellerDamageTypesConfig.ini"
attrib -R %var%\KellerGame\Config\PCKellerGadgetsConfig.ini"
attrib -R %var%\KellerGame\Config\PCKellerProjectilesConfig.ini"
attrib -R %var%\KellerGame\Config\KellerWeaponsConfig.ini"
attrib -R %var%\KellerGame\Config\PCKellerWeaponsConfig.ini"
echo Copying backup files...
copy /Y %var%\Backup\KellerGame\Config\DefaultDamageTypesConfig.ini" %var%\KellerGame\Config"
copy /Y %var%\Backup\KellerGame\Config\DefaultGadgetsConfig.ini" %var%\KellerGame\Config"
copy /Y %var%\Backup\KellerGame\Config\DefaultProjectilesConfig.ini" %var%\KellerGame\Config"
copy /Y %var%\Backup\KellerGame\Config\DefaultWeaponsConfig.ini" %var%\KellerGame\Config"
copy /Y %var%\Backup\KellerGame\Config\KellerDamageTypesConfig.ini" %var%\KellerGame\Config"
copy /Y %var%\Backup\KellerGame\Config\KellerProjectilesConfig.ini" %var%\KellerGame\Config"
copy /Y %var%\Backup\KellerGame\Config\MovieLoading.ini" %var%\KellerGame\Config"
copy /Y %var%\Backup\KellerGame\Config\PCKellerDamageTypesConfig.ini" %var%\KellerGame\Config"
copy /Y %var%\Backup\KellerGame\Config\PCKellerGadgetsConfig.ini" %var%\KellerGame\Config"
copy /Y %var%\Backup\KellerGame\Config\PCKellerProjectilesConfig.ini" %var%\KellerGame\Config"
copy /Y %var%\Backup\KellerGame\Config\PCKellerWeaponsConfig.ini" %var%\KellerGame\Config"
copy /Y %var%\Backup\KellerGame\Localization\Int\R6Game.int" %var%\KellerGame\Localization\Int"
copy /Y %var%\Backup\KellerGame\Localization\Int\R6Hud.int" %var%\KellerGame\Localization\Int"
copy /Y %var%\Backup\KellerGame\Localization\Int\R6Menus.int" %var%\KellerGame\Localization\Int"
del /q %var%\KellerGame\Config\KellerWeaponsConfig.ini"
del /q %var%\KellerGame\Config\PlatformSpecificConfigPC.ini" 2>nul
echo Uninstalled!
goto :end

:end
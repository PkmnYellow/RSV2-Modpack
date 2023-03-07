@echo off
cd /D "%~dp0"
set var=%1

REM --Checks if the directory variable exists. Otherwise, the batch file will terminate.--
if defined var ( echo Universal variable defined...
goto :check_u
) else ( echo Universal variable undefined... 
goto :end )

REM --Checks if TeknoR6Vegas2.exe even exists. An easy way to check if it is installed.--
:check_u
if exist %var%\Binaries\TeknoR6Vegas2.exe" ( echo TeknoR6Vegas2 is already installed.
echo Exiting...
goto :end
) else ( goto :install_u )

REM --A folder and files are copied over containing TeknoR6Vegas2.--
:install_u
robocopy Binaries %var%\Binaries" /e
echo Installation Complete!
goto :config_TR6

:config_TR6
color C
cd ..
set "vdir=%~dp0"
set "vdir=%vdir:~0,-18%"

echo -------------------------------TeknoR6Vegas2 Configuration-------------------------------

REM --User inputs player cap for RSV2.--
:playercap_u
echo.
echo 0. No PlayerCap (default)
echo 1. PlayerCap (16 players)
set c=
set /p c=Type the corresponding number for PlayerCap [0/1]:
if "%c%"=="" ( echo No input added...
goto :playercap_u
)
if %c%==0 goto :terroristcount_u
if %c%==1 goto :terroristcount_u
echo "%c%" is not valid, try again.
goto :playercap_u

REM --User inputs total amount of terrorists for TH.--
:terroristcount_u
echo.
set c2=
set /p c2=How many terrorists would you like to spawn [0 default, 1-99]?
if not defined c2 ( echo No input added...
goto :terroristcount_u
)
if %c2%==0 goto :eyefinity_u
if %c2% LEQ 99 ( if %c2% GEQ 1 ( goto :eyefinity_u
) )
echo "%c2%" is not valid, try again.
goto :terroristcount_u

REM --User inputs Eyefinity patch for 3 monitor gaming.--
:eyefinity_u
echo.
echo 0. No Eyefinity Patch
echo 1. Eyefinity Patch (3 monitors only)
set c3=
set /p c3=Type the corresponding number for the Eyefinity Patch [0/1]:
if not defined c3 ( echo No input added...
goto :eyefinity_u
)
if %c3%==0 goto :batch
if %c3%==1 goto :batch
echo "%c3%" is not valid, try again.
goto :eyefinity_u

REM --A batch file is created from the user's above inputs, and an if check is initiated for a shortcut to said batch file.--
:batch
echo @echo off > %var%\Binaries\RunTR6Vegas2.bat"
echo cd /D %var%\Binaries\" >> %var%\Binaries\RunTR6Vegas2.bat"
echo. >> %var%\Binaries\RunTR6Vegas2.bat"
echo REM --Starts TeknoR6Vegas2 with the proper patches.-- >> %var%\Binaries\RunTR6Vegas2.bat"
echo :start >> %var%\Binaries\RunTR6Vegas2.bat"
echo TeknoR6Vegas2 %c% %c2% %c3% >> %var%\Binaries\RunTR6Vegas2.bat"
echo. >> %var%\Binaries\RunTR6Vegas2.bat"
echo REM You can edit the values manually to enable 16 Players, Terrorist spawning, and Eyefinity patch. >> %var%\Binaries\RunTR6Vegas2.bat"
echo REM Example: TeknoR6Vegas2 1 (16 players enabled) 99 (terrorists) 0 (Eyefinity patch disabled) >> %var%\Binaries\RunTR6Vegas2.bat"
echo. >> %var%\Binaries\RunTR6Vegas2.bat"
echo :end >> %var%\Binaries\RunTR6Vegas2.bat"
echo exit >> %var%\Binaries\RunTR6Vegas2.bat"
if exist "Run TeknoR6Vegas2 (Admin only).lnk" ( echo TeknoR6Vegas2 shortcut detected...
goto :decision
) else ( goto :vbscript )

REM --A VBscript is created to link the above batch file in the Temp folder. Afterwards, it is ran and deleted. Referenced from: https://superuser.com/questions/455364/how-to-create-a-shortcut-using-a-batch-script.--
:vbscript
echo Creating TeknoR6Vegas2 shortcut...
set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"

echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%vdir%Run TeknoR6Vegas2 (Admin only).lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = %var%\Binaries\RunTR6Vegas2.bat" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%

cscript /nologo %SCRIPT%
pause
del %SCRIPT%
goto :text

REM --The user is notified of the shortcut created, and it proceeds to end the installation.--
:text
cls
echo You can launch TeknoR6Vegas2 with the shortcut created in this folder labelled 'Run TeknoR6Vegas2 (Admin only)'.
pause
cls

goto :modcheck

REM --Checks if installedmods.txt exists.--
:modcheck
color B
cd /d "%~dp0"
cd ..
if exist installedmods.txt ( goto :modcheck2
) else ( echo TeknoR6Vegas2 >> installedmods.txt 
echo Installedmods.txt created...
goto :end )

REM --Checks if "TeknoR6Vegas2" is logged in installedmods.txt.--
:modcheck2
set results6=
for /f "tokens=1 delims=" %%h in ('findstr /i "TeknoR6Vegas2" installedmods.txt') do set results6=%%h

if defined results6 ( goto :end
) else ( echo TeknoR6Vegas2 >> installedmods.txt 
echo TeknoR6Vegas2 added to the mod list!
goto :end )

:end
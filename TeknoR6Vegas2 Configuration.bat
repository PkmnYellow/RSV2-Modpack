@echo off
color C
set "vdir=%~dp0"
cd /D "%~dp0"

echo -------------------------------TeknoR6Vegas2 Configuration-------------------------------

REM --Checks for admin privileges, and if directories.txt exists.--
:checks
net session >nul 2>&1
if %errorlevel%==0 ( echo Administrator privileges detected...
goto :grabv
) else ( echo Not in Administrator mode. Please run TeknoR6Vegas2 Config.bat in Admin mode.
echo.
echo Closing program...
pause
goto :end )

REM --Grabs directory from directories.txt, and adjusts the directory if entered manually.--
:grabv
if not exist directories.txt ( echo Directories.txt is missing...
echo Run Run.bat.
pause
goto :end
)
for /f "tokens=1 delims=" %%a in (directories.txt) do set var=%%a
if not defined var ( echo Directories.txt is empty...
echo Run Run.bat, and try again.
pause
goto :end
)
set var2=%var:~0,-1%
set vegas=%var2:~-7%
echo.
if /i "%vegas%"==" Vegas " ( echo No spaces in directory, no adjustments needed.
goto :skip
)
set var=%var:~0,-1%
:skip
set var="%var%
echo Directory grabbed.

REM --Checks if TeknoR6Vegas2 exists. Otherwise, it will go back to Universal Installer.--
:install_u
if not exist %var%\Binaries\TeknoR6Vegas2.exe" ( echo TeknoR6Vegas2 is NOT installed. Heading back to UI.bat...
pause
goto :UI
)

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
goto :decision

REM --The user is notified of the shortcut created, and it proceeds to prompt the user to input where they want to go next.--
:decision
cls
echo You can launch TeknoR6Vegas2 with the shortcut created in this folder labelled 'Run TeknoR6Vegas2 (Admin only)'.
pause
cls
:decision_a
echo.
echo 1. Go to Universal Installer
echo 2. Go back to start
echo 3. Exit Launcher
set decision=
set /p decision=Where would you like to go?[1/2/3]:
if not defined decision ( echo No input added...
goto :decision_a
)
if '%decision%'=='1' goto :UI
if '%decision%'=='2' ( goto :playercap_u
cls
)
if '%decision%'=='3' goto :end
echo "%decision%" is not valid, try again.
goto :decision_a

REM --Universal Installer is called.--
:UI
call "Universal Installer.bat" %var%
goto :end

:end
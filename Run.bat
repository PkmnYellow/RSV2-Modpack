@echo off
color 6
cd /D "%~dp0"

echo -------------------------------RSV2 Directory Finder-------------------------------

REM --Checks for admin privileges, and if directories.txt exists.--
:checks
net session >nul 2>&1
if %errorlevel%==0 ( echo Administrator privileges detected...
) else ( echo Not in Administrator mode. Please run Run.bat in Admin mode.
echo.
echo Closing program...
pause
goto :end )

if exist directories.txt ( goto :loopf
)

REM --This is used to grab the drive letters available, and store them into a variable from a temporary TXT file via 2 'for' loops.--
:process_m
echo Searching Drive letters...
wmic logicaldisk get name | findstr /i /v Name >nul 2>&1 > driveletters.txt
if not %errorlevel%==0 ( echo Previous version of WMIC detected...
wmic logicaldisk list /format:list | findstr /i "Name=.:" > driveletters.txt
)

for /f "tokens=1 delims= " %%a in ('findstr ".:" driveletters.txt') do call :process %%a
goto :choice

REM --Part of the process for :process_m. It references the drive letters and sets them in their respective variable, and echos the available drives.--
:process
set drive=%1
for %%b in (b c d e f g h i j k l m) do if /I %%b:==%drive% ( set %%b=%drive%
echo Drive %drive% available.
)
exit /b

REM --User inputs which drive RSV2 is in.--
:choice
set choice=
echo.
echo 1. B
echo 2. C
echo 3. D
echo 4. E
echo 5. F
echo 6. G
echo 7. H
echo 8. I
echo 9. J
echo 10. K
echo 11. L
echo 12. M
set /p choice=Select the Drive R6V2 resides in:
if /I '%choice%'=='B' goto :drive1
if /I '%choice%'=='C' goto :drive2
if /I '%choice%'=='D' goto :drive3
if /I '%choice%'=='E' goto :drive4
if /I '%choice%'=='F' goto :drive5
if /I '%choice%'=='G' goto :drive6
if /I '%choice%'=='H' goto :drive7
if /I '%choice%'=='I' goto :drive8
if /I '%choice%'=='J' goto :drive9
if /I '%choice%'=='K' goto :drive10
if /I '%choice%'=='L' goto :drive11
if /I '%choice%'=='M' goto :drive12
echo "%choice%" is not valid, try again.
goto :choice

REM --This checks to make sure a user does not input the wrong drive letter that does not exist.--
:drive1
if "%b%"=="" ( echo B: drive is not selectable... going back to the choice menu.
echo.
goto :choice
) else ( set md=B:
goto :loop )

:drive2
if "%c%"=="" ( echo C: drive is not selectable... going back to the menu.
echo.
goto :choice 
) else ( set md=C:
goto :loop )

:drive3
if "%d%"=="" ( echo D: drive is not selectable... going back to the menu.
echo.
goto :choice 
) else ( set md=D:
goto :loop )

:drive4
if "%e%"=="" ( echo E: drive is not selectable... going back to the menu.
echo.
goto :choice
) else ( set md=E:
goto :loop )

:drive5
if "%f%"=="" ( echo F: drive is not selectable... going back to the menu.
echo.
goto :choice
) else ( set md=F:
goto :loop )

:drive6
if "%g%"=="" ( echo G: drive is not selectable... going back to the menu.
echo.
goto :choice
) else ( set md=G:
goto :loop )

:drive7
if "%h%"=="" ( echo H: drive is not selectable... going back to the menu.
echo.
goto :choice
) else ( set md=H:
goto :loop )

:drive8
if "%i%"=="" ( echo I: drive is not selectable... going back to the menu.
echo.
goto :choice
) else ( set md=I:
goto :loop )

:drive9
if "%j%"=="" ( echo J: drive is not selectable... going back to the menu.
echo.
goto :choice
) else ( set md=J:
goto :loop )

:drive10
if "%k%"=="" ( echo K: drive is not selectable... going back to the menu.
echo.
goto :choice
) else ( set md=K:
goto :loop )

:drive11
if "%l%"=="" ( echo L: drive is not selectable... going back to the menu.
echo.
goto :choice
) else ( set md=L:
goto :loop )

:drive12
if "%m%"=="" ( echo M: drive is not selectable... going back to the menu.
echo.
goto :choice
) else ( set md=M:
goto :loop )

REM --Uses %md% as your main drive letter, and recursively searches through for R6Vegas2_Game.exe.--
:loop
set start=%time%
echo Searching for Vegas 2 directory (this should take 1 min or less)... 
for /r %md%\ %%a in (R6Vegas2_Game.exe) do if exist "%%~fa" ( set dir=%%~dpa
goto :loop2
)

REM --If the R6Vegas2_Game.exe isn't found, it passes down to here, where it will prompt you if you want to restart the process.--
:fail
echo R6Vegas2_Game.exe NOT FOUND on the %md% drive... is Vegas 2 installed?
pause

:restart
cls
set fail=
set /p fail=Would you like to restart? (Y/N) 
if /I '%fail%'=='Y' ( set dir=
set start=
cls
goto :process_m
)
if /I '%fail%'=='N' goto :end
echo "%fail%" is not valid, try again.
goto :restart

REM --Sets the end execution time and calculates the proper time lapse.--
:loop2
set end=%time%
goto :time_calculation

REM --A successful directory grab, in which it will remove \Binaries\ from the directory tree, and store it in directories.txt.--
:loop2_a
echo Success! Directory of Vegas 2 grabbed.
echo Total time: %mins%:%secs%.%ms% (%totalsecs%.%ms%s total)
pause
set dir=%dir:~0,-10%
echo %dir% > directories.txt
del /q driveletters.txt
goto :loopf

REM --Time calculations from https://stackoverflow.com/questions/673523/how-do-i-measure-execution-time-of-a-command-on-the-windows-command-line.--
:time_calculation
set options="tokens=1-4 delims=:.,"
for /f %options% %%a in ("%start%") do set start_h=%%a&set /a start_m=100%%b %% 100&set /a start_s=100%%c %% 100&set /a start_ms=100%%d %% 100
for /f %options% %%a in ("%end%") do set end_h=%%a&set /a end_m=100%%b %% 100&set /a end_s=100%%c %% 100&set /a end_ms=100%%d %% 100

set /a hours=%end_h%-%start_h%
set /a mins=%end_m%-%start_m%
set /a secs=%end_s%-%start_s%
set /a ms=%end_ms%-%start_ms%
if %ms% lss 0 set /a secs = %secs% - 1 & set /a ms = 100%ms%
if %secs% lss 0 set /a mins = %mins% - 1 & set /a secs = 60%secs%
if %mins% lss 0 set /a hours = %hours% - 1 & set /a mins = 60%mins%
if %hours% lss 0 set /a hours = 24%hours%
if 1%ms% lss 100 set ms=0%ms%

set /a totalsecs = %hours%*3600 + %mins%*60 + %secs%
goto :loop2_a

REM --After grabbing the directory, it is then stored in a TXT file and grabbed from a 'for' loop to use as a variable for the other install/uninstall batch files. Driveletters.txt is deleted, and an if check is initiated for TeknoR6Vegas2.--
:loopf
for /f "tokens=1 delims=" %%a in (directories.txt) do set var=%%a
if not defined var ( echo Directories.txt is empty...
goto :restart
)
set var2=%var:~0,-1%
set vegas=%var2:~-7%
echo.
if /i "%vegas%"==" Vegas " ( echo No spaces in directory, no adjustments needed.
goto :skip
)
set var=%var:~0,-1%
REM --Identifies if the directory in directories.txt has a space or not. The non-spaced directory gets sent here.--
:skip
echo Your directory is: %var%
pause
echo.

del /q driveletters.txt 2>nul

REM --Universal Installer is called, along with the directory's variable.--
:UI
call "Universal Installer.bat" "%var%
exit

:end
@echo off
cd /d "%~dp0"
set var=%1
color 3

echo -------------------------------.xml Directory Replacer-------------------------------

REM --References the directory from directories.txt, grabs it into a variable, and two 'for' loops are used to automatically check if you have the steam/nonsteam version.--
:check
if not exist "..\directories.txt" ( echo Directories.txt missing... please run Directory Finder.bat once, and run this again. Closing program...
pause
goto :end
)

if defined var ( echo Variable already defined...
goto :check2
)

for /f "tokens=1 delims=" %%r in (..\directories.txt) do set var=%%r

if not defined var ( echo Directories.txt is empty. Run Directory Finder and try again.
pause
goto :end
)

REM --2 for loops for establishing if the directory is the nonsteam or steam version.--
:check2
for /f "tokens=1 delims=" %%s in ('findstr /I /C:"Tom Clancy's Rainbow Six Vegas 2" ..\directories.txt') do set flag=0
for /f "tokens=1 delims=" %%t in ('findstr /I /C:"common\Rainbow Six Vegas 2" ..\directories.txt') do set flag=1

if not defined flag ( echo Custom directory detected.
echo Attempting to replace .xml directory...
goto :custom
)

if "%flag%"=="0" ( echo You are running the Nonsteam/Uplay version.
goto :nonsteam
) else ( echo You are running the Steam version. 
goto :steam )

REM --Passes variable to loop.bat for replacing the default directory of all the .xml files.--
:nonsteam
set var=%var:'=''%
call "loop.bat" %var%
echo Converted all .xml with proper paths.
echo Exiting...
pause
goto :end

REM --Passes variable to loop.bat for replacing the default directory of all the .xml files.--
:steam
call "loop.bat" %var%
echo Converted all .xml with proper paths.
echo Exiting...
pause
goto :end

REM --Passes variable to loop.bat for replacing the default directory of all the .xml files.--
:custom
set var=%var:'=''%
call "loop.bat" %var%
echo Converted all .xml with proper paths.
echo Exiting...
pause
goto :end

:end 

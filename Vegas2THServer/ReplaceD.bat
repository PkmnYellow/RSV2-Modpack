@echo off
cd /d "%~dp0"
set var=%1
color 3

echo RRRR   SSS  V     V  22      M   M        d               k        V     V  9999    4  4
echo R   R S     V     V 2  2     MM MM        d               k k      V     V 9   9    4  4
echo RRRR   SSS   V   V    2      M M M ooo  ddd ppp   aa  ccc kk        V   V   9999    4444
echo R R       S   V V    2       M   M o o d  d p  p a a c    k k        V V      9 ..     4
echo R  RR SSSS     V    2222     M   M ooo  ddd ppp  aaa  ccc k  k        V      9  ..     4
echo                                             p                                           

echo              b             PPPP  k               Y   Y     ll  ll           
echo              b             P   P k k              Y Y       l   l           
echo              bbb  y  y     PPPP  kk   mmmm  nnn    Y   eee  l   l  ooo w   w
echo              b  b  yyy     P     k k  m m m n  n   Y   e e  l   l  o o w w w
echo              bbb     y     P     k  k m m m n  n   Y   ee  lll lll ooo  w w 
echo                    yy                                                       

echo.
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

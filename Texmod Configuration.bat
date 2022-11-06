@echo off
set "main=%~dp0"
cd /D %main%
color 8
set "dir_tex=cd /d Texmod*"

echo -------------------------------Texmod Auto Setup-------------------------------

REM --Checks for directories.txt, Texmod.exe and Texmod autoload.lnk.--
:checks
if not exist "Texmod & Textures [Manual Use Only]\Texmod.exe" ( echo Texmod.exe is missing... download a new one from the link in readme.rtf, or re-download RSV2 Mods.zip.
pause
goto :end
) 
if not exist directories.txt ( echo Directories.txt is missing...
echo Run Run.bat.
pause
goto :end 
)
if not exist "Texmod Autoload.lnk" ( echo Creating shortcut...
goto :vbscript
)

REM --Grabs directory from directories.txt, and adjusts the directory if entered into directories.txt.--
:grabv
for /f "tokens=1 delims=" %%a in (directories.txt) do set var=%%a
if not defined var ( echo Directories.txt is empty...
echo Run Run.bat, and try again.
pause
goto :end
)
set var2=%var:~0,-1%
set vegas=%var2:~-7%
if /i "%vegas%"==" Vegas " ( echo No spaces in directory, no adjustments needed.
goto :skip2
)
set var=%var:~0,-1%
:skip2
set var=%var%
echo Directory grabbed.

REM --3 for loops are used to determine default.ini's entries.--
:start
%dir_tex%
echo Checking texmod entry...
for /f "tokens=2 delims==" %%a in ('find /I "texmod=" "default.ini"') do set tex2=%%a
if not defined tex2 ( echo Texmod entry empty.
set tex=1
) else ( echo Texmod entry filled.
set tex=0 )

echo Checking game entry...
for /f "tokens=2 delims==" %%a in ('find /I "exe=" "default.ini"') do set exe2=%%a
if not defined exe2 ( echo Game entry empty.
set exe=1
) else ( echo Game entry filled.
set exe=0 )

echo Checking mod entry...
for /f "tokens=2 delims==" %%a in ('find /I "mod1=" "default.ini"') do set mod2=%%a
if not defined mod2 ( echo Mod entry empty.
set mod1=1
set del=0
) else ( echo Mod entry filled. 
set mod1=0 )

REM --A texture scan is initiated to determine if any pre-existing textures are used in default.ini, and are recorded in 3 arrays with 3 for loops, along with 3 counters.--
:texture_scan
set v=0
set x=0
set y=0
echo Checking texture entries...
setlocal ENABLEDELAYEDEXPANSION
for /f "tokens=1 delims=" %%a in ('findstr /I "mod.=." "default.ini"') do set mod[!x!]=%%a &set /a x+=1 >nul

for /f "tokens=1 delims=" %%a in ('findstr /I "mod..=." "default.ini"') do set mod[!x!]=%%a &set /a x+=1 >nul

for /f "tokens=1 delims==" %%a in ('findstr /I "mod.=" "default.ini"') do set mod_e[!v!]=%%a&set /a v+=1 >nul

for /f "tokens=1 delims==" %%a in ('findstr /I "mod..=" "default.ini"') do set mod_e[!v!]=%%a&set /a v+=1 >nul

if not defined mod[0] ( set x=0
)
if not defined mod_e[0] ( set v=0
)
if %x% GTR 0 ( set /a x2=x-1 >nul
)
if %v% GTR 0 ( set /a v2=v-1 >nul
)
if %x%==0 ( goto :skip
)

for /f "tokens=1,2,3 delims==" %%a in ('set mod[') do set mod_s[!y!]=%%c&set /a y+=1 >nul

for /L %%a in (0 1 %x2%) do set "mod_s[%%a]=!mod_s[%%a]:~0,-1!"
for /L %%a in (0 1 %x2%) do echo !mod_s[%%a]!

:skip
echo.
if %x%==0 ( echo NO textures detected. 
) else ( echo %x% texture[s] detected. )

REM --The choice to keep your current texture load, or not, if it detects any.--
:c1
if not defined x2 ( goto :process
)
echo.
set c=
set /p c=Do you wish to keep your current textures in texmod? (Y/N):
if /I '%c%'=='Y' ( set mod1=0
goto :process
)
if /I '%c%'=='N' ( set mod1=1
set del=1
goto :process
)
if not defined c ( echo No input added...
goto :c1
)
echo "%c%" is not valid, try again.
goto :c1

REM --Installation process for Texmod, Game and Textures.--
:process
cd ..
if %tex%==1 ( goto :texmod
) else ( echo Texmod entry already filled. )
:re_exe
if %exe%==1 ( goto :game
) else ( echo Game entry already filled. )
:re_mod
if %mod1%==1 ( goto :mod_c
) else ( echo Mod entry already filled. )

:process_end
if %tex%==0 ( if %exe%==0 ( if %mod1%==0 ( echo. 
echo No action needed. 
echo Exiting...
pause
goto :end
)
)
)

echo.
echo Everything installed.
echo Exiting...
pause
goto :end

REM --Texmod entry is added via a powershell command.--
:texmod
set "var_tex=%main%Texmod & Textures [Manual Use Only]\Texmod.exe"
set "var_tex=%var_tex:'=''%"

powershell -Command "(gc 'Texmod & Textures `[Manual Use Only`]\default.ini') -replace [regex]::Escape('texmod='), ('texmod=%var_tex%') | Out-File -encoding default 'Texmod & Textures `[Manual Use Only`]\default.ini'"

goto :re_exe

REM --Game entry is added via a powershell command.--
:game
set "var_exe=%var%\Binaries\R6Vegas2_Game.exe"
set "var_exe=%var_exe:'=''%"

powershell -Command "(gc 'Texmod & Textures `[Manual Use Only`]\default.ini') -replace [regex]::Escape('exe='), ('exe=%var_exe%') | Out-File -encoding default 'Texmod & Textures `[Manual Use Only`]\default.ini'"

goto :re_mod

REM --Checks if textures need to be deleted.--
:mod_c
if %del%==1 ( goto :mod_del
) else ( goto :mod_add )

REM --Scans for textures by storing them in 2 arrays.--
:mod_main
set z=0
set n=0
set f=0
echo.
echo Searching textures...

for /R %%a in (*.tpf) do set text[!z!]=%%~fa&set /a z+=1 >nul
set /a z2=z-1 >nul

for /R %%a in (*.tpf) do set text_b[!f!]=%%~fa&set /a f+=1 >nul
set /a f2=f-1 >nul

for /R %%a in (*.tpf) do set text_f[!n!]=%%~na&set /a n+=1 >nul
set /a n2=n-1 >nul

set m=1

REM --Main choice for adding textures individually, all at once, or a way to exit if need be.--
:c2
if %n%==0 ( if %z%==0 ( echo All textures are installed.
goto :process_end
)
)
echo -TEXTURES AVAILABLE-
for /L %%a in (0 1 !n2!) do if defined text_f[%%a] ( echo !text_f[%%a]!
)
echo.
echo %n% textures.
:c2_b
echo.
set c2=
set /p c2=Which textures would you like? (Press 'E' to exit, press 'A' for all textures, or type in the names individually) 
if /i "%c2%"=="E" goto :process_end
if /i "%c2%"=="A" goto :mod_all
if not defined c2 ( echo No input added...
goto :c2_b
)
for /R %%a in (*.tpf) do ( if /i "%c2%"=="%%~na" ( echo Adding %%~na to the list.
powershell -Command "(gc 'Texmod & Textures `[Manual Use Only`]\default.ini') -replace [regex]::Escape('mod!m!='), ('mod!m!=%%~fa') | Out-File -encoding default 'Texmod & Textures `[Manual Use Only`]\default.ini'"
set /a m+=1 >nul
)
)
for /L %%b in (0 1 %n2%) do if /i "!text_f[%%b]!"=="%c2%" ( set text_f[%%b]=
set text[%%b]=
set /a n-=1&set /a z-=1 >nul
)

REM --Prompts the user if they want to add another texture to the list.--
:c3
echo.
set c3=
set /p c3=Would you like to add another texture? (Y/N):
if /i '%c3%'=='Y' ( cls
goto :c2
)
if /i '%c3%'=='N' goto :process_end
if not defined c3 ( echo No input added...
goto :c3
)

echo "%c3%" is not valid, try again.
goto :c3

echo "%c2%" is not valid, try again.
goto :c2

REM --All textures are deleted via a for loop, through a powershell command.--
:mod_del
echo Deleting texture entries...

for /L %%a in (0 1 %x2%) do ( 
powershell -Command "(gc 'Texmod & Textures `[Manual Use Only`]\default.ini') -replace [regex]::Escape('!mod_s[%%a]!'), ('') | Out-File -encoding default 'Texmod & Textures `[Manual Use Only`]\default.ini'" 
)

for /L %%a in (0 1 %v2%) do if defined mod_e[%%a] ( echo %v% mod entries already exist...
goto :mod_main
)
echo Creating 20 fresh mod entries...
for /L %%a in (1 1 20) do echo mod%%a=>> "Texmod & Textures [Manual Use Only]\default.ini"

echo.
echo All texture entries deleted.
goto :mod_main

REM --If %m% is greater than 1, the entire mod entries are deleted in prep for all texture installation. A fail safe, in case the user decides to install all, after installing the textures individually.--
:mod_del2
echo Deleting texture entries...
set q=0
set r=0

for /f "tokens=1 delims=" %%a in ('findstr /I "mod.=." "default.ini"') do set mod_d[!q!]=%%a &set /a q+=1 >nul

for /f "tokens=1 delims=" %%a in ('findstr /I "mod..=." "default.ini"') do set mod_d[!q!]=%%a &set /a q+=1 >nul
set /a q2=q-1 >nul

for /f "tokens=1,2,3 delims==" %%a in ('set mod_d[') do set mod_s_d[!r!]=%%c&set /a r+=1 >nul

for /L %%a in (0 1 %q2%) do set "mod_s_d[%%a]=!mod_s_d[%%a]:~0,-1!"

for /L %%a in (0 1 %q2%) do ( 
powershell -Command "(gc 'Texmod & Textures `[Manual Use Only`]\default.ini') -replace [regex]::Escape('!mod_s_d[%%a]!'), ('') | Out-File -encoding default 'Texmod & Textures `[Manual Use Only`]\default.ini'" 
)

set m=1
echo.
goto :mod_all

REM --Adds 20+ mod entries for preparation.--
:mod_add
for /L %%a in (0 1 %v2%) do if defined mod_e[%%a] ( echo %v% mod entries already exist...
goto :mod_main
)
echo Creating 20 fresh mod entries...
for /L %%a in (1 1 20) do echo mod%%a=>> "Texmod & Textures [Manual Use Only]\default.ini"

echo Mod entries added.
goto :mod_main

REM --A shortcut of Texmod autoload.exe is created.--
:vbscript
echo Creating Texmod autoload shortcut...
set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"

echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%main%Texmod Autoload.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "%main%Texmod & Textures [Manual Use Only]\Texmod autoload.exe" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%

cscript /nologo %SCRIPT%
del %SCRIPT%
goto :grabv

REM --All textures are added.--
:mod_all
if %m% GTR 1 ( echo Individual textures detected...
goto :mod_del2
)
echo Adding all textures...
for /L %%a in (0 1 %f2%) do powershell -Command "(gc 'Texmod & Textures `[Manual Use Only`]\default.ini') -replace [regex]::Escape('mod!m!='), ('mod!m!=!text_b[%%a]!') | Out-File -encoding default 'Texmod & Textures `[Manual Use Only`]\default.ini'"&set /a m+=1 >nul

echo.
echo All textures installed.
goto :process_end

:end
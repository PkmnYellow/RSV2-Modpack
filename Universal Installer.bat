@ECHO off
cd /D "%~dp0"
set var=%1
color B

REM --Checks if the directory variable exists, checks and displays installedmods.txt, and asks the user to input install/uninstall.--
:start
cls
echo -------------------------------Universal Installer-------------------------------
if defined var ( echo Universal variable defined...
) else ( echo Universal variable undefined... 
goto :error )

if exist installedmods.txt ( echo Mods installed:
more installedmods.txt
)
echo.
echo 1. Install
echo 2. Uninstall
set choice=
set /p choice=Type the number to Install or Uninstall.
if %choice%==1 goto :TR6
if %choice%==2 goto :uninstall_check
echo "%choice%" is not valid, try again
echo.
goto :start

REM --User inputs whether TeknoR6Vegas2 is installed or not.--
:TR6
echo.
echo 1. WITH TeknoR6Vegas2
echo 2. WITHOUT TeknoR6Vegas2
set choice5=
set /p choice5=Type the number to choose to install TeknoR6Vegas2 (16 players, 99 terrorists limit)
if '%choice5%'=='1' goto :RSD
if '%choice5%'=='2' goto :RSD
echo "%choice5%" is not valid, try again
echo.
goto :TR6

REM --User inputs whether ReShade Graphics is installed or not.--
:RSD
echo.
echo 1. WITH Reshade Graphics Mod
echo 2. WITHOUT Reshade Graphics Mod
set choice3=
set /p choice3=Type the number to choose to install the Reshade Mod.
if '%choice3%'=='1' goto :V2TS
if '%choice3%'=='2' goto :V2TS
echo "%choice3%" is not valid, try again
echo.
goto :RSD

REM --User inputs whether Vegas2 TH Server is installed or not.--
:V2TS
echo.
echo 1. WITH Vegas 2 Terrorist Hunt Server Pre-Setup
echo 2. WITHOUT Vegas 2 Terrorist Hunt Server Pre-Setup
set choice7=
set /p choice7=Type the number to choose to install the Vegas 2 Terrorist Hunt Dedicated Server Pre-Setup.
if '%choice7%'=='1' goto :FOV
if '%choice7%'=='2' goto :FOV
echo "%choice7%" is not valid, try again
echo.
goto :V2TS

REM --User inputs which FOV they want installed or not.--
:FOV
echo.
echo 1. FOV 60
echo 2. FOV 70
echo 3. FOV 75
echo 4. FOV 90
echo 5. FOV 100
echo 6. Default
set choice8=
set /p choice8=Type the number to choose to install the FOV you want.
if '%choice8%'=='1' goto :Overhaul
if '%choice8%'=='2' goto :Overhaul
if '%choice8%'=='3' goto :Overhaul
if '%choice8%'=='4' goto :Overhaul
if '%choice8%'=='5' goto :Overhaul
if '%choice8%'=='6' goto :Overhaul
echo "%choice8%" is not valid, try again
echo.
goto :FOV

REM --User inputs what weapon overhaul they want to install.--
:Overhaul
echo.
echo 1. WITH The Complete Overhaul Mod (Enhances Weapons)
echo 2. WITH the Vegas 2 Realism Mod v2.4.4 (Enhances Weapons)
echo 3. Vanilla Weapons
set choice4=
set /p choice4=Type the number to choose to install a Weapons mod.
if not '%choice4%'=='' set choice4=%choice4:~0,1%
if '%choice4%'=='1' goto :THC
if '%choice4%'=='2' goto :THC
if '%choice4%'=='3' goto :THC
echo "%choice4%" is not valid, try again
echo.
goto :Overhaul

REM --User inputs whether Terrorist Hunt Control is installed or not.--
:THC
echo.
echo 1. WITH Terrorist Hunt Control (Manipulating Terrorist gun loadouts and AI with keybinds, ORIGINAL)
echo 2. WITH Terrorist Hunt Control (NEW, with three new keybinds added)
echo 3. WITHOUT Terrorist Hunt Control
set choice6=
set /p choice6=Type the number to choose to install the Terrorist Hunt Control Mod.
if not '%choice6%'=='' set choice4=%choice4:~0,1%
if '%choice6%'=='1' goto :TCSO
if '%choice6%'=='2' goto :TCSO
if '%choice6%'=='3' goto :TCSO
echo "%choice6%" is not valid, try again
echo.
goto :THC

REM --User inputs the specified spawn rate to install.--
:TCSO
echo.
echo 1. 15 spawn rate
echo 2. 64 spawn rate
echo 3. 99 spawn rate (GENOCIDE)
echo 4. Default (6 spawn rate)
set choice2=
set /p choice2=Type the number for enemy spawn rate.
if '%choice2%'=='1' goto :install_a
if '%choice2%'=='2' goto :install_a
if '%choice2%'=='3' goto :install_a
if '%choice2%'=='4' goto :install_a
echo "%choice2%" is the wrong number, try again
echo.
goto :TCSO

REM --Based on the user's choices, the following mods are installed/avoided.--
:install_a
if '%choice5%'=='1' ( call "TeknoR6Vegas2_3.0\Install.bat" %var%
cd /D "%~dp0"
color B
)
if '%choice3%'=='1' ( call "Realistic ReShade Mod\Install.bat" %var%
cd /D "%~dp0"
)
if '%choice4%'=='1' ( call "The Complete Overhaul Mod\Install.bat" %var%
cd /D "%~dp0"
)
if '%choice4%'=='2' ( call "Vegas 2 Realism Mod v2.4.4\Install.bat" %var%
cd /D "%~dp0"
)
if '%choice2%'=='1' ( call "The Complete Spawning Overhaul Mod\15 Spawn rate\Install.bat" %var%
cd /D "%~dp0"
)
if '%choice2%'=='2' ( call "The Complete Spawning Overhaul Mod\64 Spawn rate\Install.bat" %var%
cd /D "%~dp0"
)
if '%choice2%'=='3' ( call "The Complete Spawning Overhaul Mod\99 Spawn rate\Install.bat" %var%
cd /D "%~dp0"
)
if '%choice6%'=='1' ( call "Terrorist Hunt Control V1.0\InstallO.bat" %var%
cd /D "%~dp0"
)
if '%choice6%'=='2' ( call "Terrorist Hunt Control V1.0\Install.bat" %var%
cd /D "%~dp0"
)
if '%choice7%'=='1' ( call "Vegas2THServer\Install.bat" %var%
cd /D "%~dp0"
)
if '%choice8%'=='1' ( call "FOV\60\Install.bat" %var%
cd /D "%~dp0"
)
if '%choice8%'=='2' ( call "FOV\70\Install.bat" %var%
cd /D "%~dp0"
)
if '%choice8%'=='3' ( call "FOV\75\Install.bat" %var%
cd /D "%~dp0"
)
if '%choice8%'=='4' ( call "FOV\90\Install.bat" %var%
cd /D "%~dp0"
)
if '%choice8%'=='5' ( call "FOV\100\Install.bat" %var%
cd /D "%~dp0"
)
echo All mods are installed.
goto :decision

REM --If check is used to make sure installedmods.txt exists. Otherwise, uninstallation is reverted to the old method. 6 'for' loops are used to reference the installedmods.txt file to ensure the proper mods are being uninstalled.--
:uninstall_check
if not exist installedmods.txt ( echo Installedmods.txt missing... echo Reverting back to old uninstallation...
goto :uninstall_old
)

set r=
set r2=
set r3=
set r4=
set r5=
set r6=
set r7=
set r8=
set r9=
echo Checking which mods to uninstall...
for /f "tokens=1 delims=" %%b in ('findstr /C:"Vegas 2 Realism" installedmods.txt') do set r=%%b
for /f "tokens=1 delims=" %%c in ('findstr /C:"The Complete Spawning Overhaul" installedmods.txt') do set r2=%%c
for /f "tokens=1 delims=" %%d in ('findstr /C:"The Complete Overhaul" installedmods.txt') do set r3=%%d
for /f "tokens=1 delims=" %%e in ('findstr /C:"Realistic ReShade" installedmods.txt') do set r4=%%e
for /f "tokens=1 delims=" %%f in ('findstr /C:"Terrorist Hunt Control [New]" installedmods.txt') do set r5=%%f
for /f "tokens=1 delims=" %%g in ('findstr /C:"Terrorist Hunt Control [Original]" installedmods.txt') do set r6=%%g
for /f "tokens=1 delims=" %%h in ('findstr /C:"TeknoR6Vegas2" installedmods.txt') do set r7=%%h
for /f "tokens=1 delims=" %%i in ('findstr /C:"Vegas2THServer" installedmods.txt') do set r8=%%i
for /f "tokens=1 delims=" %%j in ('findstr /I "FOV ." installedmods.txt') do set r9=%%j
goto :uninstall

REM --If the above 'for' loops store the mod's name through variables, it will call the uninstall batches accordingly. Afterwards, it displays what mods were deleted, and it deletes installedmods.txt.--
:uninstall
echo Uninstalling all mods...
if defined r ( call "Vegas 2 Realism Mod v2.4.4\Uninstall.bat" %var%
)
if defined r2 ( call "The Complete Spawning Overhaul Mod\15 Spawn rate\Uninstall.bat" %var%
)
if defined r3 ( call "The Complete Overhaul Mod\Uninstall.bat" %var%
)
if defined r4 ( call "Realistic ReShade Mod\Uninstall.bat" %var%
)
if defined r5 ( call "Terrorist Hunt Control V1.0\Uninstall.bat" %var%
)
if defined r6 ( call "Terrorist Hunt Control V1.0\Uninstall.bat" %var%
)
if defined r7 ( call "TeknoR6Vegas2_3.0\Uninstall.bat" %var%
)
if defined r8 ( call "Vegas2THServer\Uninstall.bat" %var%
)
if defined r9 ( call "FOV\60\Uninstall.bat" %var%
)

echo.
echo All the following mods were uninstalled:
more installedmods.txt
pause
del /q installedmods.txt
goto :decision

REM --The old uninstallation method, in case the above one fails. It openly calls all the uninstallation batches.--
:uninstall_old
echo Uninstalling all mods...
call "Vegas 2 Realism Mod v2.4.4\Uninstall.bat" %var%
call "The Complete Spawning Overhaul Mod\15 Spawn rate\Uninstall.bat" %var%
call "The Complete Overhaul Mod\Uninstall.bat" %var%
call "Realistic ReShade Mod\Uninstall.bat" %var%
call "Terrorist Hunt Control V1.0\Uninstall.bat" %var%
call "TeknoR6Vegas2_3.0\Uninstall.bat" %var%
call "Vegas2THServer\Uninstall.bat" %var%
call "FOV\60\Uninstall.bat" %var%
echo.
echo All mods are uninstalled!
goto :decision

REM --User inputs their decision.--
:decision
set decision=
echo.
echo 1. Go back to start
echo 2. Exit Installer
set /p decision=Where would you like to go?[1/2]:
if '%decision%'=='1' goto :start
if '%decision%'=='2' goto :end
echo "%decision%" is not valid, try again.
goto :decision

REM --A redirect is made to here if someone trys to run Universal Installer.bat independently.--
:error
echo Run Run.bat and try again.
pause
goto :end

:end
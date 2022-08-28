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

:UI
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
if not defined choice ( echo No input added...
goto :UI
)
echo "%choice%" is not valid, try again.
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
if not defined choice5 ( echo No input added...
goto :TR6
)
echo "%choice5%" is not valid, try again.
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
if not defined choice3 ( echo No input added...
goto :RSD
)
echo "%choice3%" is not valid, try again.
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
if not defined choice7 ( echo No input added...
goto :V2TS
)
echo "%choice7%" is not valid, try again.
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
if not defined choice8 ( echo No input added...
goto :FOV
)
echo "%choice8%" is not valid, try again.
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
if not defined choice4 ( echo No input added...
goto :Overhaul
)
echo "%choice4%" is not valid, try again.
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
if not defined choice6 ( echo No input added...
goto :THC
)
echo "%choice6%" is not valid, try again.
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
if not defined choice2 ( echo No input added...
goto :TCSO
)
echo "%choice2%" is the wrong number, try again.
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

REM --A choice to uninstall all mods, or specific ones.--
:u_choice
echo.
set ui=
echo 1. Uninstall all
echo 2. Uninstall specific mods
set /p ui=Would you like to uninstall all, or specific mods? (1/2): 
if '%ui%'=='1' goto :uninstall
if '%ui%'=='2' goto :uninstall
if not defined ui ( echo No input added...
goto :u_choice
)
echo "%ui%" is not valid, try again.
goto :u_choice

REM --'for' loops store the mod's name through variables, calling the uninstall batches accordingly. If the user chooses to uninstall specific mods, it is directed to :uninstall_s.--
:uninstall
set m=
set m2=
set m3=
set m4=
set m5=
set m6=
set m7=
set m8=
set m9=

echo Detecting which mods are installed...
for /f "tokens=1 delims=" %%b in ('findstr /C:"Vegas 2 Realism" installedmods.txt') do set m=%%b
for /f "tokens=1 delims=" %%c in ('findstr /C:"The Complete Spawning Overhaul" installedmods.txt') do set m2=%%c
for /f "tokens=1 delims=" %%d in ('findstr /C:"The Complete Overhaul" installedmods.txt') do set m3=%%d
for /f "tokens=1 delims=" %%e in ('findstr /C:"Realistic ReShade" installedmods.txt') do set m4=%%e
for /f "tokens=1 delims=" %%f in ('findstr /C:"Terrorist Hunt Control [New]" installedmods.txt') do set m5=%%f
for /f "tokens=1 delims=" %%g in ('findstr /C:"Terrorist Hunt Control [Original]" installedmods.txt') do set m6=%%g
for /f "tokens=1 delims=" %%h in ('findstr /C:"TeknoR6Vegas2" installedmods.txt') do set m7=%%h
for /f "tokens=1 delims=" %%i in ('findstr /C:"Vegas2THServer" installedmods.txt') do set m8=%%i
for /f "tokens=1 delims=" %%j in ('findstr /I "FOV ." installedmods.txt') do set m9=%%j

if %ui%==2 ( goto :umod_choice
)

echo Uninstalling all mods...
if defined m ( call "Vegas 2 Realism Mod v2.4.4\Uninstall.bat" %var%
)
if defined m2 ( call "The Complete Spawning Overhaul Mod\15 Spawn rate\Uninstall.bat" %var%
)
if defined m3 ( call "The Complete Overhaul Mod\Uninstall.bat" %var%
)
if defined m4 ( call "Realistic ReShade Mod\Uninstall.bat" %var%
)
if defined m5 ( call "Terrorist Hunt Control V1.0\Uninstall.bat" %var%
)
if defined m6 ( call "Terrorist Hunt Control V1.0\Uninstall.bat" %var%
)
if defined m7 ( call "TeknoR6Vegas2_3.0\Uninstall.bat" %var%
)
if defined m8 ( call "Vegas2THServer\Uninstall.bat" %var%
)
if defined m9 ( call "FOV\60\Uninstall.bat" %var%
)

echo.
echo All the following mods were uninstalled:
more installedmods.txt
pause
del /q installedmods.txt
goto :decision

REM --If the choice is listed, the user can uninstall specific mods by number.--
:umod_choice
echo.
if defined m ( echo 1. Vegas 2 Realism
)
if defined m2 ( echo 2. The Complete Spawning Overhaul
)
if defined m3 ( echo 3. The Complete Overhaul
)
if defined m4 ( echo 4. Realistic ReShade
)
if defined m5 ( echo 5. Terrorist Hunt Control [New]
)
if defined m6 ( echo 6. Terrorist Hunt Control [Original]
)
if defined m7 ( echo 7. TeknoR6Vegas2
)
if defined m8 ( echo 8. Vegas 2 Terrorist Hunt Server pre-setup
)
if defined m9 ( echo 9. FOV 
)
set /p us=Which mod would you like to uninstall? (Press 'A' to quit uninstallation) 
if '%us%'=='1' ( if not defined m ( echo "Vegas 2 Realism" is not on the list...
goto :umod_choice
) else ( goto :umod_uninstall )
)
if '%us%'=='2' ( if not defined m2 ( echo "The Complete Spawning Overhaul" is not on the list...
goto :umod_choice
) else ( goto :umod_uninstall )
)
if '%us%'=='3' ( if not defined m3 ( echo "The Complete Overhaul" is not on the list...
goto :umod_choice
) else ( goto :umod_uninstall )
)
if '%us%'=='4' ( if not defined m4 ( echo "Realistic ReShade" is not on the list...
goto :umod_choice
) else ( goto :umod_uninstall )
)
if '%us%'=='5' ( if not defined m5 ( echo "Terrorist Hunt Control [New]" is not on the list...
goto :umod_choice
) else ( goto :umod_uninstall )
)
if '%us%'=='6' ( if not defined m6 ( echo "Terrorist Hunt Control [Original]" is not on the list...
goto :umod_choice
) else ( goto :umod_uninstall )
)
if '%us%'=='7' ( if not defined m7 ( echo "TeknoR6Vegas2" is not on the list...
goto :umod_choice
) else ( goto :umod_uninstall )
)
if '%us%'=='8' ( if not defined m8 ( echo "Vegas 2 Terrorist Hunt Server pre-setup" is not on the list...
goto :umod_choice
) else ( goto :umod_uninstall )
)
if '%us%'=='9' ( if not defined m9 ( echo "FOV" is not on the list...
goto :umod_choice
) else ( goto :umod_uninstall )
)
if /i '%us%'=='A' goto :decision
if not defined us ( echo No input added...
goto :umod_choice
)
echo "%us%" is not valid, try again.
goto :umod_choice

REM --Depending on the user's choice, the selective mod is uninstalled.--
:umod_uninstall
if %us%==1 ( call "Vegas 2 Realism Mod v2.4.4\Uninstall.bat" %var%
echo Removing Vegas 2 Realism from installedmods.txt...
powershell -Command "(gc 'installedmods.txt') -replace [regex]::Escape('Vegas 2 Realism'), ('') | Out-File -encoding default 'installedmods.txt'"
set m=
)
if %us%==2 ( call "The Complete Spawning Overhaul Mod\15 Spawn rate\Uninstall.bat" %var%
echo Removing The Complete Spawning Overhaul from installedmods.txt...
powershell -Command "(gc 'installedmods.txt') -replace [regex]::Escape('The Complete Spawning Overhaul'), ('') | Out-File -encoding default 'installedmods.txt'"
set m2=
)
if %us%==3 ( call "The Complete Overhaul Mod\Uninstall.bat" %var%
echo Removing The Complete Overhaul from installedmods.txt...
powershell -Command "(gc 'installedmods.txt') -replace [regex]::Escape('The Complete Overhaul'), ('') | Out-File -encoding default 'installedmods.txt'"
set m3=
)
if %us%==4 ( call "Realistic ReShade Mod\Uninstall.bat" %var%
echo Removing Realistic ReShade from installedmods.txt...
powershell -Command "(gc 'installedmods.txt') -replace [regex]::Escape('Realistic ReShade'), ('') | Out-File -encoding default 'installedmods.txt'"
set m4=
)
if %us%==5 ( call "Terrorist Hunt Control V1.0\Uninstall.bat" %var%
echo Removing Terrorist Hunt Control [New] from installedmods.txt...
powershell -Command "(gc 'installedmods.txt') -replace [regex]::Escape('Terrorist Hunt Control [New]'), ('') | Out-File -encoding default 'installedmods.txt'"
set m5=
)
if %us%==6 ( call "Terrorist Hunt Control V1.0\Uninstall.bat" %var%
echo Removing Terrorist Hunt Control [Original] from installedmods.txt...
powershell -Command "(gc 'installedmods.txt') -replace [regex]::Escape('Terrorist Hunt Control [Original]'), ('') | Out-File -encoding default 'installedmods.txt'"
set m6=
)
if %us%==7 ( call "TeknoR6Vegas2_3.0\Uninstall.bat" %var%
echo Removing TeknoR6Vegas2 from installedmods.txt...
powershell -Command "(gc 'installedmods.txt') -replace [regex]::Escape('TeknoR6Vegas2'), ('') | Out-File -encoding default 'installedmods.txt'"
set m7=
)
if %us%==8 ( call "Vegas2THServer\Uninstall.bat" %var%
echo Removing Vegas2THServer from installedmods.txt...
powershell -Command "(gc 'installedmods.txt') -replace [regex]::Escape('Vegas2THServer'), ('') | Out-File -encoding default 'installedmods.txt'"
set m8=
)
if %us%==9 ( call "FOV\60\Uninstall.bat" %var%
echo Removing FOV from installedmods.txt...
powershell -Command "(gc 'installedmods.txt') -replace [regex]::Escape('FOV *'), ('') | Out-File -encoding default 'installedmods.txt'"
set m9=
)
for /f "tokens=1 delims= " %%a in (installedmods.txt) do set m_a=%%a
if not defined m_a ( echo 0 mods in installedmods.txt, deleting...
del /q installedmods.txt
)

REM --Asks the user if they want to uninstall another mod, if any remaining mods exist.--
:umod_uninstall_c
if not defined m_a ( No more mods to uninstall... heading back to decision.
goto :decision
)
echo.
set au=
set /p au=Would you like to uninstall another mod? (Y/N): 
if /i "%au%"=="Y" goto :umod_choice
if /i "%au%"=="N" goto :decision
if not defined au ( echo No input added...
goto :umod_uninstall_c
)
echo "%au%" is not valid, try again.
goto :umod_uninstall_c

REM --The old uninstallation method, in case the above ones fail. It openly calls all the uninstallation batches.--
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
if not defined decision ( echo No input added...
goto :decision
)
echo "%decision%" is not valid, try again.
goto :decision

REM --A redirect is made to here if someone trys to run Universal Installer.bat independently.--
:error
echo Run Run.bat and try again.
pause
goto :end

:end
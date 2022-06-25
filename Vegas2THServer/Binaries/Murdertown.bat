@echo OFF
cd /d "%~dp0"
CLS
REM  ****************************** DOCUMENTATION ****************************
REM  ONLINEPLAY:   0 for LAN, 1 for ONLINE)
REM  ONLINE_USERNAME: a valid online account
REM  ONLINE_PASSWORD: password for ONLINE_USERNAME
REM
REM  SERVER_PASSWORD: Password to protect the server. Case sensitive.
REM
REM
REM  GAME_MODE: must be one of the following values. It must also be specified in KellerGame\Config\PC\R6VegasServerConfig.ini
REM      Attack & Defend:   R6AttackDefendGame
REM      Deathmatch:        R6DeathmatchGame  
REM      Team Deathmatch:   R6TeamDeathmatchGame    
REM      Team Leader:	    R6TeamLeaderGame         
REM      Conquest:          R6ConquestGame
REM
REM  INITIAL_MAP: the name of the ini file for the map
REM      - Go to KellerGame\Content\CookedPc\MapsBishop\
REM      - Open the directory of the map you want to add
REM      - Open the ini file of the map you want to add
REM      - Inspect the ini file and look for m_eGameMode=GAMEMODE_
REM      - If you can't find the mode you want the server to run, it means this map isn't compatible with the mode
REM      - If the map is compatible with the mode you want the server to run, 
REM      - copy the name of the ini file, without the extention
REM      - paste it after INITIAL_MAP=    (ex: INITIAL_MAP=Mb01_Import)
REM  
REM  SERVER_OPTIONS_FILE: the name of a server option file 
REM      - located under KellerGame\Config\PC
REM      - without the .ini extention (ex: SERVER_OPTIONS_FILE=R6VegasServerConfig)
REM
REM  TIME_BETWEEN_ROUNDS: Between rounds timer. Game will start when 0 if enough players.
REM
REM  BRIEFING_TIME: Briefing time.
REM  *************************************************************************

REM  ************************** CONFIG ***************************************
REM  ******************** EDIT CONFIG BELOW **********************************
SET ONLINEPLAY=0
SET ONLINE_USERNAME=
SET ONLINE_PASSWORD=
SET SERVER_PASSWORD=
SET RANKED_GAME=0
SET GAME_MODE=R6CoopTerroristHuntGame
SET INITIAL_MAP=Mb09_MurderTown
SET TIME_BETWEEN_ROUNDS=60
SET BRIEFING_TIME=3
SET SERVER_OPTIONS_FILE=R6VegasServerConfig
SET RANDOMRESPAWN=0
SET HARDCORE=0
REM  ********************** END OF CONFIG ************************************

REM  ******************* LAUNCH VEGAS 2 SERVER *********************************
echo Launching Rainbow Six Vegas 2 Stand Alone Dedicated Server

:TAG_ONLINEPLAY
cls
if "%ONLINEPLAY%"=="1" goto TAG_ONLINEPLAY_ENABLED
echo    - Playing on LAN
goto :TAG_GAME_MODE
: TAG_ONLINEPLAY_ENABLED
echo    - Playing Online (username: %ONLINE_USERNAME%)
goto :TAG_GAME_MODE

:TAG_GAME_MODE
echo    - Game Mode: %GAME_MODE%

:TAG_TIME_BETWEEN_ROUNDS
echo    - Time between rounds: %TIME_BETWEEN_ROUNDS%

:TAG_INITIAL_MAP
echo    - Initial Map: %INITIAL_MAP%

:TAG_BRIEFING_TIME
echo    - Briefing time: %BRIEFING_TIME%


:TAG_SERVER_OPTIONS_FILE
echo    - Server Options File: %SERVER_OPTIONS_FILE%

:TAG_SERVER_PASSWORD
echo    - Server Password: %SERVER_PASSWORD%

:TAG_LAUNCH_SERVER
RainbowSixVegas2_SADS.exe engine.servercommandlet %INITIAL_MAP%?AgO=%ONLINEPLAY%?AgU=%ONLINE_USERNAME%?AgP=%ONLINE_PASSWORD%?SrvOptionFile=%SERVER_OPTIONS_FILE%?TB=%BRIEFING_TIME%?TBR=%TIME_BETWEEN_ROUNDS%?GAME=R6Game.%GAME_MODE%?PW=%SERVER_PASSWORD%?HC=%HARDCORE%?RS=%RANDOMRESPAWN%

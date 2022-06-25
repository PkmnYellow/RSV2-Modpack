@echo off
set dir=%1 %2 %3 %4 %5 %6 %7 %8 %9

set dir=%dir:~0,-1%
echo Your directory is: %dir%
echo.

REM --Grabs the directory from Streets Map.xml, sets it into a variable, adjusts it accordingly, and checks if it matches your directory, in case nothing needs to be changed.--
:g_text
if exist "Task Scheduler tasks\Backup" ( goto :g_textb
)
echo Grabbing directory in Streets Map.xml...
for /f "tokens=3 delims=<>" %%g in ('find /i "<Command>" "Task Scheduler tasks\Streets Map.xml"') do set r=%%g

set r=%r:~1,-12%
set r=%r:'=''%

for /f "tokens=3 delims=<>" %%g in ('find /i "<UserId>" "Task Scheduler tasks\Streets Map.xml"') do set user=%%g

if "%user%"=="%username%" ( echo Both UserIDs are identical.
set userid=0
) else ( set userid=1 )

if "%dir%\Binaries\"=="%r%" ( echo.
echo Both directories are identical.
echo.
set command=0
) else ( set command=1 )

echo .xml directory is: %r%
echo UserId is: %user%
pause
goto :loop

REM --Grabs the directory from Backup\Streets Map.xml, sets it into a variable, adjusts it accordingly, and checks if it matches your directory, in case nothing needs to be changed.--
:g_textb
echo Grabbing directory in Streets Map.xml...
for /f "tokens=3 delims=<>" %%g in ('find /i "<Command>" "Task Scheduler tasks\Backup\Streets Map.xml"') do set r=%%g

set r=%r:~1,-12%
set r=%r:'=''%

for /f "tokens=3 delims=<>" %%g in ('find /i "<UserId>" "Task Scheduler tasks\Backup\Streets Map.xml"') do set user=%%g

if "%user%"=="%username%" ( echo Both UserIDs are identical.
set userid=0
) else ( set userid=1 )

if "%dir%\Binaries\"=="%r%" ( echo.
echo Both directories are identical.
echo.
set command=0
) else ( set command=1 )

echo .xml directory is: %r%
echo UserId is: %user%
pause
goto :loop

REM --An if check for backing up the original .xml files to Backup, deleting the original, and proceeds to the task scheduler tasks directory path by replacing the default directory with yours.--
:loop
if not exist "Task Scheduler tasks\Backup" ( echo Backing up original .xml files...
mkdir "Task Scheduler tasks\Backup"
copy /Y "Task Scheduler tasks\*.xml" "Task Scheduler tasks\Backup"
)
del /Q "Task Scheduler tasks\*.xml" 2>nul

if %command%==1 ( if %userid%==1 ( goto :loop_a
) else ( goto :loop1 )
) else ( if %userid%==1 ( goto :loop2 
) else ( echo Both the UserId and directories are identical. No changes needed.
echo Exiting program...
pause
goto :end ) 
)

:loop1
echo Converting .xml file directory paths...
for %%a in ("Task Scheduler tasks\Backup\*.xml") do powershell -Command "(gc '%%a') -replace [regex]::Escape('%r%'), ('%dir%\Binaries\') | Out-File -encoding UTF8 'Task Scheduler tasks\%%~na.xml'"

goto :end 

:loop2
echo Converting .xml userid path...
for %%a in ("Task Scheduler tasks\Backup\*.xml") do powershell -Command "(gc '%%a') -replace [regex]::Escape('%user%'), ('%username%') | Out-File -encoding UTF8 'Task Scheduler tasks\%%~na.xml'"

goto :end 

:loop_a
echo Converting .xml file directory paths...
for %%a in ("Task Scheduler tasks\Backup\*.xml") do powershell -Command "(gc '%%a') -replace [regex]::Escape('%r%'), ('%dir%\Binaries\') | Out-File -encoding UTF8 'Task Scheduler tasks\%%~na.xml'"

echo Converting .xml userid path...
for %%a in ("Task Scheduler tasks\*.xml") do powershell -Command "(gc '%%a') -replace [regex]::Escape('%user%'), ('%username%') | Out-File -encoding UTF8 'Task Scheduler tasks\%%~na.xml'"

goto :end

:end
@echo off
setlocal enabledelayedexpansion

set "batchFolder=%cd%"

:: List all batch files in the current directory excluding "DayZServerLauncher.bat"
set "count=0"
for %%i in ("%batchFolder%\*.bat") do (
    if /i not "%%~nxi"=="DayZServerLauncher.bat" (
        set /a "count+=1"
        set "batFile[!count!]=%%i"
        echo !count!. %%~nxi
    )
)

if %count% equ 0 (
    echo No eligible batch files found in the current directory.
    goto :eof
)

:: Prompt user to select a batch file
echo.
echo.
set /p "choice=Enter the number of the batch file to launch (0 to exit): "

:: Validate user input
if "%choice%" equ "0" goto :eof
if not defined batFile[%choice%] (
    echo Invalid selection. Please enter a valid number.
    goto :eof
)

:: Launch the selected batch file
echo Launching: !batFile[%choice%]!
call "!batFile[%choice%]!"

:end

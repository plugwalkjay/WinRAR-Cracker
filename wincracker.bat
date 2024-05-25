@echo off
title WinCrack - plugwalkjay
color A
if not exist "C:\Program Files\7-Zip" (
    echo 7-Zip not installed!
    pause
    exit
)

echo.
set /p archive="Enter Archive File: "
if not exist "%archive%" (
    echo Archive not found!
    pause
    exit
)

set /p wordlist="Enter wordlist: "
if not exist "%wordlist%" (
    echo Wordlist not found!
    pause
    exit
)
echo Cracking...
for /f %%a in (%wordlist%) do (
    set pass=%%a 
    call :attempt
)
echo go get a bag and some bitches and try again
pause 
exit

:attempt
"C:\Program Files\7-Zip\7z.exe" x -p%pass% "%archive%" -o"cracked" -y >nul 2>&1
echo ATTEMPT : %pass%
if /I %errorlevel% EQU 0 (
    echo Success! Password found: %pass%
    pause
    exit
)
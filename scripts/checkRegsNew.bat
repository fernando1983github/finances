@echo off
SETLOCAL

:: 1. Handle Account Argument
SET "ACCOUNT=%~1"
IF "%ACCOUNT%"=="" SET "ACCOUNT=cash:wallet"

:: Handle shorthand aliases
IF /I "%ACCOUNT%"=="wallet" SET "ACCOUNT=cash:wallet"
IF /I "%ACCOUNT%"=="checking" SET "ACCOUNT=assets:bank:checking"

:: 2. Handle Period Argument
SET "PERIOD=%~2"
IF NOT "%PERIOD%"=="" GOTO run_report

:: Prompt only if period argument was blank
echo Enter date range (e.g., 2026/10/01 to 2026/10/31, 2026-10, or this month):
SET /P "PERIOD=Period: "

:run_report
IF "%PERIOD%"=="" GOTO end

echo.
echo Running hledger for account [%ACCOUNT%] and period [%PERIOD%]...
echo.

hledger -f ~/master.journal reg "%ACCOUNT%" --drop=1 -p "%PERIOD%" -X $

:end
ENDLOCAL
pause
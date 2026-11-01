@echo off
SETLOCAL

:: 1. Read Account (Use 1st argument if provided, otherwise prompt)
SET "ACCOUNT=%~1"
IF NOT "%ACCOUNT%"=="" GOTO check_period

SET /P "ACCOUNT=Enter account: "

:check_period
IF NOT "%ACCOUNT%"=="" GOTO read_period

echo Error: Account cannot be blank.
GOTO end

:read_period
:: 2. Read Period (Use 2nd argument if provided, otherwise prompt)
SET "PERIOD=%~2"
IF NOT "%PERIOD%"=="" GOTO run_report

echo Enter date range (e.g., 2026/10/01 to 2026/11/01, 2026-10, or this month):
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

::Samples
::checkRegsNoDefault.bat cash:wallet "2026/10/01 to 2026/10/31"
::checkRegsNoDefault.bat fuel "2026/10"
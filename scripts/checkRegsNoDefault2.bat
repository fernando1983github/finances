@echo off
SETLOCAL

:: If no arguments are passed at all, run in interactive mode
IF "%~1"=="" IF "%~2"=="" GOTO interactive_mode

:: Command-line mode (arguments provided)
SET "ACCOUNT=%~1"
SET "PERIOD=%~2"
GOTO validate_period

:interactive_mode
SET /P "ACCOUNT=Enter account (leave blank for all accounts): "
echo Enter date range (e.g., 2026/10/01 to 2026/11/01, 2026-10, or this month):
SET /P "PERIOD=Period: "

:validate_period
IF "%PERIOD%"=="" (
    echo Error: Period cannot be blank.
    GOTO end
)

echo.
:: Run with or without the account parameter based on whether ACCOUNT is empty
IF "%ACCOUNT%"=="" (
    echo Running hledger for ALL accounts and period [%PERIOD%]...
    echo.
    hledger -f ~/master.journal reg --drop=1 -p "%PERIOD%" -X $
) else (
    echo Running hledger for account [%ACCOUNT%] and period [%PERIOD%]...
    echo.
    hledger -f ~/master.journal reg "%ACCOUNT%" --drop=1 -p "%PERIOD%" -X $
)

:end
ENDLOCAL
pause

::Samples
::checkRegsNoDefault2.bat cash:wallet "2026/10/01 to 2026/10/31"
::checkRegsNoDefault2.bat fuel "2026/10"
::checkRegsNoDefault2.bat "" "2026/10"
::checkRegsNoDefault2.bat "" "2026"
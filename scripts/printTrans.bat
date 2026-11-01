@echo off
SETLOCAL

:: If no arguments are passed at all, run in interactive mode
IF "%~1"=="" IF "%~2"=="" GOTO interactive_mode

:: Command-line mode (arguments provided)
SET "ACCOUNT=%~1"
SET "PERIOD=%~2"
GOTO validate_period

:interactive_mode
SET /P "ACCOUNT=Enter account filter (leave blank for all accounts): "
echo Enter date or period (e.g., 2026/10/31, 2026-10, or this month):
SET /P "PERIOD=Period: "

:validate_period
IF "%PERIOD%"=="" (
    echo Error: Period cannot be blank.
    GOTO end
)

echo.
:: Run hledger print with or without the account parameter
IF "%ACCOUNT%"=="" (
    echo Running hledger print for ALL accounts and period [%PERIOD%]...
    echo.
    hledger -f ~/master.journal print -p "%PERIOD%" -X $
) else (
    echo Running hledger print for account [%ACCOUNT%] and period [%PERIOD%]...
    echo.
    hledger -f ~/master.journal print "%ACCOUNT%" -p "%PERIOD%" -X $
)

:end
ENDLOCAL
pause

::Samples
::printTrans.bat cash:wallet "2026/10/01 to 2026/10/31"
::printTrans.bat fuel "2026/10"
::printTrans.bat "" "2026/10"
::printTrans.bat "" "2026"
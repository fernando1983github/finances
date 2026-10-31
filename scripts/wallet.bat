::@echo off

::echo wallet 2026
::echo wallet movements, date range
::The --historical/-H flag adds the balance from any undisplayed prior  post-activity, with a historically accurate running balance:
::hledger -f ~/master.journal reg cash:wallet --drop=1 -b 2026/10/01 -e 2026/10/31 -X $ -H
::hledger -f ~/master.journal reg cash:wallet --drop=1 -b 2026/10/01 -e 2026/10/31 -X $

@echo off
SETLOCAL

:: Check for required date arguments
IF "%~1"=="" (
    echo Error: Start date missing.
    echo Usage: %~nx0 [YYYY/MM/DD] [YYYY/MM/DD]
    GOTO :eof
)
IF "%~2"=="" (
    echo Error: End date missing.
    echo Usage: %~nx0 [YYYY/MM/DD] [YYYY/MM/DD]
    GOTO :eof
)

SET "START_DATE=%~1"
SET "END_DATE=%~2"

:: Execute hledger using input arguments
::hledger -f ~/master.journal reg cash:wallet --drop=1 -b %START_DATE% -e %END_DATE% -X $
:: Pass range via -p "START to END"
hledger -f ~/master.journal reg cash:wallet --drop=1 -p "%START_DATE% to %END_DATE%" -X $

ENDLOCAL
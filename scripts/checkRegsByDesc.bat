@echo off
SETLOCAL

:: Check if command-line arguments were provided (%1 = Description, %2 = Period)
IF NOT "%~1"=="" (
    SET "DESC=%~1"
    SET "PERIOD=%~2"
    GOTO validate_desc
)

:interactive_mode
SET /P "DESC=Enter description match (cannot be blank): "
echo Enter date range (e.g., 2026-10, or leave blank to skip):
SET /P "PERIOD=Enter period: "

:validate_desc
:: Validate that DESC is not empty
IF "%DESC%"=="" (
    echo.
    echo Error: Description cannot be blank.
    GOTO end
)

:run_query
echo.
echo Running hledger query for description [%DESC%]...
echo.

:: Execute hledger with description and optional period
IF "%PERIOD%"=="" (
    hledger -f ~/master.journal reg desc:"%DESC%"
) ELSE (
    echo Period: [%PERIOD%]
    echo.
    hledger -f ~/master.journal reg desc:"%DESC%" -p "%PERIOD%"
)

:end
ENDLOCAL
pause

::Samples
::checkRegsByDesc.bat
::checkRegsByDesc.bat "Pamo"
::checkRegsByDesc.bat "Pamo" "2026-08"
@echo off
SETLOCAL

echo Enter date range (e.g., "2026/10/01 to 2026/11/01", "2026-10", or "this month"):
SET /P "PERIOD=Period: "

IF "%PERIOD%"=="" GOTO :eof

echo.
echo Running hledger for period: %PERIOD%
echo.

hledger -f ~/master.journal reg cash:wallet --drop=1 -p "%PERIOD%" -X $

ENDLOCAL
pause
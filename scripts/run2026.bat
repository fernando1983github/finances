@echo off

This needed to be run before adding a transaction
REM to run on a cmd(ms-dos) windows
REM This command only fixes the current window. If you close the Command Prompt and open a new one, you will need to type chcp 65001 again.
REM chcp 65001

REM powershell
REM $OutputEncoding = [Console]::OutputEncoding = [System.Text.Encoding]::UTF8

REM cls
echo MONTHLY
echo 2025
:: GOOD, monthly with no period
hledger -f ~/master.journal -BsS bse -p 2025
hledger -f ~/master.journal bal -BMTsS --drop=1 -p 2025
hledger -f ~/master.journal is -BMTsS --drop=1 -p 2025

echo 2026
hledger -f ~/master.journal -BsS bse -p 2026
hledger -f ~/master.journal bal -BMTsS --drop=1 -p 2026
hledger -f ~/master.journal is -BMTsS --drop=1 -p 2026


:: hledger -f ~/master.journal -BsS bse -p 2026 -o bse.csv
:: hledger -f ~/master.journal bal -BMTsS --drop=1 -p 2026 -o bal.csv
:: hledger -f ~/master.journal is -BMTsS --drop=1 -p 2026 -o is.csv

:: echo QUARTERLY
:: GOOD, quarterly with no period
:: hledger -f ~/master.journal -BsS bse
:: hledger -f ~/master.journal bal -QBTt
:: hledger -f ~/master.journal is -QBTt



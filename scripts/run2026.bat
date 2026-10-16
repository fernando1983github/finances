@echo off

::This needed to be run before adding a transaction
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
::hledger -f ~/master.journal -BsS bse -p 2026
::hledger -f ~/master.journal bal -BMTsS --drop=1 -p 2026
::hledger -f ~/master.journal is -BMTsS --drop=1 -p 2026
::hledger -f ~/master.journal bse -p 2026 -sS -X $ -V
::hledger -f ~/master.journal bal -MTsS --drop=1 -p 2026 -X $
::hledger -f ~/master.journal is -MTsS --drop=1 -p 2026 -X $



:::: true Total Net Worth (Unified Cash View)
::hledger -f ~/master.journal bse -p 2026 -sS -X $
:::: audit just your Portfolio Inventory (Share Check)
::::hledger -f ~/master.journal bal assets:investments assets:schneider -V

:::: Unified Monthly Summary Tabl
::hledger -f ~/master.journal bal -MTsS --drop=1 -p 2026 -X $
::hledger -f ~/master.journal bal -MTsS --drop=1 -p 2026 -X $ type:A
::hledger -f ~/master.journal bal -MTsS --drop=1 -p 2026 -X $ type:E

:::: Unified Monthly Income Statement (is)
::::hledger -f ~/master.journal is -MTsS --drop=1 -p 2026 -X $
::::hledger -f ~/master.journal is -MTsS --drop=1 -p 2026 --value=then,$
::hledger -f ~/master.journal is -BMTsS --drop=1 -p 2026


echo GOOOOODS
::shows euro
hledger -f ~/master.journal bse -p 2026 -sS -V
::conversion to $ pesos
hledger -f ~/master.journal bse -p 2026 -sS -V -X $
::good
::hledger -f ~/master.journal bal -MTsS --drop=1 -p 2026 -B
::hledger -f ~/master.journal bal -VMTsS --drop=1 -p 2026 -X $ -B
::hledger -f ~/master.journal bal -VMTsS --drop=1 -p 2026 -X $ --value=then,$ -B
hledger -f ~/master.journal bal -VMTsS --drop=1 -p 2026 -X $
::hledger -f ~/master.journal bal -VDTsS --drop=1 -p "2026/9/1 to 2026/9/3" -X $
::hledger -f ~/master.journal bal -BMTsS --drop=1 -p 2026 type:A
hledger -f ~/master.journal is -BMTsS --drop=1 -p 2026


:: hledger -f ~/master.journal -BsS bse -p 2026 -o bse.csv
:: hledger -f ~/master.journal bal -BMTsS --drop=1 -p 2026 -o bal.csv
:: hledger -f ~/master.journal is -BMTsS --drop=1 -p 2026 -o is.csv

:: echo QUARTERLY
:: GOOD, quarterly with no period
:: hledger -f ~/master.journal -BsS bse
:: hledger -f ~/master.journal bal -QBTt
:: hledger -f ~/master.journal is -QBTt



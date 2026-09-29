@echo off
cls
REM hledger register sivale:incentivos
REM hledger add --color=no

REM hledger conf has --cost(-B param), calculates when #@price is present

:: All months since first movement, its bad printed
:: hledger -BsS bse
:: hledger bal -BMTsS --drop=1
:: hledger is -BMTsS --drop=1

:: By Year
hledger -BsS bse -p2025
hledger bal -BMTsS -p2025 --drop=1
hledger is -BMTsS -p2025 --drop=1


:: just starting from 2025
:: hledger -BsS bse -b 2025/01
:: hledger bal -BMTsS -b 2025/01 --drop=1
:: hledger is -BMTsS -b 2025/01 --drop=1

:: as quarters(needs to be checked)
:: hledger bal -MTBH -p "quarterly from 2024"
:: hledger bal -BQTsS -b 2025/01 --drop=1
:: hledger is -BQTsS -b 2025/01 --drop=1

:: GOOD
:: hledger -BsS bse -p "2024 to 2026"
:: hledger bal -QBTt -p "2024 to 2026"
:: hledger is -QBTt -p "2024 to 2026"




:: BAD
:: hledger -BsS bse -p 2024Q2
:: hledger bal -BMTsS -p 2024Q2 --drop=1
:: hledger is -BMTsS -p 2024Q2 --drop=1

REM hledger -BQsS bse
REM hledger bal -BQTsS --drop=1
REM hledger is -BQTsS --drop=1


:: hledger -sSH bse -p2025
:: hledger bal -MTsSH --drop=1 -p2025
:: hledger is -MTsSH --drop=1 -p2025
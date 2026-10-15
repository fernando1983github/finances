@echo off
::hledger -f ~/master.journal reg -BM expenses:car:maintenance
hledger -f ~/master.journal reg expenses:car:maintenance not:assets not:liabilities
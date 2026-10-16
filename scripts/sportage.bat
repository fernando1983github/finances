@echo off
::hledger -f ~/master.journal reg -BM expenses:car:maintenance
hledger -f ~/master.journal reg expenses:car:maintenance not:assets not:liabilities
::hledger -f ~/master.journal bal -VMST car: --drop=1 -p 2026 -X $
::hledger -f ~/master.journal bal -3 -VMST car: --drop=1 -p 2026 -X $
::not hledger -f ~/master.journal bal -1 -VMST car: --drop=0 -p 2026 -X $
::hledger -f ~/master.journal bal -2 -VMST car: --drop=1 -p 2026 -X $
::hledger -f ~/master.journal bal -3 -VMST entertainment: --drop=1 -b 2026 -e 2026/4/30 -X $
::hledger -f ~/master.journal bal -3 -VMST sivale: --drop=1 -b 2026 -e 2026/4/4 -X $
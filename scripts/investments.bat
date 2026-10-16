@echo off

echo 2026

echo View the Cost on its own, To verify what you originally paid
hledger -f ~\master.journal balance assets:bank:hsbc:investments -B
echo.
echo View the Market Value on its own (Recommended)
hledger -f ~\master.journal balance assets:bank:hsbc:investments -V
echo.
echo How much money did you gain on paper?
hledger -f ~\master.journal balance assets:bank:hsbc:investments --gain
echo.

echo.
echo.

echo EUR
echo View the Cost on its own, To verify what you originally paid
hledger -f ~\master.journal balance assets:schneider:investments:company_plan -B
echo View the Market Value on its own (Recommended)
hledger -f ~\master.journal balance assets:schneider:investments:company_plan -V
echo.
echo How much money did you gain on paper?
hledger -f ~\master.journal balance assets:schneider:investments:company_plan --gain -X EUR
echo.

echo pesos
echo View the Cost on its own, To verify what you originally paid
hledger -f ~\master.journal balance assets:schneider:investments:company_plan -B -X $
echo.
echo View the Market Value on its own (Recommended)
hledger -f ~\master.journal balance assets:schneider:investments:company_plan -V -X $
echo.
echo How much money did you gain on paper?
hledger -f ~\master.journal balance assets:schneider:investments:company_plan --gain -X $
::hledger -f ~\master.journal balance assets:schneider:investments:company_plan -b 2026-10-01 -e 2026-10-06 --gain -X EUR
::hledger -f ~\master.journal balance -DT assets:schneider:investments:company_plan -b 2026-10-01 -e 2026-10-12 --gain -X EUR
::hledger -f ~\master.journal balance -DT investments -b 2026-10-01 -e 2026-10-12 --gain -X EUR
::hledger -f ~\master.journal balance -3 --drop 1 -DTS investments -b 2026-10-02 -e 2026-10-12 --gain -X EUR
::hledger -f ~/master.journal bal -VMST liabilities --drop=1 -p 2026 -X $
::hledger -f ~/master.journal bal -2 -VMT --drop=1 -p 2026 -X $
echo.
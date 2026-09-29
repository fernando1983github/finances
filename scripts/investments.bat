@echo off

echo 2026

echo View the Cost on its own, To verify what you originally paid
hledger -f ~\2026.journal balance assets:bank:hsbc:investments -B
echo.
echo View the Market Value on its own (Recommended)
hledger -f ~\2026.journal balance assets:bank:hsbc:investments -V
echo.
echo How much money did you gain on paper?
hledger -f ~\2026.journal balance assets:bank:hsbc:investments --gain
echo.

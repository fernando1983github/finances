@echo off
:: see registers without liablilites and cards
::hledger -f ~/master.journal reg tag:trip=sta-maria-regla not:assets not:liabilities
:: entries exactly as you wrote them—including all inline comments—use
::hledger -f ~/master.journal print tag:trip=sta-maria-regla

echo.
echo Balanced View
:: Command 1: The Balanced View
:: complete cost of just that trip, displays zero balance
hledger -f ~/master.journal bal tag:trip=sta-maria-regla -H

echo.
echo Expense View
:: Command 2: The Expense View
:: Use a Negative Account Filter
:: By adding not:assets not:liabilities, you strip away your Banamex card, credit cards, and cash wallet lines completely. Hledger is left with only your positive spending categories, meaning the bottom line will finally show the true accumulated cost of the trip instead of balancing to zero.
:: displays actual total spending
hledger -f ~/master.journal bal tag:trip=sta-maria-regla not:assets not:liabilities -H
::hledger -f ~/master.journal is tag:trip=sta-maria-regla not:assets not:liabilities -H

echo.
echo Inverse
echo Account Group Filter
:: To view the exact inverse. Instead of excluding assets and liabilities, you tell hledger to only include them, or you exclude your expenses and income instead.
:: show exactly how you paid for the trip (which bank accounts, credit cards, or physical wallets the money came out of) without showing the itemized receipts or category trees.
:: Option 1: The Account Group Filter (Simplest)
hledger -f ~/master.journal bal tag:trip=sta-maria-regla assets liabilities -H

echo.
echo Explicit Exclusion Filter
:: Option 2: The Explicit Exclusion Filter
hledger -f ~/master.journal bal tag:trip=sta-maria-regla not:expenses not:income -H


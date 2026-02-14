# ORIGINAL MODPACK

https://github.com/FactorioParanoidal/ParanoidalModpack/

# Goal

Restore PARANOIDAL modpack under Factorio 2.73 + Space age

All changes must be in zzzcompability and 0zzzcompability in order to simplify updates of mods in modpack

## Fixes structure

Fixes must use asserts instead of common if -- else statements. Purpose for this is to hold only fixes that are really needed. If fixed mod publish his own update that refix the bug, asserts must fails that signals that the current fix don't need anymore and must be removed

NO LEGACY CODE THAT DO NOTHING!

# Structure
Fixes divided into 2 parts -- pre fix and post fix

1. 0zzzcompability -- prefixes

There usually stored fixes in name resolution

For example since 2.0.0 bob/angels mod add prefixes bob-/angels- to their's items names but not all mods now know it, so i add hook to search items with bob-/angels- prefixes when common search fails

2. zzzcompability -- postfixes

Fixes broken factorio entities


3. KaoExtended -- core legacy PARANOIDAL -- may be fixed in ./mods/KaoExtended
4. zzzparanoidal -- core legacy PARANOIDAL -- may be fixed in ./mods/zzzparanoidal

# Detail to know
For angels mods i use dev2.0 branch from github. Master branch stuggles for 2 years already


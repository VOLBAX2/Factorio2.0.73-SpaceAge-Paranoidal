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

## Disabled things while i dont understand why they need

1. 	KaoExtended/data.lua -- Re-enabling bob's alloys
2.	KaoExtended/data-final-fixes.lua -- Re-enabling bob's alloys
3.	zzzparanoidal/settings-final-fixes.lua -- reskins-library custom colors tiers
	They in the library settings but it seems like other mod remove it
4. zzzparanoidal/prototypes/offshore-pump/entity-offshore-pump.lua -- seafloor-pump moved to angels-seafloor-pump, where going seafloor-pumps with higher tier i don't know so i remove it's settings for a while
5. zzzparanoidal/prototypes/beltentities.lua  -- remove miniloader setting fixes. miniloader-redux change miniloader creation strongly so it is outdated and needs reworks(if any)
6. zzzparanoidal/prototypes/micro-fix.lua -- there used undefined global 'rolling_stock_stand_by_light' i remove options with it so it's optional

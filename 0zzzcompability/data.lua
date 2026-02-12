local Binder = require("utils.binder")
local BobwarfareNameMap = require("raw.migrationData.bobwarfare")
local SchallNameMap = require("raw.migrationData.SchallTankPlatoon")

-- Warheads_Continues + bobwarfare fix
-- Warheads attemts to read data.raw.ammo["some-key"]
-- but bobwarfare migrates to "bob-some-key" so it return nil and error later
-- there i try to add prefix bob- on access if it not there yet
if data.raw and data.raw.ammo then
	Binder.BindAccessMetatableInChain(data.raw.ammo, {
		__index = function(tbl, key)
			local value = BobwarfareNameMap[key]
			if value then
				return tbl[value]
			end
		end,
	})
end

-- Warheads_Continues + SchallTankPlatoon fix
-- Situation the same as with bobwarfare
if data.raw and data.raw.ammo then
	Binder.BindAccessMetatableInChain(data.raw.ammo, {
		__index = function(tbl, key)
			local value = SchallNameMap[key]
			if value then
				return tbl[value]
			end
		end,
	})
end

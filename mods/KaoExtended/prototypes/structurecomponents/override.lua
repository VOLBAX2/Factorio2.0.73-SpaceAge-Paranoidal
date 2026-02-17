local function replaceMachine()
	KaoExtended.recipe.add_to_recipe("warehouse-basic", { "basic-structure-components", 5 })

	KaoExtended.recipe.add_to_recipe("factory-2", { "basic-structure-components", 50 })
	KaoExtended.recipe.add_to_recipe("factory-2", { "factory-1", 2 })
	KaoExtended.recipe.add_to_recipe("factory-3", { "intermediate-structure-components", 50 })
	KaoExtended.recipe.add_to_recipe("factory-3", { "factory-2", 2 })

	KaoExtended.recipe.add_to_recipe("angels-salination-plant", { "intermediate-structure-components", 5 })
	KaoExtended.recipe.add_to_recipe("angels-salination-plant-2", { "advanced-structure-components", 5 })
	KaoExtended.recipe.add_to_recipe("angels-salination-plant-2", { "angels-salination-plant", 2 })

	KaoExtended.recipe.add_to_recipe("angels-washing-plant-2", { "intermediate-structure-components", 3 })

	KaoExtended.recipe.add_to_recipe("centrifuge", { "intermediate-structure-components", 3 })
	KaoExtended.recipe.add_to_recipe("bob-centrifuge-2", { "advanced-structure-components", 3 })
	KaoExtended.recipe.add_to_recipe("bob-centrifuge-3", { "advanced-structure-components", 10 })

	KaoExtended.recipe.add_to_recipe("assembling-machine-2", { "basic-structure-components", 1 })
	KaoExtended.recipe.add_to_recipe("assembling-machine-3", { "intermediate-structure-components", 2 })
	KaoExtended.recipe.add_to_recipe("bob-assembling-machine-4", { "intermediate-structure-components", 5 })
	KaoExtended.recipe.add_to_recipe("bob-assembling-machine-5", { "advanced-structure-components", 2 })
	KaoExtended.recipe.add_to_recipe("bob-assembling-machine-6", { "advanced-structure-components", 10 })

	KaoExtended.recipe.add_to_recipe("rocket-silo", { "bob-assembling-machine-6", 100 })

	KaoExtended.recipe.add_to_recipe("bob-electronics-machine-1", { "basic-structure-components", 2 })
	KaoExtended.recipe.add_to_recipe("bob-electronics-machine-2", { "intermediate-structure-components", 3 })
	KaoExtended.recipe.add_to_recipe("bob-electronics-machine-3", { "advanced-structure-components", 3 })

	KaoExtended.recipe.add_to_recipe("bob-electronics-machine-1", { "inserter", 4 })
	KaoExtended.recipe.add_to_recipe("bob-electronics-machine-2", { "long-handed-inserter", 4 })
	KaoExtended.recipe.add_to_recipe("bob-electronics-machine-3", { "bob-turbo-inserter", 4 })

	KaoExtended.recipe.add_to_recipe("oil-refinery", { "basic-structure-components", 1 })
	KaoExtended.recipe.add_to_recipe("angels-oil-refinery-2", { "intermediate-structure-components", 2 })
	KaoExtended.recipe.add_to_recipe("angels-oil-refinery-3", { "intermediate-structure-components", 8 })
	KaoExtended.recipe.add_to_recipe("angels-oil-refinery-4", { "advanced-structure-components", 2 })

	KaoExtended.recipe.add_to_recipe("chemical-plant", { "basic-structure-components", 1 })
	KaoExtended.recipe.add_to_recipe("angels-chemical-plant-2", { "intermediate-structure-components", 2 })
	KaoExtended.recipe.add_to_recipe("angels-chemical-plant-3", { "intermediate-structure-components", 8 })
	KaoExtended.recipe.add_to_recipe("angels-chemical-plant-4", { "advanced-structure-components", 2 })

	KaoExtended.recipe.add_to_recipe("steel-furnace", { "stone-furnace", 2 })
	KaoExtended.recipe.add_to_recipe("electric-furnace", { "steel-furnace", 2 })

	KaoExtended.recipe.add_to_recipe("electric-furnace", { "basic-structure-components", 1 })
	KaoExtended.recipe.add_to_recipe("bob-electric-furnace-2", { "intermediate-structure-components", 2 })
	KaoExtended.recipe.add_to_recipe("bob-electric-furnace-3", { "advanced-structure-components", 2 })

	KaoExtended.recipe.add_to_recipe("angels-electrolyser", { "basic-structure-components", 1 })
	KaoExtended.recipe.add_to_recipe("angels-electrolyser-2", { "intermediate-structure-components", 2 })
	KaoExtended.recipe.add_to_recipe("angels-electrolyser-3", { "intermediate-structure-components", 8 })
	KaoExtended.recipe.add_to_recipe("angels-electrolyser-4", { "advanced-structure-components", 2 })

	KaoExtended.recipe.add_to_recipe("bob-electric-chemical-mixing-furnace", { "intermediate-structure-components", 2 })
	KaoExtended.recipe.add_to_recipe("bob-electric-chemical-mixing-furnace-2", { "advanced-structure-components", 2 })

	KaoExtended.recipe.add_to_recipe("bob-electric-mixing-furnace", { "bob-electric-chemical-furnace", 2 })
	KaoExtended.recipe.add_to_recipe("bob-electric-mixing-furnace", { "basic-structure-components", 2 })

	KaoExtended.recipe.add_to_recipe("bob-electric-chemical-furnace", { "bob-stone-chemical-furnace", 2 })
	KaoExtended.recipe.add_to_recipe("bob-electric-chemical-furnace", { "basic-structure-components", 2 })
end
local function replaceMining()
	KaoExtended.recipe.add_to_recipe("bob-mining-drill-1", { "basic-structure-components", 1 })
	KaoExtended.recipe.add_to_recipe("bob-mining-drill-2", { "intermediate-structure-components", 2 })
	KaoExtended.recipe.add_to_recipe("bob-mining-drill-3", { "advanced-structure-components", 2 })
	KaoExtended.recipe.add_to_recipe("bob-mining-drill-4", { "anotherworld-structure-components", 2 })

	KaoExtended.recipe.add_to_recipe("bob-area-mining-drill-1", { "basic-structure-components", 1 })
	KaoExtended.recipe.add_to_recipe("bob-area-mining-drill-2", { "intermediate-structure-components", 2 })
	KaoExtended.recipe.add_to_recipe("bob-area-mining-drill-3", { "advanced-structure-components", 2 })
	KaoExtended.recipe.add_to_recipe("bob-area-mining-drill-4", { "anotherworld-structure-components", 2 })

	KaoExtended.recipe.add_to_recipe("bob-pumpjack-1", { "basic-structure-components", 1 })
	KaoExtended.recipe.add_to_recipe("bob-pumpjack-2", { "intermediate-structure-components", 2 })
	KaoExtended.recipe.add_to_recipe("bob-pumpjack-3", { "advanced-structure-components", 2 })
end
local function replacePower()
	KaoExtended.recipe.add_to_recipe("bob-steam-engine-2", { "basic-structure-components", 1 })
	KaoExtended.recipe.add_to_recipe("bob-steam-engine-3", { "intermediate-structure-components", 1 })

	if data.raw["item"]["petroleum-generator"] then
		KaoExtended.recipe.add_to_recipe("petroleum-generator", { "steam-engine-3", 1 })
		KaoExtended.recipe.add_to_recipe("petroleum-generator", { "advanced-structure-components", 1 })
	end
	if data.raw["item"]["steam-turbine"] then
		KaoExtended.recipe.add_to_recipe("steam-turbine", { "advanced-structure-components", 3 })
		KaoExtended.recipe.add_to_recipe("bob-steam-turbine-2", { "advanced-structure-components", 5 })
		KaoExtended.recipe.add_to_recipe("bob-steam-turbine-3", { "anotherworld-structure-components", 1 })
		KaoExtended.recipe.add_to_recipe("nuclear-reactor", { "bob-boiler-4", 1 })
		KaoExtended.recipe.add_to_recipe("nuclear-reactor", { "advanced-structure-components", 10 })
	end

	KaoExtended.recipe.add_to_recipe("bob-solar-panel-small", { "basic-structure-components", 1 })
	KaoExtended.recipe.add_to_recipe("solar-panel", { "basic-structure-components", 2 })
	KaoExtended.recipe.add_to_recipe("bob-solar-panel-large", { "basic-structure-components", 3 })

	KaoExtended.recipe.add_to_recipe("bob-solar-panel-small-2", { "intermediate-structure-components", 1 })
	KaoExtended.recipe.add_to_recipe("bob-solar-panel-2", { "intermediate-structure-components", 2 })
	KaoExtended.recipe.add_to_recipe("bob-solar-panel-large-2", { "intermediate-structure-components", 3 })

	KaoExtended.recipe.add_to_recipe("bob-solar-panel-small-3", { "advanced-structure-components", 1 })
	KaoExtended.recipe.add_to_recipe("bob-solar-panel-3", { "advanced-structure-components", 2 })
	KaoExtended.recipe.add_to_recipe("bob-solar-panel-large-3", { "advanced-structure-components", 3 })
end

local function replaceAngelRefi()
	KaoExtended.recipe.add_to_recipe("angels-thermal-extractor", { "basic-structure-components", 1 })

	KaoExtended.recipe.add_to_recipe("angels-ore-crusher-2", { "intermediate-structure-components", 1 })
	KaoExtended.recipe.add_to_recipe("angels-ore-crusher-2", { "engine-unit", 2 })
	KaoExtended.recipe.add_to_recipe("angels-ore-crusher-3", { "advanced-structure-components", 2 })
	KaoExtended.recipe.add_to_recipe("angels-ore-crusher-3", { "electric-engine-unit", 2 })

	KaoExtended.recipe.add_to_recipe("angels-ore-sorting-facility-2", { "basic-structure-components", 2 })
	KaoExtended.recipe.add_to_recipe("angels-ore-sorting-facility-3", { "intermediate-structure-components", 3 })
	KaoExtended.recipe.add_to_recipe("angels-ore-sorting-facility-4", { "advanced-structure-components", 4 })

	KaoExtended.recipe.add_to_recipe("angels-ore-floatation-cell", { "basic-structure-components", 1 })
	KaoExtended.recipe.add_to_recipe("angels-ore-floatation-cell-2", { "intermediate-structure-components", 2 })
	KaoExtended.recipe.add_to_recipe("angels-ore-floatation-cell-3", { "advanced-structure-components", 2 })

	KaoExtended.recipe.add_to_recipe("angels-ore-leaching-plant", { "basic-structure-components", 1 })
	KaoExtended.recipe.add_to_recipe("angels-ore-leaching-plant-2", { "intermediate-structure-components", 2 })
	KaoExtended.recipe.add_to_recipe("angels-ore-leaching-plant-3", { "advanced-structure-components", 2 })

	KaoExtended.recipe.add_to_recipe("angels-ore-refinery", { "intermediate-structure-components", 2 })
	KaoExtended.recipe.add_to_recipe("angels-ore-refinery-2", { "advanced-structure-components", 4 })

	KaoExtended.recipe.add_to_recipe("angels-filtration-unit", { "basic-structure-components", 4 })
	KaoExtended.recipe.add_to_recipe("angels-filtration-unit-2", { "intermediate-structure-components", 4 })

	KaoExtended.recipe.add_to_recipe("angels-crystallizer", { "basic-structure-components", 4 })
	KaoExtended.recipe.add_to_recipe("angels-crystallizer-2", { "intermediate-structure-components", 4 })

	KaoExtended.recipe.add_to_recipe("angels-hydro-plant", { "basic-structure-components", 2 })
	KaoExtended.recipe.add_to_recipe("angels-hydro-plant-2", { "intermediate-structure-components", 2 })
	KaoExtended.recipe.add_to_recipe("angels-hydro-plant-3", { "advanced-structure-components", 2 })

	KaoExtended.recipe.add_to_recipe("angels-algae-farm-2", { "basic-structure-components", 5 })
	KaoExtended.recipe.add_to_recipe("angels-algae-farm-3", { "intermediate-structure-components", 5 })
end

local function replaceAngelPetro()
	KaoExtended.recipe.add_to_recipe("angels-electrolyser", { "basic-structure-components", 1 })
	KaoExtended.recipe.add_to_recipe("angels-electrolyser-2", { "intermediate-structure-components", 2 })
	KaoExtended.recipe.add_to_recipe("angels-electrolyser-3", { "intermediate-structure-components", 8 })
	KaoExtended.recipe.add_to_recipe("angels-electrolyser-4", { "advanced-structure-components", 2 })

	KaoExtended.recipe.add_to_recipe("angels-advanced-chemical-plant", { "intermediate-structure-components", 3 })
	KaoExtended.recipe.add_to_recipe("angels-advanced-chemical-plant-2", { "advanced-structure-components", 3 })

	KaoExtended.recipe.add_to_recipe("angels-gas-refinery-small", { "basic-structure-components", 1 })
	KaoExtended.recipe.add_to_recipe("angels-gas-refinery-small-2", { "intermediate-structure-components", 2 })
	KaoExtended.recipe.add_to_recipe("angels-gas-refinery-small-3", { "intermediate-structure-components", 8 })
	KaoExtended.recipe.add_to_recipe("angels-gas-refinery-small-4", { "advanced-structure-components", 2 })

	KaoExtended.recipe.add_to_recipe("angels-gas-refinery", { "basic-structure-components", 5 })
	KaoExtended.recipe.add_to_recipe("angels-gas-refinery-2", { "intermediate-structure-components", 5 })
	KaoExtended.recipe.add_to_recipe("angels-gas-refinery-3", { "intermediate-structure-components", 10 })
	KaoExtended.recipe.add_to_recipe("angels-gas-refinery-4", { "advanced-structure-components", 5 })

	KaoExtended.recipe.add_to_recipe("angels-separator", { "basic-structure-components", 1 })
	KaoExtended.recipe.add_to_recipe("angels-separator-2", { "intermediate-structure-components", 2 })
	KaoExtended.recipe.add_to_recipe("angels-separator-3", { "intermediate-structure-components", 8 })
	KaoExtended.recipe.add_to_recipe("angels-separator-4", { "advanced-structure-components", 2 })

	KaoExtended.recipe.add_to_recipe("angels-steam-cracker", { "basic-structure-components", 1 })
	KaoExtended.recipe.add_to_recipe("angels-steam-cracker-2", { "intermediate-structure-components", 2 })
	KaoExtended.recipe.add_to_recipe("angels-steam-cracker-3", { "intermediate-structure-components", 8 })
	KaoExtended.recipe.add_to_recipe("angels-steam-cracker-4", { "advanced-structure-components", 2 })

	KaoExtended.recipe.add_to_recipe("angels-storage-tank-2", { "basic-structure-components", 4 })
	KaoExtended.recipe.add_to_recipe("angels-storage-tank-1", { "intermediate-structure-components", 6 })
end

local function replaceAngelMe()
	KaoExtended.recipe.add_to_recipe("angels-blast-furnace", { "basic-structure-components", 5 })
	KaoExtended.recipe.add_to_recipe("angels-blast-furnace-2", { "intermediate-structure-components", 5 })
	KaoExtended.recipe.add_to_recipe("angels-blast-furnace-3", { "advanced-structure-components", 5 })
	KaoExtended.recipe.add_to_recipe("angels-blast-furnace-4", { "advanced-structure-components", 10 })

	KaoExtended.recipe.add_to_recipe("angels-induction-furnace", { "basic-structure-components", 5 })
	KaoExtended.recipe.add_to_recipe("angels-induction-furnace-2", { "intermediate-structure-components", 5 })
	KaoExtended.recipe.add_to_recipe("angels-induction-furnace-3", { "advanced-structure-components", 5 })
	KaoExtended.recipe.add_to_recipe("angels-induction-furnace-4", { "advanced-structure-components", 10 })

	KaoExtended.recipe.add_to_recipe("angels-casting-machine", { "basic-structure-components", 5 })
	KaoExtended.recipe.add_to_recipe("angels-casting-machine-2", { "intermediate-structure-components", 5 })
	KaoExtended.recipe.add_to_recipe("angels-casting-machine-3", { "advanced-structure-components", 5 })
	KaoExtended.recipe.add_to_recipe("angels-casting-machine-4", { "advanced-structure-components", 10 })

	KaoExtended.recipe.add_to_recipe("angels-ore-processing-machine", { "basic-structure-components", 5 })
	KaoExtended.recipe.add_to_recipe("angels-ore-processing-machine-2", { "intermediate-structure-components", 5 })
	KaoExtended.recipe.add_to_recipe("angels-ore-processing-machine-3", { "advanced-structure-components", 5 })
	KaoExtended.recipe.add_to_recipe("angels-ore-processing-machine-4", { "advanced-structure-components", 10 })

	KaoExtended.recipe.add_to_recipe("angels-pellet-press", { "basic-structure-components", 5 })
	KaoExtended.recipe.add_to_recipe("angels-pellet-press-2", { "intermediate-structure-components", 5 })
	KaoExtended.recipe.add_to_recipe("angels-pellet-press-3", { "advanced-structure-components", 5 })
end

local function replaceRobot()
	KaoExtended.recipe.add_to_recipe("bob-roboport-2", { "intermediate-structure-components", 2 })
	KaoExtended.recipe.add_to_recipe("bob-roboport-3", { "advanced-structure-components", 2 })
	KaoExtended.recipe.add_to_recipe("bob-roboport-4", { "anotherworld-structure-components", 1 })
end

local function addtoPowerarmor()
	KaoExtended.recipe.add_to_recipe("bob-power-armor-mk3", { "space-science-pack", 100 })
	KaoExtended.recipe.add_to_recipe("bob-power-armor-mk4", { "planetary-data", 1 })
	KaoExtended.recipe.add_to_recipe("bob-power-armor-mk5", { "station-science", 1 })
end

replaceMachine()
replaceMining()
replacePower()
replaceAngelRefi()
replaceAngelPetro()
replaceAngelMe()
replaceRobot()
addtoPowerarmor()

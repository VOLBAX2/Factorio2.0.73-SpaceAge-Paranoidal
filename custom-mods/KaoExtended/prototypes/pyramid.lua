require("__zzzparanoidal__.paralib")
--BOBS + VANILLA

paralib.bobmods.lib.recipe.add_new_ingredient("submachine-gun", { type = "item", name = "pistol", amount = 2 })

paralib.bobmods.lib.recipe.remove_ingredient("bob-logistic-robot-2", "logistic-robot")
paralib.bobmods.lib.recipe.remove_ingredient("bob-construction-robot-2", "construction-robot")
paralib.bobmods.lib.recipe.remove_ingredient("bob-logistic-robot-3", "bob-logistic-robot-2")
paralib.bobmods.lib.recipe.remove_ingredient("bob-construction-robot-3", "bob-construction-robot-2")
paralib.bobmods.lib.recipe.remove_ingredient("bob-logistic-robot-4", "bob-logistic-robot-3")
paralib.bobmods.lib.recipe.remove_ingredient("bob-construction-robot-4", "bob-construction-robot-3")
paralib.bobmods.lib.recipe.add_ingredient("bob-logistic-robot-2", { type = "item", name = "logistic-robot", amount = 2 })
paralib.bobmods.lib.recipe.add_ingredient("bob-construction-robot-2", { type = "item", name="construction-robot",amount= 2 })
paralib.bobmods.lib.recipe.add_ingredient("bob-logistic-robot-3", { type = "item", name="bob-logistic-robot-2",amount= 2 })
paralib.bobmods.lib.recipe.add_ingredient("bob-construction-robot-3", { type = "item", name="bob-construction-robot-2",amount= 2 })
paralib.bobmods.lib.recipe.add_ingredient("bob-logistic-robot-4", { type = "item", name="bob-logistic-robot-3",amount= 2 })
paralib.bobmods.lib.recipe.add_ingredient("bob-construction-robot-4", { type = "item", name="bob-construction-robot-3",amount= 2 })

paralib.bobmods.lib.recipe.remove_ingredient("bob-radar-2", "radar")
paralib.bobmods.lib.recipe.add_new_ingredient("bob-radar-2", { type = "item", name = "radar", amount = 2 })
paralib.bobmods.lib.recipe.remove_ingredient("bob-radar-3", "bob-radar-2")
paralib.bobmods.lib.recipe.add_new_ingredient("bob-radar-3", { type = "item", name = "bob-radar-2", amount = 2 })
paralib.bobmods.lib.recipe.remove_ingredient("bob-radar-4", "bob-radar-3")
paralib.bobmods.lib.recipe.add_new_ingredient("bob-radar-4", { type = "item", name = "bob-radar-3", amount = 2 })
paralib.bobmods.lib.recipe.remove_ingredient("bob-radar-5", "bob-radar-4")
paralib.bobmods.lib.recipe.add_new_ingredient("bob-radar-5", { type = "item", name = "bob-radar-4", amount = 2 })

paralib.bobmods.lib.recipe.remove_ingredient("storage-tank", "bob-small-inline-storage-tank")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"storage-tank",
	{ type = "item", name = "bob-small-inline-storage-tank", amount = 4 }
)
paralib.bobmods.lib.recipe.remove_ingredient("bob-storage-tank-2", "storage-tank")
paralib.bobmods.lib.recipe.add_new_ingredient("bob-storage-tank-2", { type = "item", name = "storage-tank", amount = 2 })
paralib.bobmods.lib.recipe.remove_ingredient("bob-storage-tank-3", "bob-storage-tank-2")
paralib.bobmods.lib.recipe.add_new_ingredient("bob-storage-tank-3", { type = "item", name = "bob-storage-tank-2", amount = 2 })
paralib.bobmods.lib.recipe.remove_ingredient("bob-storage-tank-4", "bob-storage-tank-3")
paralib.bobmods.lib.recipe.add_new_ingredient("bob-storage-tank-4", { type = "item", name = "bob-storage-tank-3", amount = 2 })

paralib.bobmods.lib.recipe.remove_ingredient("bob-storage-tank-all-corners", "bob-small-storage-tank")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"bob-storage-tank-all-corners",
	{ type = "item", name = "bob-small-storage-tank", amount = 4 }
)
paralib.bobmods.lib.recipe.remove_ingredient("bob-storage-tank-all-corners-2", "bob-storage-tank-all-corners")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"bob-storage-tank-all-corners-2",
	{ type = "item", name = "bob-storage-tank-all-corners", amount = 2 }
)
paralib.bobmods.lib.recipe.remove_ingredient("bob-storage-tank-all-corners-3", "bob-storage-tank-all-corners-2")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"bob-storage-tank-all-corners-3",
	{ type = "item", name = "bob-storage-tank-all-corners-2", amount = 2 }
)
paralib.bobmods.lib.recipe.remove_ingredient("bob-storage-tank-all-corners-4", "bob-storage-tank-all-corners-3")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"bob-storage-tank-all-corners-4",
	{ type = "item", name = "bob-storage-tank-all-corners-3", amount = 2 }
)

paralib.bobmods.lib.recipe.remove_ingredient("angels-storage-tank-3", "bob-small-inline-storage-tank")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"angels-storage-tank-3",
	{ type = "item", name = "bob-small-inline-storage-tank", amount = 4 }
)
paralib.bobmods.lib.recipe.remove_ingredient("angels-storage-tank-2", "angels-storage-tank-3")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"angels-storage-tank-2",
	{ type = "item", name = "angels-storage-tank-3", amount = 4 }
)

paralib.bobmods.lib.recipe.remove_ingredient("bob-steam-engine-2", "steam-engine")
paralib.bobmods.lib.recipe.add_new_ingredient("bob-steam-engine-2", { type = "item", name = "steam-engine", amount = 2 })
paralib.bobmods.lib.recipe.remove_ingredient("bob-steam-engine-3", "bob-steam-engine-2")
paralib.bobmods.lib.recipe.add_new_ingredient("bob-steam-engine-3", { type = "item", name = "bob-steam-engine-2", amount = 2 })
paralib.bobmods.lib.recipe.remove_ingredient("bob-steam-engine-4", "bob-steam-engine-3")
paralib.bobmods.lib.recipe.add_new_ingredient("bob-steam-engine-4", { type = "item", name = "bob-steam-engine-3", amount = 2 })
paralib.bobmods.lib.recipe.remove_ingredient("bob-steam-engine-5", "bob-steam-engine-4")
paralib.bobmods.lib.recipe.add_new_ingredient("bob-steam-engine-5", { type = "item", name = "bob-steam-engine-4", amount = 2 })

paralib.bobmods.lib.recipe.remove_ingredient("bob-boiler-2", "boiler")
paralib.bobmods.lib.recipe.add_new_ingredient("bob-boiler-2", { type = "item", name = "boiler", amount = 2 })
paralib.bobmods.lib.recipe.remove_ingredient("bob-boiler-3", "bob-boiler-2")
paralib.bobmods.lib.recipe.add_new_ingredient("bob-boiler-3", { type = "item", name = "bob-boiler-2", amount = 2 })
paralib.bobmods.lib.recipe.remove_ingredient("bob-boiler-4", "bob-boiler-3")
paralib.bobmods.lib.recipe.add_new_ingredient("bob-boiler-4", { type = "item", name = "bob-boiler-3", amount = 2 })
paralib.bobmods.lib.recipe.remove_ingredient("bob-boiler-5", "bob-boiler-4")
paralib.bobmods.lib.recipe.add_new_ingredient("bob-boiler-5", { type = "item", name = "bob-boiler-4", amount = 2 })

paralib.bobmods.lib.recipe.remove_ingredient("steam-turbine", "bob-steam-engine-3")
paralib.bobmods.lib.recipe.add_new_ingredient("steam-turbine", { type = "item", name = "bob-steam-engine-3", amount = 2 })
paralib.bobmods.lib.recipe.remove_ingredient("bob-steam-turbine-2", "steam-turbine")
paralib.bobmods.lib.recipe.add_new_ingredient("bob-steam-turbine-2", { type = "item", name = "steam-turbine", amount = 2 })
paralib.bobmods.lib.recipe.remove_ingredient("bob-steam-turbine-3", "bob-steam-turbine-2")
paralib.bobmods.lib.recipe.add_new_ingredient("bob-steam-turbine-3", { type = "item", name = "bob-steam-turbine-2", amount = 2 })

paralib.bobmods.lib.recipe.remove_ingredient("assembling-machine-2", "assembling-machine")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"assembling-machine-2",
	{ type = "item", name = "assembling-machine", amount = 2 }
)
paralib.bobmods.lib.recipe.remove_ingredient("assembling-machine-3", "assembling-machine-2")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"assembling-machine-3",
	{ type = "item", name = "assembling-machine-2", amount = 2 }
)
paralib.bobmods.lib.recipe.remove_ingredient("bob-assembling-machine-4", "assembling-machine-3")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"bob-assembling-machine-4",
	{ type = "item", name = "assembling-machine-3", amount = 2 }
)
paralib.bobmods.lib.recipe.remove_ingredient("bob-assembling-machine-5", "bob-assembling-machine-4")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"bob-assembling-machine-5",
	{ type = "item", name = "bob-assembling-machine-4", amount = 2 }
)
paralib.bobmods.lib.recipe.remove_ingredient("bob-assembling-machine-6", "bob-assembling-machine-5")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"bob-assembling-machine-6",
	{ type = "item", name = "bob-assembling-machine-5", amount = 2 }
)

paralib.bobmods.lib.recipe.remove_ingredient("bob-electronics-machine-1", "iron-gear-wheel")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"bob-electronics-machine-1",
	{ type = "item", name = "assembling-machine", amount = 1 }
)
paralib.bobmods.lib.recipe.remove_ingredient("bob-electronics-machine-2", "bob-electronics-machine-1")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"bob-electronics-machine-2",
	{ type = "item", name = "bob-electronics-machine-1", amount = 2 }
)
paralib.bobmods.lib.recipe.remove_ingredient("bob-electronics-machine-3", "bob-electronics-machine-2")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"bob-electronics-machine-3",
	{ type = "item", name = "bob-electronics-machine-2", amount = 2 }
)

paralib.bobmods.lib.recipe.remove_ingredient("bob-nuclear-reactor-2", "nuclear-reactor")
paralib.bobmods.lib.recipe.add_new_ingredient("bob-nuclear-reactor-2", { type = "item", name = "nuclear-reactor", amount = 2 })
paralib.bobmods.lib.recipe.remove_ingredient("bob-nuclear-reactor-3", "bob-nuclear-reactor-2")
paralib.bobmods.lib.recipe.add_new_ingredient("bob-nuclear-reactor-3", { type = "item", name = "bob-nuclear-reactor-2", amount = 2 })

paralib.bobmods.lib.recipe.remove_ingredient("angels-oil-refinery-2", "oil-refinery")
paralib.bobmods.lib.recipe.add_new_ingredient("angels-oil-refinery-2", { type = "item", name = "oil-refinery", amount = 2 })
paralib.bobmods.lib.recipe.remove_ingredient("angels-oil-refinery-3", "angels-oil-refinery-2")
paralib.bobmods.lib.recipe.add_new_ingredient("angels-oil-refinery-3", { type = "item", name = "angels-oil-refinery-2", amount = 2 })
paralib.bobmods.lib.recipe.remove_ingredient("angels-oil-refinery-4", "angels-oil-refinery-3")
paralib.bobmods.lib.recipe.add_new_ingredient("angels-oil-refinery-4", { type = "item", name = "angels-oil-refinery-3", amount = 2 })

paralib.bobmods.lib.recipe.remove_ingredient("bob-pumpjack-1", "pumpjack")
paralib.bobmods.lib.recipe.add_new_ingredient("bob-pumpjack-1", { type = "item", name = "pumpjack", amount = 2 })
paralib.bobmods.lib.recipe.remove_ingredient("bob-pumpjack-2", "bob-pumpjack-1")
paralib.bobmods.lib.recipe.add_new_ingredient("bob-pumpjack-2", { type = "item", name = "bob-pumpjack-1", amount = 2 })
paralib.bobmods.lib.recipe.remove_ingredient("bob-pumpjack-3", "bob-pumpjack-2")
paralib.bobmods.lib.recipe.add_new_ingredient("bob-pumpjack-3", { type = "item", name = "bob-pumpjack-2", amount = 2 })

paralib.bobmods.lib.recipe.remove_ingredient("bob-electric-furnace-2", "electric-furnace")
paralib.bobmods.lib.recipe.add_new_ingredient("bob-electric-furnace-2", { type = "item", name = "electric-furnace", amount = 2 })
paralib.bobmods.lib.recipe.remove_ingredient("bob-electric-furnace-3", "bob-electric-furnace-2")
paralib.bobmods.lib.recipe.add_new_ingredient("bob-electric-furnace-3", { type = "item", name = "bob-electric-furnace-2", amount = 2 })

paralib.bobmods.lib.recipe.remove_ingredient("bob-mining-drill-1", "electric-mining-drill")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"bob-mining-drill-1",
	{ type = "item", name = "electric-mining-drill", amount = 2 }
)
paralib.bobmods.lib.recipe.remove_ingredient("bob-mining-drill-2", "bob-mining-drill-1")
paralib.bobmods.lib.recipe.add_new_ingredient("bob-mining-drill-2", { type = "item", name = "bob-mining-drill-1", amount = 2 })
paralib.bobmods.lib.recipe.remove_ingredient("bob-mining-drill-3", "bob-mining-drill-2")
paralib.bobmods.lib.recipe.add_new_ingredient("bob-mining-drill-3", { type = "item", name = "bob-mining-drill-2", amount = 2 })
paralib.bobmods.lib.recipe.remove_ingredient("bob-mining-drill-4", "bob-mining-drill-3")
paralib.bobmods.lib.recipe.add_new_ingredient("bob-mining-drill-4", { type = "item", name = "bob-mining-drill-3", amount = 2 })

paralib.bobmods.lib.recipe.remove_ingredient("bob-area-mining-drill-1", "electric-mining-drill")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"bob-area-mining-drill-1",
	{ type = "item", name = "electric-mining-drill", amount = 2 }
)
paralib.bobmods.lib.recipe.remove_ingredient("bob-area-mining-drill-2", "bob-area-mining-drill")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"bob-area-mining-drill-2",
	{ type = "item", name = "bob-area-mining-drill-1", amount = 2 }
)
paralib.bobmods.lib.recipe.remove_ingredient("bob-area-mining-drill-3", "bob-area-mining-drill-2")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"bob-area-mining-drill-3",
	{ type = "item", name = "bob-area-mining-drill-2", amount = 2 }
)
paralib.bobmods.lib.recipe.remove_ingredient("bob-area-mining-drill-4", "bob-area-mining-drill-3")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"bob-area-mining-drill-4",
	{ type = "item", name = "bob-area-mining-drill-3", amount = 2 }
)

paralib.bobmods.lib.recipe.add_new_ingredient("bob-plasma-turret-1", { type = "item", name = "laser-turret", amount = 4 })
paralib.bobmods.lib.recipe.remove_ingredient("bob-plasma-turret-2", "bob-plasma-turret-1")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"bob-plasma-turret-2",
	{ type = "item", name = "bob-plasma-turret-1", amount = 2 }
)
paralib.bobmods.lib.recipe.add_new_ingredient("bob-plasma-turret-2", { type = "item", name = "bob-laser-turret-2", amount = 2 })
paralib.bobmods.lib.recipe.remove_ingredient("bob-plasma-turret-3", "bob-plasma-turret-2")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"bob-plasma-turret-3",
	{ type = "item", name = "bob-plasma-turret-2", amount = 2 }
)
paralib.bobmods.lib.recipe.add_new_ingredient("bob-plasma-turret-3", { type = "item", name = "bob-laser-turret-3", amount = 2 })
paralib.bobmods.lib.recipe.remove_ingredient("bob-plasma-turret-4", "bob-plasma-turret-3")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"bob-plasma-turret-4",
	{ type = "item", name = "bob-plasma-turret-3", amount = 2 }
)
paralib.bobmods.lib.recipe.add_new_ingredient("bob-plasma-turret-4", { type = "item", name = "bob-laser-turret-4", amount = 2 })

paralib.bobmods.lib.recipe.remove_ingredient("bob-laser-turret-2", "laser-turret")
paralib.bobmods.lib.recipe.add_new_ingredient("bob-laser-turret-2", { type = "item", name = "laser-turret", amount = 2 })
paralib.bobmods.lib.recipe.remove_ingredient("bob-laser-turret-3", "bob-laser-turret-2")
paralib.bobmods.lib.recipe.add_new_ingredient("bob-laser-turret-3", { type = "item", name = "bob-laser-turret-2", amount = 2 })
paralib.bobmods.lib.recipe.remove_ingredient("bob-laser-turret-4", "bob-laser-turret-3")
paralib.bobmods.lib.recipe.add_new_ingredient("bob-laser-turret-4", { type = "item", name = "bob-laser-turret-3", amount = 2 })
paralib.bobmods.lib.recipe.remove_ingredient("bob-laser-turret-5", "bob-laser-turret-4")
paralib.bobmods.lib.recipe.add_new_ingredient("bob-laser-turret-5", { type = "item", name = "bob-laser-turret-4", amount = 2 })

paralib.bobmods.lib.recipe.add_new_ingredient(
	"bob-passive-provider-chest-2",
	{ type = "item", name = "angels-logistic-chest-passive-provider", amount = 1 }
)
paralib.bobmods.lib.recipe.add_new_ingredient(
	"bob-passive-provider-chest-3",
	{ type = "item", name = "bob-passive-provider-chest-2", amount = 1 }
)
paralib.bobmods.lib.recipe.add_new_ingredient(
	"bob-active-provider-chest-2",
	{ type = "item", name = "angels-logistic-chest-active-provider", amount = 1 }
)
paralib.bobmods.lib.recipe.add_new_ingredient(
	"bob-active-provider-chest-3",
	{ type = "item", name = "bob-active-provider-chest-2", amount = 1 }
)
paralib.bobmods.lib.recipe.add_new_ingredient(
	"bob-buffer-chest-2",
	{ type = "item", name = "angels-logistic-chest-buffer", amount = 1 }
)
paralib.bobmods.lib.recipe.add_new_ingredient(
	"bob-buffer-chest-3",
	{ type = "item", name = "bob-buffer-chest-2", amount = 1 }
)
paralib.bobmods.lib.recipe.add_new_ingredient(
	"bob-requester-chest-2",
	{ type = "item", name = "angels-logistic-chest-requester", amount = 1 }
)
paralib.bobmods.lib.recipe.add_new_ingredient(
	"bob-requester-chest-3",
	{ type = "item", name = "bob-requester-chest-2", amount = 1 }
)
paralib.bobmods.lib.recipe.add_new_ingredient(
	"bob-storage-chest-2",
	{ type = "item", name = "angels-logistic-chest-storage", amount = 1 }
)
paralib.bobmods.lib.recipe.add_new_ingredient(
	"bob-storage-chest-3",
	{ type = "item", name = "bob-storage-chest-2", amount = 1 }
)

--ANGELS

paralib.bobmods.lib.recipe.remove_ingredient("angels-liquifier-2", "angels-liquifier")
paralib.bobmods.lib.recipe.add_new_ingredient("angels-liquifier-2", { type = "item", name = "angels-liquifier", amount = 2 })
paralib.bobmods.lib.recipe.remove_ingredient("angels-liquifier-3", "angels-liquifier-2")
paralib.bobmods.lib.recipe.add_new_ingredient("angels-liquifier-3", { type = "item", name = "angels-liquifier-2", amount = 2 })
paralib.bobmods.lib.recipe.remove_ingredient("angels-liquifier-4", "angels-liquifier-3")
paralib.bobmods.lib.recipe.add_new_ingredient("angels-liquifier-4", { type = "item", name = "angels-liquifier-3", amount = 2 })

paralib.bobmods.lib.recipe.remove_ingredient("angels-ore-crusher-2", "angels-ore-crusher")
paralib.bobmods.lib.recipe.add_new_ingredient("angels-ore-crusher-2", { type = "item", name = "angels-ore-crusher", amount = 2 })
paralib.bobmods.lib.recipe.remove_ingredient("angels-ore-crusher-3", "angels-ore-crusher-2")
paralib.bobmods.lib.recipe.add_new_ingredient("angels-ore-crusher-3", { type = "item", name = "angels-ore-crusher-2", amount = 2 })
if data.raw.item["ore-crusher-4"] then
	paralib.bobmods.lib.recipe.remove_ingredient("ore-crusher-4", "angels-ore-crusher-3")
	paralib.bobmods.lib.recipe.add_new_ingredient("ore-crusher-4", { type = "item", name = "angels-ore-crusher-3", amount = 2 })
end

paralib.bobmods.lib.recipe.remove_ingredient("angels-ore-sorting-facility-2", "angels-ore-sorting-facility")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"angels-ore-sorting-facility-2",
	{ type = "item", name = "angels-ore-sorting-facility", amount = 2 }
)
paralib.bobmods.lib.recipe.remove_ingredient("angels-ore-sorting-facility-3", "angels-ore-sorting-facility-2")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"angels-ore-sorting-facility-3",
	{ type = "item", name = "angels-ore-sorting-facility-2", amount = 2 }
)
paralib.bobmods.lib.recipe.remove_ingredient("angels-ore-sorting-facility-4", "angels-ore-sorting-facility-3")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"angels-ore-sorting-facility-4",
	{ type = "item", name = "angels-ore-sorting-facility-3", amount = 2 }
)

paralib.bobmods.lib.recipe.remove_ingredient("angels-ore-floatation-cell-2", "angels-ore-floatation-cell")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"angels-ore-floatation-cell-2",
	{ type = "item", name = "angels-ore-floatation-cell", amount = 2 }
)
paralib.bobmods.lib.recipe.remove_ingredient("angels-ore-floatation-cell-3", "angels-ore-floatation-cell-2")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"angels-ore-floatation-cell-3",
	{ type = "item", name = "angels-ore-floatation-cell-2", amount = 2 }
)
if data.raw.item["ore-floatation-cell-4"] then
	paralib.bobmods.lib.recipe.remove_ingredient("ore-floatation-cell-4", "angels-ore-floatation-cell-3")
	paralib.bobmods.lib.recipe.add_new_ingredient(
		"ore-floatation-cell-4",
		{ type = "item", name = "angels-ore-floatation-cell-3", amount = 2 }
	)
end

paralib.bobmods.lib.recipe.remove_ingredient("angels-ore-leaching-plant-2", "angels-ore-leaching-plant")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"angels-ore-leaching-plant-2",
	{ type = "item", name = "angels-ore-leaching-plant", amount = 2 }
)
paralib.bobmods.lib.recipe.remove_ingredient("angels-ore-leaching-plant-3", "angels-ore-leaching-plant-2")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"angels-ore-leaching-plant-3",
	{ type = "item", name = "angels-ore-leaching-plant-2", amount = 2 }
)

paralib.bobmods.lib.recipe.remove_ingredient("angels-ore-refinery-2", "angels-ore-refinery")
paralib.bobmods.lib.recipe.add_new_ingredient("angels-ore-refinery-2", { type = "item", name = "angels-ore-refinery", amount = 2 })
if data.raw.item["ore-refinery-3"] then
	paralib.bobmods.lib.recipe.remove_ingredient("ore-refinery-3", "angels-ore-refinery-2")
	paralib.bobmods.lib.recipe.add_new_ingredient("ore-refinery-3", { type = "item", name = "angels-ore-refinery-2", amount = 2 })
end

paralib.bobmods.lib.recipe.remove_ingredient("angels-filtration-unit-2", "angels-filtration-unit")
paralib.bobmods.lib.recipe.add_new_ingredient("angels-filtration-unit-2", { type = "item", name = "angels-filtration-unit", amount = 2 })
if data.raw.item["angels-filtration-unit-3"] then
	paralib.bobmods.lib.recipe.remove_ingredient("angels-filtration-unit-3", "angels-filtration-unit-2")
	paralib.bobmods.lib.recipe.add_new_ingredient(
		"angels-filtration-unit-3",
		{ type = "item", name = "angels-filtration-unit-2", amount = 2 }
	)
end

paralib.bobmods.lib.recipe.remove_ingredient("angels-crystallizer-2", "angels-crystallizer")
paralib.bobmods.lib.recipe.add_new_ingredient("angels-crystallizer-2", { type = "item", name = "angels-crystallizer", amount = 2 })
if data.raw.item["angels-crystallizer-3"] then
	paralib.bobmods.lib.recipe.remove_ingredient("angels-crystallizer-3", "angels-crystallizer-2")
	paralib.bobmods.lib.recipe.add_new_ingredient("angels-crystallizer-3", { type = "item", name = "angels-crystallizer-2", amount = 2 })
end

paralib.bobmods.lib.recipe.remove_ingredient("angels-algae-farm-2", "angels-algae-farm")
paralib.bobmods.lib.recipe.add_new_ingredient("angels-algae-farm-2", { type = "item", name = "angels-algae-farm", amount = 2 })
paralib.bobmods.lib.recipe.remove_ingredient("angels-algae-farm-3", "angels-algae-farm-2")
paralib.bobmods.lib.recipe.add_new_ingredient("angels-algae-farm-3", { type = "item", name = "angels-algae-farm-2", amount = 2 })

paralib.bobmods.lib.recipe.remove_ingredient("angels-hydro-plant-2", "angels-hydro-plant")
paralib.bobmods.lib.recipe.add_new_ingredient("angels-hydro-plant-2", { type = "item", name = "angels-hydro-plant", amount = 2 })
paralib.bobmods.lib.recipe.remove_ingredient("angels-hydro-plant-3", "angels-hydro-plant-2")
paralib.bobmods.lib.recipe.add_new_ingredient("angels-hydro-plant-3", { type = "item", name = "angels-hydro-plant-2", amount = 2 })

paralib.bobmods.lib.recipe.remove_ingredient("angels-salination-plant-2", "angels-salination-plant")
paralib.bobmods.lib.recipe.add_new_ingredient("angels-salination-plant-2", { type = "item", name = "angels-salination-plant", amount = 2 })

paralib.bobmods.lib.recipe.remove_ingredient("angels-washing-plant-2", "angels-washing-plant")
paralib.bobmods.lib.recipe.add_new_ingredient("angels-washing-plant-2", { type = "item", name = "angels-washing-plant", amount = 2 })
if data.raw.item["angels-washing-plant-3"] then
	paralib.bobmods.lib.recipe.remove_ingredient("angels-washing-plant-3", "angels-washing-plant-2")
	paralib.bobmods.lib.recipe.add_new_ingredient("angels-washing-plant-3", { type = "item", name = "angels-washing-plant-2", amount = 2 })
end
if data.raw.item["angels-washing-plant-4"] then
	paralib.bobmods.lib.recipe.remove_ingredient("angels-washing-plant-4", "angels-washing-plant-3")
	paralib.bobmods.lib.recipe.add_new_ingredient("angels-washing-plant-4", { type = "item", name = "angels-washing-plant-3", amount = 2 })
end

paralib.bobmods.lib.recipe.remove_ingredient("angels-electric-boiler-2", "angels-electric-boiler")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"angels-electric-boiler-2",
	{ type = "item", name = "angels-electric-boiler", amount = 2 }
)
paralib.bobmods.lib.recipe.remove_ingredient("angels-electric-boiler-3", "angels-electric-boiler-2")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"angels-electric-boiler-3",
	{ type = "item", name = "angels-electric-boiler-2", amount = 2 }
)

paralib.bobmods.lib.recipe.remove_ingredient("angels-powderizer-2", "angels-ore-powderizer")
paralib.bobmods.lib.recipe.add_new_ingredient("angels-powderizer-2", { type = "item", name = "angels-ore-powderizer", amount = 2 })
paralib.bobmods.lib.recipe.remove_ingredient("angels-powderizer-3", "angels-powderizer-2")
paralib.bobmods.lib.recipe.add_new_ingredient("angels-powderizer-3", { type = "item", name = "angels-powderizer-2", amount = 2 })

paralib.bobmods.lib.recipe.remove_ingredient("angels-electro-whinning-cell-2", "angels-electro-whinning-cell")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"angels-electro-whinning-cell-2",
	{ type = "item", name = "angels-electro-whinning-cell", amount = 2 }
)

paralib.bobmods.lib.recipe.remove_ingredient("angels-ore-processing-machine-2", "angels-ore-processing-machine")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"angels-ore-processing-machine-2",
	{ type = "item", name = "angels-ore-processing-machine", amount = 2 }
)
paralib.bobmods.lib.recipe.remove_ingredient("angels-ore-processing-machine-3", "angels-ore-processing-machine-2")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"angels-ore-processing-machine-3",
	{ type = "item", name = "angels-ore-processing-machine-2", amount = 2 }
)
paralib.bobmods.lib.recipe.remove_ingredient("angels-ore-processing-machine-4", "angels-ore-processing-machine-3")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"angels-ore-processing-machine-4",
	{ type = "item", name = "angels-ore-processing-machine-3", amount = 2 }
)

paralib.bobmods.lib.recipe.remove_ingredient("angels-pellet-press-2", "angels-pellet-press")
paralib.bobmods.lib.recipe.add_new_ingredient("angels-pellet-press-2", { type = "item", name = "angels-pellet-press", amount = 2 })
paralib.bobmods.lib.recipe.remove_ingredient("angels-pellet-press-3", "angels-pellet-press-2")
paralib.bobmods.lib.recipe.add_new_ingredient("angels-pellet-press-3", { type = "item", name = "angels-pellet-press-2", amount = 2 })
paralib.bobmods.lib.recipe.remove_ingredient("angels-pellet-press-4", "angels-pellet-press-3")
paralib.bobmods.lib.recipe.add_new_ingredient("angels-pellet-press-4", { type = "item", name = "angels-pellet-press-3", amount = 2 })

paralib.bobmods.lib.recipe.remove_ingredient("angels-powder-mixer-2", "angels-powder-mixer")
paralib.bobmods.lib.recipe.add_new_ingredient("angels-powder-mixer-2", { type = "item", name = "angels-powder-mixer", amount = 2 })
paralib.bobmods.lib.recipe.remove_ingredient("angels-powder-mixer-3", "angels-powder-mixer-2")
paralib.bobmods.lib.recipe.add_new_ingredient("angels-powder-mixer-3", { type = "item", name = "angels-powder-mixer-2", amount = 2 })
paralib.bobmods.lib.recipe.remove_ingredient("angels-powder-mixer-4", "angels-powder-mixer-3")
paralib.bobmods.lib.recipe.add_new_ingredient("angels-powder-mixer-4", { type = "item", name = "angels-powder-mixer-3", amount = 2 })

paralib.bobmods.lib.recipe.remove_ingredient("angels-blast-furnace-2", "angels-blast-furnace")
paralib.bobmods.lib.recipe.add_new_ingredient("angels-blast-furnace-2", { type = "item", name = "angels-blast-furnace", amount = 2 })
paralib.bobmods.lib.recipe.remove_ingredient("angels-blast-furnace-3", "angels-blast-furnace-2")
paralib.bobmods.lib.recipe.add_new_ingredient("angels-blast-furnace-3", { type = "item", name = "angels-blast-furnace-2", amount = 2 })
paralib.bobmods.lib.recipe.remove_ingredient("angels-blast-furnace-4", "angels-blast-furnace-3")
paralib.bobmods.lib.recipe.add_new_ingredient("angels-blast-furnace-4", { type = "item", name = "angels-blast-furnace-3", amount = 2 })

paralib.bobmods.lib.recipe.remove_ingredient("angels-chemical-furnace-2", "angels-chemical-furnace")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"angels-chemical-furnace-2",
	{ type = "item", name = "angels-chemical-furnace", amount = 2 }
)
paralib.bobmods.lib.recipe.remove_ingredient("angels-chemical-furnace-3", "angels-chemical-furnace-2")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"angels-chemical-furnace-3",
	{ type = "item", name = "angels-chemical-furnace-2", amount = 2 }
)
paralib.bobmods.lib.recipe.remove_ingredient("angels-chemical-furnace-4", "angels-chemical-furnace-3")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"angels-chemical-furnace-4",
	{ type = "item", name = "angels-chemical-furnace-3", amount = 2 }
)

paralib.bobmods.lib.recipe.remove_ingredient("angels-induction-furnace-2", "angels-induction-furnace")
paralib.bobmods.lib.recipe.add_new_ingredient("angels-induction-furnace-2", { type = "item", name = "angels-induction-furnace", amount = 2 })
paralib.bobmods.lib.recipe.remove_ingredient("angels-induction-furnace-3", "angels-induction-furnace-2")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"angels-induction-furnace-3",
	{ type = "item", name = "angels-induction-furnace-2", amount = 2 }
)
paralib.bobmods.lib.recipe.remove_ingredient("angels-induction-furnace-4", "angels-induction-furnace-3")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"angels-induction-furnace-4",
	{ type = "item", name = "angels-induction-furnace-3", amount = 2 }
)

paralib.bobmods.lib.recipe.remove_ingredient("angels-casting-machine-2", "angels-casting-machine")
paralib.bobmods.lib.recipe.add_new_ingredient("angels-casting-machine-2", { type = "item", name = "angels-casting-machine", amount = 2 })
paralib.bobmods.lib.recipe.remove_ingredient("angels-casting-machine-3", "angels-casting-machine-2")
paralib.bobmods.lib.recipe.add_new_ingredient("angels-casting-machine-3", { type = "item", name = "angels-casting-machine-2", amount = 2 })
paralib.bobmods.lib.recipe.remove_ingredient("angels-casting-machine-4", "angels-casting-machine-3")
paralib.bobmods.lib.recipe.add_new_ingredient("angels-casting-machine-4", { type = "item", name = "angels-casting-machine-3", amount = 2 })

paralib.bobmods.lib.recipe.remove_ingredient("angels-strand-casting-machine-2", "angels-strand-casting-machine")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"angels-strand-casting-machine-2",
	{ type = "item", name = "angels-strand-casting-machine", amount = 2 }
)
paralib.bobmods.lib.recipe.remove_ingredient("angels-strand-casting-machine-3", "angels-strand-casting-machine-2")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"angels-strand-casting-machine-3",
	{ type = "item", name = "angels-strand-casting-machine-2", amount = 2 }
)
paralib.bobmods.lib.recipe.remove_ingredient("angels-strand-casting-machine-4", "angels-strand-casting-machine-3")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"angels-strand-casting-machine-4",
	{ type = "item", name = "angels-strand-casting-machine-3", amount = 2 }
)

--paralib.bobmods.lib.recipe.remove_ingredient ("angels-sintering-oven-2", "angels-sintering-oven")
--paralib.bobmods.lib.recipe.add_new_ingredient ("angels-sintering-oven-2", {type="item", name="angels-sintering-oven", amount=2})
--paralib.bobmods.lib.recipe.remove_ingredient ("angels-sintering-oven-3", "angels-sintering-oven-2")
--paralib.bobmods.lib.recipe.add_new_ingredient ("angels-sintering-oven-3", {type="item", name="angels-sintering-oven-2", amount=2})
--paralib.bobmods.lib.recipe.remove_ingredient ("angels-sintering-oven-4", "angels-sintering-oven-3")
--paralib.bobmods.lib.recipe.add_new_ingredient ("angels-sintering-oven-4", {type="item", name="angels-sintering-oven-3", amount=2})
paralib.bobmods.lib.recipe.remove_ingredient("angels-sintering-oven-5", "angels-sintering-oven-4")
paralib.bobmods.lib.recipe.add_new_ingredient("angels-sintering-oven-5", { type = "item", name = "angels-sintering-oven-4", amount = 2 })

paralib.bobmods.lib.recipe.remove_ingredient("angels-electrolyser-2", "angels-electrolyser")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"angels-electrolyser-2",
	{ type = "item", name = "angels-electrolyser", amount = 2 }
)
paralib.bobmods.lib.recipe.remove_ingredient("angels-electrolyser-3", "angels-electrolyser-2")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"angels-electrolyser-3",
	{ type = "item", name = "angels-electrolyser-2", amount = 2 }
)
paralib.bobmods.lib.recipe.remove_ingredient("angels-electrolyser-4", "angels-electrolyser-3")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"angels-electrolyser-4",
	{ type = "item", name = "angels-electrolyser-3", amount = 2 }
)

paralib.bobmods.lib.recipe.remove_ingredient("angels-air-filter-2", "angels-air-filter")
paralib.bobmods.lib.recipe.add_new_ingredient("angels-air-filter-2", { type = "item", name = "angels-air-filter", amount = 2 })

paralib.bobmods.lib.recipe.remove_ingredient("angels-separator-2", "angels-separator")
paralib.bobmods.lib.recipe.add_new_ingredient("angels-separator-2", { type = "item", name = "angels-separator", amount = 2 })
paralib.bobmods.lib.recipe.remove_ingredient("angels-separator-3", "angels-separator-2")
paralib.bobmods.lib.recipe.add_new_ingredient("angels-separator-3", { type = "item", name = "angels-separator-2", amount = 2 })
paralib.bobmods.lib.recipe.remove_ingredient("angels-separator-4", "angels-separator-3")
paralib.bobmods.lib.recipe.add_new_ingredient("angels-separator-4", { type = "item", name = "angels-separator-3", amount = 2 })

paralib.bobmods.lib.recipe.remove_ingredient("angels-gas-refinery-small-2", "angels-gas-refinery-small")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"angels-gas-refinery-small-2",
	{ type = "item", name = "angels-gas-refinery-small", amount = 2 }
)
paralib.bobmods.lib.recipe.remove_ingredient("angels-gas-refinery-small-3", "angels-gas-refinery-small-2")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"angels-gas-refinery-small-3",
	{ type = "item", name = "angels-gas-refinery-small-2", amount = 2 }
)
paralib.bobmods.lib.recipe.remove_ingredient("angels-gas-refinery-small-4", "angels-gas-refinery-small-3")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"angels-gas-refinery-small-4",
	{ type = "item", name = "angels-gas-refinery-small-3", amount = 2 }
)

paralib.bobmods.lib.recipe.remove_ingredient("angels-gas-refinery-2", "angels-gas-refinery")
paralib.bobmods.lib.recipe.add_new_ingredient("angels-gas-refinery-2", { type = "item", name = "angels-gas-refinery", amount = 2 })
paralib.bobmods.lib.recipe.remove_ingredient("angels-gas-refinery-3", "angels-gas-refinery-2")
paralib.bobmods.lib.recipe.add_new_ingredient("angels-gas-refinery-3", { type = "item", name = "angels-gas-refinery-2", amount = 2 })
paralib.bobmods.lib.recipe.remove_ingredient("angels-gas-refinery-4", "angels-gas-refinery-3")
paralib.bobmods.lib.recipe.add_new_ingredient("angels-gas-refinery-4", { type = "item", name = "angels-gas-refinery-3", amount = 2 })

paralib.bobmods.lib.recipe.remove_ingredient("angels-steam-cracker-2", "angels-steam-cracker")
paralib.bobmods.lib.recipe.add_new_ingredient("angels-steam-cracker-2", { type = "item", name = "angels-steam-cracker", amount = 2 })
paralib.bobmods.lib.recipe.remove_ingredient("angels-steam-cracker-3", "angels-steam-cracker-2")
paralib.bobmods.lib.recipe.add_new_ingredient("angels-steam-cracker-3", { type = "item", name = "angels-steam-cracker-2", amount = 2 })
paralib.bobmods.lib.recipe.remove_ingredient("angels-steam-cracker-4", "angels-steam-cracker-3")
paralib.bobmods.lib.recipe.add_new_ingredient("angels-steam-cracker-4", { type = "item", name = "angels-steam-cracker-3", amount = 2 })

paralib.bobmods.lib.recipe.remove_ingredient("angels-advanced-chemical-plant-2", "angels-advanced-chemical-plant")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"angels-advanced-chemical-plant-2",
	{ type = "item", name = "angels-advanced-chemical-plant", amount = 2 }
)

paralib.bobmods.lib.recipe.remove_ingredient("angels-chemical-plant-2", "chemical-plant")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"angels-chemical-plant-2",
	{ type = "item", name = "chemical-plant", amount = 2 }
)
paralib.bobmods.lib.recipe.remove_ingredient("angels-chemical-plant-3", "angels-chemical-plant-2")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"angels-chemical-plant-3",
	{ type = "item", name = "angels-chemical-plant-2", amount = 2 }
)
paralib.bobmods.lib.recipe.remove_ingredient("angels-chemical-plant-4", "angels-chemical-plant-3")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"angels-chemical-plant-4",
	{ type = "item", name = "angels-chemical-plant-3", amount = 2 }
)

paralib.bobmods.lib.recipe.remove_ingredient("angels-electric-boiler-2", "angels-electric-boiler")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"angels-electric-boiler-2",
	{ type = "item", name = "angels-electric-boiler", amount = 2 }
)
paralib.bobmods.lib.recipe.remove_ingredient("angels-electric-boiler-3", "angels-electric-boiler-2")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"angels-electric-boiler-3",
	{ type = "item", name = "angels-electric-boiler-2", amount = 2 }
)

paralib.bobmods.lib.recipe.remove_ingredient("clowns-sluicer-2", "clowns-sluicer")
paralib.bobmods.lib.recipe.add_new_ingredient("clowns-sluicer-2", { type = "item", name = "clowns-sluicer", amount = 2 })

paralib.bobmods.lib.recipe.add_new_ingredient("memory-unit", { type = "item", name = "warehouse-basic", amount = 2 })
paralib.bobmods.lib.tech.add_prerequisite("memory-unit", "bob-tungsten-alloy-processing")
paralib.bobmods.lib.recipe.remove_ingredient("fluid-memory-unit", "warehouse-research")
paralib.bobmods.lib.recipe.add_new_ingredient(
	"fluid-memory-unit",
	{ type = "item", name = "angels-storage-tank-1", amount = 2 }
)
paralib.bobmods.lib.tech.add_prerequisite("fluid-memory-storage", "angels-gas-processing")

paralib.bobmods.lib.recipe.add_new_ingredient("accumulator", { type = "item", name = "electronic-circuit", amount = 4 })

paralib.bobmods.lib.recipe.add_new_ingredient("modular-armor", { type = "item", name = "heavy-armor", amount = 1 })

--[[
if data.raw.car["schall-tank-l"] then
paralib.bobmods.lib.recipe.remove_ingredient ("bob-tank-2", "tank")
paralib.bobmods.lib.recipe.add_new_ingredient ("bob-tank-2", {type="car", name="schall-tank-l", amount=1})
end
]]
--

--[[
paralib.bobmods.lib.recipe.remove_ingredient ("centrifuge-mk2", "centrifuge")
paralib.bobmods.lib.recipe.add_new_ingredient ("centrifuge-mk2", {type="item", name="centrifuge", amount=2})
paralib.bobmods.lib.recipe.remove_ingredient ("centrifuge-mk3", "centrifuge-mk2")
paralib.bobmods.lib.recipe.add_new_ingredient ("centrifuge-mk3", {type="item", name="centrifuge-mk2", amount=2})
]]
--

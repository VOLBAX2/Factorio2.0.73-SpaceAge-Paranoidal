local function addingMiningdrillbits()
	KaoExtended.recipe.add_to_recipe("burner-mining-drill", { "mining-drill-bit-mk0", 1 })
	bobmods.lib.recipe.remove_ingredient("burner-mining-drill", "iron-plate")

	KaoExtended.recipe.add_to_recipe("electric-mining-drill", { "mining-drill-bit-mk1", 1 })
	bobmods.lib.recipe.remove_ingredient("burner-mining-drill", "iron-plate")

	KaoExtended.recipe.add_to_recipe("bob-mining-drill-1", { "mining-drill-bit-mk2", 1 })
	bobmods.lib.recipe.remove_ingredient("bob-mining-drill-1", "iron-gear-wheel")

	KaoExtended.recipe.add_to_recipe("bob-mining-drill-2", { "mining-drill-bit-mk3", 1 })

	KaoExtended.recipe.add_to_recipe("bob-mining-drill-3", { "mining-drill-bit-mk4", 1 })
	bobmods.lib.recipe.remove_ingredient("bob-mining-drill-3", "titanium-plate")

	KaoExtended.recipe.add_to_recipe("bob-mining-drill-4", { "mining-drill-bit-mk5", 1 })
	bobmods.lib.recipe.remove_ingredient("bob-mining-drill-4", "tungsten-carbide")

	KaoExtended.recipe.add_to_recipe("bob-area-mining-drill-1", { "mining-drill-bit-mk2", 1 })
	KaoExtended.recipe.add_to_recipe("bob-area-mining-drill-2", { "mining-drill-bit-mk3", 1 })
	KaoExtended.recipe.add_to_recipe("bob-area-mining-drill-3", { "mining-drill-bit-mk4", 1 })
	KaoExtended.recipe.add_to_recipe("bob-area-mining-drill-4", { "mining-drill-bit-mk5", 1 })

	KaoExtended.recipe.add_to_recipe("angels-seafloor-pump", { "mining-drill-bit-mk2", 1 })
end

addingMiningdrillbits()

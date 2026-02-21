--скрываем рецепты шариков. технология в prototypes/recipe/alien-artifact.lua
data.raw["recipe"]["alien-artifact-red-from-basic"].enabled = false
data.raw["recipe"]["alien-artifact-orange-from-basic"].enabled = false
data.raw["recipe"]["alien-artifact-yellow-from-basic"].enabled = false
data.raw["recipe"]["alien-artifact-green-from-basic"].enabled = false
data.raw["recipe"]["alien-artifact-blue-from-basic"].enabled = false
data.raw["recipe"]["alien-artifact-purple-from-basic"].enabled = false

data.raw["recipe"]["alien-artifact-from-small"].enabled = false
data.raw["recipe"]["alien-artifact-red-from-small"].enabled = false
data.raw["recipe"]["alien-artifact-orange-from-small"].enabled = false
data.raw["recipe"]["alien-artifact-yellow-from-small"].enabled = false
data.raw["recipe"]["alien-artifact-green-from-small"].enabled = false
data.raw["recipe"]["alien-artifact-blue-from-small"].enabled = false
data.raw["recipe"]["alien-artifact-purple-from-small"].enabled = false
-------------------------------------------------------------------------------------------------
--перемещаем рецепты и предметы больших шариков куда следует
data.raw["recipe"]["alien-artifact-red-from-basic"].group = "bio-processing-alien"
data.raw["recipe"]["alien-artifact-orange-from-basic"].group = "bio-processing-alien"
data.raw["recipe"]["alien-artifact-yellow-from-basic"].group = "bio-processing-alien"
data.raw["recipe"]["alien-artifact-green-from-basic"].group = "bio-processing-alien"
data.raw["recipe"]["alien-artifact-blue-from-basic"].group = "bio-processing-alien"
data.raw["recipe"]["alien-artifact-purple-from-basic"].group = "bio-processing-alien"

data.raw["recipe"]["alien-artifact-red-from-basic"].subgroup = "bio-processing-alien-large"
data.raw["recipe"]["alien-artifact-orange-from-basic"].subgroup = "bio-processing-alien-large"
data.raw["recipe"]["alien-artifact-yellow-from-basic"].subgroup = "bio-processing-alien-large"
data.raw["recipe"]["alien-artifact-green-from-basic"].subgroup = "bio-processing-alien-large"
data.raw["recipe"]["alien-artifact-blue-from-basic"].subgroup = "bio-processing-alien-large"
data.raw["recipe"]["alien-artifact-purple-from-basic"].subgroup = "bio-processing-alien-large"

data.raw["item"]["bob-alien-artifact"].group = "bio-processing-alien"
data.raw["item"]["bob-alien-artifact-red"].group = "bio-processing-alien"
data.raw["item"]["bob-alien-artifact-orange"].group = "bio-processing-alien"
data.raw["item"]["bob-alien-artifact-yellow"].group = "bio-processing-alien"
data.raw["item"]["bob-alien-artifact-green"].group = "bio-processing-alien"
data.raw["item"]["bob-alien-artifact-blue"].group = "bio-processing-alien"
data.raw["item"]["bob-alien-artifact-purple"].group = "bio-processing-alien"

data.raw["item"]["bob-alien-artifact"].subgroup = "bio-processing-alien-large"
data.raw["item"]["bob-alien-artifact-red"].subgroup = "bio-processing-alien-large"
data.raw["item"]["bob-alien-artifact-orange"].subgroup = "bio-processing-alien-large"
data.raw["item"]["bob-alien-artifact-yellow"].subgroup = "bio-processing-alien-large"
data.raw["item"]["bob-alien-artifact-green"].subgroup = "bio-processing-alien-large"
data.raw["item"]["bob-alien-artifact-blue"].subgroup = "bio-processing-alien-large"
data.raw["item"]["bob-alien-artifact-purple"].subgroup = "bio-processing-alien-large"

--Фикс огромных аккумуляторов
bobmods.lib.recipe.add_ingredient("bi-bio-accumulator", { type = "item", name = "accumulator", amount = 30 })
--Добавляем осмий в лейт гейм рецепты
bobmods.lib.recipe.add_ingredient("hull-component", { type = "item", name = "clowns-plate-osmium", amount = 100 })
bobmods.lib.recipe.add_ingredient("space-thruster", { type = "item", name = "clowns-plate-osmium", amount = 100 })
bobmods.lib.recipe.add_ingredient("fuel-cell", { type = "item", name = "clowns-plate-osmium", amount = 100 })
bobmods.lib.recipe.add_ingredient("habitation", { type = "item", name = "clowns-plate-osmium", amount = 100 })
bobmods.lib.recipe.add_ingredient("life-support", { type = "item", name = "clowns-plate-osmium", amount = 100 })
bobmods.lib.recipe.add_ingredient("command", { type = "item", name = "clowns-plate-osmium", amount = 100 })
bobmods.lib.recipe.add_ingredient("astrometrics", { type = "item", name = "clowns-plate-osmium", amount = 100 })
bobmods.lib.recipe.add_ingredient("ftl-drive", { type = "item", name = "clowns-plate-osmium", amount = 100 })

--Фикс пластин вольфрама и дешевых труб
bobmods.lib.recipe.set_ingredients("bob-tungsten-carbide-x", {
	{ type = "item", name = "angels-solid-carbon", amount = 8 },
	{ type = "item", name = "bob-tungsten-oxide", amount = 12 },
})

--рецепты для новых донных насосов
bobmods.lib.recipe.set_ingredients("angels-seafloor-pump", {
	{ type = "item", name = "mining-drill-bit-mk1", amount = 3 },
	{ type = "item", name = "pipe", amount = 25 },
	{ type = "item", name = "bob-basic-circuit-board", amount = 10 },
	{ type = "item", name = "iron-plate", amount = 25 },
})

--Разжижители
bobmods.lib.recipe.set_ingredients("angels-liquifier", {
	{ type = "item", name = "iron-plate", amount = 40 },
	{ type = "item", name = "bob-basic-circuit-board", amount = 3 },
	{ type = "item", name = "pipe", amount = 40 },
	{ type = "item", name = "stone-brick", amount = 60 },
})
bobmods.lib.recipe.set_ingredients("angels-liquifier-2", {
	{ type = "item", name = "bob-bronze-alloy", amount = 40 },
	{ type = "item", name = "electronic-circuit", amount = 3 },
	{ type = "item", name = "bob-bronze-pipe", amount = 40 },
	{ type = "item", name = "angels-clay-brick", amount = 60 },
	{ type = "item", name = "angels-liquifier", amount = 2 },
})
bobmods.lib.recipe.set_ingredients("angels-liquifier-3", {
	{ type = "item", name = "bob-aluminium-plate", amount = 40 },
	{ type = "item", name = "advanced-circuit", amount = 3 },
	{ type = "item", name = "bob-brass-pipe", amount = 40 },
	{ type = "item", name = "concrete", amount = 60 },
	{ type = "item", name = "angels-liquifier-2", amount = 2 },
})
bobmods.lib.recipe.set_ingredients("angels-liquifier-4", {
	{ type = "item", name = "bob-titanium-plate", amount = 40 },
	{ type = "item", name = "processing-unit", amount = 3 },
	{ type = "item", name = "bob-titanium-pipe", amount = 40 },
	{ type = "item", name = "refined-concrete", amount = 60 },
	{ type = "item", name = "angels-liquifier-3", amount = 2 },
})
-- --Термальный экстрактор
bobmods.lib.recipe.set_ingredients("thermal-extractor", {
	{ type = "item", name = "bob-aluminium-plate", amount = 24 },
	{ type = "item", name = "advanced-circuit", amount = 5 },
	{ type = "item", name = "bob-brass-pipe", amount = 12 },
	{ type = "item", name = "concrete", amount = 20 },
	{ type = "item", name = "bob-brass-gear-wheel", amount = 12 },
	{ type = "item", name = "intermediate-structure-components", amount = 5 },
})
-- --Хим заводы
bobmods.lib.recipe.set_ingredients("angels-chemical-plant", {
	{ type = "item", name = "iron-plate", amount = 40 },
	{ type = "item", name = "bob-basic-circuit-board", amount = 3 },
	{ type = "item", name = "pipe", amount = 40 },
	{ type = "item", name = "iron-gear-wheel", amount = 25 },
})
bobmods.lib.recipe.set_ingredients("angels-chemical-plant-2", {
	{ type = "item", name = "bob-bronze-alloy", amount = 40 },
	{ type = "item", name = "electronic-circuit", amount = 3 },
	{ type = "item", name = "bob-bronze-pipe", amount = 40 },
	{ type = "item", name = "bob-steel-gear-wheel", amount = 25 },
	{ type = "item", name = "angels-chemical-plant", amount = 2 },
})
bobmods.lib.recipe.set_ingredients("angels-chemical-plant-3", {
	{ type = "item", name = "bob-aluminium-plate", amount = 40 },
	{ type = "item", name = "advanced-circuit", amount = 3 },
	{ type = "item", name = "bob-brass-pipe", amount = 40 },
	{ type = "item", name = "bob-brass-gear-wheel", amount = 25 },
	{ type = "item", name = "angels-chemical-plant-2", amount = 2 },
})
bobmods.lib.recipe.set_ingredients("angels-chemical-plant-4", {
	{ type = "item", name = "bob-titanium-plate", amount = 40 },
	{ type = "item", name = "processing-unit", amount = 3 },
	{ type = "item", name = "bob-titanium-pipe", amount = 40 },
	{ type = "item", name = "bob-titanium-gear-wheel", amount = 25 },
	{ type = "item", name = "angels-chemical-plant-3", amount = 2 },
})

--Исправление цена на бойлеры (SEO)
bobmods.lib.recipe.set_ingredients("bob-boiler-2", {
	{ type = "item", name = "bob-steel-pipe", amount = 15 },
	{ type = "item", name = "boiler", amount = 2 },
	{ type = "item", name = "steel-plate", amount = 20 },
})
bobmods.lib.recipe.set_ingredients("bob-boiler-3", {
	{ type = "item", name = "bob-brass-pipe", amount = 15 },
	{ type = "item", name = "bob-boiler-2", amount = 2 },
	{ type = "item", name = "bob-invar-alloy", amount = 20 },
})
bobmods.lib.recipe.set_ingredients("bob-boiler-4", {
	{ type = "item", name = "ceramic-pipe", amount = 15 },
	{ type = "item", name = "bob-boiler-3", amount = 2 },
	{ type = "item", name = "bob-tungsten-plate", amount = 20 },
})
bobmods.lib.recipe.set_ingredients("bob-boiler-5", {
	{ type = "item", name = "copper-tungsten-pipe", amount = 15 },
	{ type = "item", name = "bob-boiler-4", amount = 2 },
	{ type = "item", name = "bob-copper-tungsten-alloy", amount = 20 },
})

bobmods.lib.recipe.set_ingredients("yellow-filter-inserter", {
	{ type = "item", name = "electric-motor", amount = 2 },
	{ type = "item", name = "burner-filter-inserter", amount = 1 },
	{ type = "item", name = "electronic-circuit", amount = 4 },
}) --в рецепт к фильтрующему добавляем фитльтрующий твердотопливный
--13.08 починка рецепта кристаллического раствора
bobmods.lib.recipe.set_ingredients(
	"crystal-powder-slurry",
	{ { type = "item", name = "crystal-powder", amount = 10 }, { type = "item", name = "water-purified", amount = 10 } }
)
bobmods.lib.recipe.set_result("crystal-powder-slurry", { name = "crystal-slurry", type = "fluid", amount = 10 })
--19.08 починка рецепта взрывчатки 3
data.raw["recipe"]["angels-solid-trinitrotoluene"].category = "advanced-chemistry"

--добавление табличек holographic_signs в технологию (AKMF)
if data.raw.recipe["hs_holo_sign"] then
	data.raw["recipe"]["hs_holo_sign"].enabled = false
	bobmods.lib.tech.add_recipe_unlock("circuit-network", "hs_holo_sign")
end

--Убрана левая печь из электо печи для сплавов (AKMF)
bobmods.lib.recipe.remove_ingredient("bob-electric-mixing-furnace", "bob-electric-chemical-furnace")
KaoExtended.recipe.add_to_recipe(
	"bob-electric-mixing-furnace",
	{ type = "item", name = "electric-furnace", amount = 1 }
)

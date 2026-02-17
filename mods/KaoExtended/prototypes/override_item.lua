
--debug
local sections = {"item", "recipe", "technology"}
for _, s in ipairs(sections) do
	for k, _ in pairs(data.raw[s]) do
		log(s .. " : ".. k)
	end
end
--debug
--ANGELS PETROCHEM

data.raw["storage-tank"]["angels-storage-tank-1"].fluid_box.base_area = 1250 --DrD 2000
data.raw["storage-tank"]["angels-storage-tank-2"].fluid_box.base_area = 800 --DrD 1500

if mods["Bio_Industries_2"] and data.raw["tile"]["bi-solar-mat"] then
	data.raw["tile"]["bi-solar-mat"].pollution_absorption_per_second = 0.0006 --Bio-Industries
end

data.raw["pump"]["pump"].hidden = true
data.raw["pump"]["bob-pump-2"].hidden = true
data.raw["pump"]["bob-pump-3"].hidden = true
data.raw["pump"]["bob-pump-4"].hidden = true

data.raw.item["bob-valve"].hidden = true
data.raw.item["bob-overflow-valve"].hidden = true
data.raw.item["bob-topup-valve"].hidden = true
data.raw.recipe["bob-valve"].hidden = true
data.raw.recipe["bob-overflow-valve"].hidden = true
data.raw.recipe["bob-topup-valve"].hidden = true

data.raw.boiler["bob-oil-boiler"].hidden = true
data.raw.boiler["bob-oil-boiler-2"].hidden = true
data.raw.boiler["bob-oil-boiler-3"].hidden = true
data.raw.boiler["bob-oil-boiler-4"].hidden = true

data.raw.item["bob-oil-boiler"].hidden = true
data.raw.item["bob-oil-boiler-2"].hidden = true
data.raw.item["bob-oil-boiler-3"].hidden = true
data.raw.item["bob-oil-boiler-4"].hidden = true

data.raw.recipe["bob-oil-boiler"].hidden = true
data.raw.recipe["bob-oil-boiler-2"].hidden = true
data.raw.recipe["bob-oil-boiler-3"].hidden = true
data.raw.recipe["bob-oil-boiler-4"].hidden = true

data.raw.technology["bob-oil-boiler-1"].hidden = true
data.raw.technology["bob-oil-boiler-2"].hidden = true
data.raw.technology["bob-oil-boiler-3"].hidden = true
data.raw.technology["bob-oil-boiler-4"].hidden = true

bobmods.lib.recipe.remove_ingredient("bob-module-processor-board", "boiler")
bobmods.lib.recipe.add_new_ingredient("bob-module-processor-board", { type = "item", name = "copper-plate", amount = 3 })
bobmods.lib.recipe.remove_ingredient("bob-module-processor-board-2", "boiler")
bobmods.lib.recipe.add_new_ingredient("bob-module-processor-board-2", { type = "item", name = "copper-plate", amount = 5 })
bobmods.lib.recipe.remove_ingredient("bob-module-processor-board-3", "boiler")
bobmods.lib.recipe.add_new_ingredient("bob-module-processor-board-3", { type = "item", name = "copper-plate", amount = 10 })

--bobmods.lib.recipe.replace_ingredient ("fast-underground-belt", "iron-gear-wheel", "steel-gear-wheel")

-- MODULES
--[[
  bobmods.lib.recipe.replace_ingredient("speed-module-3", "processing-unit", "standart-io")
  bobmods.lib.recipe.replace_ingredient("productivity-module-3", "processing-unit", "standart-io")
  bobmods.lib.recipe.replace_ingredient("effectivity-module-3", "processing-unit", "standart-io")

  bobmods.lib.recipe.replace_ingredient("speed-module-4", "processing-unit", "advanced-io")
  bobmods.lib.recipe.replace_ingredient("productivity-module-4", "processing-unit", "advanced-io")
  bobmods.lib.recipe.replace_ingredient("effectivity-module-4", "processing-unit", "advanced-io")

  bobmods.lib.recipe.replace_ingredient("speed-module-5", "processing-unit", "advanced-io")
  bobmods.lib.recipe.replace_ingredient("productivity-module-5", "processing-unit", "advanced-io")
  bobmods.lib.recipe.replace_ingredient("effectivity-module-5", "processing-unit", "advanced-io")

  bobmods.lib.recipe.replace_ingredient("speed-module-6", "processing-unit", "predictive-io")
  bobmods.lib.recipe.replace_ingredient("productivity-module-6", "processing-unit", "predictive-io")
  bobmods.lib.recipe.replace_ingredient("effectivity-module-6", "processing-unit", "predictive-io")

  bobmods.lib.recipe.replace_ingredient("speed-module-7", "processing-unit", "predictive-io")
  bobmods.lib.recipe.replace_ingredient("productivity-module-7", "processing-unit", "predictive-io")
  bobmods.lib.recipe.replace_ingredient("effectivity-module-7", "processing-unit", "predictive-io")
 ]]

-- missed circuits in modules

-- see oberhaul prototypes

-- modules effects tweak

--code from CoppermineBobModuleRebalancing
--[[
for name, item in pairs(data.raw.module) do
    local subgroup = item.subgroup

    local level_string = item.name:match("%d+")
    local level = 1

    if level_string then
      level = tonumber(level_string)
    end

    if subgroup == "speed-module" then
      item.effect = {
        speed = {bonus = 0.1 * level},
        consumption = {bonus = 0.175 * level}
      }
    end

    if subgroup == "effectivity-module" then
      item.effect = {
        speed = {bonus = -0.04 * level},
        consumption = {bonus = -0.1 * level}
      }
    end

    if subgroup == "productivity-module" then
      item.effect = {
        productivity = {bonus = 0.05 * level},
        consumption = {bonus = 0.2 * level * level},
        pollution = {bonus = 0.15 * level},
        speed = {bonus = -0.1 * level}
      }
    end

    if subgroup == "raw-speed-module" then
      item.effect = {
        speed = {bonus = 0.1 * level},
        consumption = {bonus = 0.1 * level}
      }
    end

    if subgroup == "raw-productivity-module" then
      item.effect = {
        productivity = {bonus = 0.05 * level},
        consumption = {bonus = 0.1 * level * level},
        pollution = {bonus = 0.05 * level},
        speed = {bonus = -0.05 * level}
      }
    end

    --if subgroup == "god-module" then
    --  item.effect = {
    --    productivity = {bonus = 0.1 * level},
    --  }
    --end
  end
  ]]

local Assert = require("__0zzzcompability__/utils/assert")
require("__KaoExtended__/config")
if not KaoExtended then
	KaoExtended = {}
end
if not KaoExtended.item then
	KaoExtended.item = {}
end
if not KaoExtended.recipe then
	KaoExtended.recipe = {}
end
KaoExtended.getRecipe = function(recipe)
	Assert(type(recipe) == "string", "Expected string recipe name but given: " .. type(recipe))
	return data.raw["recipe"][recipe]
end

function KaoExtended.table_merge(table1, table2)
	for index, value in pairs(table2) do
		if type(value) == "table" then
			KaoExtended.table_merge(table1[index], table2[index])
		else
			table1[index] = value
		end
	end
end

function KaoExtended.result_check(object)
	if object then
		if object.results == nil then
			object.results = {}
		end

		if object.result then
			local item = KaoExtended.item.basic_item({ name = object.result })
			if object.result_count then
				item.amount = object.result_count
				object.result_count = nil
			end
			KaoExtended.item.add_new(object.results, item)

			if object.ingredients then -- It's a recipe
				if not object.main_product then
					if object.icon or object.subgroup or object.order or item.type ~= "item" then -- if we already have one, add the rest
						if not object.icon and data.raw[item.type][object.result].icon then
							object.icon = data.raw[item.type][object.result].icon
						end
						if not object.subgroup and data.raw[item.type][object.result].subgroup then
							object.subgroup = data.raw[item.type][object.result].subgroup
						end
						if not object.order and data.raw[item.type][object.result].order then
							object.order = data.raw[item.type][object.result].order
						end
					else -- otherwise just use main_product as a cheap way to set them all.
						object.main_product = object.result
					end
				end
			end
			object.result = nil
		end
	else
		log(object .. " does not exist.")
	end
end

function KaoExtended.item.get_type(name)
	local item_types =
		{ "ammo", "armor", "capsule", "fluid", "gun", "item", "mining-tool", "module", "tool", "item-with-entity-data" }
	for i, type_name in pairs(item_types) do
		if data.raw[type_name][name] then
			return type_name
		end
	end
	return nil
end

function KaoExtended.item.get_basic_type(name)
	local item_type = "item"
	if data.raw.fluid[name] then
		item_type = "fluid"
	end
	return item_type
end

local function get_item_name(inputs)
	local result = nil
	if inputs.name then
		result = inputs.name
	else
		result = inputs[1]
	end

	Assert(type(result) == "string", "Expected string type as item name but given: " .. type(result))
end

function KaoExtended.item.basic_item(inputs)
	local item = {}

	item.name = get_item_name(inputs)
	Assert(type(item.name) == "string", "item data have no name field!")

	if inputs.amount then
		item.amount = inputs.amount
	else
		if inputs[2] then
			item.amount = inputs[2]
		end
	end
	if not item.amount then
		item.amount = 1
	end

	if inputs.type then
		item.type = inputs.type
	else
		item.type = KaoExtended.item.get_basic_type(item.name)
	end

	if item.type == "item" then
		if item.amount > 0 and item.amount < 1 then
			item.amount = 1
		else
			item.amount = math.floor(item.amount)
		end
	end

	return item
end

function KaoExtended.item.item(inputs)
	local item = KaoExtended.item.basic_item(inputs)

	if inputs.amount_min and inputs.amount_max then
		item.amount_min = inputs.amount_min
		item.amount_max = inputs.amount_max
		item.amount = nil
	else
		item.amount = 1
	end
	if inputs.probability then
		item.probability = inputs.probability
	end
	return item
end
function KaoExtended.item.add_new(ingredients, item_in) --ignores if exists
	local item = KaoExtended.item.item(item_in)
	for i, object in pairs(ingredients) do
		if item.name == get_item_name(object) then
			return
		end
	end
	table.insert(ingredients, item)
end

function KaoExtended.recipe.addtorecipe(recipeName, itemInputs)
	Assert(type(recipeName) == "string", "Expected string recipe name but given: " .. type(recipeName))
	Assert(type(itemInputs) == "table", "Expected table item data but given: " .. type(itemInputs))
	local recipe = data.raw.recipe[recipeName]
	local item = KaoExtended.item.basic_item(itemInputs)
	Assert(recipe, "Recipe " .. recipe .. " does not exist.")
	Assert(item, "Ingredient " .. item.name .. " does not exist.")
	Assert(KaoExtended.item.get_type(get_item_name(item)), "Item: " .. item.name .. " have no item type")

	local recipeVariants = { recipe.expensive, recipe.normal, recipe }
	for _, recipeVariant in ipairs(recipeVariants) do
		if recipeVariant then
			KaoExtended.item.add_new(recipeVariant.ingredients, item)
		end
	end
end

KaoExtended.changeTime = function(recipe, time)
	data.raw["recipe"][recipe].energy_required = item
end

local Assert = require("utils.assert")
-- some mods like bob, angels and so on change names of items
-- from <item> to (bob/angels/...)-<item> but older mods that
-- requires mods above still referr to old <item> names
-- (I found it for recipe section, so there i try to find such places and fix it)

local prefixes = {
	"bob-",
	"angels-",
	"Schall-",
}

-- returns item's name with prefix if any or nil
local function _FindPrefixedItemName(itemName, section)
	Assert(type(itemName) == "string", "Expected string item name to search, but given: " .. type(itemName))
	Assert(data.raw and data.raw.item, "Expected data.raw.item but it is nil")
	Assert(
		section == "item" or section == "fluid",
		"Expected section to be item or fluid but given: " .. section
	)

	local entities = data.raw[section]

	-- already exists
	if entities[itemName] then
		return itemName
	end
	for _, prefix in pairs(prefixes) do
		local prefixedName = prefix .. itemName
		if entities[prefixedName] then
			return prefixedName
		end
	end
end

local function _FixRecipe(recipe)
	local recipeCheckFields = {"results", "ingredients"}
	for _, fixField in ipairs(recipeCheckFields) do
		Assert(type(recipe[fixField]) == "table" or log(serpent.block(recipe, {maxlevel=1})), "Expected array of entities(item/fluid) but given: "..type(recipe[fixField]))
		for index, entity in ipairs(recipe[fixField]) do
			if type(entity) == "nil" then -- skip already deleted result or ingredient
				goto continue
			end
			Assert(type(entity.name) == "string" and type(entity.type) == "string", "Expected entity with name and type string fields")
			local newName = _FindPrefixedItemName(entity.name, entity.type)
			if not newName then
				recipe[fixField][index] = nil 
				log("Removing from(".. type(newName)..") " .. recipe.name .. " field " .. fixField .. " -> ".. entity.name)
			end -- no entity found at all
			if newName == entity.name then goto continue end -- already exists
			entity.name = newName -- fix name if found
		::continue::
		end
	end
end

local function FixRecipies()
	Assert(data.raw and data.raw.recipe, "Expected data.raw.recipe but it is nil")
	for recipeName, recipe in pairs(data.raw.recipe) do
		if recipe.parameter == true or recipe.enabled == false then -- unused
			goto continue
		end
		_FixRecipe(recipe)
	    ::continue::
	end
end

FixRecipies()

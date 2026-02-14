local Assert = require("utils.assert")
-- fix Bio_farm + angelsrefining patch
-- fix old recipe result definition
local function FixBiSand()
	Assert(data.raw ~= nil and data.raw.recipe ~= nil, "Expected data.raw.recipe but it is nil")

	local recipe = data.raw.recipe["bi-sand"]
	Assert.AssertOutdated(type(recipe) == "table", "Recipe bi-sand not found.")
	Assert.AssertOutdated(type(recipe.result) == "string", "Recipe bi-sand not contain result as string section.")

	local amount = 5
	local newName = "angels-solid-sand"
	if recipe.results and type(recipe.results.amount) == "number" then
		amount = recipe.results.amount
	end

	recipe.results = {{ type = "item", name = newName, amount = amount }}
	recipe.result = nil -- clear old definition
end

FixBiSand()

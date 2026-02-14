local Binder = require("utils.binder")
local Assert = require("utils.assert")
-- sets any value
-- on any key return self
local function createUniversal() 
	local tbl = {}
	setmetatable(tbl, {
		__index = function (tbl_, key)
			return tbl_
		end,
		__newindex = function (tbl_, key, value)
			return
		end
	})
	return tbl
end

-- if key = normal or expensive return table theyself
local function indexFunction(tbl, key)
	if key == "normal" or key == "expensive" then
		return tbl
	end
end

local mt = {
	__index = indexFunction
}

function FixNormalExpensive()
	Assert(data.raw and data.raw.recipe, "Expected data.raw.recipe but it is nil")
	for recipeName, recipe in pairs(data.raw.recipe) do
		Binder.BindAccessMetatableInChain(recipe, mt)
	end
end

FixNormalExpensive()

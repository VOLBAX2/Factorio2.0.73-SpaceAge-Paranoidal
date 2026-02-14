local Binder = require("utils.binder")
local Assert = require("utils.assert")
local prefixes = {
	["bob-"] = true,
	["angels-"] = true,
}

local sections = {
	"item",
	"fluid",
	"assembling-machine",
	"recipe",
	"technology",
	"boiler",
	"pump",
	"storage-tank"
}

local function indexFunc(tbl, key)
	for prefix, _ in pairs(prefixes) do
		if string.sub(key, 1, #prefix) == prefix then
			return nil -- already add prefix
		end
	end
	for prefix, _ in pairs(prefixes) do
		local result = tbl[prefix .. key]
		if result then return result end
	end
end

for _, section in ipairs(sections) do
	Assert(data.raw and data.raw[section], "Section: " .. section .. " not found in data.raw")
	Binder.BindAccessMetatableInChain(data.raw[section], {
		__index = indexFunc
	})
end

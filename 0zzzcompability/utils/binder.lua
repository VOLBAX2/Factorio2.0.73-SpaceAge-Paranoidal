local Binder = {}

-- add __index check to tbl
--
-- if tbl have no metatable mt will be set as is
-- else there will be created new metatable with
-- all metamethods (except __index) inherited
--
-- __index metamethod will be overwritted in order to
-- call in chain old __index metamethod(if it exists) and mt.__index later
--
-- allows multiple chain
--
-- mt must have __index method

Binder.BindAccessMetatableInChain = function(tbl, mt)
	assert(type(tbl) == "table", "Expected tbl to be table to bind new __index mt in chain")
	assert(
		type(mt) == "table" and mt.__index and type(mt.__index) == "function",
		"Expected mt to be metatable with __index function to bind mt in chain"
	)

	local mtChainId = "UniqueBindMetatableInChainIdentifieradjfvndksjnvlsdvsd"
	local mtChain = {}
	mtChain[mtChainId] = {}
	local oldMtTable = getmetatable(tbl)
	-- chain mt already exists, just add new mt
	if oldMtTable and oldMtTable[mtChainId] then
		table.insert(oldMtTable[mtChainId], mt)
		return
	end

	if oldMtTable and type(oldMtTable.__index) == "function" then
		mtChain[mtChainId] = { oldMtTable, mt }
	else
		mtChain[mtChainId] = { mt }
	end

	if oldMtTable then
		-- inherit other metamethods
		for key, value in pairs(oldMtTable) do
			if key ~= "__index" then
				mtChain[key] = value
			end
		end
	end

	mtChain.__index = function(_table, key)
		local this = getmetatable(_table)
		for _, _mt in ipairs(this[mtChainId]) do
			local res = _mt.__index(_table, key)
			if res then
				return res
			end
		end
	end

	setmetatable(tbl, mtChain)
end

return Binder

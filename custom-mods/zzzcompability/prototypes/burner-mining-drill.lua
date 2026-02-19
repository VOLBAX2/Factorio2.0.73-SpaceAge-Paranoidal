-- add input fluid box for default burner drill



---Creates sprite
---@param filename string
---@param icon_size number | number[] must be 2^n
---@return SpritePrototype
local function CreateSprite(filename, icon_size)
	return {
		filename=filename,
		size=icon_size
	}
end

---@param volume number must be positive
---@param pipe_connections PipeConnectionDefinition[]
---@param direction "input" | "output"
---@return FluidBox
local function CreateFluidBoxTemplate(volume, pipe_connections)
	local directions = {"north", "east", "west", "south"}
	local pipe_covers = {}
	for _, d in ipairs(directions) do
		pipe_covers[d] =
				CreateSprite("__base__/graphics/entity/pipe-covers/pipe-cover-".. d..".png", 32)
	end
	return {
		volume = volume,
		pipe_connections = pipe_connections,
		production_type="input",
		pipe_covers = pipe_covers
	}
end


---@param bbox BoundingBox
---@param flow_direction FlowDirection
---@param direction? defines.direction (default: defines.direction.north)
---@return PipeConnectionDefinition
local function CreatePipeConnectionToCollisionBox(bbox, flow_direction, direction)
	local anchor = bbox[2]
	if not anchor then
		anchor = bbox.right_bottom
	end
	if not anchor then
		error("No map position found in BoundingBox: " .. serpent.block(bbox))
	end
	-- anchor = { (anchor[1] or anchor.x), (anchor[2] or anchor.y) }
	anchor = {0.3, 0.3} -- debug
	return {
		flow_direction = flow_direction,
		direction = direction or defines.direction.south,
		position = anchor,
	}
end

---Add input fluid box for drill
---@param drill MiningDrillPrototype
---@param volume? number (default: 1000) must be positive
local function AddInputFluidBox(drill, volume)
	local bbox = drill.collision_box
	local pipe_connection = CreatePipeConnectionToCollisionBox(bbox, "input-output", defines.direction.south)


	drill.input_fluid_box = CreateFluidBoxTemplate(volume or 1000, { pipe_connection })
end

---Set trigger to mine 10 coal and open mining-with-fluid modifier
---@param techName string
local function UnlockMiningWithFluidWithTech(techName)
	local tech = data.raw.technology[techName]
	assert(tech, "Given tech not found!")

	tech.unit = nil
	tech.research_trigger = {
		type = "mine-entity",
		entity="coal"
	}
	table.insert(tech.effects, {type="mining-with-fluid", modifier=true})
end

AddInputFluidBox(data.raw["mining-drill"]["burner-mining-drill"])
UnlockMiningWithFluidWithTech("burner-mechanics")


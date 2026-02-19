-- add input fluid box for default burner drill

---@param volume number must be positive
---@param pipe_connections PipeConnectionDefinition[]
---@param direction "input" | "output"
---@return FluidBox
local function CreateFluidBoxTemplate(volume, pipe_connections)
	return {
		volume = volume,
		pipe_connections = pipe_connections,
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
		direction = direction or defines.direction.north,
		position = anchor,
	}
end

---Add input fluid box for drill
---@param drill MiningDrillPrototype
---@param volume? number (default: 1000) must be positive
local function AddInputFluidBox(drill, volume)
	local bbox = drill.collision_box
	local pipe_connection = CreatePipeConnectionToCollisionBox(bbox, "input-output")

	drill.input_fluid_box = drill.input_fluid_box or CreateFluidBoxTemplate(volume or 1000, { pipe_connection })
end

AddInputFluidBox(data.raw["mining-drill"]["burner-mining-drill"])

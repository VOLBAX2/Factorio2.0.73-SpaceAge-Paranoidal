local TPlib = require("lib.TPlib")
local cfg2 = require("config.config-2")
local TPcp = require("lib.TPcp")


local function check_tank_recipe(e)
  if e.setting == cfg2.mod_prefix .. "tank-to-recipe-force-enable" then
    local setvalue = settings.global[e.setting].value or settings.startup[cfg2.mod_prefix .. "tank-to-recipe-keep"].value
    for index, force in pairs(game.forces) do
      local recipe = force.recipes["tank"]
      if not recipe or not recipe.valid then return end
      local tech_tank = force.technologies["tank"]
      if setvalue then
        -- table.insert(tech_tank.effects, 1, {type="unlock-recipe", recipe="tank"})
        recipe.enabled = force.technologies["tank"].researched
      else
        -- for i, v in pairs(tech_tank.effects) do
        --   if (v.recipe=="tank") then table.remove(tech_tank.effects, i) end
        -- end
        recipe.enabled = false
      end
    end
  end
end


local function pre_craft_unload_equipment(e)
  local player = game.players[e.player_index]
  -- local recipe = e.recipe
  local items = e.items
  local surface = player.surface
	-- TPlib.debugprint(" # Items : " .. #e.items )
	-- TPlib.debugprint("Product : " .. recipe.name)
  local position = player.position
  local itemproto = prototypes.item   -- game.item_prototypes
  local item_cnt = {}
  local count = 0
  for i = 1, #items do
  	-- TPlib.debugprint(items[i].name .. " ×" .. items[i].count)
    local grid = items[i].grid
  	if grid and grid.valid then
  		-- TPlib.debugprint("=== has Grid ===")
  		for _, v in pairs(grid.equipment) do
        if v.valid then
          local returnname = v.prototype.take_result.name
    			-- TPlib.debugprint(v.name)
    			if player.insert{name = returnname, quality = v.quality} == 0 then
    				surface.spill_item_stack( position, {name = returnname, quality = v.quality}, true )
    			end
          TPlib.counts_2D_add(item_cnt, returnname, v.quality.name, 1)
          grid.take{equipment = v}
          count = count + 1
        end
  		end
  	end
  end
  position.y = position.y - 0.5
  for k1, v1 in pairs(item_cnt) do
    for k2, v in pairs(v1) do
      position.y = position.y - 0.5
      TPlib.create_flying_text_item(surface, position, itemproto[k1], k2, -v, player)
    end
  end
  if count > 0 then player.print({"description.Schall-msg-precraft-take-equipment", count}) end
end


local function runtime_mod_setting_changed(e)
  check_tank_recipe(e)
end

local function pre_player_crafted_item(e)
	pre_craft_unload_equipment(e)
end

local function built_entity(e)
  local player = game.players[e.player_index]
  if not player.mod_settings[cfg2.mod_prefix .. "vehicle-clone-placement-built-enable"].value then return end
  local source = player.vehicle
  local target = e.entity
  if not source then return end
  if source.name ~= target.name then return end
  TPcp.vehicle_clone_placement(source, target, player)
end

local function entity_settings_pasted(e)
  local player = game.players[e.player_index]
  if not player.mod_settings[cfg2.mod_prefix .. "vehicle-clone-placement-pasted-enable"].value then return end
  local source = e.source
  local target = e.destination
  TPcp.vehicle_clone_placement(source, target, player)
end


script.on_event(defines.events.on_runtime_mod_setting_changed,      runtime_mod_setting_changed)
script.on_event(defines.events.on_pre_player_crafted_item,          pre_player_crafted_item)
script.on_event(defines.events.on_built_entity,                     built_entity)
script.on_event(defines.events.on_entity_settings_pasted,           entity_settings_pasted)

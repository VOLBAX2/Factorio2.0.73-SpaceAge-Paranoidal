local TPlib = require("lib.TPlib")



local TPcp = {}


--
-- Custom classes
--
local function item_stat_init()
  return {
    used = {},
    failed = {},
  }
end

local function item_stat_used(t, k1, k2, v)
  if not t or not t.used then t = item_stat_init() end
  TPlib.counts_2D_add(t.used, k1, k2, v, true)
  return t
end

local function item_stat_failed(t, k1, k2, v)
  if not t or not t.failed then t = item_stat_init() end
  TPlib.counts_2D_add(t.failed, k1, k2, v, true)
  return t
end


--
-- Tool Functions
--
function TPcp.get_items_from_source(itemname, quality, desired_amt, player, item_stat)
  -- OUTPUT: Number of items allowed to get.
  local fill_amt = player.remove_item{name = itemname, quality = quality, count = desired_amt}
  item_stat_used(item_stat, itemname, quality.name, fill_amt)
  return fill_amt
end


--
-- Main Functions
--
function TPcp.inventory_filters_clone(source, target)
  if not source or not source.valid or not source.supports_filters() then return end
  if not target or not target.valid or not target.supports_filters() then return end
  -- TPlib.debugprint("Start inventory filters clone.")
  for k = math.min(#source, #target), 1, -1 do
    target.set_filter(k, source.get_filter(k))
  end
end


function TPcp.inventory_slot_clone_placement(source, target, player, item_stat)
  if not player then return end
  if not source or not source.valid or not source.valid_for_read then return end
  if not target or not target.valid then return end
  -- Skip complex items like armor (Not sure to take identical item)
  if source.count == 1 and ( source.grid or source.is_blueprint or source.is_blueprint_book or source.is_armor or source.is_item_with_inventory or source.is_item_with_entity_data or source.is_deconstruction_item or source.is_upgrade_item ) then
    -- TPlib.debugprint("Item " .. source.name .. " is not cloned, for being a possibly complex item.")
    item_stat_failed(item_stat, source.name, source.quality.name, source.count)
    return
  end
  -- TPlib.debugprint("Start inventory slot clone placement.")
  if target.valid_for_read then
    -- TPlib.debugprint("  has item " .. target.name .. " x" .. target.count)
    if (source.name == target.name) and (source.quality == target.quality) then
      if source.count > target.count then
        local fill_amt = TPcp.get_items_from_source(source.name, source.quality, source.count - target.count, player, item_stat)
        if fill_amt > 0 then
          -- Successful insert
          target.count = target.count + fill_amt
        end
      end
    else
      -- Cannot insert, occupied by different type of items
      item_stat_failed(item_stat, source.name, source.quality.name, source.count)
    end
  else
    -- TPlib.debugprint("  is empty.")
    local fill_amt = TPcp.get_items_from_source(source.name, source.quality, source.count, player, item_stat)
    if fill_amt > 0 then
      if not target.set_stack{name = source.name, quality = source.quality, count = fill_amt} then
        -- Cannot insert, probably due to incompatible slot (esp. fuel or ammo with different category)
        item_stat_failed(item_stat, source.name, source.quality.name, fill_amt)
      end
    end
  end
end


function TPcp.inventory_clone_placement(source, target, player, item_stat)
  if not player then return end
  if not source or not source.valid or source.is_empty() then return end
  if not target or not target.valid then return end
  -- TPlib.debugprint("Start inventory clone placement.")
  for k = math.min(#source, #target), 1, -1 do
    TPcp.inventory_slot_clone_placement(source[k], target[k], player, item_stat)
  end
end


function TPcp.grid_clone_placement(source, target, player, item_stat)
  if not player then return end
  if not source or not source.valid then return end
  if not target or not target.valid then return end
  -- TPlib.debugprint("Start equipment clone placement.")
  local itemproto = prototypes.item   -- game.item_prototypes
  for _, v in pairs(source.equipment) do
    if v.valid then
      -- local itempt = itemproto[v.name]
      local itemname = nil
      if itemproto[v.name] and itemproto[v.name].place_as_equipment_result.name == v.name then
        -- Placed by item of same name, no need to search
        itemname = v.name
      else
        -- Cannot be placed by item of same name, have to search through prototypes (expensive search)
        -- get_filtered_item_prototypes filters are really difficult to be used, poorly documented
        -- Now skip for breavity
        -- local results = game.get_filtered_item_prototypes({{ filter = "placed-as-equipment-result", elem_filters = {{ filter = "name", name = v.name }} }})
        -- local results = game.get_filtered_item_prototypes({{ filter = "placed-as-equipment-result" }})
        -- for k, itm in pairs(results) do
        --   if itm.place_as_equipment_result.name == v.name then
        --     itemname = itm.name
        --     game.print("Using " .. itemname .. " to insert to equipment " .. v.name)
        --     break
        --   end
        -- end
        if not itemname then
          game.print("Cannot find corresponding item for equipment " .. v.name)
        end
      end
      if itemname then
        local inserted = target.put{name = v.name, quality = v.quality, position = v.position, by_player = player}
        if inserted then
          local fill_amt = TPcp.get_items_from_source(itemname, v.quality, 1, player, item_stat)
          if fill_amt > 0 then
            -- Successful insert
            if v.burner and inserted.burner then
              TPcp.inventory_clone_placement(v.burner.inventory, inserted.burner.inventory, player, item_stat)
            end
          else
            -- Usable but out of supply
            target.take{equipment = inserted}
          end
        else
          -- Not compatible / Slot used
          -- Check same position
          local eqpT = target.get(v.position)
          if eqpT and eqpT.name == v.name and eqpT.quality == v.quality then
            -- If same equipment, than may clone contents within burner
            if v.burner and eqpT.burner then
              TPcp.inventory_clone_placement(v.burner.inventory, eqpT.burner.inventory, player, item_stat)
            end
          else
            -- TPlib.debugprint({"", "Failed to put ", v.prototype.localised_name, " on ", TPlib.format_position(v.position)})
            item_stat_failed(item_stat, v.name, v.quality.name, 1)
          end
        end
      end
    end
  end
end


function TPcp.vehicle_clone_placement(source, target, player)
  -- TPlib.debugprint("You placed a " .. target.name .. " (" .. target.type .. ").")
  if not target.prototype.weight then return end
  if not player then return end
  if not source then return end
  if not target then return end
  local itemproto = prototypes.item
  local item_stat = item_stat_init()
  -- Grid clone
  TPcp.grid_clone_placement(source.grid, target.grid, player, item_stat)
  -- Fuel clone
  TPcp.inventory_clone_placement(source.get_fuel_inventory(), target.get_fuel_inventory(), player, item_stat)
  -- Ammo clone
  TPcp.inventory_clone_placement(source.get_inventory(defines.inventory.car_ammo), target.get_inventory(defines.inventory.car_ammo), player, item_stat)
  -- Inventory clone
  TPcp.inventory_filters_clone(source.get_inventory(defines.inventory.car_trunk), target.get_inventory(defines.inventory.car_trunk))
  TPcp.inventory_clone_placement(source.get_inventory(defines.inventory.car_trunk), target.get_inventory(defines.inventory.car_trunk), player, item_stat)
  -- Cargo wagon inventory clone
  TPcp.inventory_filters_clone(source.get_inventory(defines.inventory.cargo_wagon), target.get_inventory(defines.inventory.cargo_wagon))
  TPcp.inventory_clone_placement(source.get_inventory(defines.inventory.cargo_wagon), target.get_inventory(defines.inventory.cargo_wagon), player, item_stat)
  -- Flying text for items placed
  local surface = target.surface
  local position = target.position
  player.create_local_flying_text{position = target.position, text = {"description.Schall-flying-text-place"}}
  -- Flying text for items failed to insert
  for k1, v1 in pairs(item_stat.failed) do
    for k2, v in pairs(v1) do
      position.y = position.y + 0.5
      TPlib.create_flying_text_insert_failed(surface, position, itemproto[k1], k2, player)
    end
  end
  -- Flying text for items taken from player inventory
  local surface = player.surface
  local position = player.position
  for k1, v1 in pairs(item_stat.used) do
    for k2, v in pairs(v1) do
      position.y = position.y + 0.5
      TPlib.create_flying_text_item(surface, position, itemproto[k1], k2, -v, player)
    end
  end
end



return TPcp
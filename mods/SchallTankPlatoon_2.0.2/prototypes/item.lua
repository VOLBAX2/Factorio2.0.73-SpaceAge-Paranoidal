local TPlib = require("lib.TPlib")
local cfg1 = require("config.config-1")



local item_sounds = require("__base__.prototypes.item_sounds")



local item_icon_layer = {
  fission_reactor     = {
    [2]               = {icon = "__base__/graphics/icons/fission-reactor-equipment.png", tint = {r=0.4, g=0.4, b=0.4, a=1} },
    [3]               = {icon = "__base__/graphics/icons/fission-reactor-equipment.png", tint = {r=0.7, g=0.7, b=0.7, a=1} },
  },
  fusion_reactor      = {
    [2]               = {icon = "__space-age__/graphics/icons/fusion-reactor-equipment.png", tint = {r=0.4, g=0.4, b=0.4, a=1} },
    [3]               = {icon = "__space-age__/graphics/icons/fusion-reactor-equipment.png", tint = {r=0.7, g=0.7, b=0.7, a=1} },
  },
  veh_energy_shield   = {
    [1]               = {icon = "__base__/graphics/icons/energy-shield-equipment.png"},
    [2]               = {icon = "__base__/graphics/icons/energy-shield-mk2-equipment.png"},
  },
  veh_battery         = {
    [1]               = {icon = "__SchallTankPlatoon__/graphics/icons/vehicle-battery-equipment.png"},
    [2]               = {icon = "__SchallTankPlatoon__/graphics/icons/vehicle-battery-mk2-equipment.png"},
  },
  veh_fuel_cell       = {
    [2]               = {icon = "__SchallTankPlatoon__/graphics/icons/vehicle-fuel-cell.png", icon_size = 128, icon_mipmaps = 3, tint = {r=0.4, g=0.4, b=0.4, a=1}},
    [3]               = {icon = "__SchallTankPlatoon__/graphics/icons/vehicle-fuel-cell.png", icon_size = 128, icon_mipmaps = 3, tint = {r=0.7, g=0.7, b=0.7, a=1}},
    [4]               = {icon = "__SchallTankPlatoon__/graphics/icons/vehicle-fuel-cell.png", icon_size = 128, icon_mipmaps = 3},
  },
  veh_nuclear_reactor = {icon = "__base__/graphics/icons/nuclear-reactor.png", icon_size = 64, icon_mipmaps = 4, tint = {r=0.7, g=0.7, b=0.7, a=1}},
  night_vision        = {icon = "__base__/graphics/icons/night-vision-equipment.png"},
  concrete_wall       = {icon = "__SchallTankPlatoon__/graphics/icons/concrete-wall.png"},
  concrete_gate       = {icon = "__SchallTankPlatoon__/graphics/icons/concrete-gate.png"},
  repair_pack         = {icon = "__base__/graphics/icons/repair-pack.png"},
}

local function item_icons(model, param)
  -- param = {variant, eqp, tier}
  local rt = {}
  local spec = item_icon_layer[model]
  local layer
  if param and param.variant then
    layer = spec[param.variant]
  else
    layer = spec
  end
  if layer.icon then
    table.insert(rt, {icon = layer.icon, icon_size = layer.icon_size or 64, icon_mipmaps = layer.icon_mipmaps or 4, tint = layer.tint})
  end
  if param and param.tier then
    table.insert(rt, TPlib.tier_icon_layer[param.tier])
  end
  if param and param.eqp then
    table.insert(rt, TPlib.eqp_icon_layer[param.eqp])
  end
  return rt
end



local subgroup_veheqp = {
  [0] = "equipment",
  M   = "military-equipment",
  R   = "equipment",
}

if mods["SchallTransportGroup"] then
  subgroup_veheqp = {
    [0] = "vehicle-equipment",
    M   = "vehicle-equipment-military",
    R   = "vehicle-equipment-defense"
  }
end



data:extend
{
  -- Equipment
  {
    type = "item",
    name = "Schall-fission-reactor-2-equipment",
    icons = item_icons("fission_reactor", {variant = 2}),
    place_as_equipment_result = "Schall-fission-reactor-2-equipment",
    subgroup = "equipment",
    order = "a[energy-source]-b[fission-reactor]",
    inventory_move_sound = item_sounds.reactor_inventory_move,
    pick_sound = item_sounds.reactor_inventory_pickup,
    drop_sound = item_sounds.reactor_inventory_move,
    stack_size = 20,
    weight = 0.1 * tons
  },
  {
    type = "item",
    name = "Schall-fission-reactor-3-equipment",
    icons = item_icons("fission_reactor", {variant = 3}),
    place_as_equipment_result = "Schall-fission-reactor-3-equipment",
    subgroup = "equipment",
    order = "a[energy-source]-b[fission-reactor]",
    inventory_move_sound = item_sounds.reactor_inventory_move,
    pick_sound = item_sounds.reactor_inventory_pickup,
    drop_sound = item_sounds.reactor_inventory_move,
    stack_size = 20,
    weight = 0.15 * tons
  },
  {
    type = "item",
    name = "Schall-vehicle-energy-shield-equipment",
    icons = item_icons("veh_energy_shield", {variant = 1, eqp = "tank"}),
    place_as_equipment_result = "Schall-vehicle-energy-shield-equipment",
    subgroup = subgroup_veheqp["M"],
    order = "a[shield]-v[vehicle]-a[energy-shield-equipment]",
    inventory_move_sound = item_sounds.energy_shield_inventory_move,
    pick_sound = item_sounds.energy_shield_inventory_pickup,
    drop_sound = item_sounds.energy_shield_inventory_move,
    default_request_amount = 5,
    stack_size = 20,
    weight = 50*kg
  },
  {
    type = "item",
    name = "Schall-vehicle-energy-shield-mk2-equipment",
    icons = item_icons("veh_energy_shield", {variant = 2, eqp = "tank"}),
    place_as_equipment_result = "Schall-vehicle-energy-shield-mk2-equipment",
    subgroup = subgroup_veheqp["M"],
    order = "a[shield]-v[vehicle]-b[energy-shield-equipment-mk2]",
    inventory_move_sound = item_sounds.energy_shield_inventory_move,
    pick_sound = item_sounds.energy_shield_inventory_pickup,
    drop_sound = item_sounds.energy_shield_inventory_move,
    default_request_amount = 5,
    stack_size = 20,
    weight = 100*kg
  },
  {
    type = "item",
    name = "Schall-vehicle-battery-equipment",
    icons = item_icons("veh_battery", {variant = 1, eqp = "tank"}),
    place_as_equipment_result = "Schall-vehicle-battery-equipment",
    subgroup = subgroup_veheqp[0],
    order = "b[battery]-v[vehicle]-a[battery-equipment]",
    inventory_move_sound = item_sounds.electric_small_inventory_move,
    pick_sound = item_sounds.electric_small_inventory_pickup,
    drop_sound = item_sounds.electric_small_inventory_move,
    default_request_amount = 5,
    stack_size = 20,
    weight = 50*kg
  },
  {
    type = "item",
    name = "Schall-vehicle-battery-mk2-equipment",
    icons = item_icons("veh_battery", {variant = 2, eqp = "tank"}),
    place_as_equipment_result = "Schall-vehicle-battery-mk2-equipment",
    subgroup = subgroup_veheqp[0],
    order = "b[battery]-v[vehicle]-b[battery-equipment-mk2]",
    inventory_move_sound = item_sounds.electric_small_inventory_move,
    pick_sound = item_sounds.electric_small_inventory_pickup,
    drop_sound = item_sounds.electric_small_inventory_move,
    default_request_amount = 5,
    stack_size = 20,
    weight = 100*kg
  },
  {
    type = "item",
    name = "Schall-vehicle-fuel-cell-2-equipment",
    icons = item_icons("veh_fuel_cell", {variant = 2, eqp = "tank"}),
    place_as_equipment_result = "Schall-vehicle-fuel-cell-2-equipment",
    subgroup = subgroup_veheqp[0],
    order = "a[energy-source]-v[vehicle]-b[fuel-cell]-2",
    inventory_move_sound = item_sounds.reactor_inventory_move,
    pick_sound = item_sounds.reactor_inventory_pickup,
    drop_sound = item_sounds.reactor_inventory_move,
    default_request_amount = 1,
    stack_size = 10
  },
  {
    type = "item",
    name = "Schall-vehicle-fuel-cell-3-equipment",
    icons = item_icons("veh_fuel_cell", {variant = 3, eqp = "tank"}),
    place_as_equipment_result = "Schall-vehicle-fuel-cell-3-equipment",
    subgroup = subgroup_veheqp[0],
    order = "a[energy-source]-v[vehicle]-b[fuel-cell]-3",
    inventory_move_sound = item_sounds.reactor_inventory_move,
    pick_sound = item_sounds.reactor_inventory_pickup,
    drop_sound = item_sounds.reactor_inventory_move,
    default_request_amount = 1,
    stack_size = 10
  },
  {
    type = "item",
    name = "Schall-vehicle-fuel-cell-4-equipment",
    icons = item_icons("veh_fuel_cell", {variant = 4, eqp = "tank"}),
    place_as_equipment_result = "Schall-vehicle-fuel-cell-4-equipment",
    subgroup = subgroup_veheqp[0],
    order = "a[energy-source]-v[vehicle]-b[fuel-cell]-4",
    inventory_move_sound = item_sounds.reactor_inventory_move,
    pick_sound = item_sounds.reactor_inventory_pickup,
    drop_sound = item_sounds.reactor_inventory_move,
    default_request_amount = 1,
    stack_size = 10
  },
  {
    type = "item",
    name = "Schall-vehicle-nuclear-reactor-equipment",
    icons = item_icons("veh_nuclear_reactor", {eqp = "tank"}),
    place_as_equipment_result = "Schall-vehicle-nuclear-reactor-equipment",
    subgroup = subgroup_veheqp[0],
    order = "a[energy-source]-v[vehicle]-e[nuclear-reactor]",
    inventory_move_sound = item_sounds.reactor_inventory_move,
    pick_sound = item_sounds.reactor_inventory_pickup,
    drop_sound = item_sounds.reactor_inventory_move,
    default_request_amount = 1,
    stack_size = 10,
    weight = 1000*kg
  },
  {
    type = "item",
    name = "Schall-night-vision-mk1-equipment",
    localised_description = {"item-description.night-vision-equipment"},
    icons = item_icons("night_vision", {tier = 1}),
    place_as_equipment_result = "Schall-night-vision-mk1-equipment",
    subgroup = "utility-equipment",
    order = "f[night-vision]-a[night-vision-equipment]-1",
    inventory_move_sound = item_sounds.electric_small_inventory_move,
    pick_sound = item_sounds.electric_small_inventory_pickup,
    drop_sound = item_sounds.electric_small_inventory_move,
    default_request_amount = 1,
    stack_size = 20
  },
  {
    type = "item",
    name = "Schall-night-vision-mk2-equipment",
    localised_description = {"item-description.night-vision-equipment"},
    icons = item_icons("night_vision", {tier = 2}),
    place_as_equipment_result = "Schall-night-vision-mk2-equipment",
    subgroup = "utility-equipment",
    order = "f[night-vision]-a[night-vision-equipment]-2",
    inventory_move_sound = item_sounds.electric_small_inventory_move,
    pick_sound = item_sounds.electric_small_inventory_pickup,
    drop_sound = item_sounds.electric_small_inventory_move,
    default_request_amount = 1,
    stack_size = 20
  },
  -- Concrete walls
  {
    type = "item",
    name = "Schall-concrete-wall",
    icons = item_icons("concrete_wall"),
    subgroup = "defensive-structure",
    order = "a[wall]-a[wall]-2",
    inventory_move_sound = item_sounds.concrete_inventory_move,
    pick_sound = item_sounds.concrete_inventory_pickup,
    drop_sound = item_sounds.concrete_inventory_move,
    place_result = "Schall-concrete-wall",
    stack_size = 100,
    weight = 10*kg
  },
  {
    type = "item",
    name = "Schall-concrete-gate",
    icons = item_icons("concrete_gate"),
    subgroup = "defensive-structure",
    order = "a[wall]-b[gate]-2",
    inventory_move_sound = item_sounds.concrete_inventory_move,
    pick_sound = item_sounds.concrete_inventory_pickup,
    drop_sound = item_sounds.concrete_inventory_move,
    place_result = "Schall-concrete-gate",
    stack_size = 50
  },
  -- Repair Packs
  {
    type = "repair-tool",
    name = "Schall-repair-pack-mk1",
    localised_description = {"item-description.repair-pack"},
    icons = item_icons("repair_pack", {tier = 1}),
    icon_size = 32,
    subgroup = "tool",
    order = "b[repair]-a[repair-pack]-1",
    inventory_move_sound = item_sounds.repair_pack_inventory_move,
    pick_sound = item_sounds.repair_pack_inventory_pickup,
    drop_sound = item_sounds.repair_pack_inventory_move,
    speed = 4,
    durability = 300,
    stack_size = 100
  },
  {
    type = "repair-tool",
    name = "Schall-repair-pack-mk2",
    localised_description = {"item-description.repair-pack"},
    icons = item_icons("repair_pack", {tier = 2}),
    icon_size = 32,
    subgroup = "tool",
    order = "b[repair]-a[repair-pack]-2",
    inventory_move_sound = item_sounds.repair_pack_inventory_move,
    pick_sound = item_sounds.repair_pack_inventory_pickup,
    drop_sound = item_sounds.repair_pack_inventory_move,
    speed = 6,
    durability = 300,
    stack_size = 100
  },
}


if cfg1.class_on["fusion-reactor"] then
  data:extend
  {
    -- Equipment
    {
      type = "item",
      name = "Schall-fusion-reactor-2-equipment",
      icons = item_icons("fusion_reactor", {variant = 2}),
      place_as_equipment_result = "Schall-fusion-reactor-2-equipment",
      subgroup = "equipment",
      order = "a[energy-source]-c[fusion-reactor]",
      inventory_move_sound = item_sounds.reactor_inventory_move,
      pick_sound = item_sounds.reactor_inventory_pickup,
      drop_sound = item_sounds.reactor_inventory_move,
      stack_size = 20,
      weight = 0.5 * tons
    },
    {
      type = "item",
      name = "Schall-fusion-reactor-3-equipment",
      icons = item_icons("fusion_reactor", {variant = 3}),
      place_as_equipment_result = "Schall-fusion-reactor-3-equipment",
      subgroup = "equipment",
      order = "a[energy-source]-c[fusion-reactor]",
      inventory_move_sound = item_sounds.reactor_inventory_move,
      pick_sound = item_sounds.reactor_inventory_pickup,
      drop_sound = item_sounds.reactor_inventory_move,
      stack_size = 20,
      weight = 0.6 * tons
    },
  }
end

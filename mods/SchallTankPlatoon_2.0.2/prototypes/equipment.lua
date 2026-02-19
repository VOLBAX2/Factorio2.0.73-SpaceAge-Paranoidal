local cfg1 = require("config.config-1")



data:extend
{
  -- Fusion Reactor
  {
    type = "generator-equipment",
    name = "Schall-fission-reactor-2-equipment",
    sprite =
    {
      filename = "__base__/graphics/equipment/fission-reactor-equipment.png",
      width = 256,
      height = 256,
      priority = "medium",
      scale = 0.5
    },
    shape =
    {
      width = 2,
      height = 2,
      type = "full"
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "primary-output"
    },
    power = "150kW",
    categories = {"armor"}
  },
  {
    type = "generator-equipment",
    name = "Schall-fission-reactor-3-equipment",
    sprite =
    {
      filename = "__base__/graphics/equipment/fission-reactor-equipment.png",
      width = 256,
      height = 256,
      priority = "medium",
      scale = 0.5
    },
    shape =
    {
      width = 3,
      height = 3,
      type = "full"
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "primary-output"
    },
    power = "400kW",
    categories = {"armor"}
  },
  -- Vehicle Energy Shield
  {
    type = "energy-shield-equipment",
    name = "Schall-vehicle-energy-shield-equipment",
    sprite =
    {
      filename = "__base__/graphics/equipment/energy-shield-equipment.png",
      width = 128,
      height = 128,
      priority = "medium",
      scale = 0.5
    },
    shape =
    {
      width = 2,
      height = 2,
      type = "full"
    },
    max_shield_value = 150, --50,
    energy_source =
    {
      type = "electric",
      buffer_capacity = "180kJ", --"120kJ",
      input_flow_limit = "360kW", --"240kW",
      usage_priority = "primary-input"
    },
    energy_per_shield = "20kJ",
    categories = {"vehicle"}
  },
  {
    type = "energy-shield-equipment",
    name = "Schall-vehicle-energy-shield-mk2-equipment",
    sprite =
    {
      filename = "__base__/graphics/equipment/energy-shield-mk2-equipment.png",
      width = 128,
      height = 128,
      priority = "medium",
      scale = 0.5
    },
    shape =
    {
      width = 2,
      height = 2,
      type = "full"
    },
    max_shield_value = 450, --150,
    energy_source =
    {
      type = "electric",
      buffer_capacity = "270kJ", --"180kJ",
      input_flow_limit = "540kW", --"360kW",
      usage_priority = "primary-input"
    },
    energy_per_shield = "30kJ",
    categories = {"vehicle"}
  },
  -- Vehicle Battery
  {
    type = "battery-equipment",
    name = "Schall-vehicle-battery-equipment",
    sprite =
    {
      filename = "__SchallTankPlatoon__/graphics/equipment/vehicle-battery-equipment.png",
      width = 32,
      height = 64,
      priority = "medium"
    },
    shape =
    {
      width = 1,
      height = 2,
      type = "full"
    },
    energy_source =
    {
      type = "electric",
      buffer_capacity = "60MJ", --"20MJ",
      usage_priority = "tertiary"
    },
    categories = {"vehicle"}
  },
  {
    type = "battery-equipment",
    name = "Schall-vehicle-battery-mk2-equipment",
    sprite =
    {
      filename = "__SchallTankPlatoon__/graphics/equipment/vehicle-battery-mk2-equipment.png",
      width = 32,
      height = 64,
      priority = "medium"
    },
    shape =
    {
      width = 1,
      height = 2,
      type = "full"
    },
    energy_source =
    {
      type = "electric",
      buffer_capacity = "300MJ", --"100MJ",
      usage_priority = "tertiary"
    },
    categories = {"vehicle"}
  },
  -- Vehicle Fuel Cell
  {
    type = "generator-equipment",
    name = "Schall-vehicle-fuel-cell-2-equipment",
    sprite =
    {
      filename = "__base__/graphics/technology/electric-engine.png",
      width = 256,
      height = 256,
      priority = "medium"
    },
    shape =
    {
      width = 2,
      height = 2,
      type = "full"
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-output"
    },
    burner =
    {
      type = "burner",
      fuel_categories = {"chemical"},
      effectivity = 0.8, --0.4,
      fuel_inventory_size = 1,
    },
    power = "400kW",
    categories = {"vehicle"}
  },
  {
    type = "generator-equipment",
    name = "Schall-vehicle-fuel-cell-3-equipment",
    sprite =
    {
      filename = "__base__/graphics/technology/electric-engine.png",
      width = 256,
      height = 256,
      priority = "medium"
    },
    shape =
    {
      width = 3,
      height = 3,
      type = "full"
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-output"
    },
    burner =
    {
      type = "burner",
      fuel_categories = {"chemical"},
      effectivity = 0.9, --0.45,
      fuel_inventory_size = 2,
    },
    power = "1000kW",
    categories = {"vehicle"}
  },
  {
    type = "generator-equipment",
    name = "Schall-vehicle-fuel-cell-4-equipment",
    sprite =
    {
      filename = "__base__/graphics/technology/electric-engine.png",
      width = 256,
      height = 256,
      priority = "medium"
    },
    shape =
    {
      width = 4,
      height = 4,
      type = "full"
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-output"
    },
    burner =
    {
      type = "burner",
      fuel_categories = {"chemical"},
      effectivity = 1, --0.5,
      fuel_inventory_size = 3,
    },
    power = "2000kW",
    categories = {"vehicle"}
  },
  {
    type = "generator-equipment",
    name = "Schall-vehicle-nuclear-reactor-equipment",
    sprite =
    {
      filename = "__base__/graphics/entity/nuclear-reactor/reactor.png",
      width = 302,
      height = 318,
      scale = 0.5,
      shift = util.by_pixel(-5, -7),
      priority = "medium"
    },
    shape =
    {
      width = 4,
      height = 4,
      type = "full"
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-output"
    },
    burner =
    {
      type = "burner",
      fuel_categories = {"nuclear"},
      effectivity = 0.5,
      fuel_inventory_size = 1,
      burnt_inventory_size = 1
    },
    power = "20MW",
    categories = {"vehicle"}
  },
  -- Nightvision
  {
    type = "night-vision-equipment",
    name = "Schall-night-vision-mk1-equipment",
    sprite =
    {
      filename = "__base__/graphics/equipment/night-vision-equipment.png",
      width = 128,
      height = 128,
      priority = "medium",
      scale = 0.5
    },
    shape =
    {
      width = 2,
      height = 2,
      type = "full"
    },
    energy_source =
    {
      type = "electric",
      buffer_capacity = "180kJ", --"120kJ",
      input_flow_limit = "360kW", --"240kW",
      usage_priority = "primary-input"
    },
    energy_input = "15kW", --"10kW",
    categories = {"armor"},
    activate_sound = { filename = "__base__/sound/nightvision-on.ogg", volume = 0.5 },
    deactivate_sound = { filename = "__base__/sound/nightvision-off.ogg", volume = 0.5 },
    darkness_to_turn_on = 0.4, --0.5,
    color_lookup = {{0.5, "__SchallTankPlatoon__/graphics/color_luts/nightvision-mk1.png"}}
  },
  {
    type = "night-vision-equipment",
    name = "Schall-night-vision-mk2-equipment",
    sprite =
    {
      filename = "__base__/graphics/equipment/night-vision-equipment.png",
      width = 128,
      height = 128,
      priority = "medium",
      scale = 0.5
    },
    shape =
    {
      width = 2,
      height = 2,
      type = "full"
    },
    energy_source =
    {
      type = "electric",
      buffer_capacity = "240kJ", --"120kJ",
      input_flow_limit = "480kW", --"240kW",
      usage_priority = "primary-input"
    },
    energy_input = "20kW", --"10kW",
    categories = {"armor"},
    activate_sound = { filename = "__base__/sound/nightvision-on.ogg", volume = 0.5 },
    deactivate_sound = { filename = "__base__/sound/nightvision-off.ogg", volume = 0.5 },
    darkness_to_turn_on = 0.3, --0.5,
    color_lookup = {{0.5, "__SchallTankPlatoon__/graphics/color_luts/nightvision-mk2.png"}}
  },
}


if cfg1.class_on["fusion-reactor"] then
  data:extend
  {
    -- Fusion Reactor
    {
      type = "generator-equipment",
      name = "Schall-fusion-reactor-2-equipment",
      sprite =
      {
        filename = "__space-age__/graphics/equipment/fusion-reactor-equipment.png",
        width = 256,
        height = 256,
        priority = "medium",
        scale = 0.5
      },
      shape =
      {
        width = 2,
        height = 2,
        type = "full"
      },
      energy_source =
      {
        type = "electric",
        usage_priority = "primary-output"
      },
      power = "500kW",
      categories = {"armor"}
    },
    {
      type = "generator-equipment",
      name = "Schall-fusion-reactor-3-equipment",
      sprite =
      {
        filename = "__space-age__/graphics/equipment/fusion-reactor-equipment.png",
        width = 256,
        height = 256,
        priority = "medium",
        scale = 0.5
      },
      shape =
      {
        width = 3,
        height = 3,
        type = "full"
      },
      energy_source =
      {
        type = "electric",
        usage_priority = "primary-output"
      },
      power = "1250kW",
      categories = {"armor"}
    },
  }
end

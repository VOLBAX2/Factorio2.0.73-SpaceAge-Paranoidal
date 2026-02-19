local cfg1 = require("config.config-1")



data:extend
{
  -- Autocannon Shell
  {
    type = "recipe",
    name = "Schall-explosive-autocannon-shell",
    enabled = false,
    energy_required = 8,
    ingredients =
    {
      {type = "item", name = "steel-plate", amount = 2},
      {type = "item", name = "plastic-bar", amount = 2},
      {type = "item", name = "explosives", amount = 2}
    },
    results = { {type = "item", name = "Schall-explosive-autocannon-shell", amount = 1} }
  },
  {
    type = "recipe",
    name = "Schall-explosive-uranium-autocannon-shell",
    enabled = false,
    energy_required = 12,
    ingredients =
    {
      {type = "item", name = "Schall-explosive-autocannon-shell", amount = 1},
      {type = "item", name = "uranium-238", amount = 1}
    },
    results = { {type = "item", name = "Schall-explosive-uranium-autocannon-shell", amount = 1} }
  },
  -- High Caliber Cannon Shell
  {
    type = "recipe",
    name = "Schall-cannon-H1-shell",
    enabled = false,
    energy_required = 20, --8,
    ingredients =
    {
      {type = "item", name = "steel-plate", amount = 4},
      {type = "item", name = "plastic-bar", amount = 4},
      {type = "item", name = "explosives", amount = 2}
    },
    results = { {type = "item", name = "Schall-cannon-H1-shell", amount = 1} }
  },
  {
    type = "recipe",
    name = "Schall-cannon-H2-shell",
    enabled = false,
    energy_required = 80, --8,
    ingredients =
    {
      {type = "item", name = "steel-plate", amount = 12},
      {type = "item", name = "plastic-bar", amount = 12},
      {type = "item", name = "explosives", amount = 6}
    },
    results = { {type = "item", name = "Schall-cannon-H2-shell", amount = 1} }
  },
  {
    type = "recipe",
    name = "Schall-explosive-cannon-H1-shell",
    enabled = false,
    energy_required = 20, --8,
    ingredients =
    {
      {type = "item", name = "steel-plate", amount = 4},
      {type = "item", name = "plastic-bar", amount = 4},
      {type = "item", name = "explosives", amount = 4}
    },
    results = { {type = "item", name = "Schall-explosive-cannon-H1-shell", amount = 1} }
  },
  {
    type = "recipe",
    name = "Schall-explosive-cannon-H2-shell",
    enabled = false,
    energy_required = 80, --8,
    ingredients =
    {
      {type = "item", name = "steel-plate", amount = 12},
      {type = "item", name = "plastic-bar", amount = 12},
      {type = "item", name = "explosives", amount = 12}
    },
    results = { {type = "item", name = "Schall-explosive-cannon-H2-shell", amount = 1} }
  },
  {
    type = "recipe",
    name = "Schall-uranium-cannon-H1-shell",
    enabled = false,
    energy_required = 30, --12,
    ingredients =
    {
      {type = "item", name = "Schall-cannon-H1-shell", amount = 1},
      {type = "item", name = "uranium-238", amount = 2}
    },
    results = { {type = "item", name = "Schall-uranium-cannon-H1-shell", amount = 1} }
  },
  {
    type = "recipe",
    name = "Schall-uranium-cannon-H2-shell",
    enabled = false,
    energy_required = 120, --12,
    ingredients =
    {
      {type = "item", name = "Schall-cannon-H2-shell", amount = 1},
      {type = "item", name = "uranium-238", amount = 6}
    },
    results = { {type = "item", name = "Schall-uranium-cannon-H2-shell", amount = 1} }
  },
  {
    type = "recipe",
    name = "Schall-explosive-uranium-cannon-H1-shell",
    enabled = false,
    energy_required = 30, --12,
    ingredients =
    {
      {type = "item", name = "Schall-explosive-cannon-H1-shell", amount = 1},
      {type = "item", name = "uranium-238", amount = 2}
    },
    results = { {type = "item", name = "Schall-explosive-uranium-cannon-H1-shell", amount = 1} }
  },
  {
    type = "recipe",
    name = "Schall-explosive-uranium-cannon-H2-shell",
    enabled = false,
    energy_required = 120, --12,
    ingredients =
    {
      {type = "item", name = "Schall-explosive-cannon-H2-shell", amount = 1},
      {type = "item", name = "uranium-238", amount = 6}
    },
    results = { {type = "item", name = "Schall-explosive-uranium-cannon-H2-shell", amount = 1} }
  },
  -- Incendiary Autocannon Shell
  {
    type = "recipe",
    name = "Schall-incendiary-autocannon-shell",
    category = "chemistry",
    enabled = false,
    energy_required = 8,
    ingredients =
    {
      {type = "item", name = "steel-plate", amount = 2},
      {type = "fluid", name = "light-oil", amount = 100},
      {type = "fluid", name = "heavy-oil", amount = 100}
    },
    results = { {type = "item", name = "Schall-incendiary-autocannon-shell", amount = 1} }
  },
  -- Rocket Pack
  {
    type = "recipe",
    name = "Schall-explosive-rocket-pack",
    enabled = false,
    energy_required = 8,
    ingredients =
    {
      {type = "item", name = "explosive-rocket", amount = 5},
    },
    results = { {type = "item", name = "Schall-explosive-rocket-pack", amount = 1} }
  },
  -- Incendiary Rocket
  {
    type = "recipe",
    name = "Schall-incendiary-rocket",
    category = "chemistry",
    enabled = false,
    energy_required = 40,--8,
    ingredients =
    {
      {type = "item", name = "rocket", amount = 5},
      {type = "item", name = "steel-plate", amount = 2},
      {type = "fluid", name = "light-oil", amount = 100},
      {type = "fluid", name = "heavy-oil", amount = 100}
    },
    results = { {type = "item", name = "Schall-incendiary-rocket", amount = 5} }
  },
  -- Napalm Bomb
  {
    type = "recipe",
    name = "Schall-napalm-bomb",
    category = "chemistry",
    enabled = false,
    energy_required = 40,
    ingredients =
    {
      {type = "item", name = "advanced-circuit", amount = 20},
      {type = "item", name = "steel-plate", amount = 10},
      {type = "item", name = "explosives", amount = 10},
      {type = "fluid", name = "light-oil", amount = 500},
      {type = "fluid", name = "heavy-oil", amount = 500}
    },
    results = { {type = "item", name = "Schall-napalm-bomb", amount = 1} }
  },
  -- Poison Bomb
  {
    type = "recipe",
    name = "Schall-poison-bomb",
    enabled = false,
    energy_required = 40,
    ingredients =
    {
      {type = "item", name = "rocket", amount = 2},
      {type = "item", name = "steel-plate", amount = 18}, --3
      {type = "item", name = "electronic-circuit", amount = 6}, --3
      {type = "item", name = "coal", amount = 60} --10
    },
    results = { {type = "item", name = "Schall-poison-bomb", amount = 1} }
  },
  -- Fusion Reactor
  {
    type = "recipe",
    name = "Schall-fission-reactor-2-equipment",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {type = "item", name = "processing-unit", amount = 60},
      {type = "item", name = "low-density-structure", amount = 15},
      {type = "item", name = "uranium-fuel-cell", amount = 2}
    },
    results = { {type = "item", name = "Schall-fission-reactor-2-equipment", amount = 1} }
  },
  {
    type = "recipe",
    name = "Schall-fission-reactor-3-equipment",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {type = "item", name = "processing-unit", amount = 120},
      {type = "item", name = "low-density-structure", amount = 30},
      {type = "item", name = "uranium-fuel-cell", amount = 3}
    },
    results = { {type = "item", name = "Schall-fission-reactor-3-equipment", amount = 1} }
  },
  -- Vehicle Energy Shield
  {
    type = "recipe",
    name = "Schall-vehicle-energy-shield-equipment",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {type = "item", name = "energy-shield-equipment", amount = 5},
      {type = "item", name = "electric-engine-unit", amount = 10}
    },
    results = { {type = "item", name = "Schall-vehicle-energy-shield-equipment", amount = 1} }
  },
  {
    type = "recipe",
    name = "Schall-vehicle-energy-shield-mk2-equipment",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {type = "item", name = "Schall-vehicle-energy-shield-equipment", amount = 10},
      {type = "item", name = "processing-unit", amount = 10}
    },
    results = { {type = "item", name = "Schall-vehicle-energy-shield-mk2-equipment", amount = 1} }
  },
  -- Vehicle Battery
  {
    type = "recipe",
    name = "Schall-vehicle-battery-equipment",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {type = "item", name = "battery-equipment", amount = 5},
      {type = "item", name = "electric-engine-unit", amount = 10}
    },
    results = { {type = "item", name = "Schall-vehicle-battery-equipment", amount = 1} }
  },
  {
    type = "recipe",
    name = "Schall-vehicle-battery-mk2-equipment",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {type = "item", name = "Schall-vehicle-battery-equipment", amount = 10},
      {type = "item", name = "processing-unit", amount = 20}
    },
    results = { {type = "item", name = "Schall-vehicle-battery-mk2-equipment", amount = 1} }
  },
  -- Vehicle Fuel Cell
  {
    type = "recipe",
    name = "Schall-vehicle-fuel-cell-2-equipment",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {type = "item", name = "steam-engine", amount = 1},
      {type = "item", name = "electric-engine-unit", amount = 10}
    },
    results = { {type = "item", name = "Schall-vehicle-fuel-cell-2-equipment", amount = 1} }
  },
  {
    type = "recipe",
    name = "Schall-vehicle-fuel-cell-3-equipment",
    enabled = false,
    energy_required = 20,
    ingredients =
    {
      {type = "item", name = "Schall-vehicle-fuel-cell-2-equipment", amount = 4}
    },
    results = { {type = "item", name = "Schall-vehicle-fuel-cell-3-equipment", amount = 1} }
  },
  {
    type = "recipe",
    name = "Schall-vehicle-fuel-cell-4-equipment",
    enabled = false,
    energy_required = 30,
    ingredients =
    {
      {type = "item", name = "Schall-vehicle-fuel-cell-3-equipment", amount = 3}
    },
    results = { {type = "item", name = "Schall-vehicle-fuel-cell-4-equipment", amount = 1} }
  },
  {
    type = "recipe",
    name = "Schall-vehicle-nuclear-reactor-equipment",
    enabled = false,
    energy_required = 60,
    ingredients =
    {
      {type = "item", name = "nuclear-reactor", amount = 1}
    },
    results = { {type = "item", name = "Schall-vehicle-nuclear-reactor-equipment", amount = 1} }
  },
  -- Guns
  {
    type = "recipe",
    name = "Schall-sniper-rifle",
    enabled = false,
    energy_required = 30, --10,
    ingredients =
    {
      {type = "item", name = "iron-gear-wheel", amount = 10},
      {type = "item", name = "copper-plate", amount = 5},
      {type = "item", name = "steel-plate", amount = 10}
    },
    results = { {type = "item", name = "Schall-sniper-rifle", amount = 1} }
  },
  -- Sniper Ammo
  {
    type = "recipe",
    name = "Schall-sniper-firearm-magazine",
    enabled = false,
    energy_required = 1,
    ingredients =
    {
      {type = "item", name = "iron-plate", amount = 4}
    },
    results = { {type = "item", name = "Schall-sniper-firearm-magazine", amount = 1} }
  },
  {
    type = "recipe",
    name = "Schall-sniper-piercing-rounds-magazine",
    enabled = false,
    energy_required = 3,
    ingredients =
    {
      {type = "item", name = "Schall-sniper-firearm-magazine", amount = 1},
      {type = "item", name = "steel-plate", amount = 1},
      {type = "item", name = "copper-plate", amount = 5}
    },
    results = { {type = "item", name = "Schall-sniper-piercing-rounds-magazine", amount = 1} }
  },
  {
    type = "recipe",
    name = "Schall-sniper-uranium-rounds-magazine",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {type = "item", name = "Schall-sniper-piercing-rounds-magazine", amount = 1},
      {type = "item", name = "uranium-238", amount = 1}
    },
    results = { {type = "item", name = "Schall-sniper-uranium-rounds-magazine", amount = 1} }
  },
  -- Nightvision
  {
    type = "recipe",
    name = "Schall-night-vision-mk1-equipment",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {type = "item", name = "night-vision-equipment", amount = 1},
      {type = "item", name = "processing-unit", amount = 5}
    },
    results = { {type = "item", name = "Schall-night-vision-mk1-equipment", amount = 1} }
  },
  {
    type = "recipe",
    name = "Schall-night-vision-mk2-equipment",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {type = "item", name = "Schall-night-vision-mk1-equipment", amount = 1},
      {type = "item", name = "speed-module-3", amount = 1}
    },
    results = { {type = "item", name = "Schall-night-vision-mk2-equipment", amount = 1} }
  },
  -- Concrete wall
  {
    type = "recipe",
    name = "Schall-concrete-wall",
    enabled = false,
    energy_required = 2,
    ingredients =
    {
      {type = "item", name = "concrete", amount = 5},
      {type = "item", name = "steel-plate", amount = 1}
    },
    results = { {type = "item", name = "Schall-concrete-wall", amount = 1} }
  },
  {
    type = "recipe",
    name = "Schall-concrete-gate",
    enabled = false,
    energy_required = 2,
    ingredients =
    {
      {type = "item", name = "Schall-concrete-wall", amount = 1},
      {type = "item", name = "steel-plate", amount = 2},
      {type = "item", name = "electronic-circuit", amount = 2}
    },
    results = { {type = "item", name = "Schall-concrete-gate", amount = 1} }
  },
  -- Repair Packs
  {
    type = "recipe",
    name = "Schall-repair-pack-mk1",
    enabled = false,
    energy_required = 1,
    ingredients =
    {
      {type = "item", name = "repair-pack", amount = 1},
      {type = "item", name = "advanced-circuit", amount = 2}
    },
    results = { {type = "item", name = "Schall-repair-pack-mk1", amount = 1} }
  },
  {
    type = "recipe",
    name = "Schall-repair-pack-mk2",
    enabled = false,
    energy_required = 2,
    ingredients =
    {
      {type = "item", name = "Schall-repair-pack-mk1", amount = 1},
      {type = "item", name = "processing-unit", amount = 2}
    },
    results = { {type = "item", name = "Schall-repair-pack-mk2", amount = 1} }
  }
}


if cfg1.class_on["fusion-reactor"] then
  data:extend
  {
    -- Fusion Reactor
    {
      type = "recipe",
      name = "Schall-fusion-reactor-2-equipment",
      enabled = false,
      energy_required = 30,
      ingredients =
      {
      {type = "item", name = "Schall-fission-reactor-2-equipment", amount = 1},
      {type = "item", name = "fusion-power-cell", amount = 3},
      {type = "item", name = "tungsten-plate", amount = 75},
      {type = "item", name = "carbon-fiber", amount = 30},
      {type = "item", name = "supercapacitor", amount = 8},
      {type = "item", name = "quantum-processor", amount = 75}
      },
      results = { {type = "item", name = "Schall-fusion-reactor-2-equipment", amount = 1} },
      crafting_machine_tint =
      {
        primary = {r = 0.298, g = 0.442, b = 0.518, a = 1.000}, -- #4c7084ff
        secondary = {r = 0.864, g = 0.706, b = 0.902, a = 1.000}, -- #dcb4e6ff
        tertiary = {r = 0.159, g = 0.136, b = 0.207, a = 1.000}, -- #282234ff
        quaternary = {r = 0.945, g = 0.370, b = 1.000, a = 1.000}, -- #f15effff
      }
    },
    {
      type = "recipe",
      name = "Schall-fusion-reactor-3-equipment",
      enabled = false,
      energy_required = 30,
      ingredients =
      {
      {type = "item", name = "Schall-fission-reactor-3-equipment", amount = 1},
      {type = "item", name = "fusion-power-cell", amount = 6},
      {type = "item", name = "tungsten-plate", amount = 150},
      {type = "item", name = "carbon-fiber", amount = 60},
      {type = "item", name = "supercapacitor", amount = 15},
      {type = "item", name = "quantum-processor", amount = 150}
      },
      results = { {type = "item", name = "Schall-fusion-reactor-3-equipment", amount = 1} },
      crafting_machine_tint =
      {
        primary = {r = 0.298, g = 0.442, b = 0.518, a = 1.000}, -- #4c7084ff
        secondary = {r = 0.864, g = 0.706, b = 0.902, a = 1.000}, -- #dcb4e6ff
        tertiary = {r = 0.159, g = 0.136, b = 0.207, a = 1.000}, -- #282234ff
        quaternary = {r = 0.945, g = 0.370, b = 1.000, a = 1.000}, -- #f15effff
      }
    },
  }
end
    crafting_machine_tint =
    {
      primary = {r = 0.298, g = 0.442, b = 0.518, a = 1.000}, -- #4c7084ff
      secondary = {r = 0.864, g = 0.706, b = 0.902, a = 1.000}, -- #dcb4e6ff
      tertiary = {r = 0.159, g = 0.136, b = 0.207, a = 1.000}, -- #282234ff
      quaternary = {r = 0.945, g = 0.370, b = 1.000, a = 1.000}, -- #f15effff
    }

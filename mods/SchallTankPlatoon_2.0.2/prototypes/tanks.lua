local cfg1 = require("config.config-1")
local TPpt = require("lib.TPpt")



local VEH_specs =
{
  ["tank-L"] = {
    name = "Schall-tank-L",
    enable = true,
    tint = {r=0.7, g=0.7, b=0.7, a=1},
    icon_base = "ori",
    scale = 0.8,  --1,
    mining_time = 0.5,
    subcat = "b[tank]-c[conventional]-1-",
    base_health = 1000, --2000,
    base_braking_power = 400, --200, --400,
    base_consumption = 320, --600,
    effectivity = 0.95, --0.9,
    energy_source = {
      effectivity = 1,
      fuel_inventory_size = 1, --2,
    },
    terrain_friction_modifier = 0.2,
    weight = 8000, --20000,
    base_inventory_size = 20,
    turret_rotation_speed = 0.4 / 60, --0.35 / 60,
    rotation_speed = 0.004, --0.0035,
    base_resistances = {
      fire      = { decrease = 10,  percent = 50 },
      physical  = { decrease = 10,  percent = 50 },
      impact    = { decrease = 40,  percent = 70 },
      explosion = { decrease = 10,  percent = 60 },
      acid      = { decrease =  0,  percent = 60 },
      laser     = { decrease =  0,  percent =  0 },
      electric  = { decrease =  0,  percent =  0 }
    },
    grid = {
      width_add = -1,
      height_add = -1,
      equipment_categories = {"armor", "vehicle", "armoured-vehicle", "tank"}
    },
    guns = {
      [0] = { "Schall-tank-autocannon", "Schall-tank-machine-gun-single" },
      [1] = { "Schall-tank-autocannon", "Schall-tank-machine-gun-single" },
      [2] = { "Schall-tank-autocannon", "Schall-tank-machine-gun-single" },
      [3] = { "Schall-tank-autocannon", "Schall-tank-machine-gun-single" },
    },
    recipe_specs = {
      [0] = {
        energy_required = 3,
        ingredients =
        {
          {type = "item", name = "engine-unit", amount = 16},
          {type = "item", name = "steel-plate", amount = 25},
          {type = "item", name = "iron-gear-wheel", amount = 8},
          {type = "item", name = "advanced-circuit", amount = 5}
        }
      },
      [1] = {
        energy_required = 6,
        ingredients =
        {
          {type = "item", name = "__VEH__0__", amount = 1},  -- Special string to call for name generation
          {type = "item", name = "processing-unit", amount = 30},
          {type = "item", name = "electric-engine-unit", amount = 10},
        }
      },
      [2] = {
        energy_required = 10,
        ingredients =
        {
          {type = "item", name = "__VEH__1__", amount = 1},
          {type = "item", name = "efficiency-module-2", amount = 16},
          {type = "item", name = "speed-module-2", amount = 16},
        }
      },
      [3] = {
        energy_required = 15,
        ingredients =
        {
          {type = "item", name = "__VEH__2__", amount = 1},
          {type = "item", name = "alien-artifact", amount = 300},
          {type = "item", name = "low-density-structure", amount = 30},
          {type = "item", name = "space-science-pack", amount = 30},
          {type = "item", name = "Schall-vehicle-nuclear-reactor-equipment", amount = 1}
        }
      },
    },
  },
  ["tank-M"] = {
    name = "Schall-tank-M",
    enable = true,
    tint = {r=0.6, g=0.6, b=0.6, a=1},
    icon_base = "ori",
    scale = 1,
    mining_time = 0.5,
    subcat = "b[tank]-c[conventional]-2-",
    base_health = 2000,
    base_braking_power = 800, --400,
    base_consumption = 600,
    effectivity = 0.9,
    energy_source = {
      effectivity = 1,
      fuel_inventory_size = 2,
    },
    terrain_friction_modifier = 0.2,
    weight = 20000,
    base_inventory_size = 20,
    turret_rotation_speed = 0.35 / 60,
    rotation_speed = 0.0035,
    base_resistances = {
      fire      = { decrease = 15,  percent = 60 },
      physical  = { decrease = 15,  percent = 60 },
      impact    = { decrease = 50,  percent = 80 },
      explosion = { decrease = 15,  percent = 70 },
      acid      = { decrease =  0,  percent = 70 },
      laser     = { decrease =  0,  percent =  0 },
      electric  = { decrease =  0,  percent =  0 }
    },
    grid = {
      width_add = 0,
      height_add = 0,
      equipment_categories = {"armor", "vehicle", "armoured-vehicle", "tank", "tank-M"}
    },
    guns = {
      [0] = { "tank-cannon", "tank-machine-gun" },
      [1] = { "tank-cannon", "tank-machine-gun" },
      [2] = { "tank-cannon", "tank-machine-gun" },
      [3] = { "tank-cannon", "tank-machine-gun" },
    },
    recipe_specs = {
      [0] = {
        energy_required = 5,
        ingredients =
        {
          {type = "item", name = "engine-unit", amount = 32},
          {type = "item", name = "steel-plate", amount = 50},
          {type = "item", name = "iron-gear-wheel", amount = 15},
          {type = "item", name = "advanced-circuit", amount = 10}
        }
      },
      [1] = {
        energy_required = 10,
        ingredients =
        {
          {type = "item", name = "__VEH__0__", amount = 1},  -- Special string to call for name generation
          {type = "item", name = "processing-unit", amount = 40},
          {type = "item", name = "electric-engine-unit", amount = 20},
        }
      },
      [2] = {
        energy_required = 15,
        ingredients =
        {
          {type = "item", name = "__VEH__1__", amount = 1},
          {type = "item", name = "efficiency-module-2", amount = 25},
          {type = "item", name = "speed-module-2", amount = 25},
        }
      },
      [3] = {
        energy_required = 20,
        ingredients =
        {
          {type = "item", name = "__VEH__2__", amount = 1},
          {type = "item", name = "alien-artifact", amount = 600},
          {type = "item", name = "low-density-structure", amount = 60},
          {type = "item", name = "space-science-pack", amount = 60},
          {type = "item", name = "Schall-vehicle-nuclear-reactor-equipment", amount = 2}
        }
      },
    },
  },
  ["tank-H"] = {
    name = "Schall-tank-H",
    enable = true,
    tint = {r=0.5, g=0.5, b=0.5, a=1},
    icon_base = "ori",
    scale = 1.5, --1,
    mining_time = 1,  --0.5,
    subcat = "b[tank]-c[conventional]-3-",
    base_health = 3000, --2000,
    base_braking_power = 1320,  --660, --400,
    base_consumption = 1000, --600,
    effectivity = 0.75,  --0.9,
    energy_source = {
      effectivity = 0.875,  --1,
      fuel_inventory_size = 2,
    },
    terrain_friction_modifier = 0.22,  --0.2,
    weight = 50000,  --20000,
    base_inventory_size = 20,
    turret_rotation_speed = 0.1 / 60,  --0.35 / 60,
    rotation_speed = 0.002,  --0.0035,
    base_resistances = {
      fire      = { decrease = 15,  percent = 60 },
      physical  = { decrease = 18,  percent = 65 },
      impact    = { decrease = 55,  percent = 80 },
      explosion = { decrease = 18,  percent = 75 },
      acid      = { decrease =  3,  percent = 70 },
      laser     = { decrease =  0,  percent =  0 },
      electric  = { decrease =  0,  percent =  0 }
    },
    grid = {
      width_add = 1,
      height_add = 0,
      equipment_categories = {"armor", "vehicle", "armoured-vehicle", "tank", "tank-M", "tank-H"}
    },
    guns = {
      [0] = { "Schall-tank-cannon-H1", "tank-machine-gun" },
      [1] = { "Schall-tank-cannon-H1", "tank-machine-gun" },
      [2] = { "Schall-tank-cannon-H1", "tank-machine-gun" },
      [3] = { "Schall-tank-cannon-H1", "tank-machine-gun" },
    },
    recipe_specs = {
      [0] = {
        energy_required = 20,
        ingredients =
        {
          {type = "item", name = "engine-unit", amount = 100},
          {type = "item", name = "steel-plate", amount = 150},
          {type = "item", name = "iron-gear-wheel", amount = 50},
          {type = "item", name = "advanced-circuit", amount = 30}
        }
      },
      [1] = {
        energy_required = 40,
        ingredients =
        {
          {type = "item", name = "__VEH__0__", amount = 1},  -- Special string to call for name generation
          {type = "item", name = "processing-unit", amount = 80},
          {type = "item", name = "electric-engine-unit", amount = 60},
        }
      },
      [2] = {
        energy_required = 60,
        ingredients =
        {
          {type = "item", name = "__VEH__1__", amount = 1},
          {type = "item", name = "efficiency-module-2", amount = 32},
          {type = "item", name = "speed-module-2", amount = 32},
        }
      },
      [3] = {
        energy_required = 80,
        ingredients =
        {
          {type = "item", name = "__VEH__2__", amount = 1},
          {type = "item", name = "alien-artifact", amount = 1800},
          {type = "item", name = "low-density-structure", amount = 180},
          {type = "item", name = "space-science-pack", amount = 180},
          {type = "item", name = "Schall-vehicle-nuclear-reactor-equipment", amount = 6}
        }
      },
    },
  },
  ["tank-SH"] = {
    name = "Schall-tank-SH",
    enable = true,
    tint = {r=0.4, g=0.4, b=0.4, a=1},
    icon_base = "ori",
    scale = 2, --1,
    mining_time = 2,  --0.5,
    subcat = "b[tank]-c[conventional]-4-",
    base_health = 4000, --2000,
    base_braking_power = 1320,  --660, --400,
    base_consumption = 1000, --600,
    effectivity = 0.6,  --0.9,
    energy_source = {
      effectivity = 0.666,  --1,
      fuel_inventory_size = 2,
    },
    terrain_friction_modifier = 0.25,  --0.2,
    weight = 100000,  --20000,
    base_inventory_size = 20,
    turret_rotation_speed = 0.025 / 60,  --0.35 / 60,
    rotation_speed = 0.001,  --0.0035,
    base_resistances = {
      fire      = { decrease = 15,  percent = 60 },
      physical  = { decrease = 20,  percent = 70 },
      impact    = { decrease = 60,  percent = 80 },
      explosion = { decrease = 20,  percent = 80 },
      acid      = { decrease =  5,  percent = 70 },
      laser     = { decrease =  0,  percent =  0 },
      electric  = { decrease =  0,  percent =  0 }
    },
    grid = {
      width_add = 1,
      height_add = 1,
      equipment_categories = {"armor", "vehicle", "armoured-vehicle", "tank", "tank-M", "tank-H", "tank-SH"}
    },
    guns = {
      [0] = { "Schall-tank-cannon-H2", "Schall-tank-cannon-H2", "tank-machine-gun" },
      [1] = { "Schall-tank-cannon-H2", "Schall-tank-cannon-H2", "tank-machine-gun" },
      [2] = { "Schall-tank-cannon-H2", "Schall-tank-cannon-H2", "tank-machine-gun" },
      [3] = { "Schall-tank-cannon-H2", "Schall-tank-cannon-H2", "tank-machine-gun" },
    },
    recipe_specs = {
      [0] = {
        energy_required = 60,
        ingredients =
        {
          {type = "item", name = "engine-unit", amount = 300},
          {type = "item", name = "steel-plate", amount = 400},
          {type = "item", name = "iron-gear-wheel", amount = 120},
          {type = "item", name = "advanced-circuit", amount = 80},
          {type = "item", name = "military-science-pack", amount = 200}
        }
      },
      [1] = {
        energy_required = 120,
        ingredients =
        {
          {type = "item", name = "__VEH__0__", amount = 1},  -- Special string to call for name generation
          {type = "item", name = "processing-unit", amount = 160},
          {type = "item", name = "electric-engine-unit", amount = 120},
        }
      },
      [2] = {
        energy_required = 180,
        ingredients =
        {
          {type = "item", name = "__VEH__1__", amount = 1},
          {type = "item", name = "efficiency-module-2", amount = 40},
          {type = "item", name = "speed-module-2", amount = 40},
        }
      },
      [3] = {
        energy_required = 240,
        ingredients =
        {
          {type = "item", name = "__VEH__2__", amount = 1},
          {type = "item", name = "alien-artifact", amount = 4800},
          {type = "item", name = "low-density-structure", amount = 480},
          {type = "item", name = "space-science-pack", amount = 480},
          {type = "item", name = "Schall-vehicle-nuclear-reactor-equipment", amount = 16}
        }
      },
    },
  },
  ["tank-F"] = {
    name = "Schall-tank-F",
    enable = true,
    tint = {r=1.0, g=0.4, b=0.0, a=1},
    icon_base = "tint", --"ori",
    scale = 1,
    mining_time = 0.5,
    subcat = "b[tank]-c[conventional]-5-",
    base_health = 2000,
    base_braking_power = 800, --400,
    base_consumption = 600,
    effectivity = 0.9,
    energy_source = {
      effectivity = 1,
      fuel_inventory_size = 2,
    },
    terrain_friction_modifier = 0.2,
    weight = 20000,
    base_inventory_size = 20,
    turret_rotation_speed = 0.35 / 60,
    rotation_speed = 0.0035,
    base_resistances = {
      fire      = { decrease = 50,  percent = 100 },
      physical  = { decrease = 10,  percent = 60 },
      impact    = { decrease = 45,  percent = 80 },
      explosion = { decrease = 10,  percent = 60 },
      acid      = { decrease =  0,  percent = 70 },
      laser     = { decrease =  0,  percent =  0 },
      electric  = { decrease =  0,  percent =  0 }
    },
    grid = {
      width_add = 0,
      height_add = 0,
      equipment_categories = {"armor", "vehicle", "armoured-vehicle", "tank", "tank-F"}
    },
    guns = {
      [0] = { "tank-flamethrower", "tank-machine-gun" },
      [1] = { "tank-flamethrower", "tank-machine-gun" },
      [2] = { "tank-flamethrower", "tank-machine-gun" },
      [3] = { "tank-flamethrower", "tank-machine-gun" },
    },
    recipe_specs = {
      [0] = {
        energy_required = 5,
        ingredients =
        {
          {type = "item", name = "engine-unit", amount = 32},
          {type = "item", name = "steel-plate", amount = 50},
          {type = "item", name = "iron-gear-wheel", amount = 15},
          {type = "item", name = "advanced-circuit", amount = 10}
        }
      },
      [1] = {
        energy_required = 10,
        ingredients =
        {
          {type = "item", name = "__VEH__0__", amount = 1},  -- Special string to call for name generation
          {type = "item", name = "processing-unit", amount = 40},
          {type = "item", name = "electric-engine-unit", amount = 20},
        }
      },
      [2] = {
        energy_required = 15,
        ingredients =
        {
          {type = "item", name = "__VEH__1__", amount = 1},
          {type = "item", name = "efficiency-module-2", amount = 25},
          {type = "item", name = "speed-module-2", amount = 25},
        }
      },
      [3] = {
        energy_required = 20,
        ingredients =
        {
          {type = "item", name = "__VEH__2__", amount = 1},
          {type = "item", name = "alien-artifact", amount = 600},
          {type = "item", name = "low-density-structure", amount = 60},
          {type = "item", name = "space-science-pack", amount = 60},
          {type = "item", name = "Schall-vehicle-nuclear-reactor-equipment", amount = 2}
        }
      },
    },
  },
  ["ht-RA"] = {
    name = "Schall-ht-RA",
    enable = cfg1.class_on["ht-RA"],
    tint = {r=0.8, g=0.0, b=0.0, a=1},
    icon_base = "tint",  -- "ori",
    scale = 1,
    mining_time = 0.5,
    subcat = "b[tank]-r[rocket]-1-",
    base_health = 2000,
    base_braking_power = 800, --400,
    base_consumption = 600,
    effectivity = 0.9,
    energy_source = {
      effectivity = 1,
      fuel_inventory_size = 2,
    },
    terrain_friction_modifier = 0.2,
    weight = 40000, -- 20000,
    base_inventory_size = 20,
    turret_rotation_speed = 0.35 / 60,
    rotation_speed = 0.0035,
    base_resistances = {
      fire      = { decrease = 10,  percent = 40 },
      physical  = { decrease =  0,  percent = 50 },
      impact    = { decrease = 30,  percent = 60 },
      explosion = { decrease = 10,  percent = 50 },
      acid      = { decrease =  0,  percent = 60 },
      laser     = { decrease =  0,  percent =  0 },
      electric  = { decrease =  0,  percent =  0 }
    },
    grid = {
      width_add = 0,
      height_add = 0,
      equipment_categories = {"armor", "vehicle", "armoured-vehicle", "tank", "artillery-rocket"}
    },
    guns = {
      [0] = { "Schall-tactical-missile-launcher", "Schall-multiple-rocket-launcher", "Schall-tank-machine-gun-single" },
      [1] = { "Schall-tactical-missile-launcher", "Schall-multiple-rocket-launcher", "Schall-tank-machine-gun-single" },
      [2] = { "Schall-tactical-missile-launcher", "Schall-multiple-rocket-launcher", "Schall-tank-machine-gun-single" },
      [3] = { "Schall-tactical-missile-launcher", "Schall-multiple-rocket-launcher", "Schall-tank-machine-gun-single" },
    },
    recipe_specs = {
      [0] = {
        energy_required = 5,
        ingredients =
        {
          {type = "item", name = "engine-unit", amount = 32},
          {type = "item", name = "steel-plate", amount = 50},
          {type = "item", name = "iron-gear-wheel", amount = 15},
          {type = "item", name = "advanced-circuit", amount = 10}
        }
      },
      [1] = {
        energy_required = 10,
        ingredients =
        {
          {type = "item", name = "__VEH__0__", amount = 1},  -- Special string to call for name generation
          {type = "item", name = "processing-unit", amount = 40},
          {type = "item", name = "electric-engine-unit", amount = 20},
        }
      },
      [2] = {
        energy_required = 15,
        ingredients =
        {
          {type = "item", name = "__VEH__1__", amount = 1},
          {type = "item", name = "efficiency-module-2", amount = 25},
          {type = "item", name = "speed-module-2", amount = 25},
        }
      },
      [3] = {
        energy_required = 20,
        ingredients =
        {
          {type = "item", name = "__VEH__2__", amount = 1},
          {type = "item", name = "alien-artifact", amount = 600},
          {type = "item", name = "low-density-structure", amount = 60},
          {type = "item", name = "space-science-pack", amount = 60},
          {type = "item", name = "Schall-vehicle-nuclear-reactor-equipment", amount = 2}
        }
      },
    },
  },
}



local dataextendlist = {}


local tier_max = cfg1.tier_max

for name, spec in pairs(VEH_specs) do
  if spec.enable then
    for tier = 0, tier_max, 1 do
      if cfg1.tier_on[tier] then
        table.insert( dataextendlist, TPpt.VEH_item(spec, tier) )
        table.insert( dataextendlist, TPpt.VEH_entity(spec, tier) )
        table.insert( dataextendlist, TPpt.VEH_recipe(spec, tier) )
        table.insert( dataextendlist, TPpt.VEH_grid(spec, tier) )
      end
    end
  end
end

if next(dataextendlist) ~= nil then
  data:extend(dataextendlist)
end
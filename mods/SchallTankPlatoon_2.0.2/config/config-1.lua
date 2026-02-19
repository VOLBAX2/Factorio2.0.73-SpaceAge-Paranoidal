local config = {}

config.mod_prefix         = "Schall-TP-"
config.mod_prefix_ptrn    = "Schall%-TP%-"

config.class_on =
{
  ["ht-RA"] = settings.startup[config.mod_prefix .. "ht-RA-enable"].value or mods["SchallMissileCommand"],
  ["armor-t3"] = mods["SchallAlienTech"] and settings.startup["Schall-AT-armor-t3-enable"].value,
  ["concrete-wall"] = settings.startup[config.mod_prefix .. "concrete-walls-enable"].value,
  ["fusion-reactor"] = mods["space-age"],
}

local tank_t1_on = settings.startup[config.mod_prefix .. "tank-t1-enable"].value
local tank_t2_on = tank_t1_on and settings.startup[config.mod_prefix .. "tank-t2-enable"].value
local tank_t3_on = config.class_on["armor-t3"] and tank_t2_on and settings.startup["Schall-AT-tank-t3-enable"].value

config.tier_max = 3

config.tier_on =
{
  [0] = true,
  [1] = tank_t1_on,
  [2] = tank_t2_on,
  [3] = tank_t3_on,
}

config.tier_suffix =
{
  [0] = "",
  [1] = "-mk1",
  [2] = "-mk2",
  [3] = "-mk3",
}

-- Vehicle Grid
local function read_grid_values(setting, defw, defh)
  if setting then
    local rt = {}
    for v in string.gmatch(setting.value, "%d+") do table.insert(rt, tonumber(v)) end
    return table.unpack(rt)
    -- return string.match(setting.value, "(%d+)x(%d+)")
  else
    return defw, defh
  end
end

config.VEH_base_grid = {
  [0] = {read_grid_values(settings.startup[config.mod_prefix .. "tank-t0-grid"], 6, 5)},
  [1] = {read_grid_values(settings.startup[config.mod_prefix .. "tank-t1-grid"], 8, 8)},
  [2] = {read_grid_values(settings.startup[config.mod_prefix .. "tank-t2-grid"], 11, 11)},
  [3] = {read_grid_values(settings.startup["Schall-AT-tank-t3-grid"], 15, 13)},
}

function config.VEH_grid_width(tier, size_add)
  return math.max(config.VEH_base_grid[tier][1] + size_add, 0)
end

function config.VEH_grid_height(tier, size_add)
  return math.max(config.VEH_base_grid[tier][2] + size_add, 0)
end

config.tiered_subgroups = mods["SchallTransportGroup"] and settings.startup[config.mod_prefix .. "tiered-military-vehicles-subgroups"].value
config.bullet_proj = settings.startup[config.mod_prefix .. "bullet-projectile-enable"].value
config.hide_resistances = settings.startup[config.mod_prefix .. "vehicle-hide-resistances"].value

config.resistances_add = {
  [0] = {
    },
  [1] = {
      fire      = { decrease =  0,  percent =  5 },
      physical  = { decrease =  0,  percent =  5 },
      impact    = { decrease =  2,  percent =  0 },
      explosion = { decrease =  2,  percent =  8 },
      acid      = { decrease =  2,  percent =  0 },
      laser     = { decrease =  5,  percent = 20 },
      electric  = { decrease =  5,  percent = 20 }
    },
  [2] = {
      fire      = { decrease =  0,  percent = 10 },
      physical  = { decrease =  0,  percent = 10 },
      impact    = { decrease =  5,  percent =  0 },
      explosion = { decrease =  5,  percent = 16 },
      acid      = { decrease =  5,  percent =  0 },
      laser     = { decrease = 10,  percent = 40 },
      electric  = { decrease = 10,  percent = 40 }
    },
  [3] = {
      fire      = { decrease =  0,  percent = 15 },
      physical  = { decrease =  0,  percent = 15 },
      impact    = { decrease = 10,  percent =  0 },
      explosion = { decrease = 10,  percent = 24 },
      acid      = { decrease =  5,  percent =  5 },
      laser     = { decrease = 15,  percent = 60 },
      electric  = { decrease = 15,  percent = 60 }
    },
}

config.tier_health_mul =
{
  [0] = 1,
  [1] = 1.5,
  [2] = 2,
  [3] = 2.5,
}

config.tier_power_mul =
{
  [0] = 1,
  [1] = 1.2,
  [2] = 1.5,
  [3] = 3,
}

config.tier_weight_mul =
{
  [0] = 1,
  [1] = 1,
  [2] = 1,
  [3] = 1.5,
}

config.tier_inventory_size_add =
{
  [0] = 0,
  [1] = 10,
  [2] = 20,
  [3] = 40,
}

config.collision_box_none = {{0, 0}, {0, 0}}
config.collision_box_ori = {{-0.3, -1.1}, {0.3, 1.1}}
config.collision_box_bullet = {{-0.05, -0.25}, {0.05, 0.25}}  -- Shotgun : {{-0.05, -0.25}, {0.05, 0.25}}

config.collision_box =
{
  C       = config.collision_box_ori,
  AC      = config.collision_box_ori,
}

config.force_condition =
{
  C       = settings.startup[config.mod_prefix .. "tank-cannon-force-condition"].value,
  AC      = settings.startup[config.mod_prefix .. "tank-autocannon-force-condition"].value,
}

config.force_condition_area_effects = settings.startup[config.mod_prefix .. "force-condition-area-effects"].value
config.projectiles =
{
  AC      = {
    "Schall-explosive-autocannon-projectile",
    "Schall-explosive-uranium-autocannon-projectile",
    "Schall-incendiary-autocannon-projectile",
  },
  C       = {
    "cannon-projectile",
    "Schall-cannon-H1-projectile",
    "Schall-cannon-H2-projectile",
    "explosive-cannon-projectile",
    "Schall-explosive-cannon-H1-projectile",
    "Schall-explosive-cannon-H2-projectile",
    "uranium-cannon-projectile",
    "Schall-uranium-cannon-H1-projectile",
    "Schall-uranium-cannon-H2-projectile",
    "explosive-uranium-cannon-projectile",
    "Schall-explosive-uranium-cannon-H1-projectile",
    "Schall-explosive-uranium-cannon-H2-projectile",
  },
  ROC     = {
    "Schall-explosive-rocket-pack",
    "Schall-incendiary-rocket",
    "Schall-napalm-rocket",
    "Schall-poison-rocket",
  },
}

config.category_spider_base =
{
  "armor",
  "vehicle",
  "armoured-vehicle",
  "tank",
  "tank-M",
}

config.minimap_rep_specs =
{
  ["unchanged"] = { default = nil },
  ["generic"] = {
      default =
      {
        filename = "__SchallTankPlatoon__/graphics/entity/minimap/generic-map.png",
        flags = {"icon"},
        size = {40, 40},
        scale = 0.5
      },
    },
  ["tank"] = {
      default =
      {
        filename = "__SchallTankPlatoon__/graphics/entity/minimap/tank-map.png",
        flags = {"icon"},
        size = {32, 50},
        scale = 0.5
      },
    },
}
config.minimap_rep_set = config.minimap_rep_specs[settings.startup[config.mod_prefix .. "minimap-representation"].value]
function config.minimap_representation(scale, vehicle_type)
  local rt = table.deepcopy(config.minimap_rep_set.default)
  if vehicle_type and config.minimap_rep_set[vehicle_type] then
    rt = table.deepcopy(config.minimap_rep_set[vehicle_type])
  end
  if rt and rt.scale and scale then
    rt.scale = rt.scale * scale
  end
  return rt
end



return config
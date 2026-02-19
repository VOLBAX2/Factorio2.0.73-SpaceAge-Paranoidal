local TPlib = require("__SchallTankPlatoon__.lib.TPlib")
local cfg1 = require("config.config-1")



local item_sounds = require("__base__.prototypes.item_sounds")



local ammo_icon_layer = {
  C = {
    AP      = {icon = "__base__/graphics/icons/cannon-shell.png"},
    HE      = {icon = "__base__/graphics/icons/explosive-cannon-shell.png"},
    DUAP    = {icon = "__base__/graphics/icons/uranium-cannon-shell.png"},
    DUHE    = {icon = "__base__/graphics/icons/explosive-uranium-cannon-shell.png"},
  },
  AC = {
    HE      = {icon = "__SchallTankPlatoon__/graphics/icons/explosive-autocannon-shell.png"},
    DUHE    = {icon = "__SchallTankPlatoon__/graphics/icons/explosive-uranium-autocannon-shell.png"},
    IN      = {icon = "__SchallTankPlatoon__/graphics/icons/incendiary-autocannon-shell.png"},
  },
  ROC = {
    HEpack  = {icon = "__SchallTankPlatoon__/graphics/icons/explosive-rocket-pack.png"},
    -- basic   = {suffix = "M", tint = {r=0.5, g=0.5, b=0.5, a=1}},
    IN      = {ROCsuffix = "M", tint = {r=1, g=1, b=1, a=1}},
    NP      = {ROCsuffix = "H", tint = {r=1, g=1, b=1, a=1}},
    PO      = {ROCsuffix = "H", tint = {r=1, g=1, b=0, a=1}},
  }
}

local ammo_light_layer = {
  C = {
    draw_as_light = true,
    flags = {"light"},
    size = 64,
    filename = "__base__/graphics/icons/uranium-cannon-shell-light.png",
    scale = 0.5,
    mipmap_count = 4
  },
  AC = {
    draw_as_light = true,
    flags = {"light"},
    size = 64,
    filename = "__SchallTankPlatoon__/graphics/icons/uranium-autocannon-shell-light.png",
    scale = 0.5,
    mipmap_count = 4
  },
  ROC = {
    draw_as_light = true,
    flags = {"light"},
    size = 64,
    filename = "__base__/graphics/icons/atomic-bomb-light.png",
    scale = 0.5,
    mipmap_count = 4
  },
}

local function ammo_icons(category, model, param)
  -- param = {variant, caliber, tier, eqp, sp}
  local rt = {}
  local spec = ammo_icon_layer[category][model]
  if spec.icon then
    table.insert(rt, {icon = spec.icon, icon_size = spec.icon_size or 64, icon_mipmaps = spec.icon_mipmaps or 4})
  elseif spec.ROCsuffix then
    table.insert(rt, {icon = "__base__/graphics/icons/rocket.png", icon_size = 64, icon_mipmaps = 4})
    table.insert(rt, {icon = "__SchallTankPlatoon__/graphics/icons/rocket-to-tint-"..spec.ROCsuffix..".png", icon_size = 64, icon_mipmaps = 4, tint = spec.tint})
  end
  if param and param.caliber then
    table.insert(rt, TPlib.caliber_icon_layer[param.caliber])
  end
  return rt
end

local function ammo_pictures(category, model, param)
  local rt = {}
  local spec = ammo_icon_layer[category][model]
  if spec.icon then
    local size1 = spec.icon_size or 64
    local scale1
    if spec.scale then scale1 = spec.scale / 2 else scale1 = 32 / size1 end
    table.insert(rt, {filename = spec.icon, size = size1, mipmap_count = spec.icon_mipmaps or 4, scale = scale1})
  elseif spec.ROCsuffix then
    table.insert(rt, {filename = "__base__/graphics/icons/rocket.png", size = 64, scale = 0.5, mipmap_count = 4})
    table.insert(rt, {filename = "__SchallTankPlatoon__/graphics/icons/rocket-to-tint-"..spec.ROCsuffix..".png", size = 64, scale = 0.5, mipmap_count = 4, tint = spec.tint})
  end
  if param and param.caliber then
    local icon_layer = TPlib.caliber_icon_layer[param.caliber]
    local size2 = icon_layer.icon_size or 64
    local scale2
    if spec.scale then scale2 = icon_layer.scale / 2 else scale2 = 32 / size2 end
    table.insert(rt, {filename = icon_layer.icon, size = size2, mipmap_count = icon_layer.icon_mipmaps or 4, scale = scale2})
  end
  table.insert(rt, ammo_light_layer[category])
  return { layers = rt }
end



data:extend
{
  -- Autocannon Shell
  {
    type = "ammo",
    name = "Schall-explosive-autocannon-shell",
    icons = ammo_icons("AC", "HE"),
    ammo_category = "Schall-autocannon-shell", --"cannon-shell",
    ammo_type =
    {
      target_type = "direction",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "Schall-explosive-autocannon-projectile", --"explosive-cannon-projectile",
          starting_speed = 1,
          direction_deviation = 0.1,
          range_deviation = 0.1,
          max_range = 20, --30,
          min_range = 5,
          source_effects =
          {
            type = "create-explosion",
            entity_name = "explosion-gunshot-small" --"explosion-gunshot"
          }
        }
      }
    },
    subgroup = "ammo",
    order = "d[f-explosive-autocannon-shell]-a[basic]", --"d[cannon-shell]-c[explosive]",
    inventory_move_sound = item_sounds.ammo_large_inventory_move,
    pick_sound = item_sounds.ammo_large_inventory_pickup,
    drop_sound = item_sounds.ammo_large_inventory_move,
    magazine_size = 10, --1,
    stack_size = 100,
    weight = 20 * kg
  },
  {
    type = "ammo",
    name = "Schall-explosive-uranium-autocannon-shell",
    icons = ammo_icons("AC", "DUHE"),
    pictures = ammo_pictures("AC", "DUHE"),
    ammo_category = "Schall-autocannon-shell", --"cannon-shell",
    ammo_type =
    {
      target_type = "direction",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "Schall-explosive-uranium-autocannon-projectile", --"explosive-uranium-cannon-projectile",
          starting_speed = 1,
          direction_deviation = 0.1,
          range_deviation = 0.1,
          max_range = 20, --30,
          min_range = 5,
          source_effects =
          {
            type = "create-explosion",
            entity_name = "explosion-gunshot-small" --"explosion-gunshot"
          }
        }
      }
    },
    subgroup = "ammo",
    order = "d[f-explosive-autocannon-shell]-c[uranium]", --"d[explosive-cannon-shell]-c[uranium]",
    inventory_move_sound = item_sounds.ammo_large_inventory_move,
    pick_sound = item_sounds.ammo_large_inventory_pickup,
    drop_sound = item_sounds.ammo_large_inventory_move,
    magazine_size = 10, --1,
    stack_size = 100,
    weight = 40 * kg
  },
  -- Rocket
  {
    type = "ammo",
    name = "Schall-explosive-rocket-pack",
    icons = ammo_icons("ROC", "HEpack"),
    ammo_category = "rocket",
    ammo_type =
    {
      {
        source_type = "default",

        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "projectile",
            projectile = "explosive-rocket",
            starting_speed = 0.1,
            min_range = 10, --0,
            source_effects =
            {
              type = "create-entity",
              entity_name = "explosion-hit"
            }
          }
        }
      },
      {
        source_type = "vehicle",
        target_type = "position",
        clamp_position = true,

        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "projectile",
            projectile = "Schall-explosive-rocket-pack", --"explosive-rocket"
            starting_speed = 0.1,
            source_effects =
            {
              type = "create-entity",
              entity_name = "explosion-hit"
            }
          }
        }
      }
    },
    subgroup = "ammo",
    order = "d[rocket-launcher]-b[explosive]-1[pack]",
    inventory_move_sound = item_sounds.ammo_large_inventory_move,
    pick_sound = item_sounds.ammo_large_inventory_pickup,
    drop_sound = item_sounds.ammo_large_inventory_move,
    stack_size = 50
  },
  -- High-Caliber Cannon Shell
  {
    type = "ammo",
    name = "Schall-cannon-H1-shell",
    icons = ammo_icons("C", "AP", {caliber = 1}),
    ammo_category = "Schall-cannon-H1-shell",
    ammo_type =
    {
      target_type = "direction",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "Schall-cannon-H1-projectile",-- "cannon-projectile",
          starting_speed = 1,
          direction_deviation = 0.1,
          range_deviation = 0.1,
          max_range = 30, --30,
          min_range = 5,
          source_effects =
          {
            type = "create-explosion",
            entity_name = "explosion-gunshot"
          }
        }
      }
    },
    subgroup = "ammo",
    order = "d[cannon-shell]-a[basic]-1",
    inventory_move_sound = item_sounds.ammo_large_inventory_move,
    pick_sound = item_sounds.ammo_large_inventory_pickup,
    drop_sound = item_sounds.ammo_large_inventory_move,
    stack_size = 50,
    weight = 40 * kg
  },
  {
    type = "ammo",
    name = "Schall-cannon-H2-shell",
    icons = ammo_icons("C", "AP", {caliber = 2}),
    ammo_category = "Schall-cannon-H2-shell",
    ammo_type =
    {
      target_type = "direction",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "Schall-cannon-H2-projectile",-- "cannon-projectile",
          starting_speed = 1,
          direction_deviation = 0.1,
          range_deviation = 0.1,
          max_range = 35, --30,
          min_range = 5,
          source_effects =
          {
            type = "create-explosion",
            entity_name = "explosion-gunshot"
          }
        }
      }
    },
    subgroup = "ammo",
    order = "d[cannon-shell]-a[basic]-2",
    inventory_move_sound = item_sounds.ammo_large_inventory_move,
    pick_sound = item_sounds.ammo_large_inventory_pickup,
    drop_sound = item_sounds.ammo_large_inventory_move,
    stack_size = 25,
    weight = 80 * kg
  },
  {
    type = "ammo",
    name = "Schall-explosive-cannon-H1-shell",
    icons = ammo_icons("C", "HE", {caliber = 1}),
    ammo_category = "Schall-cannon-H1-shell", --"cannon-shell",
    ammo_type =
    {
      target_type = "direction",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "Schall-explosive-cannon-H1-projectile", --"explosive-cannon-projectile",
          starting_speed = 1,
          direction_deviation = 0.1,
          range_deviation = 0.1,
          max_range = 30, --30,
          min_range = 5,
          source_effects =
          {
            type = "create-explosion",
            entity_name = "explosion-gunshot"
          }
        }
      }
    },
    subgroup = "ammo",
    order = "d[cannon-shell]-c[explosive]-1", --"d[cannon-shell]-c[explosive]",
    inventory_move_sound = item_sounds.ammo_large_inventory_move,
    pick_sound = item_sounds.ammo_large_inventory_pickup,
    drop_sound = item_sounds.ammo_large_inventory_move,
    stack_size = 50,
    weight = 40 * kg
  },
  {
    type = "ammo",
    name = "Schall-explosive-cannon-H2-shell",
    icons = ammo_icons("C", "HE", {caliber = 2}),
    ammo_category = "Schall-cannon-H2-shell", --"cannon-shell",
    ammo_type =
    {
      target_type = "direction",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "Schall-explosive-cannon-H2-projectile", --"explosive-cannon-projectile",
          starting_speed = 1,
          direction_deviation = 0.1,
          range_deviation = 0.1,
          max_range = 35, --30,
          min_range = 5,
          source_effects =
          {
            type = "create-explosion",
            entity_name = "explosion-gunshot"
          }
        }
      }
    },
    subgroup = "ammo",
    order = "d[cannon-shell]-c[explosive]-2", --"d[cannon-shell]-c[explosive]",
    inventory_move_sound = item_sounds.ammo_large_inventory_move,
    pick_sound = item_sounds.ammo_large_inventory_pickup,
    drop_sound = item_sounds.ammo_large_inventory_move,
    stack_size = 25,
    weight = 80 * kg
  },
  {
    type = "ammo",
    name = "Schall-uranium-cannon-H1-shell",
    icons = ammo_icons("C", "DUAP", {caliber = 1}),
    pictures = ammo_pictures("C", "DUAP", {caliber = 1}),
    ammo_category = "Schall-cannon-H1-shell", --"cannon-shell",
    ammo_type =
    {
      target_type = "direction",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "Schall-uranium-cannon-H1-projectile",-- "uranium-cannon-projectile",
          starting_speed = 1,
          direction_deviation = 0.1,
          range_deviation = 0.1,
          max_range = 30, --30,
          min_range = 5,
          source_effects =
          {
            type = "create-explosion",
            entity_name = "explosion-gunshot"
          }
        }
      }
    },
    subgroup = "ammo",
    order = "d[cannon-shell]-c[uranium]-1",-- "d[cannon-shell]-c[uranium]",
    inventory_move_sound = item_sounds.ammo_large_inventory_move,
    pick_sound = item_sounds.ammo_large_inventory_pickup,
    drop_sound = item_sounds.ammo_large_inventory_move,
    stack_size = 50,
    weight = 80 * kg
  },
  {
    type = "ammo",
    name = "Schall-uranium-cannon-H2-shell",
    icons = ammo_icons("C", "DUAP", {caliber = 2}),
    pictures = ammo_pictures("C", "DUAP", {caliber = 2}),
    ammo_category = "Schall-cannon-H2-shell", --"cannon-shell",
    ammo_type =
    {
      target_type = "direction",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "Schall-uranium-cannon-H2-projectile",-- "uranium-cannon-projectile",
          starting_speed = 1,
          direction_deviation = 0.1,
          range_deviation = 0.1,
          max_range = 35, --30,
          min_range = 5,
          source_effects =
          {
            type = "create-explosion",
            entity_name = "explosion-gunshot"
          }
        }
      }
    },
    subgroup = "ammo",
    order = "d[cannon-shell]-c[uranium]-2",-- "d[cannon-shell]-c[uranium]",
    inventory_move_sound = item_sounds.ammo_large_inventory_move,
    pick_sound = item_sounds.ammo_large_inventory_pickup,
    drop_sound = item_sounds.ammo_large_inventory_move,
    stack_size = 25,
    weight = 160 * kg
  },
  {
    type = "ammo",
    name = "Schall-explosive-uranium-cannon-H1-shell",
    icons = ammo_icons("C", "DUHE", {caliber = 1}),
    pictures = ammo_pictures("C", "DUHE", {caliber = 1}),
    ammo_category = "Schall-cannon-H1-shell", --"cannon-shell",
    ammo_type =
    {
      target_type = "direction",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "Schall-explosive-uranium-cannon-H1-projectile",-- "explosive-uranium-cannon-projectile",
          starting_speed = 1,
          direction_deviation = 0.1,
          range_deviation = 0.1,
          max_range = 30, --30,
          min_range = 5,
          source_effects =
          {
            type = "create-explosion",
            entity_name = "explosion-gunshot"
          }
        }
      }
    },
    subgroup = "ammo",
    order = "d[explosive-cannon-shell]-c[uranium]-1",-- "d[explosive-cannon-shell]-c[uranium]",
    inventory_move_sound = item_sounds.ammo_large_inventory_move,
    pick_sound = item_sounds.ammo_large_inventory_pickup,
    drop_sound = item_sounds.ammo_large_inventory_move,
    stack_size = 50,
    weight = 80 * kg
  },
  {
    type = "ammo",
    name = "Schall-explosive-uranium-cannon-H2-shell",
    icons = ammo_icons("C", "DUHE", {caliber = 2}),
    pictures = ammo_pictures("C", "DUHE", {caliber = 2}),
    ammo_category = "Schall-cannon-H2-shell", --"cannon-shell",
    ammo_type =
    {
      target_type = "direction",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "Schall-explosive-uranium-cannon-H2-projectile",-- "explosive-uranium-cannon-projectile",
          starting_speed = 1,
          direction_deviation = 0.1,
          range_deviation = 0.1,
          max_range = 35, --30,
          min_range = 5,
          source_effects =
          {
            type = "create-explosion",
            entity_name = "explosion-gunshot"
          }
        }
      }
    },
    subgroup = "ammo",
    order = "d[explosive-cannon-shell]-c[uranium]-2",-- "d[explosive-cannon-shell]-c[uranium]",
    inventory_move_sound = item_sounds.ammo_large_inventory_move,
    pick_sound = item_sounds.ammo_large_inventory_pickup,
    drop_sound = item_sounds.ammo_large_inventory_move,
    stack_size = 25,
    weight = 160 * kg
  },
  -- Incendiary Autocannon Shell
  {
    type = "ammo",
    name = "Schall-incendiary-autocannon-shell",
    icons = ammo_icons("AC", "IN"),
    ammo_category = "Schall-autocannon-shell", --"cannon-shell",
    ammo_type =
    {
      target_type = "direction",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "Schall-incendiary-autocannon-projectile", --"explosive-uranium-cannon-projectile",
          starting_speed = 1,
          direction_deviation = 0.1,
          range_deviation = 0.1,
          max_range = 20, --30,
          min_range = 5, --0,
          source_effects =
          {
            type = "create-explosion",
            entity_name = "explosion-gunshot-small" --"explosion-gunshot"
          }
        }
      }
    },
    subgroup = "ammo",
    order = "d[f-incendiary-autocannon-shell]", --"d[explosive-cannon-shell]-c[uranium]",
    inventory_move_sound = item_sounds.ammo_large_inventory_move,
    pick_sound = item_sounds.ammo_large_inventory_pickup,
    drop_sound = item_sounds.ammo_large_inventory_move,
    magazine_size = 10, --1,
    stack_size = 100,
    weight = 20 * kg
  },
  -- Incendiary Rocket
  {
    type = "ammo",
    name = "Schall-incendiary-rocket",
    icons = ammo_icons("ROC", "IN"),
    ammo_category = "rocket",
    ammo_type =
    {
      -- target_type = "position",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "Schall-incendiary-rocket",
          starting_speed = 0.05,
          source_effects =
          {
            type = "create-entity",
            entity_name = "explosion-hit"
          }
        }
      }
    },
    subgroup = "ammo",
    order = "d[rocket-launcher]-d[incendiary-rocket]",
    inventory_move_sound = item_sounds.ammo_large_inventory_move,
    pick_sound = item_sounds.ammo_large_inventory_pickup,
    drop_sound = item_sounds.ammo_large_inventory_move,
    stack_size = 100,
    weight = 40 * kg
  },
  -- Napalm Bomb
  {
    type = "ammo",
    name = "Schall-napalm-bomb",
    icons = ammo_icons("ROC", "NP"),
    ammo_category = "rocket",
    ammo_type =
    {
      range_modifier = 3,
      cooldown_modifier = 3,
      target_type = "position",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "Schall-napalm-rocket",--"atomic-rocket",
          starting_speed = 0.05,
          source_effects =
          {
            type = "create-entity",
            entity_name = "explosion-hit"
          }
        }
      }
    },
    subgroup = "ammo",
    order = "d[rocket-launcher]-i[napalm-bomb]",
    inventory_move_sound = item_sounds.ammo_large_inventory_move,
    pick_sound = item_sounds.ammo_large_inventory_pickup,
    drop_sound = item_sounds.ammo_large_inventory_move,
    stack_size = 20,
    weight = 200 * kg
  },
  -- Poison Bomb
  {
    type = "ammo",
    name = "Schall-poison-bomb",
    icons = ammo_icons("ROC", "PO"),
    ammo_category = "rocket",
    ammo_type =
    {
      range_modifier = 3,
      cooldown_modifier = 3,
      target_type = "position",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "Schall-poison-rocket",
          starting_speed = 0.05,
          source_effects =
          {
            type = "create-entity",
            entity_name = "explosion-hit"
          }
        }
      }
    },
    subgroup = "ammo",
    order = "d[rocket-launcher]-k[poison-bomb]",
    inventory_move_sound = item_sounds.ammo_large_inventory_move,
    pick_sound = item_sounds.ammo_large_inventory_pickup,
    drop_sound = item_sounds.ammo_large_inventory_move,
    stack_size = 20,
    weight = 200 * kg
  },
}

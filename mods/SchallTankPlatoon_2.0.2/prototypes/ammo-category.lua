local TPlib = require("lib.TPlib")



data:extend
{
  {
    type = "ammo-category",
    name = "Schall-sniper-bullet",
    icons = {
      {icon = "__base__/graphics/icons/ammo-category/bullet.png"},
      TPlib.sp_icon_layer["sniper"],
    },
    subgroup = "ammo-category",
    order = "b[basic]-a[bullet]-1[sniper]"
  },
  {
    type = "ammo-category",
    name = "Schall-autocannon-shell",
    icon = "__SchallTankPlatoon__/graphics/icons/ammo-category/autocannon-shell.png",
    -- icons = {
    --   {icon = "__SchallTankPlatoon__/graphics/icons/ammo-category/autocannon-shell.png"},
    -- },
    subgroup = "ammo-category",
    order = "b[basic]-b[autocannon]"
  },
  {
    type = "ammo-category",
    name = "Schall-cannon-H1-shell",
    icons = {
      {icon = "__base__/graphics/icons/ammo-category/cannon-shell.png"},
      TPlib.caliber_icon_layer[1],
    },
    subgroup = "ammo-category",
    order = "b[basic]-c[cannon]-1"
  },
  {
    type = "ammo-category",
    name = "Schall-cannon-H2-shell",
    icons = {
      {icon = "__base__/graphics/icons/ammo-category/cannon-shell.png"},
      TPlib.caliber_icon_layer[2],
    },
    subgroup = "ammo-category",
    order = "b[basic]-c[cannon]-2"
  },
}


local drac = data.raw["ammo-category"]
if drac["bullet"] then
  drac["bullet"].order = "b[basic]-a[bullet]"
end
if drac["cannon"] then
  drac["cannon"].order = "b[basic]-c[cannon]"
end

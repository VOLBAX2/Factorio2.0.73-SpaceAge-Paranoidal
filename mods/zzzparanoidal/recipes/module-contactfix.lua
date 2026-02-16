data:extend({ 

{
    type = "recipe",
    name = "module-contact",
    normal =
    {
      energy_required = 5,
      enabled = false,
      ingredients =
      {
        {"silver-plate", 1},
        {"gold-plate", 1},
      },
      results ={{type="item", name= "module-contact", amount=2}},
    },
    expensive =
    {
      energy_required = 6,
      enabled = false,
      ingredients =
      {
        {"silver-plate", 1},
        {"gold-plate", 1},
      },
      results ={{type="item", name= "module-contact", amount=2}},
    },
  },
})

--[[
OV.patch_recipes(      {        {
          name = "module-contact",
          ingredients = {            {"!!"},
            {name = "copper-plate", amount = 1},
            {name = "silver-plate", amount = 1},          }        },
]]--

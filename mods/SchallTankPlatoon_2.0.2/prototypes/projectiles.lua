local TPlib = require("__SchallTankPlatoon__.lib.TPlib")
local cfg1 = require("config.config-1")



local nff = table.deepcopy(data.raw.fire["fire-flame"])
nff.name = "Schall-napalm-fire-flame" --"fire-flame"
nff.localised_name = {"entity-name.fire-flame"}
nff.initial_lifetime = 180  --120
nff.lifetime_increase_by = 225  --150
nff.maximum_lifetime = 3600 --1800



data:extend
{
  nff,
  -- Autocannon
  {
    type = "projectile",
    name = "Schall-explosive-autocannon-projectile",
    flags = {"not-on-map"},
    hidden = true,
    collision_box = cfg1.collision_box.AC,
    force_condition = cfg1.force_condition.AC,
    acceleration = 0,
    piercing_damage = 10, --100,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "damage",
            damage = {amount = 18, type = "physical"}
            -- damage = {amount = 180, type = "physical"}
          },
          {
            type = "create-entity",
            entity_name = "Schall-autocannon-explosion" --"small-explosion" --"explosion"
          }
        }
      }
    },
    final_action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "explosion" --"big-explosion"
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              radius = 4,
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  {
                    type = "damage",
                    damage = {amount = 30, type = "explosion"}
                    -- damage = {amount = 300, type = "explosion"}
                  },
                  {
                    type = "create-entity",
                    entity_name = "Schall-autocannon-explosion" --"small-explosion" --"explosion"
                  }
                }
              }
            }
          }
        }
      }
    },
    animation =
    {
      filename = "__base__/graphics/entity/bullet/bullet.png",
      frame_count = 1,
      width = 3,
      height = 50,
      priority = "high"
    }
  },
  {
    type = "projectile",
    name = "Schall-explosive-uranium-autocannon-projectile",
    flags = {"not-on-map"},
    hidden = true,
    collision_box = cfg1.collision_box.AC,
    force_condition = cfg1.force_condition.AC,
    acceleration = 0,
    piercing_damage = 15, --150,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "damage",
            damage = {amount = 35 , type = "physical"}
            -- damage = {amount = 350 , type = "physical"}
          },
          {
            type = "create-entity",
            entity_name = "Schall-uranium-autocannon-explosion" --"uranium-cannon-explosion"
          }
        }
      }
    },
    final_action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "Schall-uranium-autocannon-shell-explosion" --"uranium-cannon-shell-explosion"
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              radius = 4.25,
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  {
                    type = "damage",
                    damage = {amount = 31.5, type = "explosion"}
                    -- damage = {amount = 315, type = "explosion"}
                  },
                  {
                    type = "create-entity",
                    entity_name = "Schall-uranium-autocannon-explosion" --"uranium-cannon-explosion"
                  }
                }
              }
            }
          },
          {
            type = "create-entity",
            entity_name = "small-scorchmark",
            check_buildability = true
          }
        }
      }
    },
    animation =
    {
      filename = "__base__/graphics/entity/bullet/bullet.png",
      frame_count = 1,
      width = 3,
      height = 50,
      priority = "high"
    }
  },
  -- Rocket
  {
    type = "projectile",
    name = "Schall-explosive-rocket-pack",
    flags = {"not-on-map"},
    hidden = true,
    acceleration = 0.01,
    turn_speed = 0.003,
    turning_speed_increases_exponentially_with_projectile_speed = true,
    action =
    {
      {
        type = "cluster",
        cluster_count = 7,
        distance = 8,
        distance_deviation = 3,
        action_delivery =
        {
          type = "projectile",
          projectile = "explosive-rocket",
          direction_deviation = 0.6,
          starting_speed = 0.25,
          starting_speed_deviation = 0.3
        }
      }
    },
    light = {intensity = 0.5, size = 4},
    animation = require("__base__.prototypes.entity.rocket-projectile-pictures").animation({1, 0.2, 0.2}),
    shadow = require("__base__.prototypes.entity.rocket-projectile-pictures").shadow,
    smoke = require("__base__.prototypes.entity.rocket-projectile-pictures").smoke,
  },
  -- High Caliber Cannon
  {
    type = "projectile",
    name = "Schall-cannon-H1-projectile",
    flags = {"not-on-map"},
    hidden = true,
    collision_box = cfg1.collision_box.C, --{{-0.3, -1.1}, {0.3, 1.1}},
    force_condition = cfg1.force_condition.C,
    acceleration = 0,
    direction_only = true,
    piercing_damage = 1333,--1000,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "damage",
            -- damage = {amount = 1000 , type = "physical"}
            damage = {amount = 1750 , type = "physical"}
          },
          {
            type = "damage",
            -- damage = {amount = 100 , type = "explosion"}
            damage = {amount = 160 , type = "explosion"}
          },
          {
            type = "create-entity",
            entity_name = "explosion"
          }
        }
      }
    },
    final_action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "small-scorchmark",
            check_buildability = true
          }
        }
      }
    },
    animation =
    {
      filename = "__base__/graphics/entity/bullet/bullet.png",
      frame_count = 1,
      width = 3,
      height = 50,
      priority = "high"
    }
  },
  {
    type = "projectile",
    name = "Schall-cannon-H2-projectile",
    flags = {"not-on-map"},
    hidden = true,
    collision_box = cfg1.collision_box.C, --{{-0.3, -1.1}, {0.3, 1.1}},
    force_condition = cfg1.force_condition.C,
    acceleration = 0,
    direction_only = true,
    piercing_damage = 1666,--1000,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "damage",
            -- damage = {amount = 1000 , type = "physical"}
            damage = {amount = 2500 , type = "physical"}
          },
          {
            type = "damage",
            -- damage = {amount = 100 , type = "explosion"}
            damage = {amount = 360 , type = "explosion"}
          },
          {
            type = "create-entity",
            entity_name = "explosion"
          }
        }
      }
    },
    final_action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "small-scorchmark",
            check_buildability = true
          }
        }
      }
    },
    animation =
    {
      filename = "__base__/graphics/entity/bullet/bullet.png",
      frame_count = 1,
      width = 3,
      height = 50,
      priority = "high"
    }
  },
  {
    type = "projectile",
    name = "Schall-explosive-cannon-H1-projectile",
    flags = {"not-on-map"},
    hidden = true,
    collision_box = cfg1.collision_box.C, --{{-0.3, -1.1}, {0.3, 1.1}},
    force_condition = cfg1.force_condition.C,
    acceleration = 0,
    piercing_damage = 133,--100,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "damage",
            -- damage = {amount = 180, type = "physical"}
            damage = {amount = 315, type = "physical"}
          },
          {
            type = "create-entity",
            entity_name = "explosion"
          }
        }
      }
    },
    final_action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "big-explosion"
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              radius = 4.45,--4,
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  {
                    type = "damage",
                    -- damage = {amount = 300, type = "explosion"}
                    damage = {amount = 380, type = "explosion"}
                  },
                  {
                    type = "create-entity",
                    entity_name = "explosion"
                  }
                }
              }
            }
          }
        }
      }
    },
    animation =
    {
      filename = "__base__/graphics/entity/bullet/bullet.png",
      frame_count = 1,
      width = 3,
      height = 50,
      priority = "high"
    }
  },
  {
    type = "projectile",
    name = "Schall-explosive-cannon-H2-projectile",
    flags = {"not-on-map"},
    hidden = true,
    collision_box = cfg1.collision_box.C, --{{-0.3, -1.1}, {0.3, 1.1}},
    force_condition = cfg1.force_condition.C,
    acceleration = 0,
    piercing_damage = 166,--100,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "damage",
            -- damage = {amount = 180, type = "physical"}
            damage = {amount = 450, type = "physical"}
          },
          {
            type = "create-entity",
            entity_name = "explosion"
          }
        }
      }
    },
    final_action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "big-explosion"
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              radius = 6,--4,
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  {
                    type = "damage",
                    -- damage = {amount = 300, type = "explosion"}
                    damage = {amount = 570, type = "explosion"}
                  },
                  {
                    type = "create-entity",
                    entity_name = "explosion"
                  }
                }
              }
            }
          }
        }
      }
    },
    animation =
    {
      filename = "__base__/graphics/entity/bullet/bullet.png",
      frame_count = 1,
      width = 3,
      height = 50,
      priority = "high"
    }
  },
  {
    type = "projectile",
    name = "Schall-uranium-cannon-H1-projectile",
    flags = {"not-on-map"},
    hidden = true,
    collision_box = cfg1.collision_box.C, --{{-0.3, -1.1}, {0.3, 1.1}},
    force_condition = cfg1.force_condition.C,
    acceleration = 0,
    direction_only = true,
    piercing_damage = 3000,--2200,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "damage",
            -- damage = {amount = 2000 , type = "physical"}
            damage = {amount = 3500 , type = "physical"}
          },
          {
            type = "damage",
            -- damage = {amount = 200 , type = "explosion"}
            damage = {amount = 320 , type = "explosion"}
          },
          {
            type = "create-entity",
            entity_name = "uranium-cannon-explosion"
          }
        }
      }
    },
    final_action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "small-scorchmark",
            check_buildability = true
          }
        }
      }
    },
    animation =
    {
      filename = "__base__/graphics/entity/bullet/bullet.png",
      frame_count = 1,
      width = 3,
      height = 50,
      priority = "high"
    }
  },
  {
    type = "projectile",
    name = "Schall-uranium-cannon-H2-projectile",
    flags = {"not-on-map"},
    hidden = true,
    collision_box = cfg1.collision_box.C, --{{-0.3, -1.1}, {0.3, 1.1}},
    force_condition = cfg1.force_condition.C,
    acceleration = 0,
    direction_only = true,
    piercing_damage = 4000,--2200,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "damage",
            -- damage = {amount = 2000 , type = "physical"}
            damage = {amount = 5000 , type = "physical"}
          },
          {
            type = "damage",
            -- damage = {amount = 200 , type = "explosion"}
            damage = {amount = 720 , type = "explosion"}
          },
          {
            type = "create-entity",
            entity_name = "uranium-cannon-explosion"
          }
        }
      }
    },
    final_action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "small-scorchmark",
            check_buildability = true
          }
        }
      }
    },
    animation =
    {
      filename = "__base__/graphics/entity/bullet/bullet.png",
      frame_count = 1,
      width = 3,
      height = 50,
      priority = "high"
    }
  },
  {
    type = "projectile",
    name = "Schall-explosive-uranium-cannon-H1-projectile",
    flags = {"not-on-map"},
    hidden = true,
    collision_box = cfg1.collision_box.C, --{{-0.3, -1.1}, {0.3, 1.1}},
    force_condition = cfg1.force_condition.C,
    acceleration = 0,
    piercing_damage = 200,--150,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "damage",
            -- damage = {amount = 350 , type = "physical"}
            damage = {amount = 612 , type = "physical"}
          },
          {
            type = "create-entity",
            entity_name = "uranium-cannon-explosion"
          }
        }
      }
    },
    final_action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "uranium-cannon-shell-explosion"
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              radius = 4.75, --4.25,
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  {
                    type = "damage",
                    -- damage = {amount = 315, type = "explosion"}
                    damage = {amount = 400, type = "explosion"}
                  },
                  {
                    type = "create-entity",
                    entity_name = "uranium-cannon-explosion"
                  }
                }
              }
            }
          },
          {
            type = "create-entity",
            entity_name = "small-scorchmark",
            check_buildability = true
          }
        }
      }
    },
    animation =
    {
      filename = "__base__/graphics/entity/bullet/bullet.png",
      frame_count = 1,
      width = 3,
      height = 50,
      priority = "high"
    }
  },
  {
    type = "projectile",
    name = "Schall-explosive-uranium-cannon-H2-projectile",
    flags = {"not-on-map"},
    hidden = true,
    collision_box = cfg1.collision_box.C, --{{-0.3, -1.1}, {0.3, 1.1}},
    force_condition = cfg1.force_condition.C,
    acceleration = 0,
    piercing_damage = 250,--150,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "damage",
            -- damage = {amount = 350 , type = "physical"}
            damage = {amount = 875 , type = "physical"}
          },
          {
            type = "create-entity",
            entity_name = "uranium-cannon-explosion"
          }
        }
      }
    },
    final_action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "uranium-cannon-shell-explosion"
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              radius = 6.375, --4.25,
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  {
                    type = "damage",
                    -- damage = {amount = 315, type = "explosion"}
                    damage = {amount = 600, type = "explosion"}
                  },
                  {
                    type = "create-entity",
                    entity_name = "uranium-cannon-explosion"
                  }
                }
              }
            }
          },
          {
            type = "create-entity",
            entity_name = "small-scorchmark",
            check_buildability = true
          }
        }
      }
    },
    animation =
    {
      filename = "__base__/graphics/entity/bullet/bullet.png",
      frame_count = 1,
      width = 3,
      height = 50,
      priority = "high"
    }
  },

  -- Incendiary Autocannon
  {
    type = "projectile",
    name = "Schall-incendiary-autocannon-projectile",
    flags = {"not-on-map"},
    hidden = true,
    collision_box = collision_box_none,
    force_condition = cfg1.force_condition.AC,
    acceleration = 0,
    action =
    {
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            -- type = "create-fire",
            -- entity_name = "fire-flame",
            -- initial_ground_flame_count = 50,--30,
            -- show_in_tooltip = true
            {
              type = "nested-result",
              action =
              {
                type = "cluster",
                cluster_count = 2,
                distance = 0.5,
                distance_deviation = 1,
                action_delivery =
                {
                  type = "projectile",
                  projectile = "Schall-napalm-fire",
                  direction_deviation = 0.6,
                  starting_speed = 0.3,
                  starting_speed_deviation = 0.1
                }
              }
            }
          }
        }
      },
      -- {
      --   type = "area",
      --   radius = 2.5,--2,--10,
      --   action_delivery =
      --   {
      --     type = "instant",
      --     target_effects =
      --     {
      --       {
      --         type = "create-sticker",
      --         sticker = "fire-sticker",
      --       },
      --       {
      --         type = "damage",
      --         damage = {amount = 15, type = "fire"},--3
      --         apply_damage_to_trees = false
      --       }
      --     }
      --   }
      -- },
    },
    light = {intensity = 0.8, size = 5},
    animation =
    {
      filename = "__base__/graphics/entity/bullet/bullet.png",
      frame_count = 1,
      width = 3,
      height = 50,
      priority = "high"
    }
  },
  -- Incendiary Rocket
  {
    type = "projectile",
    name = "Schall-incendiary-rocket",
    flags = {"not-on-map"},
    hidden = true,
    acceleration = 0.01,
    turn_speed = 0.003,
    turning_speed_increases_exponentially_with_projectile_speed = true,
    action =
    {
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
                repeat_count = 10,
                type = "create-trivial-smoke",
                smoke_name = "nuclear-smoke",
                offset_deviation = {{-1, -1}, {1, 1}},
                slow_down_factor = 1,
                starting_frame = 3,
                starting_frame_deviation = 5,
                starting_frame_speed = 0,
                starting_frame_speed_deviation = 5,
                speed_from_center = 0.5,
                speed_deviation = 0.2
            },
            {
              type = "create-entity",
              -- entity_name = "Schall-napalm-big-explosion"
              entity_name = "big-explosion"
              -- entity_name = "explosion"
            },
            -- {
            --   type = "damage",
            --   damage = {amount = 20, type = "fire"}
            -- },
            {
              type = "create-entity",
              entity_name = "small-scorchmark",
              check_buildability = true
            },
            {
              type = "nested-result",
              action =
              {
                type = "cluster",
                cluster_count = 8,--4,
                distance = 2,
                distance_deviation = 6,
                action_delivery =
                {
                  type = "projectile",
                  projectile = "Schall-napalm-fire",
                  direction_deviation = 0.6,
                  starting_speed = 0.3,
                  starting_speed_deviation = 0.1
                }
              }
            }
          }
        }
      },
    },
    light = {intensity = 0.8, size = 15},
    animation = require("__base__.prototypes.entity.rocket-projectile-pictures").animation({1, 0.2, 0.2}),
    shadow = require("__base__.prototypes.entity.rocket-projectile-pictures").shadow,
    smoke = require("__base__.prototypes.entity.rocket-projectile-pictures").smoke,
  },
  -- Napalm Rocket
  {
    type = "projectile",
    name = "Schall-napalm-rocket",
    flags = {"not-on-map"},
    hidden = true,
    acceleration = 0.01,
    turn_speed = 0.003,
    turning_speed_increases_exponentially_with_projectile_speed = true,
    action =
    {
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              repeat_count = 100,
              type = "create-trivial-smoke",
              smoke_name = "nuclear-smoke",
              offset_deviation = {{-1, -1}, {1, 1}},
              slow_down_factor = 1,
              starting_frame = 3,
              starting_frame_deviation = 5,
              starting_frame_speed = 0,
              starting_frame_speed_deviation = 5,
              speed_from_center = 0.5,
              speed_deviation = 0.2
            },
            {
              type = "create-entity",
              entity_name = "Schall-napalm-big-explosion"
              -- entity_name = "big-explosion"
              -- entity_name = "explosion"
            },
            -- {
            --   type = "damage",
            --   damage = {amount = 20, type = "fire"}
            -- },
            {
              type = "create-entity",
              entity_name = "small-scorchmark",
              check_buildability = true
            },
            {
              type = "nested-result",
              action =
              {
                type = "cluster",
                cluster_count = 200,--100,--30,--10,
                distance = 2,
                distance_deviation = 50,--35,
                action_delivery =
                {
                  type = "projectile",
                  projectile = "Schall-napalm-fire",
                  direction_deviation = 0.6,
                  starting_speed = 0.3,
                  starting_speed_deviation = 0.1
                }
              }
            }
          }
        }
      },
    },
    light = {intensity = 0.8, size = 15},
    animation = require("__base__.prototypes.entity.rocket-projectile-pictures").animation({1, 0.2, 0.2}),
    shadow = require("__base__.prototypes.entity.rocket-projectile-pictures").shadow,
    smoke = require("__base__.prototypes.entity.rocket-projectile-pictures").smoke,
  },
  {
    type = "projectile",
    name = "Schall-napalm-fire",
    flags = {"not-on-map"},
    hidden = true,
    acceleration = 0.005,
    action =
    {
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-fire",
              entity_name = "Schall-napalm-fire-flame", --"fire-flame",
              initial_ground_flame_count = 240,--200,--30,
              show_in_tooltip = true
            },
          }
        }
      },
      {
        type = "area",
        radius = 2.5,--2,--10,
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-sticker",
              sticker = "fire-sticker",
            },
            {
              type = "damage",
              damage = {amount = 5, type = "fire"},--3
              apply_damage_to_trees = false
            }
          }
        }
      },
    },
    light = {intensity = 0.5, size = 10},
    animation =
    {
      filename = "__base__/graphics/entity/grenade/grenade-shadow.png",
      frame_count = 1,
      width = 24,
      height = 24,
      priority = "high"
    },
    shadow =
    {
      filename = "__base__/graphics/entity/grenade/grenade-shadow.png",
      frame_count = 1,
      width = 24,
      height = 24,
      priority = "high"
    }
  },  
  -- Poison Rocket
  {
    type = "projectile",
    name = "Schall-poison-rocket",
    flags = {"not-on-map"},
    hidden = true,
    acceleration = 0.01,
    turn_speed = 0.003,
    turning_speed_increases_exponentially_with_projectile_speed = true,
    action =
    {
      {
        type = "cluster",
        cluster_count = 6,
        distance = 8,
        distance_deviation = 3,
        action_delivery =
        {
          type = "projectile",
          projectile = "Schall-poison-capsule",  --"poison-capsule",
          starting_speed = 0.3
        }
      },
    },
    light = {intensity = 0.8, size = 15},
    animation = require("__base__.prototypes.entity.rocket-projectile-pictures").animation({1, 0.2, 0.2}),
    shadow = require("__base__.prototypes.entity.rocket-projectile-pictures").shadow,
    smoke = require("__base__.prototypes.entity.rocket-projectile-pictures").smoke,
  },
  -- Poison Capsule up to 0.18.6
  {
    type = "projectile",
    name = "Schall-poison-capsule",  --"poison-capsule",
    flags = {"not-on-map"},
    hidden = true,
    acceleration = 0.005,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "create-entity",
          show_in_tooltip = true,
          entity_name = "Schall-poison-cloud" --"poison-cloud"
        }
      }
    },
    light = {intensity = 0.5, size = 4},
    animation =
    {
      filename = "__SchallTankPlatoon__/graphics/entity/projectiles/poison-capsule.png",  --"__base__/graphics/entity/poison-capsule/poison-capsule.png",
      frame_count = 1,
      width = 32,
      height = 32,
      priority = "high"
    },
    shadow =
    {
      filename = "__SchallTankPlatoon__/graphics/entity/projectiles/poison-capsule-shadow.png", --"__base__/graphics/entity/poison-capsule/poison-capsule-shadow.png",
      frame_count = 1,
      width = 32,
      height = 32,
      priority = "high"
    },
    smoke = capsule_smoke
  },
}



-- Add Force condition to area effects of projectiles
if cfg1.force_condition_area_effects then
  local drp = data.raw.projectile
  for ammocat, prjlist in pairs(cfg1.projectiles) do
    if cfg1.force_condition[ammocat] then
      for _, prjname in pairs(prjlist) do
        if drp[prjname] then
          local chg = TPlib.force_condition_area_effects_recursive(drp[prjname].action, cfg1.force_condition[ammocat]) or TPlib.force_condition_area_effects_recursive(drp[prjname].final_action, cfg1.force_condition[ammocat])
          if chg then
            TPlib.debuglog(prjname .. " changed.")
          else
          end
        end
      end
    end
  end
end

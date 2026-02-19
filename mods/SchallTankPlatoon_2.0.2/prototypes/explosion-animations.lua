local explosion_animations = {}

function explosion_animations.explosion(scale)
  scale = scale or 1
  return
  {
    {
      filename = "__base__/graphics/entity/explosion/explosion-1.png",
      draw_as_glow = true,
      priority = "high",
      line_length = 6,
      width = 48,
      height = 42,
      frame_count = 17,
      animation_speed = 0.5,
      shift = util.by_pixel(4.5*scale,6*scale),
      scale = 0.5 * scale,
      usage = "explosion"
    },
    {
      filename = "__base__/graphics/entity/explosion/explosion-3.png",
      draw_as_glow = true,
      priority = "high",
      line_length = 6,
      width = 102,
      height = 88,
      frame_count = 17,
      animation_speed = 0.5,
      shift = util.by_pixel(-1*scale,1.5*scale),
      scale = 0.5 * scale,
      usage = "explosion"
    },
  }
end

function explosion_animations.big_explosion(scale)
  scale = scale or 1
  return
  {
    {
      filename = "__base__/graphics/entity/big-explosion/big-explosion.png",
      draw_as_glow = true,
      width = 197,
      height = 245,
      frame_count = 47,
      line_length = 6,
      shift = {0.1875*scale, -0.75*scale},
      scale = scale,
      animation_speed = 0.5,
      usage = "explosion"
    }
  }
end

function explosion_animations.massive_explosion(scale)
  scale = scale or 1
  return
  {
    width = 656,
    height = 634,
    axially_symmetrical = false,
    shift = util.by_pixel(-45*scale, -91*scale),
    animation_speed = 0.5,
    scale = 0.5 * scale,
    allow_forced_downscale = true,
    draw_as_glow = true,
    stripes =
    {
      {
        filename = "__base__/graphics/entity/massive-explosion/massive-explosion-1.png",
        width_in_frames = 6,
        height_in_frames = 5,
      },
      {
        filename = "__base__/graphics/entity/massive-explosion/massive-explosion-2.png",
        width_in_frames = 6,
        height_in_frames = 5,
      }
    },
  }
end

return explosion_animations
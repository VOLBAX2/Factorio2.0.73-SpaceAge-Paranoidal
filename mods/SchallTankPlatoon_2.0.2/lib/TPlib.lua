local TPlib = {}

local showlog = false     -- Debug log message toggle
local showprint = false   -- Debug game print toggle

function TPlib.debuglog(msg)
  if showlog then log(msg) end
  return showlog
end

function TPlib.debugprint(msg)
  if showprint and game then game.print(msg) end
  return showprint
end



function TPlib.format_number(x, n)
  return string.format("%."..n.."f", x)
end

function TPlib.floor_float(x)
  return x>=0 and math.floor(x) or math.ceil(x)
end

function TPlib.round(x)
  return x>=0 and math.floor(x+0.5) or math.ceil(x-0.5)
end

function TPlib.round(x, n)
  n = math.pow(10, n or 0)
  x = x * n
  if x >= 0 then x = math.floor(x+0.5) else x = math.ceil(x-0.5) end
  return x / n
end

function TPlib.format_position(p)
  return string.format("%.0f,%.0f", p.x, p.y )
end

function TPlib.format_position_gps(p)
  return string.format("[gps=%.0f,%.0f]", p.x, p.y )
end

function TPlib.string_split(str, sep)
  local rt = {}
  string.gsub(str, "[^"..sep.."]+", function(w) table.insert(rt, w) end)
  return rt
end

function TPlib.vector_multiply(vector, scale)
  if not (vector and scale) then
    return vector
  end
  return {vector[1] * scale, vector[2] * scale}
end

function TPlib.table_multiply(t, scale)
  if not (t and scale) then
    return t
  end
  for k, v in pairs(t) do
    t[k] = v * scale
  end
  return t
end

function TPlib.table_recursive_multiply(t, scale)
  if not (t and scale) then
    return t
  end
  for k, v in pairs(t) do
    if type(v) == "table" then
      TPlib.table_recursive_multiply(v, scale)
    elseif type(v) == "number" then
      t[k] = v * scale
    end
  end
  return t
end

function TPlib.table_contain(t, val)
  if not t then return false end
  for _, tval in pairs(t) do
    if tval == val then return true end
  end
  return false
end

function TPlib.table_merge_unique(tables)
  -- Different from core util.merge, a siimple function NOT dealing with subtables.
  -- Will NOT override/replace earlier tables, but create a unique table.
  -- New entries are inserted at the end.
  local rt = {}
  local tdict = {}
  for i, tab in ipairs(tables) do
    for _, v in pairs(tab) do
      if not tdict[v] then
        table.insert(rt, v)
        tdict[v] = true
      end
    end
  end
  return rt
end

function TPlib.table_insert(t, k, s)
  if not t[k] then t[k] = {} end
  if s then
    table.insert(t[k], s)
  end
end

function TPlib.counts_add(t, k, amtadd, processzero)
  if processzero or amtadd > 0 then
    t[k] = (t[k] or 0) + amtadd
  end
end

function TPlib.counts_2D_add(t, k1, k2, amtadd, processzero)
  if not t[k1] then t[k1] = {} end
  if processzero or amtadd > 0 then
    t[k1][k2] = (t[k1][k2] or 0) + amtadd
  end
end


function TPlib.sprite_rescale_recursive(layer, linescale, animscale, spritesspec)
  if not layer or type(layer) ~= "table" then return nil end
  local spec = spritesspec or {}
  if layer.width then
    local isanim = layer.animation_speed or layer.frame_count
    layer.shift = TPlib.vector_multiply(layer.shift, linescale)
    if not spec.skipscale then
      layer.scale = (layer.scale or 1) * linescale * (spec.scalemul or 1)
    end
    if isanim and not spec.skipanimscale and not spec.constant_speed then
      layer.animation_speed = (layer.animation_speed or 1) * animscale
    end
    if layer.hr_version then
      layer.hr_version.shift = TPlib.vector_multiply(layer.hr_version.shift, linescale)
      if not spec.skipscale then
        layer.hr_version.scale = (layer.hr_version.scale or 1) * linescale * (spec.scalemul or 1)
      end
      if isanim and not spec.skipanimscale and not spec.constant_speed then
        layer.hr_version.animation_speed = (layer.hr_version.animation_speed or 1) * animscale
      end
    end
  else
    if layer.constant_speed then
      spec = table.deepcopy(spec)
      spec.skipanimscale = true
    end
    for k, v in pairs(layer) do
      if type(k) == "string" and k:match("_position$") then
        layer[k] = TPlib.vector_multiply(v, linescale)
      else
        TPlib.sprite_rescale_recursive(v, linescale, animscale, spec)
      end
    end
  end
  return layer
end

function TPlib.sprite_tint_recursive(layer, tint)
  if not layer or type(layer) ~= "table" then return nil end
  if layer.apply_tint then return nil end
  if layer.width then
    layer.tint = tint
    if layer.hr_version then
      layer.hr_version.tint = tint
    end
  else
    for k, v in pairs(layer) do
      TPlib.sprite_tint_recursive(v, tint)
    end
  end
  return layer
end



function TPlib.check_set_value(entry, prop, val)
  if entry then
    if type(prop) == "table" then
      if #prop > 1 then
        TPlib.debuglog("  At lv "..#prop.. ": "..prop[1])
        return TPlib.check_set_value(entry[prop[1]], {table.unpack(prop,2)}, val)
      else
        TPlib.debuglog("    Set "..prop[1].. " = `"..tostring(val).."`")
        entry[prop[1]] = val
        return true
      end
    else
      TPlib.debuglog("    Set "..prop.. " = `"..tostring(val).."`")
      entry[prop] = val
      return true
    end
  else
    if type(prop) == "table" then
      log("Failed to set prop `"..prop[1].."` = `"..tostring(val).."`")
    else
      log("Failed to set prop `"..prop.."` = `"..tostring(val).."`")
    end
    return false
  end
end

function TPlib.text_quality_or_normal(quality)
  -- Output "normal" for normal, or "quality" for <> normal
  if quality == "normal" then
    return quality
  else
    return "quality"
  end
end

function TPlib.richtext_item(name, quality)
  if script.active_mods["quality"] then
    return "[item="..name..",quality="..quality.."]"
  else
    return "[item="..name.."]"
  end
end

function TPlib.create_flying_text_item(surface, position, itempt, quality, amountadd, player)
  local sign = ""
  local inv = player.get_main_inventory()
  if not inv then return end
  local counts = inv.get_item_count({name = itempt.name, quality = quality})
  -- local counts = player.get_item_count(itempt.name)
  local text
  if amountadd > 0 then
    sign = "+"
  end
  local chgtext = sign .. tostring(amountadd)
  if counts == 0 then
    color = {r=1, g=0.14, b=0}
  else
    color = nil
  end
  local localetext = "show-diff-"..TPlib.text_quality_or_normal(quality)
  local itemRT = TPlib.richtext_item(itempt.name, quality)
  local qualityLOC = prototypes.quality[quality].localised_name
  player.create_local_flying_text{position = position, color = color, text = {localetext, chgtext, itemRT, counts, itempt.localised_name, qualityLOC}, speed = 10 }
end

function TPlib.create_flying_text_insert_failed(surface, position, itempt, quality, player)
  local itemRT = TPlib.richtext_item(itempt.name, quality)
  -- local qualityLOC = prototypes.quality[quality].localised_name
  player.create_local_flying_text{position = position, text = {"description.Schall-flying-text-insert-failed", itemRT, itempt.localised_name}, speed = 10 }
end



local soft_limit = {75, 80, 90, 95, 98, 100}
local hard_limit = 100

-- function TPlib.aymptotic_100(x)
--   for _, v in pairs(soft_limit) do
--     if x<=v then
--       return math.ceil(x)
--     else
--       x = v + (x-v) * 0.5
--     end
--   end
--   return math.min(x, hard_limit)
-- end

function TPlib.aymptotic_100(base, add)
  local x = base + add
  for _, v in pairs(soft_limit) do
    if x <= v then
      return math.ceil(x)
    elseif base >= v then
      -- Skip checking if base is already higher than soft limit
    else
      x = v + (x-v) * 0.5
    end
  end
  return math.min(x, hard_limit)
end

function TPlib.resistances(base, add)
  local rt = {}
  local decbase, perbase
  local decadd, peradd
  for k, v in pairs(base) do
    decbase = v.decrease
    perbase = v.percent
    if add[k] then
      decadd = add[k].decrease
      peradd = add[k].percent
    else
      decadd = 0
      peradd = 0
    end
    if dec ~= 0 or per ~= 0 then
      table.insert(rt, { type = k, decrease = decbase+decadd, percent = TPlib.aymptotic_100(perbase, peradd) } )
    end
  end
  return rt
end

function TPlib.suggest_item_weight(enty, entyweight, multiplier)
  -- Vehicle items use multiplier 10, which seems proper ratio for rocket capacity.
  local weight = entyweight or enty.weight or (1 * tons)
  return weight * (multiplier or 1) * 10
end



TPlib.tier_icon_layer = {
  [0] = nil,
  [1] = {icon = "__SchallTankPlatoon__/graphics/icons/mk1.png", icon_size = 128, icon_mipmaps = 3},
  [2] = {icon = "__SchallTankPlatoon__/graphics/icons/mk2.png", icon_size = 128, icon_mipmaps = 3},
  [3] = {icon = "__SchallAlienTech__/graphics/icons/mk3.png", icon_size = 128, icon_mipmaps = 3},
}

TPlib.caliber_icon_layer = {
  [0] = nil,
  [1] = {icon = "__SchallTankPlatoon__/graphics/icons/H1.png", icon_size = 128, icon_mipmaps = 3},
  [2] = {icon = "__SchallTankPlatoon__/graphics/icons/H2.png", icon_size = 128, icon_mipmaps = 3},
}

TPlib.eqp_icon_layer = {
  tank    = {icon = "__SchallTankPlatoon__/graphics/icons/tank-equipment.png", icon_size = 128, icon_mipmaps = 3},
  train   = {icon = "__SchallTankPlatoon__/graphics/icons/train-equipment.png", icon_size = 128, icon_mipmaps = 3},
}

TPlib.eqp_techicon_layer = {
  tank    = {icon = "__SchallTankPlatoon__/graphics/technology/tank-equipment.png", icon_size = 256},
  train   = {icon = "__SchallTankPlatoon__/graphics/technology/train-equipment.png", icon_size = 256},
}

TPlib.sp_icon_layer = {
  sniper  = {icon = "__SchallTankPlatoon__/graphics/icons/sniper-bullet.png", icon_size = 128, icon_mipmaps = 3},
}


TPlib.energy_source_tank_smoke =
{
  {
    name = "tank-smoke",
    deviation = {0.25, 0.25},
    frequency = 50,
    position = {0, 1.5},
    starting_frame = 0,
    starting_frame_deviation = 60
  }
}

function TPlib.energy_source(oript, categories, spec, smoke)
  if not spec then return oript end
  local rt = table.deepcopy(oript)
  for k, v in pairs(spec) do
    rt[k] = v
  end
  if TPlib.table_contain(categories, "void") then
    rt = { type = "void" }
  elseif TPlib.table_contain(categories, "nuclear") then
    rt.type = "burner"
    rt.fuel_categories = categories
    rt.fuel_inventory_size = 1
    rt.burnt_inventory_size = 1
    if smoke then rt.smoke = smoke end
  elseif TPlib.table_contain(categories, "chemical") then
    rt.type = "burner"
    rt.fuel_categories = categories
    rt.fuel_inventory_size = rt.fuel_inventory_size or 1
    if smoke then rt.smoke = smoke end
  end
  return rt
end

local function scale_volume(pt, scale)
  for _, v in pairs(pt) do
    if v.volume then v.volume = v.volume * scale end
  end
end

function TPlib.scale_sound_volume(pt, scale)
  if pt.variations then
    scale_volume(pt.variations, scale)
  else
    scale_volume(pt, scale)
  end
end

function TPlib.force_condition_area_effects_recursive(layer, force_condition)
  local chg = false
  if not layer or type(layer) ~= "table" then return nil end
  if layer.type == "area" and not layer.force then
    layer.force = force_condition
    chg = true
  end
  for k, v in pairs(layer) do
    chg = TPlib.force_condition_area_effects_recursive(v, force_condition) or chg
  end
  return chg
end



return TPlib

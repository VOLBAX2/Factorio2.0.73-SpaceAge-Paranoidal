require("__core__/lualib/sound-util")
require("__base__/prototypes/entity/rail-pictures")

local locomotive_reflection = function()
  return
  {
    pictures =
    {
      filename = "__base__/graphics/entity/locomotive/reflection/locomotive-reflection.png",
      priority = "extra-high",
      width = 20,
      height = 52,
      shift = util.by_pixel(0, 40),
      variation_count = 1,
      scale = 5
    },
    rotate = true,
    orientation_to_variation = false
  }
end

local drive_over_tie = function()
	return {
		type = "play-sound",
		sound = {
			category = "environment",
			variations = sound_variations("__base__/sound/train-tie", 6, 0.4, {
				volume_multiplier("main-menu", 2.4),
				volume_multiplier("driving", 1.3),
			}),
		},
	}
end


local rolling_stock_stand_by_light = function()
	return {
		{
			minimum_darkness = 0.3,
			color = { 0.05, 0.2, 1, 0 },
			shift = { -0.6, -3.5 },
			size = 2,
			intensity = 0.5,
			add_perspective = true,
		},
		{
			minimum_darkness = 0.3,
			color = { 0.05, 0.2, 1, 0 },
			shift = { 0.6, -3.5 },
			size = 2,
			intensity = 0.5,
			add_perspective = true,
		},
	}
end

local sounds = require("__base__/prototypes/entity/sounds")

data:extend({
	-------------------------------------------------------------------------------------------------
	-- создаем технологию для переработки шариков
	{
		type = "technology",
		name = "bob-alien-artifact",
		icon = "__reskins-bobs__/graphics/icons/enemies/artifacts/bob-alien-artifact.png",
		icon_size = 64,
		icon_mipmaps = 4,
		effects = {
			{ type = "unlock-recipe", recipe = "alien-artifact-red-from-basic" },
			{ type = "unlock-recipe", recipe = "alien-artifact-orange-from-basic" },
			{ type = "unlock-recipe", recipe = "alien-artifact-yellow-from-basic" },
			{ type = "unlock-recipe", recipe = "alien-artifact-green-from-basic" },
			{ type = "unlock-recipe", recipe = "alien-artifact-blue-from-basic" },
			{ type = "unlock-recipe", recipe = "alien-artifact-purple-from-basic" },

			{ type = "unlock-recipe", recipe = "alien-artifact-from-small" },
			{ type = "unlock-recipe", recipe = "alien-artifact-red-from-small" },
			{ type = "unlock-recipe", recipe = "alien-artifact-orange-from-small" },
			{ type = "unlock-recipe", recipe = "alien-artifact-yellow-from-small" },
			{ type = "unlock-recipe", recipe = "alien-artifact-green-from-small" },
			{ type = "unlock-recipe", recipe = "alien-artifact-blue-from-small" },
			{ type = "unlock-recipe", recipe = "alien-artifact-purple-from-small" },
		},
		prerequisites = { "gardens" },
		unit = {
			count = 20,
			ingredients = { { "automation-science-pack", 1} },
			time = 30,
		},
		order = "c-a",
	},
	-------------------------------------------------------------------------------------------------
	--создаем рецепт для стекла из дробленого кронтиниума
	{
		type = "recipe",
		name = "glass-from-ore4",
		category = "smelting",
		group = "angels-casting",
		subgroup = "angels-glass-casting",
		order = "az",
		always_show_products = true,
		--enabled = false --доступно изначально
		icons = {
			{
				icon = "__reskins-library__/graphics/icons/shared/items/glass.png",
				icon_size = 64,
				icon_mipmaps = 4,
			},
			{
				icon = "__angelsrefininggraphics__/graphics/icons/angels-ore4/angels-ore4-crushed.png",
				icon_size = 32,
				icon_mipmaps = 1,
				scale = 0.4375,
				shift = { -10, -10 },
			},
		},
		energy_required = 20,
		ingredients = { { type = "item", name = "angels-ore4-crushed", amount = 7 } },
		results = {
			{ type = "item", name = "bob-glass", amount = 4 },
			{ name = "slag", type = "item", amount = 1 },
		},
	},
})
-------------------------------------------------------------------------------------------------
if mods["JunkTrain3"] then
	data:extend({
		--добавляем рецепт для модернизации рельс
		{
			type = "recipe",
			name = "scrap-rail-to-rail",
			main_product = "",
			icons = {
				{
					icon = "__JunkTrain3__/graphics/icons/rail.png",
					icon_size = 32,
					--icon_mipmaps = 4
				},
				{
					icon = "__zzzparanoidal__/graphics/upgrade-icon.png",
					icon_size = 16,
					icon_mipmaps = 1,
					scale = 0.9,
					shift = { -10, -10 },
				},
			},
			category = "crafting",
			group = "transport",
			subgroup = "transport-rail",
			order = "aa",
			energy_required = 0.5,
			enabled = false,
			allow_decomposition = false,
			always_show_products = true,
			ingredients = {
				{ type = "item", name = "scrap-rail", amount = 2 },
				{ type = "item", name = "concrete", amount = 6 },
			},
			results = { { type = "item", name = "rail", amount = 2 } },
		},
		-------------------------------------------------------------------------------------------------
		--добавляем рецепт для модернизации светофора
		{
			type = "recipe",
			name = "rail-signal-scrap-to-rail-signal",
			main_product = "",
			icons = {
				{
					icon = "__base__/graphics/icons/rail-signal.png",
					icon_size = 64,
					icon_mipmaps = 4,
					tint = { r = 170, g = 130, b = 1 },
				},
				{
					icon = "__zzzparanoidal__/graphics/upgrade-icon.png",
					icon_size = 16,
					icon_mipmaps = 1,
					scale = 0.9,
					shift = { -10, -10 },
				},
			},
			category = "crafting",
			group = "transport",
			subgroup = "transport-rail-other",
			order = "aa",
			energy_required = 0.5,
			enabled = false,
			allow_decomposition = false,
			always_show_products = true,
			ingredients = {
				{ type = "item", name = "rail-signal-scrap", amount = 1 },
				{ type = "item", name = "electronic-circuit", amount = 1 },
			},
			results = { { type = "item", name = "rail-signal", amount = 1 } },
		},
		-------------------------------------------------------------------------------------------------
		--добавляем рецепт для модернизации проходного светофора
		{
			type = "recipe",
			name = "rail-chain-signal-scrap-to-rail-chain-signal",
			main_product = "",
			icons = {
				{
					icon = "__base__/graphics/icons/rail-chain-signal.png",
					icon_size = 64,
					icon_mipmaps = 4,
					tint = { r = 170, g = 130, b = 1 },
				},
				{
					icon = "__zzzparanoidal__/graphics/upgrade-icon.png",
					icon_size = 16,
					icon_mipmaps = 1,
					scale = 0.9,
					shift = { -10, -10 },
				},
			},
			category = "crafting",
			group = "transport",
			subgroup = "transport-rail-other",
			order = "ba",
			energy_required = 0.5,
			enabled = false,
			allow_decomposition = false,
			always_show_products = true,
			ingredients = {
				{ type = "item", name = "rail-chain-signal-scrap", amount = 1 },
				{ type = "item", name = "electronic-circuit", amount = 1 },
			},
			results = { { type = "item", name = "rail-chain-signal", amount = 1 } },
		},
		-------------------------------------------------------------------------------------------------
		--добавляем рецепт для модернизации станции
		{
			type = "recipe",
			name = "train-stop-scrap-to-train-stop",
			main_product = "",
			icons = {
				{
					icon = "__base__/graphics/icons/train-stop.png",
					icon_size = 64,
					icon_mipmaps = 4,
					tint = { r = 170, g = 130, b = 1 },
				},
				{
					icon = "__zzzparanoidal__/graphics/upgrade-icon.png",
					icon_size = 16,
					icon_mipmaps = 1,
					scale = 0.9,
					shift = { -10, -10 },
				},
			},
			category = "crafting",
			group = "transport",
			subgroup = "transport-rail-other",
			order = "ca",
			energy_required = 0.5,
			enabled = false,
			allow_decomposition = false,
			always_show_products = true,
			ingredients = {
				{ type = "item", name = "train-stop-scrap", amount = 1 },
				{ type = "item", name = "electronic-circuit", amount = 5 },
				{ type = "item", name = "steel-plate", amount = 10 },
			},
			results = { { type = "item", name = "train-stop", amount = 1 } },
		},
	})
end
--###############################################################################################
--добавляем новые группы и сабгруппы для рецептов
if not mods["angelsindustries"] then
	data:extend({
		{
			type = "item-group",
			name = "circuit",
			order = "ab",
			icon = "__base__/graphics/technology/circuit-network.png",
			icon_size = 256,
			icon_mipmaps = 4,
		},
		{ type = "item-subgroup", name = "circuit-connection", group = "circuit", order = "b" },
		{ type = "item-subgroup", name = "circuit-combinator", group = "circuit", order = "c" },
		{ type = "item-subgroup", name = "circuit-input", group = "circuit", order = "d" },
		{ type = "item-subgroup", name = "circuit-visual", group = "circuit", order = "e" },
		{ type = "item-subgroup", name = "circuit-auditory", group = "circuit", order = "f" },
		-------------------------------------------------------------------------------------------------
		{
			type = "item-group",
			name = "transport",
			order = "ac",
			icon = "__base__/graphics/technology/railway.png",
			icon_size = 256,
			icon_mipmaps = 4,
		},
		{ type = "item-subgroup", name = "transport-rail", group = "transport", order = "a" },
		{ type = "item-subgroup", name = "transport-rail-other", group = "transport", order = "b" },
		--{type = "item-subgroup", name = "junk-train", group = "transport", order = "ddd",},
		{ type = "item-subgroup", name = "artillery-wagon", group = "transport", order = "eg" },
		{ type = "item-subgroup", name = "spider", group = "transport", order = "x" },
		{ type = "item-subgroup", name = "aircraft", group = "transport", order = "y" },
		-------------------------------------------------------------------------------------------------
		{ type = "item-subgroup", name = "FluidMustFlow", group = "logistics", order = "d-a-3" },
		{ type = "item-subgroup", name = "FlowControl", group = "logistics", order = "d-a-4" },
		{ type = "item-subgroup", name = "wooden-pole", group = "logistics", order = "d-1" },
		{ type = "item-subgroup", name = "medium-electric-pole", group = "logistics", order = "d-2" },
		{ type = "item-subgroup", name = "big-electric-pole", group = "logistics", order = "d-3" },
		{ type = "item-subgroup", name = "substation", group = "logistics", order = "d-4" },
		{ type = "item-subgroup", name = "logistic-chests-1", group = "logistics", order = "f-1" },
		{ type = "item-subgroup", name = "logistic-chests-4", group = "logistics", order = "f-4" },
		{ type = "item-subgroup", name = "logistic-chests-5", group = "logistics", order = "f-5" },
	})
else
	data:extend({
		{ type = "item-subgroup", name = "transport-rail", group = "angels-vehicles", order = "a" },
		{ type = "item-subgroup", name = "transport-rail-other", group = "angels-vehicles", order = "b" },
	})
end
-------------------------------------------------------------------------------------------------
--создаем предмет для hazard-concrete-brick
data:extend({
	{
		type = "item",
		name = "hazard-concrete-brick",
		icons = {
			{
				icon = "__angelssmeltinggraphics__/graphics/icons/brick-concrete.png",
				icon_size = 32,
				--icon_mipmaps = 4
			},
			{
				icon = "__base__/graphics/icons/refined-hazard-concrete.png",
				icon_size = 64,
				icon_mipmaps = 4,
				scale = 0.3,
				shift = { -10, -10 },
			},
		},
		icon_size = 32,
		subgroup = "angels-stone-casting",
		order = "ia",
		stack_size = angelsmods.trigger.pavement_stack_size,
		place_as_tile = { result = "hazard-concrete-brick-left", condition_size = 1, condition = { "water-tile" } },
	},
})
-------------------------------------------------------------------------------------------------
--создаем hazard-tile-left для hazard-concrete-brick
local hazard_tile_left = table.deepcopy(data.raw["tile"]["refined-hazard-concrete-left"])
hazard_tile_left.name = "hazard-concrete-brick-left"
hazard_tile_left.minable = { mining_time = 0.1, result = "hazard-concrete-brick" }
hazard_tile_left.layer = "225"
hazard_tile_left.next_direction = "hazard-concrete-brick-right"
hazard_tile_left.variants.material_background = {
	picture = "__zzzparanoidal__/graphics/grid/hazard-concrete-left.png",
	count = 8,
}
data:extend({ hazard_tile_left })
-------------------------------------------------------------------------------------------------
--создаем hazard-tile-right для hazard-concrete-brick
local hazard_tile_right = table.deepcopy(data.raw["tile"]["refined-hazard-concrete-right"])
hazard_tile_right.name = "hazard-concrete-brick-right"
hazard_tile_right.minable = { mining_time = 0.1, result = "hazard-concrete-brick" }
hazard_tile_right.layer = "225"
hazard_tile_right.next_direction = "hazard-concrete-brick-left"
hazard_tile_right.variants.material_background = {
	picture = "__zzzparanoidal__/graphics/grid/hazard-concrete-right.png",
	count = 8,
}
data:extend({ hazard_tile_right })
-------------------------------------------------------------------------------------------------
--добавляем рецепт для бетонного кирпича с полосами
data:extend({
	{
		type = "recipe",
		name = "hazard-concrete-brick",
		category = "crafting",
		group = "angels-casting",
		subgroup = "angels-stone-casting",
		order = "ia",
		energy_required = 1,
		enabled = false,
		allow_decomposition = false,
		always_show_products = true,
		ingredients = { { type = "item", name = "angels-concrete-brick", amount = 10 } },
		results = { { type = "item", name = "hazard-concrete-brick", amount = 10 } },
	},
})
--###############################################################################################
--суперзарядка для батарей электровоза
if mods["BatteryElectricTrain"] then
	data:extend({
		{
			type = "item",
			name = "super_charger",
			icon = "__zzzparanoidal__/graphics/train/electric/charger_icon.png",
			icon_size = 32,
			subgroup = "bet-logistics",
			order = "b1",
			stack_size = 10,
			place_result = "super_charger",
		},
		-------------------------------------------------------------------------------------------------
		{
			type = "recipe",
			name = "super_charger",
			energy_required = 20,
			enabled = false,
			ingredients = {
				{ type = "item", name = "bet-charger-3", amount = 2},
				{ type = "item", name = "bob-advanced-processing-unit", amount = 50},
				{ type = "item", name = "bob-insulated-cable", amount = 30},
				{ type = "item", name = "bob-gilded-copper-cable", amount = 20},
				{ type = "item", name = "bob-nitinol-gear-wheel", amount = 5},
				{ type = "item", name = "bob-nitinol-alloy", amount = 30},
				{ type = "item", name = "raw-speed-module-6", amount = 2},
			},
			results = { { type = "item", name = "super_charger", amount = 1 } },
		},
	})
	-------------------------------------------------------------------------------------------------
	local super_charger = table.deepcopy(data.raw.furnace["bet-charger-3"])
	super_charger.name = "super_charger"
	super_charger.icon = "__zzzparanoidal__/graphics/train/electric/charger_icon.png"
	super_charger.minable = { mining_time = 1, result = "super_charger" }
	super_charger.crafting_speed = 50
	super_charger.energy_usage = "100MW"
	super_charger.energy_source = { type = "electric", drain = "50kW", usage_priority = "secondary-input" }
	super_charger.working_visualisations = {
		filename = "__zzzparanoidal__/graphics/train/electric/charger_sheet.png",
		priority = "medium",
		width = 256,
		height = 256,
		frame_count = 16,
		line_length = 4,
		shift = { 0.5, -0.5 },
		scale = 0.5,
		animation_speed = 0.01,
	}
	super_charger.animation = {
		filename = "__zzzparanoidal__/graphics/train/electric/charger_sheet.png",
		priority = "medium",
		width = 256,
		height = 256,
		frame_count = 16,
		line_length = 4,
		shift = { 0.5, -0.5 },
		scale = 0.5,
		animation_speed = 0.01,
	}

	data:extend({ super_charger })
	--###############################################################################################
	--хай-энд поезд
	--локомотив
	data:extend({
		{
			type = "item-with-entity-data",
			name = "hiend_loco",
			icon = "__zzzparanoidal__/graphics/train/hiend/ht-locomotive.png",
			icon_size = 64,
			subgroup = "locomotive",
			order = "z",
			place_result = "hiend_loco",
			stack_size = 10,
		},
		-------------------------------------------------------------------------------------------------
		{
			type = "recipe",
			name = "hiend_loco",
			energy_required = 5,
			enabled = false,
			ingredients = {
				{ type = "item", name = "bet-locomotive", amount = 1},
				{ type = "item", name = "bob-advanced-processing-unit", amount = 20},
				{ type = "item", name = "bob-nitinol-bearing", amount = 20},
				{ type = "item", name = "bob-nitinol-gear-wheel", amount = 15},
				{ type = "item", name = "bob-nitinol-alloy", amount = 10},
				{ type = "item", name = "raw-speed-module-6", amount = 5},
			},
			results = { { type = "item", name = "hiend_loco", amount = 1} },
		},
		-------------------------------------------------------------------------------------------------
		{
			type = "locomotive",
			name = "hiend_loco",
			icon = "__zzzparanoidal__/graphics/train/hiend/ht-locomotive.png",
			icon_size = 64,
			flags = { "placeable-neutral", "player-creation", "placeable-off-grid" },
			minable = { mining_time = 0.5, result = "hiend_loco" },
			mined_sound = { filename = "__core__/sound/deconstruct-large.ogg", volume = 0.8 },
			max_health = 5000,
			corpse = "locomotive-remnants",
			dying_explosion = "locomotive-explosion",
			collision_box = { { -0.6, -2.6 }, { 0.6, 2.6 } },
			selection_box = { { -1, -3 }, { 1, 3 } },
			damaged_trigger_effect = {
				type = "create-entity",
				entity_name = "spark-explosion",
				offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
				offsets = { { 0, 1 } },
				damage_type_filters = "fire",
			},
			drawing_box = { { -1, -4 }, { 1, 3 } },
			alert_icon_shift = util.by_pixel(0, -24),
			weight = 1000,
			max_speed = 2,
			5,
			max_power = "1800kW",
			reversing_power_modifier = 1,
			braking_force = 40,
			friction_force = 0.50,
			vertical_selection_shift = -0.5,
			air_resistance = 0.0030, -- this is a percentage of current speed that will be subtracted
			connection_distance = 3.7,
			joint_distance = 3.7,
			energy_per_hit_point = 5,
			resistances = {
				{ type = "fire", decrease = 15, percent = 90 },
				{ type = "physical", decrease = 15, percent = 20 },
				{ type = "impact", decrease = 50, percent = 40 },
				{ type = "explosion", decrease = 15, percent = 30 },
				{ type = "acid", decrease = 50, percent = 90 },
			},
			burner = {
				fuel_categories = {"bet-fuel-battery"},
				effectivity = 2,
				fuel_inventory_size = 2,
				burnt_inventory_size = 2,
			},
			front_light = {
				{
					type = "oriented",
					minimum_darkness = 0.3,
					picture = {
						filename = "__zzzparanoidal__/graphics/train/hiend/ht-locomotive/light-cone.png",
						priority = "extra-high",
						flags = { "light" },
						scale = 2,
						width = 235,
						height = 235,
					},
					shift = util.by_pixel(0, -360),
					size = 1.0,
					intensity = 1.2,
					color = { r = 0.333, g = 0.768, b = 0.913 },
				},
				{
					type = "oriented",
					minimum_darkness = 0.3,
					picture = {
						filename = "__zzzparanoidal__/graphics/train/hiend/ht-locomotive/spot.png",
						priority = "extra-high",
						flags = { "light" },
						scale = 1,
						width = 200,
						height = 200,
					},
					shift = util.by_pixel(0, -125),
					size = 1.0,
					intensity = 1.0,
					color = { r = 0.333, g = 0.828, b = 1.0 },
				},
			},
			--back_light = rolling_stock_back_light(),
			stand_by_light = rolling_stock_stand_by_light(),
			color = { r = 0.333, g = 0.768, b = 0.913 },
			pictures = {
				layers = {
					{
						dice = 4,
						priority = "very-low",
						width = 240,
						height = 224,
						direction_count = 256,
						allow_low_quality_rotation = true,
						filenames = {
							"__zzzparanoidal__/graphics/train/hiend/ht-locomotive/pyloco-1.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-locomotive/pyloco-2.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-locomotive/pyloco-3.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-locomotive/pyloco-4.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-locomotive/pyloco-5.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-locomotive/pyloco-6.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-locomotive/pyloco-7.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-locomotive/pyloco-8.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-locomotive/pyloco-9.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-locomotive/pyloco-10.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-locomotive/pyloco-11.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-locomotive/pyloco-12.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-locomotive/pyloco-13.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-locomotive/pyloco-14.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-locomotive/pyloco-15.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-locomotive/pyloco-16.png",
						},
						line_length = 4,
						lines_per_file = 4,
						shift = util.by_pixel(0, -5),
					},

					{
						priority = "very-low",
						dice = 4,
						flags = { "shadow" },
						width = 240,
						height = 224,
						direction_count = 256,
						draw_as_shadow = true,
						allow_low_quality_rotation = true,
						filenames = {
							"__zzzparanoidal__/graphics/train/hiend/ht-locomotive/sh-1.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-locomotive/sh-2.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-locomotive/sh-3.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-locomotive/sh-4.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-locomotive/sh-5.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-locomotive/sh-6.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-locomotive/sh-7.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-locomotive/sh-8.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-locomotive/sh-9.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-locomotive/sh-10.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-locomotive/sh-11.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-locomotive/sh-12.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-locomotive/sh-13.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-locomotive/sh-14.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-locomotive/sh-15.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-locomotive/sh-16.png",
						},
						line_length = 4,
						lines_per_file = 4,
						shift = util.by_pixel(48, 12),
					},
				},
			},
			minimap_representation = {
				filename = "__zzzparanoidal__/graphics/train/hiend/ht-locomotive/icon-map.png",
				flags = { "icon" },
				size = { 20, 44 },
				scale = 0.4,
			},
			selected_minimap_representation = {
				filename = "__zzzparanoidal__/graphics/train/hiend/ht-locomotive/icon-map-selected.png",
				flags = { "icon" },
				size = { 20, 44 },
				scale = 0.4,
			},
			--wheels = standard_train_wheels,
			stop_trigger = {
				-- left side
				{
					type = "create-trivial-smoke",
					repeat_count = 5,
					smoke_name = "smoke-train-stop",
					initial_height = 0,
					-- smoke goes to the left
					speed = { -0.03, -0.4 },
					speed_multiplier = 0.75,
					speed_multiplier_deviation = 1.1,
					color = { r = 0.333, g = 0.768, b = 0.913 },
					offset_deviation = { { -0.75, -2.7 }, { -0.3, 2.7 } },
				},
				-- right side
				{
					type = "create-trivial-smoke",
					repeat_count = 5,
					smoke_name = "smoke-train-stop",
					initial_height = 0,
					-- smoke goes to the right
					speed = { 0.03, -0.4 },
					speed_multiplier = 0.75,
					speed_multiplier_deviation = 1.1,
					color = { r = 0.333, g = 0.768, b = 0.913 },
					offset_deviation = { { 0.3, -2.7 }, { 0.75, 2.7 } },
				},
				{
					type = "play-sound",
					sound = {
						filename = "__zzzparanoidal__/graphics/train/hiend/ht-locomotive/ht-locomotive-break.ogg",
						volume = 0.4,
					},
				},
				{
					type = "play-sound",
					sound = { filename = "__zzzparanoidal__/graphics/train/hiend/ht-locomotive/bonk.ogg", volume = 0.5 },
				},
			},
			drive_over_tie_trigger = drive_over_tie(),
			tie_distance = 50,
			vehicle_impact_sound = {
				{ filename = "__base__/sound/car-metal-impact-2.ogg", volume = 0.5 },
				{ filename = "__base__/sound/car-metal-impact-3.ogg", volume = 0.5 },
				{ filename = "__base__/sound/car-metal-impact-4.ogg", volume = 0.5 },
				{ filename = "__base__/sound/car-metal-impact-5.ogg", volume = 0.5 },
				{ filename = "__base__/sound/car-metal-impact-6.ogg", volume = 0.5 },
			},
			working_sound = {
				sound = {
					filename = "__zzzparanoidal__/graphics/train/hiend/ht-locomotive/ht-locomotive-engine.ogg",
					volume = 0.63,
				},
				deactivate_sound = {
					filename = "__zzzparanoidal__/graphics/train/hiend/ht-locomotive/ht-locomotive-end-engine.ogg",
					volume = 0.40,
				},
				match_speed_to_activity = true,
				max_sounds_per_type = 2,
				-- use_doppler_shift = false
			},
			open_sound = {
				filename = "__zzzparanoidal__/graphics/train/hiend/ht-locomotive/ht-locomotive-open.ogg",
				volume = 0.5,
			},
			close_sound = {
				filename = "__zzzparanoidal__/graphics/train/hiend/ht-locomotive/ht-locomotive-close.ogg",
				volume = 0.4,
			},
			sound_minimum_speed = 0.5,
			sound_scaling_ratio = 0.35,
			equipment_grid = "locomotive",
			water_reflection = locomotive_reflection(),
		},
		-------------------------------------------------------------------------------------------------
		{
			type = "item",
			name = "hiend_wagon",
			icon = "__zzzparanoidal__/graphics/train/hiend/ht-generic-wagon.png",
			icon_size = 64,
			subgroup = "cargo-wagon",
			order = "z",
			place_result = "hiend_wagon",
			stack_size = 10,
		},
		-------------------------------------------------------------------------------------------------
		{
			type = "recipe",
			name = "hiend_wagon",
			energy_required = 5,
			enabled = false,
			ingredients = {
				{ type = "item", name = "bob-cargo-wagon-3", amount = 1},
				{ type = "item", name = "bob-advanced-processing-unit", amount = 20},
				{ type = "item", name = "bob-nitinol-bearing", amount = 15},
				{ type = "item", name = "bob-nitinol-gear-wheel", amount = 10},
				{ type = "item", name = "bob-nitinol-alloy", amount = 10},
			},
			results = { { type = "item", name = "hiend_wagon", amount = 1} },
		},
		-------------------------------------------------------------------------------------------------
		{
			type = "cargo-wagon",
			name = "hiend_wagon",
			icon = "__zzzparanoidal__/graphics/train/hiend/ht-generic-wagon.png",
			icon_size = 64,
			flags = { "placeable-neutral", "player-creation", "placeable-off-grid" },
			minable = { mining_time = 0.5, result = "hiend_wagon" },
			mined_sound = { filename = "__core__/sound/deconstruct-large.ogg", volume = 0.8 },
			max_health = 1000,
			corpse = "cargo-wagon-remnants",
			dying_explosion = "cargo-wagon-explosion",
			collision_box = { { -0.6, -2.4 }, { 0.6, 2.4 } },
			selection_box = { { -1, -2.7 }, { 1, 3.3 } },
			--damaged_trigger_effect = hit_effects.entity(),
			vertical_selection_shift = -0.5,
			weight = 500,
			max_speed = 3,
			braking_force = 30,
			friction_force = 0.50,
			air_resistance = 0.0030,
			connection_distance = 3,
			joint_distance = 4,
			energy_per_hit_point = 5,
			inventory_size = 60,
			resistances = {
				{ type = "fire", decrease = 15, percent = 90 },
				{ type = "physical", decrease = 15, percent = 20 },
				{ type = "impact", decrease = 50, percent = 40 },
				{ type = "explosion", decrease = 15, percent = 30 },
				{ type = "acid", decrease = 3, percent = 90 },
			},
			--back_light = rolling_stock_back_light(),
			stand_by_light = rolling_stock_stand_by_light(),
			color = { r = 0.333, g = 0.768, b = 0.913 },
			pictures = {
				layers = {
					{
						dice = 4,
						priority = "very-low",
						width = 240,
						height = 224,
						back_equals_front = true,
						direction_count = 128,
						allow_low_quality_rotation = true,
						filenames = {
							"__zzzparanoidal__/graphics/train/hiend/ht-generic-wagon/generic-wagon-1.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-generic-wagon/generic-wagon-2.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-generic-wagon/generic-wagon-3.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-generic-wagon/generic-wagon-4.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-generic-wagon/generic-wagon-5.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-generic-wagon/generic-wagon-6.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-generic-wagon/generic-wagon-7.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-generic-wagon/generic-wagon-8.png",
						},
						line_length = 4,
						lines_per_file = 4,
						shift = util.by_pixel(0, -5),
					},

					{
						priority = "very-low",
						dice = 4,
						flags = { "shadow" },
						width = 240,
						height = 224,
						back_equals_front = true,
						direction_count = 128,
						draw_as_shadow = true,
						allow_low_quality_rotation = true,
						filenames = {
							"__zzzparanoidal__/graphics/train/hiend/ht-generic-wagon/sh-generic-wagon-1.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-generic-wagon/sh-generic-wagon-2.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-generic-wagon/sh-generic-wagon-3.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-generic-wagon/sh-generic-wagon-4.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-generic-wagon/sh-generic-wagon-5.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-generic-wagon/sh-generic-wagon-6.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-generic-wagon/sh-generic-wagon-7.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-generic-wagon/sh-generic-wagon-8.png",
						},
						line_length = 4,
						lines_per_file = 4,
						shift = util.by_pixel(48, 12),
					},
				},
			},
			minimap_representation = {
				filename = "__zzzparanoidal__/graphics/train/hiend/ht-generic-wagon/icon-map.png",
				flags = { "icon" },
				size = { 20, 44 },
				scale = 0.4,
			},
			selected_minimap_representation = {
				filename = "__zzzparanoidal__/graphics/train/hiend/ht-generic-wagon/icon-map-selected.png",
				flags = { "icon" },
				size = { 20, 44 },
				scale = 0.4,
			},
			--wheels = standard_train_wheels,
			drive_over_tie_trigger = drive_over_tie(),
			tie_distance = 50,
			crash_trigger = crash_trigger(),
			open_sound = sounds.cargo_wagon_open,
			close_sound = sounds.cargo_wagon_close,
			sound_minimum_speed = 1,
			vehicle_impact_sound = sounds.generic_impact,
			equipment_grid = "cargo-wagon",
			water_reflection = locomotive_reflection(),
		},

		-------------------------------------------------------------------------------------------------
		--вагон-цистерна
		{
			type = "item",
			name = "hiend_fluid_wagon",
			icon = "__zzzparanoidal__/graphics/train/hiend/ht-generic-fluid-wagon.png",
			icon_size = 64,
			subgroup = "fluid-wagon",
			order = "z",
			place_result = "hiend_fluid_wagon",
			stack_size = 10,
		},
		-------------------------------------------------------------------------------------------------
		{
			type = "recipe",
			name = "hiend_fluid_wagon",
			energy_required = 5,
			enabled = false,
			ingredients = {
				{ type = "item", name = "bob-fluid-wagon-3", amount = 1},
				{ type = "item", name = "bob-advanced-processing-unit", amount = 20},
				{ type = "item", name = "bob-nitinol-bearing", amount = 15},
				{ type = "item", name = "bob-nitinol-gear-wheel", amount = 10},
				{ type = "item", name = "bob-nitinol-alloy", amount = 10},
				{ type = "item", name = "bob-storage-tank-4", amount = 1},
			},
			results = { { type = "item", name = "hiend_fluid_wagon", amount = 1} },
		},
		-------------------------------------------------------------------------------------------------
		{
			type = "fluid-wagon",
			name = "hiend_fluid_wagon",
			icon = "__zzzparanoidal__/graphics/train/hiend/ht-generic-fluid-wagon.png",
			icon_size = 64,
			flags = { "placeable-neutral", "player-creation", "placeable-off-grid" },
			minable = { mining_time = 0.5, result = "hiend_fluid_wagon" },
			mined_sound = { filename = "__core__/sound/deconstruct-large.ogg", volume = 0.8 },
			max_health = 600,
			corpse = "fluid-wagon-remnants",
			dying_explosion = "fluid-wagon-explosion",
			collision_box = { { -0.6, -2.4 }, { 0.6, 2.4 } },
			selection_box = { { -1, -2.7 }, { 1, 3.3 } },
			--damaged_trigger_effect = hit_effects.entity(),
			vertical_selection_shift = -0.5,
			weight = 500,
			max_speed = 1.7,
			braking_force = 25,
			friction_force = 0.40,
			air_resistance = 0.0050,
			connection_distance = 3,
			joint_distance = 4,
			energy_per_hit_point = 5,
			capacity = 50000,
			resistances = {
				{ type = "fire", decrease = 15, percent = 90 },
				{ type = "physical", decrease = 15, percent = 20 },
				{ type = "impact", decrease = 50, percent = 40 },
				{ type = "explosion", decrease = 15, percent = 30 },
				{ type = "acid", decrease = 3, percent = 90 },
			},
			--back_light = rolling_stock_back_light(),
			stand_by_light = rolling_stock_stand_by_light(),
			color = { r = 0.333, g = 0.768, b = 0.913 },
			pictures = {
				layers = {
					{
						dice = 4,
						priority = "very-low",
						width = 240,
						height = 224,
						direction_count = 256,
						allow_low_quality_rotation = true,
						filenames = {
							"__zzzparanoidal__/graphics/train/hiend/ht-generic-fluid-wagon/generic-fluid-wagon-1.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-generic-fluid-wagon/generic-fluid-wagon-2.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-generic-fluid-wagon/generic-fluid-wagon-3.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-generic-fluid-wagon/generic-fluid-wagon-4.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-generic-fluid-wagon/generic-fluid-wagon-5.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-generic-fluid-wagon/generic-fluid-wagon-6.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-generic-fluid-wagon/generic-fluid-wagon-7.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-generic-fluid-wagon/generic-fluid-wagon-8.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-generic-fluid-wagon/generic-fluid-wagon-9.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-generic-fluid-wagon/generic-fluid-wagon-10.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-generic-fluid-wagon/generic-fluid-wagon-11.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-generic-fluid-wagon/generic-fluid-wagon-12.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-generic-fluid-wagon/generic-fluid-wagon-13.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-generic-fluid-wagon/generic-fluid-wagon-14.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-generic-fluid-wagon/generic-fluid-wagon-15.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-generic-fluid-wagon/generic-fluid-wagon-16.png",
						},
						line_length = 4,
						lines_per_file = 4,
						shift = util.by_pixel(0, -5),
					},

					{
						priority = "very-low",
						dice = 4,
						flags = { "shadow" },
						width = 480,
						height = 448,
						direction_count = 256,
						draw_as_shadow = true,
						allow_low_quality_rotation = true,
						filenames = {
							"__zzzparanoidal__/graphics/train/hiend/ht-generic-fluid-wagon/sh-1.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-generic-fluid-wagon/sh-2.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-generic-fluid-wagon/sh-3.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-generic-fluid-wagon/sh-4.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-generic-fluid-wagon/sh-5.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-generic-fluid-wagon/sh-6.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-generic-fluid-wagon/sh-7.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-generic-fluid-wagon/sh-8.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-generic-fluid-wagon/sh-9.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-generic-fluid-wagon/sh-10.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-generic-fluid-wagon/sh-11.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-generic-fluid-wagon/sh-12.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-generic-fluid-wagon/sh-13.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-generic-fluid-wagon/sh-14.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-generic-fluid-wagon/sh-15.png",
							"__zzzparanoidal__/graphics/train/hiend/ht-generic-fluid-wagon/sh-16.png",
						},
						line_length = 4,
						lines_per_file = 4,
						scale = 0.55,
						shift = util.by_pixel(48, 12),
					},
				},
			},
			minimap_representation = {
				filename = "__zzzparanoidal__/graphics/train/hiend/ht-generic-fluid-wagon/icon-map.png",
				flags = { "icon" },
				size = { 20, 44 },
				scale = 0.4,
			},
			selected_minimap_representation = {
				filename = "__zzzparanoidal__/graphics/train/hiend/ht-generic-fluid-wagon/icon-map-selected.png",
				flags = { "icon" },
				size = { 20, 44 },
				scale = 0.4,
			},
			--wheels = standard_train_wheels,
			drive_over_tie_trigger = drive_over_tie(),
			tie_distance = 50,
			crash_trigger = crash_trigger(),
			open_sound = sounds.cargo_wagon_open,
			close_sound = sounds.cargo_wagon_close,
			sound_minimum_speed = 1,
			vehicle_impact_sound = sounds.generic_impact,
			water_reflection = locomotive_reflection(),
			equipment_grid = "cargo-wagon",
		},
		-------------------------------------------------------------------------------------------------
		{
			type = "technology",
			name = "hiend_train",
			icon = "__zzzparanoidal__/graphics/train/hiend/ht-trains-tech.png",
			icon_size = 128,
			icon_mipmaps = 1,
			effects = {
				{ type = "unlock-recipe", recipe = "hiend_loco" },
				{ type = "unlock-recipe", recipe = "hiend_wagon" },
				{ type = "unlock-recipe", recipe = "hiend_fluid_wagon" },
				{ type = "unlock-recipe", recipe = "super_charger" },
			},
			prerequisites = { "bet-fuel-4", "bob-fluid-handling-4", "raw-speed-module-6" },
			unit = {
				count = 1000,
				ingredients = {
					{ "automation-science-pack", 1},
					{ "logistic-science-pack", 1},
					{ "chemical-science-pack", 1},
					{ "bob-advanced-logistic-science-pack", 1},
					{ "production-science-pack", 1},
					{ "utility-science-pack", 1},
				},
				time = 30,
			},
			order = "4",
		},
	})
end
--###############################################################################################
--создаем машинку с огнеметом
local flame_car = table.deepcopy(data.raw.car.car)
flame_car.name = "flame_car"
flame_car.minable = { mining_time = 0.4, result = "flame_car" }
flame_car.resistances = {
	{ type = "fire", percent = 100 },
	{ type = "impact", percent = 30, decrease = 50 },
	{ type = "acid", percent = 20 },
}
flame_car.guns = { "tank-flamethrower" }
flame_car.equipment_grid = "car"

data:extend({ flame_car })
-------------------------------------------------------------------------------------------------
data:extend({
	{
		type = "recipe",
		name = "flame_car",
		enabled = false,
		energy_required = 20,
		ingredients = {
			{ type = "item", name = "iron-gear-wheel", amount = 30 },
			{ type = "item", name = "steel-plate", amount = 40 },
			{ type = "item", name = "engine-unit", amount = 16 },
			{ type = "item", name = "flamethrower", amount = 3 },
		},
		results = { { type = "item", name = "flame_car", amount = 1 } },
	},
	-------------------------------------------------------------------------------------------------
	{
		type = "item",
		name = "flame_car",
		icons = {
			{
				icon = "__base__/graphics/icons/car.png",
				icon_size = 64,
				icon_mipmaps = 4,
			},
			{
				icon = "__base__/graphics/icons/flamethrower.png",
				icon_size = 64,
				icon_mipmaps = 4,
				scale = 0.3,
				shift = { -10, -10 },
			},
		},
		icon_size = 64,
		subgroup = "transport",
		order = "b[personal-transport]-b[car]",
		stack_size = 1,
		place_result = "flame_car",
	},
	-------------------------------------------------------------------------------------------------
	{
		type = "technology",
		name = "flame_car",
		icons = {
			{
				icon = "__base__/graphics/technology/automobilism.png",
				icon_size = 256,
				icon_mipmaps = 4,
			},
			{
				icon = "__base__/graphics/technology/refined-flammables.png",
				icon_size = 256,
				icon_mipmaps = 4,
				scale = 0.5,
				shift = { -60, 50 },
			},
		},
		effects = { { type = "unlock-recipe", recipe = "flame_car" } },
		prerequisites = { "flamethrower", "automobilism" },
		unit = {
			count = 50,
			ingredients = {
				{ "automation-science-pack", 1},
				{ "logistic-science-pack", 1},
				{ "military-science-pack", 1},
			},
			time = 30,
		},
		order = "1",
	},
})

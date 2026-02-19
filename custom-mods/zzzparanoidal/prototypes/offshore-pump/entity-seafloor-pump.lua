local blank = {
	filename = "__zzzparanoidal__/graphics/blank.png",
	priority = "high",
	width = 1,
	height = 1,
	frame_count = 1,
}

local offshore_pump_output_template = {
	type = "pump",
	collision_box = { { -0.9, -0 }, { 0.9, 0.65 } },
	fluid_box = {
		volume = 1000,
		base_area = 1,
		height = 2,
		pipe_covers = pipecoverspictures(),
		pipe_connections = {
			{
				direction = defines.direction.north,
				flow_direction = "output",
				position = {
					0,
					0.2,
				},
			},

			{
				direction = defines.direction.south,
				flow_direction = "input",
				position = {
					0,
					0.1,
				},
			},
		},
	},

	order = "z",
	icon_size = 64,
	icon_mipmaps = 4,
	flags = { "placeable-neutral", "player-creation", "not-deconstructable", "not-blueprintable", "placeable-off-grid" },
	max_health = 150,
	resistances = {
		{
			type = "fire",
			percent = 70,
		},
		{
			type = "impact",
			percent = 30,
		},
	},
	corpse = nil,
	pumping_speed = 10000, -- change in zzz
	vehicle_impact_sound = {
		filename = "__base__/sound/car-metal-impact-1.ogg",
		volume = 0.65,
	},
	glass_pictures = nil,
	fluid_animation = nil,
	water_reflection = nil,
	circuit_wire_connection_points = circuit_connector_definitions["pump"].points,
	circuit_connector_sprites = circuit_connector_definitions["pump"].sprites,
	circuit_wire_max_distance = default_circuit_wire_max_distance,
}

-- ##############################
-----SEAFLOOR MK1

local seafloor_pump = data.raw["offshore-pump"]["angels-seafloor-pump"]
seafloor_pump.flags = seafloor_pump.flags or {}
table.insert(seafloor_pump.flags, "hide-alt-info")
seafloor_pump.fluid_box.pipe_connections = {
	{
		direction = defines.direction.north,
		flow_direction = "output",
		position = {
			0,
			0.2,
		},
	},
}
seafloor_pump.selectable_in_game = false

local seafloor_pump_output = table.deepcopy(offshore_pump_output_template)
seafloor_pump_output.animations = {
	north = {
		filename = "__angelsrefininggraphics__/graphics/entity/seafloor-pump/seafloor-pump.png",
		width = 160,
		height = 160,
		line_length = 1,
		frame_count = 1,
		animation_speed = 0.5,
		shift = { 0, -1 },
	},
	east = {
		filename = "__angelsrefininggraphics__/graphics/entity/seafloor-pump/seafloor-pump.png",
		width = 160,
		height = 160,
		x = 160,
		line_length = 1,
		frame_count = 1,
		animation_speed = 0.5,
		shift = { 1, 0 },
	},

	south = {
		filename = "__angelsrefininggraphics__/graphics/entity/seafloor-pump/seafloor-pump.png",
		width = 160,
		height = 160,
		x = 320,
		line_length = 1,
		frame_count = 1,
		animation_speed = 0.5,
		shift = { 0, 1 },
	},
	west = {
		filename = "__angelsrefininggraphics__/graphics/entity/seafloor-pump/seafloor-pump.png",
		width = 160,
		height = 160,
		x = 480,
		line_length = 1,
		frame_count = 1,
		animation_speed = 0.5,
		shift = { -1, 0 },
	},
}
seafloor_pump_output.name = "seafloor-pump-output"
seafloor_pump_output.icon = "__angelsrefininggraphics__/graphics/icons/seafloor-pump-ico.png"
seafloor_pump_output.icon_size = 32
seafloor_pump_output.localised_name = { "entity-name.seafloor-pump" }
seafloor_pump_output.minable = seafloor_pump.minable
seafloor_pump_output.placeable_by = { item = "angels-seafloor-pump", count = 1 }
seafloor_pump_output.pumping_speed = seafloor_pump.pumping_speed
seafloor_pump_output.selectable_in_game = true
-- seafloor_pump_output.create_ghost_on_death = false --test
seafloor_pump_output.selection_box = seafloor_pump.selection_box
seafloor_pump_output.energy_source =
	{ type = "electric", usage_priority = "secondary-input", emissions_per_minute = { pollution = 10 } }
seafloor_pump_output.energy_usage = "500kW"
data:extend({ seafloor_pump_output })

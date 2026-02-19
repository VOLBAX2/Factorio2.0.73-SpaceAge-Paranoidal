---@meta


---@class (exact) PrototypeBase 
---@field factoriopedia_description LocalisedString  Provides additional description used in factoriopedia. 
---@field factoriopedia_simulation SimulationDefinition  The simulation shown when looking at this prototype in the Factoriopedia GUI. 
---@field hidden boolean (default: literal: value: False)  
---@field hidden_in_factoriopedia boolean (default: Value of `hidden`)  
---@field localised_description LocalisedString  Overwrites the description set in the [locale file](https://wiki.factorio.com/Tutorial:Localisation). The description is usually shown in the tooltip of the prototype. 
---@field localised_name LocalisedString  Overwrites the name set in the [locale file](https://wiki.factorio.com/Tutorial:Localisation). Can be used to easily set a procedurally-generated name because the LocalisedString format allows to insert parameters into the name directly from the Lua script. 
---@field name string  Unique textual identification of the prototype. May only contain alphanumeric characters, dashes and underscores. May not exceed a length of 200 characters.
---
---For a list of all names used in vanilla, see [data.raw](https://wiki.factorio.com/Data.raw). 
---@field order Order (default: literal: value: ) Used to order prototypes in inventory, recipes and GUIs. May not exceed a length of 200 characters. 
---@field parameter boolean (default: literal: value: False) Whether the prototype is a special type which can be used to parametrize blueprints and doesn't have other function. 
---@field subgroup ItemSubGroupID  The name of an [ItemSubGroup](prototype:ItemSubGroup). 
---@field type string  Specifies the kind of prototype this is.
---
---For a list of all possible types, see the [prototype overview](prototype:prototypes). 
---typename: null
---The abstract base for prototypes. PrototypeBase defines the common features of prototypes, such as localization and order.
PrototypeBase = {}


---@class (exact) Prototype : PrototypeBase
---@field custom_tooltip_fields {'complex_type': 'array', 'value': 'CustomTooltipField'}  Allows to add extra description items to the tooltip and Factoriopedia. 
---@field factoriopedia_alternative string  The ID type corresponding to the prototype that inherits from this.
---
---For example, if this is an [EntityPrototype](prototype:EntityPrototype), this property's type is [EntityID](prototype:EntityID). 
---@parent PrototypeBase
---
--- typename: null
--- 
Prototype = {}


---@class (exact) EntityPrototype : Prototype
---@field additional_pastable_entities {'complex_type': 'array', 'value': 'EntityID'}  Names of the entity prototypes this entity prototype can be pasted on to in addition to the standard supported types.
---
---This is used to allow copying between types that aren't compatible on the C++ code side, by allowing mods to receive the [on_entity_settings_pasted](runtime:on_entity_settings_pasted) event for the given entity and do the setting pasting via script. 
---@field alert_icon_scale float   
---@field alert_icon_shift Vector   
---@field allow_copy_paste boolean (default: literal: value: True)  
---@field ambient_sounds {'complex_type': 'union', 'options': ['WorldAmbientSoundDefinition', {'complex_type': 'array', 'value': 'WorldAmbientSoundDefinition'}], 'full_format': False}   
---@field ambient_sounds_group EntityID   
---@field autoplace AutoplaceSpecification (default: nil (entity is not autoplacable)) Used to specify the rules for placing this entity during map generation. 
---@field build_base_evolution_requirement double (default: literal: value: 0)  
---@field build_grid_size uint8 (default: literal: value: 1) Supported values are 1 (for 1x1 grid) and 2 (for 2x2 grid, like rails).
---
---Internally forced to be `2` for [RailPrototype](prototype:RailPrototype), [RailRemnantsPrototype](prototype:RailRemnantsPrototype), [TrainStopPrototype](prototype:TrainStopPrototype), [RailSupportPrototype](prototype:RailSupportPrototype) and [CargoBayPrototype](prototype:CargoBayPrototype).
---
---Internally forced to be `256` for [SpacePlatformHubPrototype](prototype:SpacePlatformHubPrototype). 
---@field build_sound Sound   
---@field close_sound Sound   
---@field collision_box BoundingBox (default: Empty = `{{0, 0}, {0, 0}}`) Specification of the entity collision boundaries. Empty collision box means no collision and is used for smoke, projectiles, particles, explosions etc.
---
---The `{0,0}` coordinate in the collision box will match the entity position. It should be near the center of the collision box, to keep correct entity drawing order. The bounding box must include the `{0,0}` coordinate.
---
---Note, that for buildings, it is customary to leave 0.1 wide border between the edge of the tile and the edge of the building, this lets the player move between the building and electric poles/inserters etc. 
---@field collision_mask CollisionMaskConnector  Defaults to the mask from [UtilityConstants::default_collision_masks](prototype:UtilityConstants::default_collision_masks) when indexed by the entity type. 
---@field created_effect Trigger  The effect/trigger that happens when the entity is placed. 
---@field created_smoke CreateTrivialSmokeEffectItem (default: The "smoke-building"-smoke) The smoke that is shown when the entity is placed. 
---@field deconstruction_alternative EntityID  Used to merge multiple entities into one entry in the deconstruction planner. 
---@field diagonal_tile_grid_size TilePosition   
---@field draw_stateless_visualisations_in_ghost boolean (default: literal: value: False)  
---@field drawing_box_vertical_extension double (default: literal: value: 0.0) Specification of extra vertical space needed to see the whole entity in GUIs. This is used to calculate the correct zoom and positioning in the entity info gui, for example in the entity tooltip. 
---@field emissions_per_second {'complex_type': 'dictionary', 'key': 'AirbornePollutantID', 'value': 'double'}  Amount of emissions created (positive number) or cleaned (negative number) every second by the entity. This is passive and currently used just for trees and fires. This is independent of the [emissions of energy sources](prototype:BaseEnergySource::emissions_per_minute) used by machines, which are created actively depending on the power consumption. 
---@field enemy_map_color Color   
---@field fast_replaceable_group string (default: literal: value: ) This allows you to replace an entity that's already placed, with a different one in your inventory. For example, replacing a burner inserter with a fast inserter. The replacement entity can be a different rotation to the replaced entity and you can replace an entity with the same type.
---
---This is simply a string, so any string can be used here. The entity that should be replaced simply has to use the same string here.
---
---Entities with the same fast replaceable group can be configured as upgrades for each other in the upgrade planner. Refer to the [upgrade planner prototype's page](prototype:UpgradeItemPrototype) the full requirements for entities to be shown in the upgrade planner. 
---@field flags EntityPrototypeFlags   
---@field friendly_map_color Color   
---@field heating_energy Energy (default: literal: value: 0W) This entity can freeze if heating_energy is larger than zero. 
---@field hit_visualization_box BoundingBox (default: Empty = `{{0, 0}, {0, 0}}`) Where beams should hit the entity. Useful if the bounding box only covers part of the entity (e.g. feet of the character) and beams only hitting there would look weird. 
---@field icon FileName  Path to the icon file.
---
---Either this or `icons` is mandatory for entities that have at least one of these flags active: `"placeable-neutral"`, `"placeable-player`", `"placeable-enemy"`.
---
---Only loaded if `icons` is not defined. 
---@field icon_draw_specification IconDrawSpecification  Used to specify where and how the alt-mode icons should be drawn. 
---@field icon_size SpriteSizeType (default: literal: value: 64) The size of the square icon, in pixels. E.g. `32` for a 32px by 32px icon. Must be larger than `0`.
---
---Only loaded if `icons` is not defined. 
---@field icons {'complex_type': 'array', 'value': 'IconData'}  This will be used in the electric network statistics, editor building selection, and the bonus gui. Can't be an empty array.
---
---Either this or `icon` is mandatory for entities that have at least one of these flags active: `"placeable-neutral"`, `"placeable-player`", `"placeable-enemy"`. 
---@field icons_positioning {'complex_type': 'array', 'value': 'IconSequencePositioning'}   
---@field impact_category string (default: literal: value: default) Name of a [ImpactCategory](prototype:ImpactCategory). 
---@field map_color Color   
---@field map_generator_bounding_box BoundingBox (default: The value of collision_box.) Used instead of the collision box during map generation. Allows space entities differently during map generation, for example if the box is bigger, the entities will be placed farther apart. 
---@field minable MinableProperties (default: not minable) The item given to the player when they mine the entity and other properties relevant to mining this entity. 
---@field mined_sound Sound   
---@field mining_sound Sound   
---@field next_upgrade EntityID  Name of the entity that will be automatically selected as the upgrade of this entity when using the [upgrade planner](prototype:UpgradeItemPrototype) without configuration.
---
---This entity may not have "not-upgradable" flag set and must be minable. This entity mining result must not contain item product with [hidden](prototype:ItemPrototype::hidden) set to `true`. Mining results with no item products are allowed. This entity may not be a [RollingStockPrototype](prototype:RollingStockPrototype).
---
---The upgrade target entity needs to have the same bounding box, collision mask, and fast replaceable group as this entity. The upgrade target entity must have least 1 item that builds it that isn't hidden. 
---@field open_sound Sound   
---@field order Order  Used to order prototypes in inventory, recipes and GUIs. May not exceed a length of 200 characters.
---
---The order string is taken from the items in `placeable_by` if they exist, or from an item that has its [place_result](prototype:ItemPrototype::place_result) set to this entity. 
---@field placeable_by {'complex_type': 'union', 'options': ['ItemToPlace', {'complex_type': 'array', 'value': 'ItemToPlace'}], 'full_format': False}  Item that when placed creates this entity. Determines which item is picked when "Q" (smart pipette) is used on this entity. Determines which item and item amount is needed in a blueprint of this entity and to revive a ghost of this entity.
---
---The item count specified here can't be larger than the stack size of that item. 
---@field placeable_position_visualization Sprite   
---@field protected_from_tile_building boolean (default: literal: value: True) When this is true, this entity prototype should be included during tile collision checks with tiles that have [TilePrototype::check_collision_with_entities](prototype:TilePrototype::check_collision_with_entities) set to true. 
---@field radius_visualisation_specification RadiusVisualisationSpecification   
---@field remains_when_mined {'complex_type': 'union', 'options': ['EntityID', {'complex_type': 'array', 'value': 'EntityID'}], 'full_format': False}  The entity that remains when this one is mined, deconstructed or fast-replaced. The entity wont actually be spawned if it would collide with the entity that is in the process of being mined. 
---@field remove_decoratives {'complex_type': 'union', 'options': [{'complex_type': 'literal', 'value': 'automatic'}, {'complex_type': 'literal', 'value': 'true'}, {'complex_type': 'literal', 'value': 'false'}], 'full_format': False} (default: literal: value: automatic) Whether this entity should remove decoratives that collide with it when this entity is built. When set to "automatic", if the entity type is considered [a building](runtime:LuaEntityPrototype::is_building) (e.g. an assembling machine or a wall) it will remove decoratives. 
---@field rotated_sound Sound   
---@field selectable_in_game boolean (default: literal: value: True)  
---@field selection_box BoundingBox (default: Empty = `{{0, 0}, {0, 0}}`) Specification of the entity selection area. When empty the entity will have no selection area (and thus is not selectable).
---
---The selection box is usually a little bit bigger than the collision box. For tileable entities (like buildings) it should match the tile size of the building. 
---@field selection_priority uint8 (default: literal: value: 50) The entity with the higher number is selectable before the entity with the lower number.
---
---The value `0` will be treated the same as `nil`. 
---@field shooting_cursor_size double  The cursor size used when shooting at this entity. 
---@field stateless_visualisation {'complex_type': 'union', 'options': ['StatelessVisualisation', {'complex_type': 'array', 'value': 'StatelessVisualisation'}], 'full_format': False}   
---@field sticker_box BoundingBox (default: The value of collision_box.) Used to set the area of the entity that can have stickers on it, currently only used for units to specify the area where the green slow down stickers can appear. 
---@field surface_conditions {'complex_type': 'array', 'value': 'SurfaceCondition'}   
---@field tile_buildability_rules {'complex_type': 'array', 'value': 'TileBuildabilityRule'}   
---@field tile_height int32 (default: calculated by the collision box height rounded up.)  
---@field tile_width int32 (default: calculated by the collision box width rounded up.) Used to determine how the center of the entity should be positioned when building (unless the off-grid [flag](prototype:EntityPrototypeFlags) is specified).
---
---When the tile width is odd, the center will be in the center of the tile, when it is even, the center is on the tile transition. 
---@field trigger_target_mask TriggerTargetMask  Defaults to the mask from [UtilityConstants::default_trigger_target_mask_by_type](prototype:UtilityConstants::default_trigger_target_mask_by_type). 
---@field water_reflection WaterReflectionDefinition  May also be defined inside `graphics_set` instead of directly in the entity prototype. This is useful for entities that use a `graphics_set` property to define their graphics, because then all graphics can be defined in one place.
---
---[Currently only renders](https://forums.factorio.com/100703) for [EntityWithHealthPrototype](prototype:EntityWithHealthPrototype) and [CorpsePrototype](prototype:CorpsePrototype). 
---@field working_sound WorkingSound  Will also work on entities that don't actually do work. 
---@parent Prototype
---
--- typename: null
--- Abstract base of all entities in the game. Entity is nearly everything that can be on the map (except tiles).
---
---For in game script access to entity, take a look at [LuaEntity](runtime:LuaEntity).
EntityPrototype = {}


---@class (exact) EntityWithHealthPrototype : EntityPrototype
---@field alert_when_damaged boolean (default: literal: value: True)  
---@field attack_reaction {'complex_type': 'union', 'options': ['AttackReactionItem', {'complex_type': 'array', 'value': 'AttackReactionItem'}], 'full_format': False} (default: Empty)  
---@field corpse {'complex_type': 'union', 'options': ['EntityID', {'complex_type': 'array', 'value': 'EntityID'}], 'full_format': False} (default: Empty) Specifies the names of the [CorpsePrototype](prototype:CorpsePrototype) to be used when this entity dies. 
---@field create_ghost_on_death boolean (default: literal: value: True)  
---@field damaged_trigger_effect TriggerEffect   
---@field dying_explosion {'complex_type': 'union', 'options': ['ExplosionDefinition', {'complex_type': 'array', 'value': 'ExplosionDefinition'}], 'full_format': False}  The entities that are spawned in place of this one when it dies. 
---@field dying_trigger_effect TriggerEffect   
---@field healing_per_tick float (default: literal: value: 0) The amount of health automatically regenerated per tick. The entity must be active for this to work. 
---@field hide_resistances boolean (default: literal: value: True) Whether the resistances of this entity should be hidden in the entity tooltip. 
---@field integration_patch Sprite4Way  May also be defined inside `graphics_set` instead of directly in the entity prototype. This is useful for entities that use a `graphics_set` property to define their graphics, because then all graphics can be defined in one place.
---
---Sprite drawn on ground under the entity to make it feel more integrated into the ground. 
---@field integration_patch_render_layer RenderLayer (default: literal: value: lower-object) May also be defined inside `graphics_set` instead of directly in the entity prototype. This is useful for entities that use a `graphics_set` property to define their graphics, because then all graphics can be defined in one place. 
---@field loot {'complex_type': 'array', 'value': 'LootItem'}  The loot is dropped on the ground when the entity is killed. 
---@field max_health float (default: literal: value: 10) The unit health can never go over the maximum. Default health of units on creation is set to max. Must be greater than 0. 
---@field overkill_fraction float (default: literal: value: 0.05) Fraction of health by which predicted damage must be exceeded before entity is considered as "predicted to die" causing turrets (and others) to stop shooting more projectiles. If entity is healing it is better to keep larger margin to avoid cases where not enough projectiles goes towards a target and it heals causing it to survive all the incoming projectiles. If entity does not heal, margin may be reduced. Must be >= 0. 
---@field random_corpse_variation boolean (default: literal: value: False)  
---@field repair_sound Sound (default: Utility sound defaultManualRepair) Played when this entity is repaired with a [RepairToolPrototype](prototype:RepairToolPrototype). 
---@field repair_speed_modifier float (default: literal: value: 1) Multiplier of [RepairToolPrototype::speed](prototype:RepairToolPrototype::speed) for this entity prototype. 
---@field resistances {'complex_type': 'array', 'value': 'Resistance'}  See [damage](https://wiki.factorio.com/Damage). 
---@parent EntityPrototype
---
--- typename: null
--- Abstract base of all entities with health in the game.
EntityWithHealthPrototype = {}


---@class (exact) EntityWithOwnerPrototype : EntityWithHealthPrototype
---@field allow_run_time_change_of_is_military_target boolean (default: literal: value: False) If this is true, this entity's `is_military_target` property can be changed during runtime (on the entity, not on the prototype itself). 
---@field is_military_target boolean (default: literal: value: False) Whether this prototype should be a high priority target for enemy forces. See [Military units and structures](https://wiki.factorio.com/Military_units_and_structures). 
---@field quality_indicator_scale double (default: Calculated based on entity tile_width and height) The default scale is based on the tile distance of the shorter dimension. Where size 3 results into scale 1. The default minimum is 0.5 and maximum 1.0. 
---@field quality_indicator_shift Vector  The shift from the bottom left corner of the selection box. 
---@parent EntityWithHealthPrototype
---
--- typename: null
--- Abstract base of all entities with a force in the game. These entities have a [LuaEntity::unit_number](runtime:LuaEntity::unit_number) during runtime. Can be high priority [military targets](https://wiki.factorio.com/Military_units_and_structures).
EntityWithOwnerPrototype = {}


---@class (exact) AccumulatorPrototype : EntityWithOwnerPrototype
---@field chargable_graphics ChargableGraphics   
---@field circuit_connector CircuitConnectorDefinition   
---@field circuit_wire_max_distance double (default: literal: value: 0) The maximum circuit wire distance for this entity. 
---@field default_output_signal SignalIDConnector  The name of the signal that is the default for when an accumulator is connected to the circuit network. 
---@field draw_circuit_wires boolean (default: literal: value: True)  
---@field draw_copper_wires boolean (default: literal: value: True)  
---@field energy_source ElectricEnergySource  The capacity of the energy source buffer specifies the capacity of the accumulator. 
---@parent EntityWithOwnerPrototype
---
--- typename: accumulator
--- Entity with energy source with specialised animation for charging/discharging. Used for the [accumulator](https://wiki.factorio.com/Accumulator) entity.
AccumulatorPrototype = {}


---@class (exact) AchievementPrototype : Prototype
---@field allowed_without_fight boolean (default: literal: value: True) If this is set to `false`, it is not possible to complete the achievement on the peaceful difficulty setting or when the enemy base generation settings have been changed. 
---@field icon FileName  Path to the icon file.
---
---Only loaded, and mandatory if `icons` is not defined. 
---@field icon_size SpriteSizeType (default: literal: value: 64) The size of the square icon, in pixels. E.g. `32` for a 32px by 32px icon. Must be larger than `0`.
---
---The base game uses 128px icons for achievements.
---
---Only loaded if `icons` is not defined. 
---@field icons {'complex_type': 'array', 'value': 'IconData'}  Can't be an empty array. 
---@field steam_stats_name string (default: literal: value: ) Unusable by mods, as this refers to unlocking the achievement through Steam. 
---@parent Prototype
---
--- typename: achievement
--- This prototype definition is used for the in-game achievements.
AchievementPrototype = {}


---@class (exact) AchievementPrototypeWithCondition : AchievementPrototype
---@field objective_condition {'complex_type': 'union', 'options': [{'complex_type': 'literal', 'value': 'game-finished'}, {'complex_type': 'literal', 'value': 'rocket-launched'}, {'complex_type': 'literal', 'value': 'late-research'}], 'full_format': False}  The condition that needs to be met to receive the achievement. Required for `"complete-objective-achievement"`, `"dont-build-entity-achievement"`, and `"dont-craft-manually-achievement"`. Not allowed for `"dont-kill-manually-achievement"` and `"dont-research-before-researching-achievement"`. Only allowed for `"dont-use-entity-in-energy-production-achievement"` if `"last_hour_only"` is `false`. 
---@parent AchievementPrototype
---
--- typename: null
--- 
AchievementPrototypeWithCondition = {}


---@class (exact) EquipmentPrototype : Prototype
---@field background_border_color Color (default: equipment_default_background_border_color in utility constants) The color that the border of the background of this equipment should have when shown inside an equipment grid. 
---@field background_color Color (default: equipment_default_background_color in utility constants) The color that the background of this equipment should have when shown inside an equipment grid. 
---@field categories {'complex_type': 'array', 'value': 'EquipmentCategoryID'}  Sets the categories of the equipment. It can only be inserted into [grids](prototype:EquipmentGridPrototype::equipment_categories) with at least one matching category. 
---@field energy_source ElectricEnergySource   
---@field grabbed_background_color Color (default: equipment_default_grabbed_background_color in utility constants) The color that the background of this equipment should have when held in the players hand and hovering over an equipment grid. 
---@field shape EquipmentShape  How big this equipment should be in the grid and whether it should be one solid rectangle or of a custom shape. 
---@field sprite Sprite  The graphics to use when this equipment is shown inside an equipment grid. 
---@field take_result ItemID (default: `name` of this prototype) Name of the item prototype that should be returned to the player when they remove this equipment from an equipment grid. 
---@parent Prototype
---
--- typename: null
--- Abstract base of all equipment modules. Equipment modules can be inserted into [equipment grids](prototype:EquipmentGridPrototype).
EquipmentPrototype = {}


---@class (exact) ActiveDefenseEquipmentPrototype : EquipmentPrototype
---@field attack_parameters AttackParameters   
---@field automatic boolean   
---@parent EquipmentPrototype
---
--- typename: active-defense-equipment
--- Used by [discharge defense](https://wiki.factorio.com/Discharge_defense) and [personal laser defense](https://wiki.factorio.com/Personal_laser_defense).
ActiveDefenseEquipmentPrototype = {}


---@class (exact) ActiveTriggerPrototype : Prototype
---@parent Prototype
---
--- typename: null
--- The abstract base of all active trigger prototypes. Active triggers are a special type of trigger delivery mechanism that function of a period of time and do not result in the creation or deletion of entities to function. They are intended to be short-lived objects associated with a surface and cannot be cancelled until they self-destruct. Active triggers support migrations and prototype changes, but require their own named prototype to function.
ActiveTriggerPrototype = {}


---@class (exact) AgriculturalTowerPrototype : EntityWithOwnerPrototype
---@field accepted_seeds {'complex_type': 'array', 'value': 'ItemID'}  When missing, all items with [plant result](prototype:ItemPrototype::plant_result) will be accepted. When provided, only items on this list that have plant result will be accepted. 
---@field arm_extending_sound InterruptibleSound   
---@field arm_extending_sound_source string   
---@field central_orienting_sound InterruptibleSound   
---@field central_orienting_sound_source string   
---@field circuit_connector CircuitConnectorDefinition   
---@field circuit_wire_max_distance double (default: literal: value: 0) The maximum circuit wire distance for this entity. 
---@field crane AgriculturalCraneProperties   
---@field crane_energy_usage Energy  The amount of energy this agricultural tower uses while the crane is moving. 
---@field draw_circuit_wires boolean (default: literal: value: True)  
---@field draw_copper_wires boolean (default: literal: value: True)  
---@field energy_source EnergySource   
---@field energy_usage Energy  The amount of energy this agricultural tower uses for each planted or harvested [plant](prototype:PlantPrototype). 
---@field graphics_set CraftingMachineGraphicsSet   
---@field grappler_extending_sound InterruptibleSound   
---@field grappler_extending_sound_source string   
---@field grappler_orienting_sound InterruptibleSound   
---@field grappler_orienting_sound_source string   
---@field growth_area_radius double (default: literal: value: 0.95) The minimum radius of empty space a [plant](prototype:PlantPrototype) requires around it to be planted.
---
---Must be >= 0 and <= growth_grid_tile_size / 2 
---@field growth_grid_tile_size uint32 (default: literal: value: 3) The size of one grid tile a [plant](prototype:PlantPrototype) is planted into.
---
---Must be positive. 
---@field harvesting_procedure_points {'complex_type': 'array', 'value': 'Vector3D'}   
---@field harvesting_sound Sound   
---@field input_inventory_size ItemStackIndex   
---@field output_inventory_size ItemStackIndex (default: literal: value: 0)  
---@field planting_procedure_points {'complex_type': 'array', 'value': 'Vector3D'}   
---@field planting_sound Sound   
---@field radius double  The radius represents [grid tiles](prototype:AgriculturalTowerPrototype::growth_grid_tile_size) which are created around the agricultural tower from its [collision box](prototype:EntityPrototype::collision_box).
---
---Must be positive. 
---@field radius_visualisation_picture Sprite   
---@field random_growth_offset double (default: literal: value: 0.25) The maximum offset from the grid tile center which will be applied to the planting spot selected by this agricultural tower.
---
---Must be >= 0 and < 1. 
---@field randomize_planting_tile boolean (default: literal: value: True) Whether the agricultural tower will start from a random grid tile when given a planting task. 
---@parent EntityWithOwnerPrototype
---
--- typename: agricultural-tower
--- 
AgriculturalTowerPrototype = {}


---@class (exact) AirbornePollutantPrototype : Prototype
---@field affects_evolution boolean   
---@field affects_water_tint boolean  If true, large amounts of this pollution will cause water tiles to turn a sickly green. 
---@field chart_color Color   
---@field damages_trees boolean (default: literal: value: True) If true, trees will occasionally take damage from this pollutant type. When they do, some amount of pollution is removed from the chunk equal to the map's `pollution_restored_per_tree_damage` setting. 
---@field icon Sprite   
---@field localised_name_with_amount string (default: literal: value: airborne-pollutant-name-with-amount.<name>) The translated plural string key to use when displaying this pollution's name with an amount. See [Tutorial:Localisation](https://wiki.factorio.com/Tutorial:Localisation). 
---@parent Prototype
---
--- typename: airborne-pollutant
--- A type of pollution that can spread throughout the chunks of a map.
AirbornePollutantPrototype = {}


---@class (exact) AmbientSound 
---@field name string  Unique textual identification of the prototype. 
---@field planet SpaceLocationID  Track without a planet is bound to space platforms. 
---@field sound Sound  Static music track.
---
---One of `sound` or `variable_sound` must be defined. Both cannot be defined together. 
---@field track_type AmbientSoundType   
---@field type {'complex_type': 'literal', 'value': 'ambient-sound'}  Specification of the type of the prototype. 
---@field variable_sound VariableAmbientSoundVariableSound  Variable music track.
---
---One of `sound` or `variable_sound` must be defined. Both cannot be defined together. 
---@field weight double (default: literal: value: 1) Cannot be less than zero.
---
---Cannot be defined if `track_type` is `"hero-track"`. 
---
---
--- typename: ambient-sound
--- This prototype is used to make sound while playing the game. This includes the game's [music](https://store.steampowered.com/app/436090/Factorio__Soundtrack/), composed by Daniel James Taylor.
AmbientSound = {}


---@class (exact) AmmoCategory : Prototype
---@field bonus_gui_order Order (default: literal: value: )  
---@field icon FileName  Path to the icon file.
---
---Only loaded if `icons` is not defined. 
---@field icon_size SpriteSizeType (default: literal: value: 64) The size of the square icon, in pixels. E.g. `32` for a 32px by 32px icon. Must be larger than `0`.
---
---Only loaded if `icons` is not defined. 
---@field icons {'complex_type': 'array', 'value': 'IconData'}  Can't be an empty array. 
---@parent Prototype
---
--- typename: ammo-category
--- An ammo category. Each weapon has an ammo category, and can use any ammo with the same ammo category. Ammo categories can also be upgraded by technologies.
AmmoCategory = {}


---@class (exact) ItemPrototype : Prototype
---@field auto_recycle boolean (default: literal: value: True) Whether the item should be included in the self-recycling recipes automatically generated by the quality mod.
---
---This property is not read by the game engine itself, but the quality mod's data-updates.lua file. This means it is discarded by the game engine after loading finishes. 
---@field burnt_result ItemID (default: literal: value: ) The item that is the result when this item gets burned as fuel. 
---@field close_sound Sound   
---@field color_hint ColorHintSpecification  Only used by hidden setting, support may be limited. 
---@field dark_background_icon FileName  If this is set, it is used to show items in alt-mode instead of the normal item icon. This can be useful to increase the contrast of the icon with the dark alt-mode [icon outline](prototype:UtilityConstants::item_outline_color).
---
---Path to the icon file.
---
---Only loaded if `dark_background_icons` is not defined. 
---@field dark_background_icon_size SpriteSizeType (default: literal: value: 64) The size of the square icon, in pixels. E.g. `32` for a 32px by 32px icon. Must be larger than `0`.
---
---Only loaded if `dark_background_icons` is not defined. 
---@field dark_background_icons {'complex_type': 'array', 'value': 'IconData'}  Can't be an empty array. 
---@field default_import_location SpaceLocationID (default: literal: value: nauvis)  
---@field destroyed_by_dropping_trigger Trigger  The effect/trigger that happens when an item is destroyed by being dropped on a [TilePrototype](prototype:TilePrototype) marked as destroying dropped items.
---
---This overrides the [TilePrototype::default_destroyed_dropped_item_trigger](prototype:TilePrototype::default_destroyed_dropped_item_trigger) from the tile. 
---@field drop_sound Sound   
---@field flags ItemPrototypeFlags  Specifies some properties of the item. 
---@field fuel_acceleration_multiplier double (default: literal: value: 1.0) Must be 0 or positive. 
---@field fuel_acceleration_multiplier_quality_bonus double  Additional fuel acceleration multiplier per quality level. Defaults to 30% of `fuel_acceleration_multiplier - 1` if `fuel_acceleration_multiplier` is larger than 1. Otherwise defaults to 0.
---
---Must be 0 or positive. 
---@field fuel_category FuelCategoryID (default: literal: value: ) Must exist when a nonzero fuel_value is defined. 
---@field fuel_emissions_multiplier double (default: literal: value: 1.0)  
---@field fuel_glow_color Color  Colors the glow of the burner energy source when this fuel is burned. Can also be used to color the glow of reactors burning the fuel, see [ReactorPrototype::use_fuel_glow_color](prototype:ReactorPrototype::use_fuel_glow_color). 
---@field fuel_top_speed_multiplier double (default: literal: value: 1.0) Must be 0 or positive. 
---@field fuel_top_speed_multiplier_quality_bonus double  Additional fuel top speed multiplier per quality level. Defaults to 30% of `fuel_top_speed_multiplier - 1` if `fuel_top_speed_multiplier` is larger than 1. Otherwise defaults to 0.
---
---Must be 0 or positive. 
---@field fuel_value Energy (default: literal: value: 0J) Amount of energy the item gives when used as fuel.
---
---Mandatory if `fuel_acceleration_multiplier`, `fuel_top_speed_multiplier` or `fuel_emissions_multiplier` or `fuel_glow_color` are used. 
---@field has_random_tint boolean (default: literal: value: True)  
---@field hidden boolean (default: literal: value: False) Item will not appear in lists of all items such as those for logistics requests, filters, etc. 
---@field icon FileName  Path to the icon file.
---
---Only loaded, and mandatory if `icons` is not defined. 
---@field icon_size SpriteSizeType (default: literal: value: 64) The size of the square icon, in pixels. E.g. `32` for a 32px by 32px icon. Must be larger than `0`.
---
---Only loaded if `icons` is not defined. 
---@field icons {'complex_type': 'array', 'value': 'IconData'}  Can't be an empty array. 
---@field ingredient_to_weight_coefficient double (default: literal: value: 0.5)  
---@field inventory_move_sound Sound   
---@field moved_to_hub_when_building boolean  Whether this item should be moved to the hub when space platform performs building, upgrade or deconstruction and is left with this item. The following items are considered valuable and moved to hub by default: [Modules](prototype:ModulePrototype), [items that build entities](prototype:ItemPrototype::place_result), [items that build tiles](prototype:ItemPrototype::place_as_tile) and items [not obtainable from asteroid chunks](prototype:AsteroidChunkPrototype::minable) that have [subgroup](prototype:PrototypeBase::subgroup) from a [group](prototype:ItemSubGroup::group) other than `"intermediate-products"`. 
---@field open_sound Sound   
---@field pick_sound Sound   
---@field pictures SpriteVariations  Used to give the item multiple different icons so that they look less uniform on belts. For inventory icons and similar, `icon/icons` will be used. Maximum number of variations is 16.
---
---When using sprites of size `64` (same as base game icons), the `scale` should be set to 0.5. 
---@field place_as_equipment_result EquipmentID (default: literal: value: )  
---@field place_as_tile PlaceAsTile   
---@field place_result EntityID (default: literal: value: ) Name of the [EntityPrototype](prototype:EntityPrototype) that can be built using this item. If this item should be the one that construction bots use to build the specified `place_result`, set the `"primary-place-result"` [item flag](prototype:ItemPrototypeFlags).
---
---The localised name of the entity will be used as the in-game item name. This behavior can be overwritten by specifying `localised_name` on this item, it will be used instead. 
---@field plant_result EntityID   
---@field random_tint_color Color (default: Value of UtilityConstants::item_default_random_tint_strength) Randomly tints item instances on belts and in the world. 0 no tinting. 1 full tint. 
---@field rocket_launch_products {'complex_type': 'array', 'value': 'ItemProductPrototype'}   
---@field send_to_orbit_mode SendToOrbitMode (default: literal: value: not-sendable) The way this item works when we try to send it to the orbit on its own.
---
---When "manual" is set, it can only be launched by pressing the launch button in the rocket silo.
---
---When "automated" is set, it will force the existence of "launch to orbit automatically" checkbox in the rocket silo which will then force the silo to automatically send the item to orbit when present. 
---@field spoil_level uint8 (default: literal: value: 0) Used by Inserters with spoil priority. Item with higher spoil level is considered more spoiled than item with lower spoil level regardless of progress of spoiling. 
---@field spoil_result ItemID   
---@field spoil_ticks uint32 (default: literal: value: 0)  
---@field spoil_to_trigger_result SpoilToTriggerResult   
---@field stack_size ItemCountType  Count of items of the same name that can be stored in one inventory slot. Must be 1 when the `"not-stackable"` flag is set. 
---@field weight Weight  The default weight is calculated automatically from recipes and falls back to [UtilityConstants::default_item_weight](prototype:UtilityConstants::default_item_weight).
---
---More information on how item weight is determined can be found on its [auxiliary page](runtime:item-weight). 
---@parent Prototype
---
--- typename: item
--- Possible configuration for all items.
ItemPrototype = {}


---@class (exact) AmmoItemPrototype : ItemPrototype
---@field ammo_category AmmoCategoryID   
---@field ammo_type {'complex_type': 'union', 'options': ['AmmoType', {'complex_type': 'array', 'value': 'AmmoType'}], 'full_format': False}  When using a plain [AmmoType](prototype:AmmoType) (no array), the ammo type applies to everything (`"default"`).
---
---When using an array of AmmoTypes, they have the additional [AmmoType::source_type](prototype:AmmoType::source_type) property. 
---@field magazine_size float (default: literal: value: 1) Number of shots before ammo item is consumed. Must be >= `1`. 
---@field reload_time float (default: literal: value: 0) Amount of extra time (in ticks) it takes to reload the weapon after depleting the magazine. Must be >= `0`. 
---@field shoot_protected boolean (default: literal: value: False)  
---@parent ItemPrototype
---
--- typename: ammo
--- Ammo used for a gun.
AmmoItemPrototype = {}


---@class (exact) TurretPrototype : EntityWithOwnerPrototype
---@field alert_when_attacking boolean (default: literal: value: True)  
---@field allow_turning_when_starting_attack boolean (default: literal: value: False)  
---@field attack_from_start_frame boolean (default: literal: value: False)  
---@field attack_parameters AttackParameters  Requires ammo_type in attack_parameters unless this is a [AmmoTurretPrototype](prototype:AmmoTurretPrototype). 
---@field attack_target_mask TriggerTargetMask (default: all masks)  
---@field attacking_animation RotatedAnimation8Way   
---@field attacking_speed float (default: literal: value: 1) Controls the speed of the attacking_animation: `1 ÷ attacking_speed = duration of the attacking_animation` 
---@field call_for_help_radius double   
---@field can_retarget_while_starting_attack boolean (default: literal: value: False)  
---@field circuit_connector {'complex_type': 'array', 'value': 'CircuitConnectorDefinition'}  Set of [circuit connector definitions](prototype:CircuitConnectorDefinition) for all directions used by this turret. Required amount of elements is based on other prototype values: 8 elements if building-direction-8-way flag is set, or 16 elements if building-direction-16-way flag is set, or 4 elements if turret_base_has_direction is set to true, or 1 element. 
---@field circuit_wire_max_distance double (default: literal: value: 0) The maximum circuit wire distance for this entity. 
---@field default_speed float (default: literal: value: 1)  
---@field default_speed_secondary float (default: Value of `default_speed`)  
---@field default_speed_when_killed float (default: Value of `default_speed`)  
---@field default_starting_progress_when_killed float (default: literal: value: 0)  
---@field draw_circuit_wires boolean (default: literal: value: True)  
---@field draw_copper_wires boolean (default: literal: value: True)  
---@field dying_sound Sound   
---@field ending_attack_animation RotatedAnimation8Way   
---@field ending_attack_speed float (default: Value of `default_speed`) Controls the speed of the ending_attack_animation: `1 ÷ ending_attack_speed = duration of the ending_attack_animation` 
---@field ending_attack_speed_secondary float (default: Value of `default_speed_secondary`)  
---@field ending_attack_speed_when_killed float (default: Value of `default_speed_when_killed`)  
---@field ending_attack_starting_progress_when_killed float (default: Value of `default_starting_progress_when_killed`)  
---@field energy_glow_animation RotatedAnimation8Way   
---@field energy_glow_animation_flicker_strength float (default: literal: value: 0.2) The range of the flickering of the alpha of `energy_glow_animation`. Default is range 0.2, so animation alpha can be anywhere between 0.8 and 1.0. 
---@field folded_animation RotatedAnimation8Way   
---@field folded_animation_is_stateless boolean (default: literal: value: False)  
---@field folded_speed float (default: Value of `default_speed`) It's randomized whether a particular turret uses the primary or the secondary speed for its animations.
---
---Controls the speed of the folded_animation: `1 ÷ folded_speed = duration of the folded_animation` 
---@field folded_speed_secondary float (default: Value of `default_speed_secondary`) It's randomized whether a particular turret uses the primary or the secondary speed for its animations.
---
---Controls the speed of the folded_animation: `1 ÷ folded_speed_secondary = duration of the folded_animation` 
---@field folded_speed_when_killed float (default: Value of `default_speed_when_killed`)  
---@field folded_starting_progress_when_killed float (default: Value of `default_starting_progress_when_killed`)  
---@field folded_state_corpse {'complex_type': 'union', 'options': ['EntityID', {'complex_type': 'array', 'value': 'EntityID'}], 'full_format': False}   
---@field folding_animation RotatedAnimation8Way   
---@field folding_sound Sound   
---@field folding_speed float (default: Value of `default_speed`) Controls the speed of the folding_animation: `1 ÷ folding_speed = duration of the folding_animation` 
---@field folding_speed_secondary float (default: Value of `default_speed_secondary`)  
---@field folding_speed_when_killed float (default: Value of `default_speed_when_killed`)  
---@field folding_starting_progress_when_killed float (default: Value of `default_starting_progress_when_killed`)  
---@field glow_light_intensity float (default: literal: value: 0) The intensity of light in the form of `energy_glow_animation` drawn on top of `energy_glow_animation`. 
---@field graphics_set TurretGraphicsSet   
---@field gun_animation_render_layer RenderLayer (default: literal: value: object)  
---@field gun_animation_secondary_draw_order uint8 (default: literal: value: 0)  
---@field ignore_target_mask TriggerTargetMask (default: no masks)  
---@field integration Sprite   
---@field is_military_target boolean (default: literal: value: True) Whether this prototype should be a high priority target for enemy forces. See [Military units and structures](https://wiki.factorio.com/Military_units_and_structures). 
---@field prepare_range double (default: The range defined in the `attack_parameters`)  
---@field prepared_alternative_animation RotatedAnimation8Way   
---@field prepared_alternative_chance float (default: literal: value: 0) The chance for `prepared_alternative_animation` to be used. 
---@field prepared_alternative_sound Sound   
---@field prepared_alternative_speed float (default: Value of `default_speed`) It's randomized whether a particular turret uses the primary or the secondary speed for its animations.
---
---Controls the speed of the prepared_alternative_animation: `1 ÷ prepared_alternative_speed = duration of the prepared_alternative_animation` 
---@field prepared_alternative_speed_secondary float (default: Value of `default_speed_secondary`) It's randomized whether a particular turret uses the primary or the secondary speed for its animations.
---
---Controls the speed of the prepared_alternative_animation: `1 ÷ prepared_alternative_speed_secondary = duration of the prepared_alternative_animation` 
---@field prepared_alternative_speed_when_killed float (default: Value of `default_speed_when_killed`)  
---@field prepared_alternative_starting_progress_when_killed float (default: Value of `default_starting_progress_when_killed`)  
---@field prepared_animation RotatedAnimation8Way   
---@field prepared_sound Sound   
---@field prepared_speed float (default: Value of `default_speed`) It's randomized whether a particular turret uses the primary or the secondary speed for its animations.
---
---Controls the speed of the prepared_animation: `1 ÷ prepared_speed = duration of the prepared_animation` 
---@field prepared_speed_secondary float (default: Value of `default_speed_secondary`) It's randomized whether a particular turret uses the primary or the secondary speed for its animations.
---
---Controls the speed of the prepared_animation: `1 ÷ prepared_speed_secondary = duration of the prepared_animation` 
---@field prepared_speed_when_killed float (default: Value of `default_speed_when_killed`)  
---@field prepared_starting_progress_when_killed float (default: Value of `default_starting_progress_when_killed`)  
---@field preparing_animation RotatedAnimation8Way   
---@field preparing_sound Sound   
---@field preparing_speed float (default: Value of `default_speed`) Controls the speed of the preparing_animation: `1 ÷ preparing_speed = duration of the preparing_animation` 
---@field preparing_speed_secondary float (default: Value of `default_speed_secondary`)  
---@field preparing_speed_when_killed float (default: Value of `default_speed_when_killed`)  
---@field preparing_starting_progress_when_killed float (default: Value of `default_starting_progress_when_killed`)  
---@field random_animation_offset boolean (default: literal: value: False)  
---@field resource_indicator_animation RotatedAnimation8Way   
---@field rotating_sound InterruptibleSound   
---@field rotation_speed float (default: Value of `default_speed`)  
---@field rotation_speed_secondary float (default: Value of `default_speed_secondary`)  
---@field rotation_speed_when_killed float (default: Value of `default_speed_when_killed`)  
---@field rotation_starting_progress_when_killed float (default: Value of `default_starting_progress_when_killed`)  
---@field shoot_in_prepare_state boolean (default: literal: value: False)  
---@field spawn_decoration {'complex_type': 'array', 'value': 'CreateDecorativesTriggerEffectItem'}  Decoratives to be created when the spawner is created by the [map generator](https://wiki.factorio.com/Map_generator). Placed when enemies expand if `spawn_decorations_on_expansion` is set to true. 
---@field spawn_decorations_on_expansion boolean (default: literal: value: False) Whether `spawn_decoration` should be spawned when this turret is created through [enemy expansion](https://wiki.factorio.com/Enemies#Expansions). 
---@field special_effect TurretSpecialEffect   
---@field start_attacking_only_when_can_shoot boolean (default: literal: value: False) When `false` the turret will enter `starting_attack` state without checking its ammo or energy levels. [FluidTurretPrototype](prototype:FluidTurretPrototype) forces this to `true`. 
---@field starting_attack_animation RotatedAnimation8Way   
---@field starting_attack_sound Sound   
---@field starting_attack_speed float (default: Value of `default_speed`) Controls the speed of the starting_attack_animation: `1 ÷ starting_attack_speed = duration of the starting_attack_animation` 
---@field starting_attack_speed_secondary float (default: Value of `default_speed_secondary`)  
---@field starting_attack_speed_when_killed float (default: Value of `default_speed_when_killed`)  
---@field starting_attack_starting_progress_when_killed float (default: Value of `default_starting_progress_when_killed`)  
---@field turret_base_has_direction boolean (default: literal: value: False) When `true` the turret's collision box will affected by its rotation. 
---@field unfolds_before_dying boolean (default: literal: value: False)  
---@parent EntityWithOwnerPrototype
---
--- typename: turret
--- A turret that needs no extra ammunition. See the children for turrets that need some kind of ammunition.
TurretPrototype = {}


---@class (exact) AmmoTurretPrototype : TurretPrototype
---@field automated_ammo_count ItemCountType  Shift of the "alt-mode icon" relative to the turret's position. 
---@field energy_per_shot Energy   
---@field energy_source ElectricEnergySource   
---@field inventory_size ItemStackIndex   
---@field prepare_with_no_ammo boolean (default: literal: value: True)  
---@parent TurretPrototype
---
--- typename: ammo-turret
--- A turret that consumes [ammo items](prototype:AmmoItemPrototype).
AmmoTurretPrototype = {}


---@class (exact) AnimationPrototype 
---@field allow_forced_downscale boolean (default: literal: value: False) Only loaded if `layers` is not defined.
---
---If `true`, the sprite may be downsampled to half its size on load even when 'Sprite quality' graphics setting is set to 'High'. Whether downsampling happens depends on detected hardware and other graphics settings. 
---@field animation_speed float (default: literal: value: 1) Only loaded if `layers` is not defined.
---
---Modifier of the animation playing speed, the default of `1` means one animation frame per tick (60 fps). The speed of playing can often vary depending on the usage (output of steam engine for example). Has to be greater than `0`.
---
---If `layers` are used, the `animation_speed` only has to be defined in one layer. All layers will run at the same speed. 
---@field apply_runtime_tint boolean (default: literal: value: False) Only loaded if `layers` is not defined. 
---@field apply_special_effect boolean (default: literal: value: False) Only loaded if `layers` is not defined. 
---@field blend_mode BlendMode (default: literal: value: normal) Only loaded if `layers` is not defined. 
---@field dice uint8  Only loaded if `layers` is not defined. 
---@field dice_x uint8  Only loaded if `layers` is not defined. 
---@field dice_y uint8  Only loaded if `layers` is not defined. 
---@field draw_as_glow boolean (default: literal: value: False) Only loaded if `layers` is not defined.
---
---Only one of `draw_as_shadow`, `draw_as_glow` and `draw_as_light` can be true. This takes precedence over `draw_as_light`.
---
---Draws first as a normal sprite, then again as a light layer. See [https://forums.factorio.com/91682](https://forums.factorio.com/91682). 
---@field draw_as_light boolean (default: literal: value: False) Only loaded if `layers` is not defined.
---
---Only one of `draw_as_shadow`, `draw_as_glow` and `draw_as_light` can be true. 
---@field draw_as_shadow boolean (default: literal: value: False) Only loaded if `layers` is not defined.
---
---Only one of `draw_as_shadow`, `draw_as_glow` and `draw_as_light` can be true. This takes precedence over `draw_as_glow` and `draw_as_light`. 
---@field filename FileName  Only loaded if `layers` is not defined. Mandatory if neither `stripes` nor `filenames` are defined.
---
---The path to the sprite file to use. 
---@field filenames {'complex_type': 'array', 'value': 'FileName'}  Only loaded if neither `layers` nor `stripes` are defined. 
---@field flags SpriteFlags  Only loaded if `layers` is not defined. 
---@field frame_count uint32 (default: literal: value: 1) Only loaded if `layers` is not defined.
---
---Can't be `0`. 
---@field frame_sequence AnimationFrameSequence  Only loaded if `layers` is not defined. 
---@field generate_sdf boolean (default: literal: value: False) Only loaded if `layers` is not defined.
---
---Unused. 
---@field height SpriteSizeType  Only loaded if `layers` is not defined. Mandatory if `size` is not defined.
---
---Height of one frame in pixels, from 0-4096. 
---@field invert_colors boolean (default: literal: value: False) Only loaded if `layers` is not defined. 
---@field layers {'complex_type': 'array', 'value': 'Animation'}  If this property is present, all Animation definitions have to be placed as entries in the array, and they will all be loaded from there. `layers` may not be an empty table. Each definition in the array may also have the `layers` property.
---
---`animation_speed` and `max_advance` of the first layer are used for all layers. All layers will run at the same speed.
---
---If this property is present, all other properties besides `name` and `type` are ignored. 
---@field line_length uint32 (default: literal: value: 0) Only loaded if `layers` is not defined.
---
---Once the specified number of pictures is loaded, other pictures are loaded on other line. This is to allow having longer animations in matrix, to input files with too high width. The game engine limits the width of any input files to 8192px, so it is compatible with most graphics cards. `0` means that all the pictures are in one horizontal line. 
---@field lines_per_file uint32  Only loaded if `layers` is not defined. Mandatory if `filenames` is defined. 
---@field load_in_minimal_mode boolean (default: literal: value: False) Only loaded if `layers` is not defined.
---
---Minimal mode is entered when mod loading fails. You are in it when you see the gray box after (part of) the loading screen that tells you a mod error. Modders can ignore this property. 
---@field max_advance float (default: MAX_FLOAT) Only loaded if `layers` is not defined.
---
---If `layers` are used, `max_advance` of the first layer is used for all layers.
---
---Maximum amount of frames the animation can move forward in one update. 
---@field mipmap_count uint8 (default: literal: value: 0) Only loaded if `layers` is not defined.
---
---Only loaded if this is an icon, that is it has the flag `"group=icon"` or `"group=gui"`.
---
---Note that `mipmap_count` doesn't make sense in an animation, as it is not possible to layout mipmaps in a way that would load both the animation and the mipmaps correctly (besides animations with just one frame). See [here](https://forums.factorio.com/viewtopic.php?p=549058#p549058). 
---@field name string  Name of the animation. Can be used with [LuaRendering::draw_animation](runtime:LuaRendering::draw_animation) at runtime. 
---@field position {'complex_type': 'tuple', 'values': ['SpriteSizeType', 'SpriteSizeType']}  Only loaded if `layers` is not defined.
---
---Loaded only when `x` and `y` are both `0`. The first member of the tuple is `x` and the second is `y`. 
---@field premul_alpha boolean (default: literal: value: True) Only loaded if `layers` is not defined.
---
---Whether alpha should be pre-multiplied. 
---@field priority SpritePriority (default: literal: value: medium) Only loaded if `layers` is not defined. 
---@field repeat_count uint8 (default: literal: value: 1) Only loaded if `layers` is not defined.
---
---How many times to repeat the animation to complete an animation cycle. E.g. if one layer is 10 frames, a second layer of 1 frame would need `repeat_count = 10` to match the complete cycle. 
---@field rotate_shift boolean (default: literal: value: False) Only loaded if `layers` is not defined. 
---@field run_mode AnimationRunMode (default: literal: value: forward) Only loaded if `layers` is not defined. 
---@field scale double (default: literal: value: 1) Only loaded if `layers` is not defined.
---
---Values other than `1` specify the scale of the sprite on default zoom. A scale of `2` means that the picture will be two times bigger on screen (and thus more pixelated). 
---@field shift Vector (default: `{0, 0}`) Only loaded if `layers` is not defined.
---
---The shift in tiles. `util.by_pixel()` can be used to divide the shift by 32 which is the usual pixel height/width of 1 tile in normal resolution. Note that 32 pixel tile height/width is not enforced anywhere - any other tile height or width is also possible. 
---@field size {'complex_type': 'union', 'options': ['SpriteSizeType', {'complex_type': 'tuple', 'values': ['SpriteSizeType', 'SpriteSizeType']}], 'full_format': False}  Only loaded if `layers` is not defined.
---
---The width and height of one frame. If this is a tuple, the first member of the tuple is the width and the second is the height. Otherwise the size is both width and height. Width and height may only be in the range of 0-4096. 
---@field slice uint32 (default: Value of `frame_count`) Only loaded if `layers` is not defined and if `filenames` is defined. 
---@field stripes {'complex_type': 'array', 'value': 'Stripe'}  Only loaded if `layers` is not defined. 
---@field surface SpriteUsageSurfaceHint (default: literal: value: any) Only loaded if `layers` is not defined.
---
---Provides hint to sprite atlas system, so it can try to put sprites that are intended to be used at the same locations to the same sprite atlas. 
---@field tint Color (default: `{r=1, g=1, b=1, a=1}`) Only loaded if `layers` is not defined. 
---@field tint_as_overlay boolean (default: literal: value: False) Only loaded if `layers` is not defined. 
---@field type {'complex_type': 'literal', 'value': 'animation'}   
---@field usage SpriteUsageHint (default: literal: value: any) Only loaded if `layers` is not defined.
---
---Provides hint to sprite atlas system, so it can pack sprites that are related to each other to the same sprite atlas. 
---@field width SpriteSizeType  Only loaded if `layers` is not defined. Mandatory if `size` is not defined.
---
---Width of one frame in pixels, from 0-4096. 
---@field x SpriteSizeType (default: literal: value: 0) Only loaded if `layers` is not defined.
---
---Horizontal position of the animation in the source file in pixels. 
---@field y SpriteSizeType (default: literal: value: 0) Only loaded if `layers` is not defined.
---
---Vertical position of the animation in the source file in pixels. 
---
---
--- typename: animation
--- Specifies an animation that can be used with [LuaRendering::draw_animation](runtime:LuaRendering::draw_animation) at runtime.
AnimationPrototype = {}


---@class (exact) CombinatorPrototype : EntityWithOwnerPrototype
---@field active_energy_usage Energy   
---@field activity_led_hold_time uint8 (default: literal: value: 5)  
---@field activity_led_light LightDefinition   
---@field activity_led_light_offsets {'complex_type': 'tuple', 'values': ['Vector', 'Vector', 'Vector', 'Vector']}   
---@field activity_led_sprites Sprite4Way   
---@field circuit_wire_max_distance double (default: literal: value: 0) The maximum circuit wire distance for this entity. 
---@field draw_circuit_wires boolean (default: literal: value: True)  
---@field draw_copper_wires boolean (default: literal: value: True)  
---@field emissions_per_second {'complex_type': 'dictionary', 'key': 'AirbornePollutantID', 'value': 'double'}  Emissions cannot be larger than zero, combinators cannot produce pollution. 
---@field energy_source {'complex_type': 'union', 'options': ['ElectricEnergySource', 'VoidEnergySource'], 'full_format': False}  Defines how this combinator gets energy. The emissions set on the energy source are ignored so combinators cannot produce pollution. 
---@field frozen_patch Sprite4Way   
---@field input_connection_bounding_box BoundingBox   
---@field input_connection_points {'complex_type': 'tuple', 'values': ['WireConnectionPoint', 'WireConnectionPoint', 'WireConnectionPoint', 'WireConnectionPoint']}   
---@field output_connection_bounding_box BoundingBox   
---@field output_connection_points {'complex_type': 'tuple', 'values': ['WireConnectionPoint', 'WireConnectionPoint', 'WireConnectionPoint', 'WireConnectionPoint']}   
---@field screen_light LightDefinition   
---@field screen_light_offsets {'complex_type': 'tuple', 'values': ['Vector', 'Vector', 'Vector', 'Vector']}   
---@field sprites Sprite4Way   
---@parent EntityWithOwnerPrototype
---
--- typename: null
--- Abstract base type for decider and arithmetic combinators.
CombinatorPrototype = {}


---@class (exact) ArithmeticCombinatorPrototype : CombinatorPrototype
---@field and_symbol_sprites Sprite4Way   
---@field divide_symbol_sprites Sprite4Way   
---@field left_shift_symbol_sprites Sprite4Way   
---@field minus_symbol_sprites Sprite4Way   
---@field modulo_symbol_sprites Sprite4Way   
---@field multiply_symbol_sprites Sprite4Way   
---@field or_symbol_sprites Sprite4Way   
---@field plus_symbol_sprites Sprite4Way   
---@field power_symbol_sprites Sprite4Way   
---@field right_shift_symbol_sprites Sprite4Way   
---@field xor_symbol_sprites Sprite4Way   
---@parent CombinatorPrototype
---
--- typename: arithmetic-combinator
--- An [arithmetic combinator](https://wiki.factorio.com/Arithmetic_combinator).
ArithmeticCombinatorPrototype = {}


---@class (exact) ToolPrototype : ItemPrototype
---@field durability double  The durability of this tool. Must be positive. Mandatory if `infinite` is false. Ignored if <code>infinite</code> is true. 
---@field durability_description_key string  May not be longer than 200 characters. 
---@field durability_description_value string  May not be longer than 200 characters.
---
---In-game, the game provides the locale with three [parameters](https://wiki.factorio.com/Tutorial:Localisation#Localising_with_parameters):
---
---`__1__`: remaining durability
---
---`__2__`: total durability
---
---`__3__`: durability as a percentage
---
---So when a locale key that has the following translation
---
---`Remaining durability is __1__ out of __2__ which is __3__ %`
---
---is applied to a tool with 2 remaining durability out of 8 it will be displayed as
---
---`Remaining durability is 2 out of 8 which is 25 %` 
---@field infinite boolean (default: literal: value: False) Whether this tool has infinite durability. If this is false, `durability` must be specified. 
---@parent ItemPrototype
---
--- typename: tool
--- Items with a "durability". Used for [science packs](https://wiki.factorio.com/Science_pack).
ToolPrototype = {}


---@class (exact) ArmorPrototype : ToolPrototype
---@field collision_box BoundingBox   
---@field drawing_box BoundingBox   
---@field equipment_grid EquipmentGridID  Name of the [EquipmentGridPrototype](prototype:EquipmentGridPrototype) that this armor has. 
---@field flight_sound InterruptibleSound  Only loaded if `provides_flight` is `true`. 
---@field inventory_size_bonus ItemStackIndex  By how many slots the inventory of the player is expanded when the armor is worn. 
---@field landing_sound Sound  Only loaded if `provides_flight` is `true`. 
---@field moving_sound Sound   
---@field provides_flight boolean (default: literal: value: False)  
---@field resistances {'complex_type': 'array', 'value': 'Resistance'}  What amount of damage the armor takes on what type of damage is incoming. 
---@field steps_sound Sound   
---@field takeoff_sound Sound  Only loaded if `provides_flight` is `true`. 
---@parent ToolPrototype
---
--- typename: armor
--- Armor to wear on your in-game [character](prototype:CharacterPrototype) for defense and buffs.
ArmorPrototype = {}


---@class (exact) ArrowPrototype : EntityPrototype
---@field arrow_picture Sprite   
---@field blinking boolean (default: literal: value: False)  
---@field circle_picture Sprite   
---@parent EntityPrototype
---
--- typename: arrow
--- The arrows used for example in the campaign, they are literally just arrows.
ArrowPrototype = {}


---@class (exact) ArtilleryFlarePrototype : EntityPrototype
---@field creation_shift Vector   
---@field early_death_ticks uint32 (default: literal: value: 180) How long this flare stays alive after `shots_per_flare` amount of shots have been shot at it. 
---@field ended_in_water_trigger_effect TriggerEffect   
---@field initial_frame_speed float (default: literal: value: 1)  
---@field initial_height float (default: literal: value: 0)  
---@field initial_speed Vector   
---@field initial_vertical_speed float (default: literal: value: 0)  
---@field life_time uint16   
---@field map_color Color   
---@field movement_modifier double (default: literal: value: 1)  
---@field movement_modifier_when_on_ground double (default: literal: value: 0.8)  
---@field pictures AnimationVariations  Picture variation count and individual frame count must be equal to shadow variation count. 
---@field regular_trigger_effect TriggerEffect   
---@field regular_trigger_effect_frequency uint32 (default: literal: value: 0)  
---@field render_layer RenderLayer (default: literal: value: object)  
---@field render_layer_when_on_ground RenderLayer (default: literal: value: lower-object)  
---@field selection_priority uint8 (default: literal: value: 48) The entity with the higher number is selectable before the entity with the lower number.
---
---The value `0` will be treated the same as `nil`. 
---@field shadows AnimationVariations  Shadow variation variation count and individual frame count must be equal to picture variation count. 
---@field shot_category AmmoCategoryID  Only artillery turrets/wagons whose ammo's [ammo_category](prototype:AmmoItemPrototype::ammo_category) matches this category will shoot at this flare. Defaults to all ammo categories being able to shoot at this flare. 
---@field shots_per_flare uint32 (default: literal: value: 1) How many artillery shots should be fired at the position of this flare. 
---@parent EntityPrototype
---
--- typename: artillery-flare
--- The entity spawned by the [artillery targeting remote](https://wiki.factorio.com/Artillery_targeting_remote).
ArtilleryFlarePrototype = {}


---@class (exact) ArtilleryProjectilePrototype : EntityPrototype
---@field action Trigger   
---@field chart_picture Sprite   
---@field collision_box BoundingBox (default: Empty = `{{0, 0}, {0, 0}}`) Must have a collision box size of zero. 
---@field final_action Trigger   
---@field height_from_ground float (default: literal: value: 1)  
---@field map_color Color   
---@field picture Sprite   
---@field reveal_map boolean   
---@field rotatable boolean (default: literal: value: True) Whether the picture of the projectile is rotated to match the direction of travel. 
---@field shadow Sprite   
---@parent EntityPrototype
---
--- typename: artillery-projectile
--- The projectile shot by [artillery](https://wiki.factorio.com/Artillery).
ArtilleryProjectilePrototype = {}


---@class (exact) ArtilleryTurretPrototype : EntityWithOwnerPrototype
---@field alert_when_attacking boolean (default: literal: value: True)  
---@field ammo_stack_limit ItemCountType  Must be > 0. 
---@field automated_ammo_count ItemCountType  Must be > 0. 
---@field base_picture Animation4Way   
---@field base_picture_render_layer RenderLayer (default: literal: value: lower-object)  
---@field base_picture_secondary_draw_order uint8 (default: literal: value: 0)  
---@field cannon_barrel_light_direction Vector3D  Only loaded if `cannon_barrel_recoil_shiftings` is loaded. 
---@field cannon_barrel_pictures RotatedSprite   
---@field cannon_barrel_recoil_shiftings {'complex_type': 'array', 'value': 'Vector3D'}   
---@field cannon_barrel_recoil_shiftings_load_correction_matrix {'complex_type': 'array', 'value': 'Vector3D'}  Only loaded if `cannon_barrel_recoil_shiftings` is loaded. 
---@field cannon_base_pictures RotatedSprite   
---@field cannon_base_shift Vector3D   
---@field cannon_parking_frame_count uint16 (default: literal: value: 0)  
---@field cannon_parking_speed float (default: literal: value: 1) Must be positive. 
---@field circuit_connector CircuitConnectorDefinition   
---@field circuit_wire_max_distance double (default: literal: value: 0) The maximum circuit wire distance for this entity. 
---@field disable_automatic_firing boolean (default: literal: value: False)  
---@field draw_circuit_wires boolean (default: literal: value: True)  
---@field draw_copper_wires boolean (default: literal: value: True)  
---@field gun ItemID  Name of a [GunPrototype](prototype:GunPrototype). 
---@field inventory_size ItemStackIndex  Must be > 0. 
---@field is_military_target boolean (default: literal: value: True) Whether this prototype should be a high priority target for enemy forces. See [Military units and structures](https://wiki.factorio.com/Military_units_and_structures). 
---@field manual_range_modifier double  Must be positive. 
---@field rotating_sound InterruptibleSound   
---@field turn_after_shooting_cooldown uint16 (default: literal: value: 0)  
---@field turret_rotation_speed double   
---@parent EntityWithOwnerPrototype
---
--- typename: artillery-turret
--- An [artillery turret](https://wiki.factorio.com/Artillery_turret).
ArtilleryTurretPrototype = {}


---@class (exact) VehiclePrototype : EntityWithOwnerPrototype
---@field allow_passengers boolean (default: literal: value: True) Determines whether this vehicle accepts passengers. This includes both drivers and gunners, if applicable. 
---@field allow_remote_driving boolean (default: literal: value: False)  
---@field braking_power {'complex_type': 'union', 'options': ['Energy', 'double'], 'full_format': False}  Must be positive. There is no functional difference between the two ways to set braking power/force. 
---@field chunk_exploration_radius uint32 (default: literal: value: 0) In chunks. The radius of the radar range of the vehicle, so how many chunks it charts around itself. 
---@field crash_trigger TriggerEffect   
---@field deliver_category string (default: literal: value: ) Name of a [DeliverCategory](prototype:DeliverCategory). 
---@field energy_per_hit_point double  The (movement) energy used per hit point (1 hit point = 1 health damage) taken and dealt for this vehicle during collisions. The smaller the number, the more damage this vehicle and the rammed entity take during collisions: `damage = energy / energy_per_hit_point`. 
---@field equipment_grid EquipmentGridID  The name of the [EquipmentGridPrototype](prototype:EquipmentGridPrototype) this vehicle has. 
---@field friction double  Must be positive. There is no functional difference between the two ways to set friction force. 
---@field impact_speed_to_volume_ratio double (default: literal: value: 5.0)  
---@field minimap_representation Sprite  The sprite that represents this vehicle on the map/minimap. 
---@field selected_minimap_representation Sprite  The sprite that represents this vehicle on the map/minimap when it is selected. 
---@field stop_trigger TriggerEffect   
---@field stop_trigger_speed double (default: literal: value: 0.0)  
---@field terrain_friction_modifier float (default: literal: value: 1) Must be in the [0, 1] interval. 
---@field weight double  Must be positive. Weight of the entity used for physics calculation when car hits something. 
---@parent EntityWithOwnerPrototype
---
--- typename: null
--- Abstract base of all vehicles.
VehiclePrototype = {}


---@class (exact) RollingStockPrototype : VehiclePrototype
---@field air_resistance double   
---@field allow_manual_color boolean (default: literal: value: True)  
---@field allow_robot_dispatch_in_automatic_mode boolean (default: literal: value: False)  
---@field back_light LightDefinition   
---@field color Color   
---@field connection_distance double  The distance between the joint of this rolling stock and its connected rolling stocks joint.
---
---Maximum connection distance is 15. 
---@field default_copy_color_from_train_stop boolean (default: literal: value: False)  
---@field door_closing_sound InterruptibleSound  Cannot use `fade_ticks`. 
---@field door_opening_sound InterruptibleSound  Cannot use `fade_ticks`. 
---@field drive_over_elevated_tie_trigger TriggerEffect   
---@field drive_over_tie_trigger TriggerEffect  Usually a sound to play when the rolling stock drives over a tie. The rolling stock is considered to be driving over a tie every `tie_distance` tiles. 
---@field drive_over_tie_trigger_minimal_speed double (default: literal: value: 0.0)  
---@field elevated_collision_mask CollisionMaskConnector  Defaults to the mask from [UtilityConstants::default_collision_masks](prototype:UtilityConstants::default_collision_masks) when indexed by  `type .. "/elevated"`. 
---@field elevated_rail_sound MainSound   
---@field elevated_selection_priority uint8 (default: literal: value: 56)  
---@field horizontal_doors Animation   
---@field joint_distance double  The length between this rolling stocks front and rear joints. Joints are the point where connection_distance is measured from when rolling stock are connected to one another. Wheels sprite are placed based on the joint position.
---
---Maximum joint distance is 15.
---
---Note: There needs to be border at least 0.2 between the [bounding box](prototype:EntityPrototype::collision_box) edge and joint. This means that the collision_box must be at least `{{-0,-0.2},{0,0.2}}`. 
---@field max_speed double  Maximum speed of the rolling stock in tiles/tick.
---
---In-game, the max speed of a train is `min(all_rolling_stock_max_speeds) × average(all_fuel_modifiers_in_all_locomotives)`. This calculated train speed is then silently capped to 7386.3km/h. 
---@field pictures RollingStockRotatedSlopedGraphics   
---@field stand_by_light LightDefinition   
---@field tie_distance double (default: literal: value: 10.0) In tiles. Used to determine how often `drive_over_tie_trigger` is triggered. 
---@field transition_collision_mask CollisionMaskConnector  Defaults to the mask from [UtilityConstants::default_collision_masks](prototype:UtilityConstants::default_collision_masks) when indexed by  `type .. "/transition"`. 
---@field vertical_doors Animation   
---@field vertical_selection_shift double   
---@field wheels RollingStockRotatedSlopedGraphics   
---@parent VehiclePrototype
---
--- typename: null
--- The abstract base of all rolling stock.
RollingStockPrototype = {}


---@class (exact) ArtilleryWagonPrototype : RollingStockPrototype
---@field ammo_stack_limit ItemCountType  Must be > 0. 
---@field automated_ammo_count ItemCountType  Must be > 0. 
---@field cannon_barrel_light_direction Vector3D  Only loaded if `cannon_barrel_recoil_shiftings` is loaded. 
---@field cannon_barrel_pictures RollingStockRotatedSlopedGraphics   
---@field cannon_barrel_recoil_shiftings {'complex_type': 'array', 'value': 'Vector3D'}   
---@field cannon_barrel_recoil_shiftings_load_correction_matrix {'complex_type': 'array', 'value': 'Vector3D'}  Only loaded if `cannon_barrel_recoil_shiftings` is loaded. 
---@field cannon_base_height double (default: literal: value: 0.0)  
---@field cannon_base_pictures RollingStockRotatedSlopedGraphics   
---@field cannon_base_shift_when_horizontal double (default: literal: value: 0.0)  
---@field cannon_base_shift_when_vertical double (default: literal: value: 0.0)  
---@field cannon_parking_frame_count uint16 (default: literal: value: 0)  
---@field cannon_parking_speed float (default: literal: value: 1) Must be positive. 
---@field disable_automatic_firing boolean (default: literal: value: False)  
---@field gun ItemID  Name of a [GunPrototype](prototype:GunPrototype). 
---@field inventory_size ItemStackIndex  Must be > 0. 
---@field manual_range_modifier double  Must be > 0. 
---@field rotating_sound InterruptibleSound   
---@field turn_after_shooting_cooldown uint16 (default: literal: value: 0)  
---@field turret_rotation_speed double   
---@parent RollingStockPrototype
---
--- typename: artillery-wagon
--- An [artillery wagon](https://wiki.factorio.com/Artillery_wagon).
ArtilleryWagonPrototype = {}


---@class (exact) CraftingMachinePrototype : EntityWithOwnerPrototype
---@field allowed_effects EffectTypeLimitation (default: No effects are allowed) Sets the [modules](prototype:ModulePrototype) and [beacon](prototype:BeaconPrototype) effects that are allowed to be used on this machine. 
---@field allowed_module_categories {'complex_type': 'array', 'value': 'ModuleCategoryID'} (default: All module categories are allowed) Sets the [module categories](prototype:ModuleCategory) that are allowed to be inserted into this machine. 
---@field crafting_categories {'complex_type': 'array', 'value': 'RecipeCategoryID'}  A list of [recipe categories](prototype:RecipeCategory) this crafting machine can use. 
---@field crafting_speed double  How fast this crafting machine can craft. 1 means that for example a 1 second long recipe take 1 second to craft. 0.5 means it takes 2 seconds, and 2 means it takes 0.5 seconds.
---
---Crafting speed has to be positive. 
---@field crafting_speed_quality_multiplier {'complex_type': 'dictionary', 'key': 'QualityID', 'value': 'double'}  Each value must be >= 0.01.
---
---If value is not provided for a quality, then [QualityPrototype::crafting_machine_speed_multiplier](prototype:QualityPrototype::crafting_machine_speed_multiplier) will be used as a speed multiplier instead. 
---@field draw_entity_info_icon_background boolean (default: literal: value: True) Whether the "alt-mode icon" should have a black background. 
---@field effect_receiver EffectReceiver   
---@field energy_source EnergySource  Defines how the crafting machine is powered.
---
---When using an electric energy source and `drain` is not specified, it will be set to `energy_usage ÷ 30` automatically. 
---@field energy_usage Energy  Sets how much energy this machine uses while crafting. Energy usage has to be positive. 
---@field energy_usage_quality_multiplier {'complex_type': 'dictionary', 'key': 'QualityID', 'value': 'double'}  Each value must be >= 0.01.
---
---If value is not provided for a quality, then [QualityPrototype::crafting_machine_energy_usage_multiplier](prototype:QualityPrototype::crafting_machine_energy_usage_multiplier) will be used as an energy usage multiplier instead.
---
---Does nothing if [CraftingMachinePrototype::quality_affects_energy_usage](prototype:CraftingMachinePrototype::quality_affects_energy_usage) is not set. 
---@field fast_transfer_modules_into_module_slots_only boolean (default: literal: value: False)  
---@field fluid_boxes {'complex_type': 'array', 'value': 'FluidBox'}  The crafting machine's fluid boxes. If an assembling machine has fluid boxes *and* [AssemblingMachinePrototype::fluid_boxes_off_when_no_fluid_recipe](prototype:AssemblingMachinePrototype::fluid_boxes_off_when_no_fluid_recipe) is true, the assembling machine can only be rotated when a recipe consuming or producing fluid is set, or if it has one of the other properties listed at the top of this page.
---
---For assembling machines, any [filters](prototype:FluidBox::filter) set on the fluidboxes are ignored. 
---@field forced_symmetry Mirroring (default: none)  
---@field graphics_set CraftingMachineGraphicsSet   
---@field graphics_set_flipped CraftingMachineGraphicsSet   
---@field ignore_output_full boolean (default: literal: value: False)  
---@field match_animation_speed_to_activity boolean (default: literal: value: True) Whether the speed of the animation and working visualization should be based on the machine's speed (boosted or slowed by modules). 
---@field module_slots ItemStackIndex (default: literal: value: 0) The number of module slots in this machine. 
---@field module_slots_quality_bonus {'complex_type': 'dictionary', 'key': 'QualityID', 'value': 'ItemStackIndex'}  If value is not provided for a quality, then [QualityPrototype::crafting_machine_module_slots_bonus](prototype:QualityPrototype::crafting_machine_module_slots_bonus) will be used as a module slots bonus instead.
---
---Does nothing if [CraftingMachinePrototype::quality_affects_module_slots](prototype:CraftingMachinePrototype::quality_affects_module_slots) is not set. 
---@field perceived_performance PerceivedPerformance  Affects animation speed. 
---@field production_health_effect ProductionHealthEffect   
---@field quality_affects_energy_usage boolean (default: literal: value: False) When set, [QualityPrototype::crafting_machine_energy_usage_multiplier](prototype:QualityPrototype::crafting_machine_energy_usage_multiplier) will be applied to energy_usage. 
---@field quality_affects_module_slots boolean (default: literal: value: False) If set, [QualityPrototype::crafting_machine_module_slots_bonus](prototype:QualityPrototype::crafting_machine_module_slots_bonus) will be added to module slots count. 
---@field return_ingredients_on_change boolean (default: literal: value: True) Controls whether the ingredients of an in-progress recipe are destroyed when mining the machine/changing the recipe. If set to true, the ingredients do not get destroyed. This affects only the ingredients of the recipe that is currently in progress, so those that visually have already been consumed while their resulting product has not yet been produced. 
---@field show_recipe_icon boolean (default: literal: value: True) Whether the "alt-mode icon" should be drawn at all. 
---@field show_recipe_icon_on_map boolean (default: literal: value: True) Whether the recipe icon should be shown on the map. 
---@field trash_inventory_size ItemStackIndex   
---@field vector_to_place_result Vector   
---@parent EntityWithOwnerPrototype
---
--- typename: null
--- The abstract basis of the assembling machines and furnaces. Contains the properties that both of them have.
---
---Note that a crafting machine cannot be rotated unless it has at least one of the following: a fluid box, a heat energy source, a fluid energy source, or a non-square collision box. Crafting machines with non-square collision boxes can only be rotated before placement, not after.
CraftingMachinePrototype = {}


---@class (exact) AssemblingMachinePrototype : CraftingMachinePrototype
---@field circuit_connector {'complex_type': 'tuple', 'values': ['CircuitConnectorDefinition', 'CircuitConnectorDefinition', 'CircuitConnectorDefinition', 'CircuitConnectorDefinition']}   
---@field circuit_connector_flipped {'complex_type': 'tuple', 'values': ['CircuitConnectorDefinition', 'CircuitConnectorDefinition', 'CircuitConnectorDefinition', 'CircuitConnectorDefinition']}   
---@field circuit_wire_max_distance double (default: literal: value: 0) The maximum circuit wire distance for this entity. 
---@field default_recipe_finished_signal SignalIDConnector   
---@field default_working_signal SignalIDConnector   
---@field disabled_when_recipe_not_researched boolean  Defaults to true if `fixed_recipe` is not given. 
---@field draw_circuit_wires boolean (default: literal: value: True)  
---@field draw_copper_wires boolean (default: literal: value: True)  
---@field enable_logistic_control_behavior boolean (default: literal: value: True)  
---@field fixed_quality QualityID  Only loaded when fixed_recipe is provided. 
---@field fixed_recipe RecipeID (default: literal: value: ) The preset recipe of this machine. This machine does not show a recipe selection if this is set. The base game uses this for the [rocket silo](https://wiki.factorio.com/Rocket_silo). 
---@field fluid_boxes_off_when_no_fluid_recipe boolean (default: literal: value: False)  
---@field gui_title_key string (default: literal: value: ) The locale key of the title of the GUI that is shown when the player opens the assembling machine. May not be longer than 200 characters. 
---@field ingredient_count uint16 (default: literal: value: 65535) Sets the maximum number of ingredients this machine can craft with. Any recipe with more ingredients than this will be unavailable in this machine.
---
---This only counts item ingredients, not fluid ingredients! This means if ingredient count is 2, and the recipe has 2 item ingredients and 1 fluid ingredient, it can still be crafted in the machine. 
---@field max_item_product_count uint16 (default: literal: value: 65535)  
---@parent CraftingMachinePrototype
---
--- typename: assembling-machine
--- An assembling machine - like the assembling machines 1/2/3 in the game, but you can use your own recipe categories.
AssemblingMachinePrototype = {}


---@class (exact) AsteroidChunkPrototype : Prototype
---@field dying_trigger_effect TriggerEffect   
---@field graphics_set AsteroidGraphicsSet   
---@field hide_from_signal_gui boolean (default: unset)  
---@field icon FileName  Path to the icon file.
---
---Only loaded, and mandatory if `icons` is not defined. 
---@field icon_size SpriteSizeType (default: literal: value: 64) The size of the square icon, in pixels. E.g. `32` for a 32px by 32px icon. Must be larger than `0`.
---
---Only loaded if `icons` is not defined. 
---@field icons {'complex_type': 'array', 'value': 'IconData'}  Can't be an empty array. 
---@field minable MinableProperties   
---@parent Prototype
---
--- typename: asteroid-chunk
--- 
AsteroidChunkPrototype = {}


---@class (exact) AsteroidCollectorPrototype : EntityWithOwnerPrototype
---@field arm_angular_speed_cap_base float (default: literal: value: 0.1)  
---@field arm_angular_speed_cap_quality_scaling float (default: literal: value: 0.1)  
---@field arm_color_gradient {'complex_type': 'array', 'value': 'Color'} (default: {{1, 1, 1}})  
---@field arm_count_base uint32 (default: literal: value: 3)  
---@field arm_count_quality_scaling uint32 (default: literal: value: 1)  
---@field arm_energy_usage Energy   
---@field arm_extend_sound Sound   
---@field arm_inventory_size ItemStackIndex (default: literal: value: 5)  
---@field arm_inventory_size_quality_increase ItemStackIndex (default: literal: value: 0)  
---@field arm_retract_sound Sound   
---@field arm_slow_energy_usage Energy  If `arm_energy_usage` is not met, attempts to move slower at the cost of `arm_slow_energy_usage`. 
---@field arm_speed_base float (default: literal: value: 0.1)  
---@field arm_speed_quality_scaling float (default: literal: value: 0.1)  
---@field circuit_connector {'complex_type': 'tuple', 'values': ['CircuitConnectorDefinition', 'CircuitConnectorDefinition', 'CircuitConnectorDefinition', 'CircuitConnectorDefinition']}   
---@field circuit_wire_max_distance double (default: literal: value: 0) The maximum circuit wire distance for this entity. 
---@field collection_box_offset float (default: literal: value: 0.0)  
---@field collection_radius double  Must be positive. 
---@field deposit_radius float (default: literal: value: 1.5)  
---@field deposit_sound Sound   
---@field draw_circuit_wires boolean (default: literal: value: True)  
---@field draw_copper_wires boolean (default: literal: value: True)  
---@field energy_source {'complex_type': 'union', 'options': ['ElectricEnergySource', 'VoidEnergySource'], 'full_format': False}   
---@field energy_usage_quality_scaling float (default: literal: value: 0.1)  
---@field graphics_set AsteroidCollectorGraphicsSet   
---@field head_collection_radius float (default: literal: value: 0.6)  
---@field held_items_display_count uint8 (default: literal: value: 5)  
---@field held_items_offset float (default: literal: value: 0.1)  
---@field held_items_spread float (default: literal: value: 0.15)  
---@field inventory_size ItemStackIndex (default: literal: value: 39)  
---@field inventory_size_quality_increase ItemStackIndex (default: literal: value: 5)  
---@field minimal_arm_swing_segment_retraction uint32 (default: literal: value: 6)  
---@field munch_sound Sound   
---@field passive_energy_usage Energy   
---@field radius_visualisation_picture Sprite   
---@field tether_size float (default: literal: value: 0.4)  
---@field unpowered_arm_speed_scale float (default: literal: value: 0.3)  
---@parent EntityWithOwnerPrototype
---
--- typename: asteroid-collector
--- 
AsteroidCollectorPrototype = {}


---@class (exact) AsteroidPrototype : EntityWithOwnerPrototype
---@field emissions_per_second {'complex_type': 'dictionary', 'key': 'AirbornePollutantID', 'value': 'double'}  Emissions cannot be larger than zero, asteroids cannot produce pollution. 
---@field graphics_set AsteroidGraphicsSet   
---@field mass double (default: literal: value: 1.0)  
---@parent EntityWithOwnerPrototype
---
--- typename: asteroid
--- 
AsteroidPrototype = {}


---@class (exact) AutoplaceControl : Prototype
---@field can_be_disabled boolean (default: literal: value: True) Whether there is an "enable" checkbox for the autoplace control in the map generator GUI. If this is false, the autoplace control cannot be disabled from the GUI. 
---@field category {'complex_type': 'union', 'options': [{'complex_type': 'literal', 'value': 'resource'}, {'complex_type': 'literal', 'value': 'terrain'}, {'complex_type': 'literal', 'value': 'cliff'}, {'complex_type': 'literal', 'value': 'enemy'}], 'full_format': False}  Controls in what tab the autoplace is shown in the map generator GUI. 
---@field hidden boolean (default: literal: value: False) Hides the autoplace control from the map generation screen. 
---@field related_to_fight_achievements boolean (default: literal: value: False) Whether this settings being lower than default disables fight related achievements. 
---@field richness boolean (default: literal: value: False) Sets whether this control's richness can be changed. The map generator GUI will only show the richness slider when the `category` is `"resource"`.
---
---If the autoplace control is used to generate ores, you probably want this to be true. 
---@parent Prototype
---
--- typename: autoplace-control
--- A setting in the map creation GUI. Used by the [autoplace system](prototype:AutoplaceSpecification::control).
AutoplaceControl = {}


---@class (exact) BatteryEquipmentPrototype : EquipmentPrototype
---@parent EquipmentPrototype
---
--- typename: battery-equipment
--- Used by [personal battery](https://wiki.factorio.com/Personal_battery).
BatteryEquipmentPrototype = {}


---@class (exact) BeaconPrototype : EntityWithOwnerPrototype
---@field allowed_effects EffectTypeLimitation (default: No effects are allowed) The types of [modules](prototype:ModulePrototype) that a player can place inside of the beacon. 
---@field allowed_module_categories {'complex_type': 'array', 'value': 'ModuleCategoryID'} (default: All module categories are allowed) Sets the [module categories](prototype:ModuleCategory) that are allowed to be inserted into this machine. 
---@field animation Animation  Only loaded if `graphics_set` is not defined.
---
---The animation for the beacon, when in use. 
---@field base_picture Animation  Only loaded if `graphics_set` is not defined.
---
---The picture of the beacon when it is not on. 
---@field beacon_counter {'complex_type': 'union', 'options': [{'complex_type': 'literal', 'value': 'total'}, {'complex_type': 'literal', 'value': 'same_type'}], 'full_format': False} (default: literal: value: total) The beacon counter used by effect receiver when deciding which sample to take from `profile`. 
---@field distribution_effectivity double  The multiplier of the module's effects, when shared between neighbors. 
---@field distribution_effectivity_bonus_per_quality_level double  Must be 0 or positive. 
---@field energy_source {'complex_type': 'union', 'options': ['ElectricEnergySource', 'VoidEnergySource'], 'full_format': False}   
---@field energy_usage Energy  The constant power usage of this beacon. 
---@field graphics_set BeaconGraphicsSet  The graphics for the beacon. 
---@field module_slots ItemStackIndex  The number of module slots in this beacon. 
---@field perceived_performance PerceivedPerformance  Affects animation speed. 
---@field profile {'complex_type': 'array', 'value': 'double'}  Extra multiplier applied to the effects received from beacon by the effect receiver based on amount of beacons that are in range of that effect receiver.
---
---If there are more beacons that reach the effect receiver than there are entries in this array, then the last entry in the array is used for the multiplier.
---
---If this is not defined, then an implicit profile of `{1}` will be used. 
---@field quality_affects_module_slots boolean (default: literal: value: False) If set, [QualityPrototype::beacon_module_slots_bonus](prototype:QualityPrototype::beacon_module_slots_bonus) will be added to module slots count. 
---@field quality_affects_supply_area_distance boolean (default: literal: value: False) If set, [QualityPrototype::beacon_supply_area_distance_bonus](prototype:QualityPrototype::beacon_supply_area_distance_bonus) will be added to supply_area_distance. Total value will be clamped to be within range `[0, 64]`. 
---@field radius_visualisation_picture Sprite   
---@field supply_area_distance uint32  The maximum distance that this beacon can supply its neighbors with its module's effects. Max distance is 64. 
---@parent EntityWithOwnerPrototype
---
--- typename: beacon
--- Entity with the ability to transfer [module](prototype:ModulePrototype) effects to its neighboring entities.
BeaconPrototype = {}


---@class (exact) BeamPrototype : EntityPrototype
---@field action Trigger   
---@field action_triggered_automatically boolean (default: literal: value: False) Whether this beams should trigger its action every `damage_interval`. If false, the action is instead triggered when its owner triggers shooting. 
---@field damage_interval uint32  Damage interval can't be 0. A value of 1 will cause the attack to be applied each tick. 
---@field graphics_set BeamGraphicsSet   
---@field random_target_offset boolean (default: literal: value: False)  
---@field target_offset Vector   
---@field width float   
---@parent EntityPrototype
---
--- typename: beam
--- Used as a laser beam.
BeamPrototype = {}


---@class (exact) BeltImmunityEquipmentPrototype : EquipmentPrototype
---@field energy_consumption Energy  The continuous power consumption of the belt immunity equipment. 
---@parent EquipmentPrototype
---
--- typename: belt-immunity-equipment
--- Used by [belt immunity equipment](https://wiki.factorio.com/Belt_immunity_equipment).
BeltImmunityEquipmentPrototype = {}


---@class (exact) ItemWithLabelPrototype : ItemPrototype
---@field default_label_color Color (default: Default item text color) The default label color the item will use. 
---@field draw_label_for_cursor_render boolean (default: literal: value: False) If the item will draw its label when held in the cursor in place of the item count. 
---@parent ItemPrototype
---
--- typename: item-with-label
--- Like a normal item but with the ability to have a colored label.
ItemWithLabelPrototype = {}


---@class (exact) ItemWithInventoryPrototype : ItemWithLabelPrototype
---@field filter_message_key string (default: literal: value: item-limitation.item-not-allowed-in-this-container-item) The locale key used when the player attempts to put an item that doesn't match the filter rules into the item-with-inventory. 
---@field filter_mode {'complex_type': 'union', 'options': [{'complex_type': 'literal', 'value': 'blacklist'}, {'complex_type': 'literal', 'value': 'whitelist'}], 'full_format': False} (default: literal: value: whitelist) This determines how filters are applied. If no filters are defined this is automatically set to "none". 
---@field inventory_size ItemStackIndex  The inventory size of the item. 
---@field item_filters {'complex_type': 'array', 'value': 'ItemID'}  A list of explicit item names to be used as filters. 
---@field item_group_filters {'complex_type': 'array', 'value': 'ItemGroupID'}  A list of explicit item group names to be used as filters. 
---@field item_subgroup_filters {'complex_type': 'array', 'value': 'ItemSubGroupID'}  A list of explicit [item subgroup](prototype:ItemSubGroup) names to be used as filters. 
---@field stack_size {'complex_type': 'literal', 'value': 1}  Count of items of the same name that can be stored in one inventory slot. Must be 1 when the `"not-stackable"` flag is set. 
---@parent ItemWithLabelPrototype
---
--- typename: item-with-inventory
--- The inventory allows setting player defined filters similar to cargo wagon inventories.
ItemWithInventoryPrototype = {}


---@class (exact) BlueprintBookPrototype : ItemWithInventoryPrototype
---@field draw_label_for_cursor_render boolean (default: literal: value: True) If the item will draw its label when held in the cursor in place of the item count. 
---@field inventory_size {'complex_type': 'union', 'options': ['ItemStackIndex', {'complex_type': 'literal', 'value': 'dynamic'}], 'full_format': False}  The inventory size of the item. 
---@field stack_size {'complex_type': 'literal', 'value': 1}  Count of items of the same name that can be stored in one inventory slot. Must be 1 when the `"not-stackable"` flag is set. 
---@parent ItemWithInventoryPrototype
---
--- typename: blueprint-book
--- A [blueprint book](https://wiki.factorio.com/Blueprint_book).
BlueprintBookPrototype = {}


---@class (exact) SelectionToolPrototype : ItemWithLabelPrototype
---@field alt_reverse_select SelectionModeData  Settings for how the selection tool alt-reverse-selects things in-game (using SHIFT + Right mouse button). 
---@field alt_select SelectionModeData   
---@field always_include_tiles boolean (default: literal: value: False) If tiles should be included in the selection regardless of entities also being in the selection. This is a visual only setting. 
---@field mouse_cursor MouseCursorID (default: literal: value: selection-tool-cursor)  
---@field reverse_select SelectionModeData   
---@field select SelectionModeData   
---@field skip_fog_of_war boolean (default: literal: value: False)  
---@field super_forced_select SelectionModeData   
---@parent ItemWithLabelPrototype
---
--- typename: selection-tool
--- Used in the base game as a base for the blueprint item and the deconstruction item.
SelectionToolPrototype = {}


---@class (exact) BlueprintItemPrototype : SelectionToolPrototype
---@field alt_select SelectionModeData  The [SelectionModeData::mode](prototype:SelectionModeData::mode) is hardcoded to `"blueprint"`.
---
---The filters are parsed, but then ignored and forced to be empty. 
---@field always_include_tiles boolean (default: literal: value: False) This property is hardcoded to `false`. 
---@field draw_label_for_cursor_render boolean (default: literal: value: True) Whether the item will draw its label when held in the cursor in place of the item count. 
---@field select SelectionModeData  The [SelectionModeData::mode](prototype:SelectionModeData::mode) is hardcoded to `"blueprint"`.
---
---The filters are parsed, but then ignored and forced to be empty. 
---@field stack_size {'complex_type': 'literal', 'value': 1}  Count of items of the same name that can be stored in one inventory slot. Must be 1 when the `"not-stackable"` flag is set. 
---@parent SelectionToolPrototype
---
--- typename: blueprint
--- A [blueprint](https://wiki.factorio.com/Blueprint).
BlueprintItemPrototype = {}


---@class (exact) BoilerPrototype : EntityWithOwnerPrototype
---@field burning_cooldown uint16  Controls for how many ticks the boiler will show the fire and fire_glow after the energy source runs out of energy.
---
---Note that `fire` and `fire_glow` alpha is set to the light intensity of the energy source, so 0 light intensity means the fire is invisible. For burner energy sources, the light intensity will reach zero rather quickly after the boiler runs out of fuel, effectively capping the time that `fire` and `fire_glow` will be shown after the boiler runs out of fuel. 
---@field energy_consumption Energy   
---@field energy_source EnergySource   
---@field fire_flicker_enabled boolean (default: literal: value: False) If this is set to false, `fire` alpha is always 1 instead of being controlled by the light intensity of the energy source. 
---@field fire_glow_flicker_enabled boolean (default: literal: value: False) If this is set to false, `fire_glow` alpha is always 1 instead of being controlled by the light intensity of the energy source. 
---@field fluid_box FluidBox  The input fluid box.
---
---If `mode` is `"heat-fluid-inside"`, the fluid is heated up directly in this fluidbox. 
---@field mode {'complex_type': 'union', 'options': [{'complex_type': 'literal', 'value': 'heat-fluid-inside'}, {'complex_type': 'literal', 'value': 'output-to-separate-pipe'}], 'full_format': False} (default: literal: value: heat-fluid-inside) In the `"output-to-separate-pipe"` mode, fluid is transferred from the `fluid_box` to the `output_fluid_box` when enough energy is available to [heat](prototype:FluidPrototype::heat_capacity) the input fluid to the `target_temperature`. Setting a filter on the `output_fluid_box` means that instead of the heated input fluid getting moved to the output, it is converted to the filtered fluid in a ratio based on the heat capacity of the fluids: `output_fluid_amount = input_fluid_amount * (output_fluid_heat_capacity / input_fluid_heat_capacity)`
---
---In the `"heat-fluid-inside"` mode, fluid in the `fluid_box` is continuously heated from the input temperature up to its [FluidPrototype::max_temperature](prototype:FluidPrototype::max_temperature). 
---@field output_fluid_box FluidBox  The output fluid box.
---
---If `mode` is `"output-to-separate-pipe"` and this has a [filter](prototype:FluidBox::filter), the heated input fluid is converted to the output fluid that is set in the filter. The conversion ratio is based on the [heat capacity](prototype:FluidPrototype::heat_capacity) of the fluids: `output_fluid_amount = input_fluid_amount * (output_fluid_heat_capacity / input_fluid_heat_capacity)`
---
---If `mode` is `"heat-fluid-inside"`, this fluidbox is unused. 
---@field pictures BoilerPictureSet   
---@field target_temperature float  Only loaded, and mandatory if `mode` is `"output-to-separate-pipe"`. This is the temperature that the input fluid must reach to be moved to the output fluid box. 
---@parent EntityWithOwnerPrototype
---
--- typename: boiler
--- A [boiler](https://wiki.factorio.com/Boiler). It heats fluid and optionally outputs it as a different fluid.
BoilerPrototype = {}


---@class (exact) BuildEntityAchievementPrototype : AchievementPrototype
---@field amount uint32 (default: literal: value: 1) How many entities need to be built. 
---@field limited_to_one_game boolean (default: literal: value: False) If this is false, the player carries over their statistics from this achievement through all their saves. 
---@field to_build EntityID  This will trigger the achievement, if this entity is placed. 
---@field within MapTick (default: `math.huge`) The achievement must be completed within this time limit. 
---@parent AchievementPrototype
---
--- typename: build-entity-achievement
--- This prototype is used for receiving an achievement when the player builds an entity.
BuildEntityAchievementPrototype = {}


---@class (exact) BurnerGeneratorPrototype : EntityWithOwnerPrototype
---@field always_draw_idle_animation boolean (default: literal: value: False) Whether the `idle_animation` should also play when the generator is active. 
---@field animation Animation4Way  Plays when the generator is active. `idle_animation` must have the same frame count as animation. 
---@field burner BurnerEnergySource  The input energy source of the generator. 
---@field energy_source ElectricEnergySource  The output energy source of the generator. Any emissions specified on this energy source are ignored, they must be specified on `burner`. 
---@field idle_animation Animation4Way  Plays when the generator is inactive. Idle animation must have the same frame count as `animation`. 
---@field max_power_output Energy  How much energy this generator can produce. 
---@field perceived_performance PerceivedPerformance  Affects animation speed and working sound. 
---@parent EntityWithOwnerPrototype
---
--- typename: burner-generator
--- An entity that produces power from a burner energy source.
BurnerGeneratorPrototype = {}


---@class (exact) BurnerUsagePrototype : Prototype
---@field accepted_fuel_key string   
---@field burned_in_key string   
---@field empty_slot_caption LocalisedString   
---@field empty_slot_description LocalisedString   
---@field empty_slot_sprite Sprite   
---@field icon Sprite   
---@field no_fuel_status LocalisedString   
---@parent Prototype
---
--- typename: burner-usage
--- Set of data affecting tooltips, looks of gui slots etc when [burner](prototype:BurnerEnergySource) is not supposed to be burning items but eating them.
BurnerUsagePrototype = {}


---@class (exact) CapsulePrototype : ItemPrototype
---@field capsule_action CapsuleAction   
---@field radius_color Color  Color of the range radius that is shown around the player when they hold the capsule. 
---@parent ItemPrototype
---
--- typename: capsule
--- A capsule, for example a [combat robot capsule](https://wiki.factorio.com/Combat_robot_capsules) or the [raw fish](https://wiki.factorio.com/Raw_fish).
CapsulePrototype = {}


---@class (exact) FlyingRobotPrototype : EntityWithOwnerPrototype
---@field energy_per_move Energy (default: literal: value: 0) How much energy does it cost to move 1 tile.
---
---Used only by [robots with logistic interface](prototype:RobotWithLogisticInterfacePrototype). 
---@field energy_per_tick Energy (default: literal: value: 0) How much energy does it cost to fly for 1 tick.
---
---Used only by [robots with logistic interface](prototype:RobotWithLogisticInterfacePrototype). 
---@field is_military_target boolean (default: literal: value: True) Whether this prototype should be a high priority target for enemy forces. See [Military units and structures](https://wiki.factorio.com/Military_units_and_structures). 
---@field max_energy Energy (default: literal: value: 0) How much energy can be stored in the batteries.
---
---Used only by [robots with logistic interface](prototype:RobotWithLogisticInterfacePrototype). 
---@field max_speed double (default: max double) The maximum flying speed of the robot, including bonuses, in tiles/tick. Useful to limit the impact of [worker robot speed research](prototype:WorkerRobotSpeedModifier).
---
---Must be >= speed. 
---@field max_to_charge float (default: literal: value: 0.95) If the robot's battery fill ratio is more than this, it does not need to charge before stationing.
---
---Used only by [robots with logistic interface](prototype:RobotWithLogisticInterfacePrototype). 
---@field min_to_charge float (default: literal: value: 0.2) The robot will go to charge when its battery fill ratio is less than this.
---
---Used only by [robots with logistic interface](prototype:RobotWithLogisticInterfacePrototype). 
---@field speed double  The flying speed of the robot, in tiles/tick. 
---@field speed_multiplier_when_out_of_energy float (default: literal: value: 0) Some robots simply crash, some slowdown but keep going. 0 means crash.
---
---Used only by [robots with logistic interface](prototype:RobotWithLogisticInterfacePrototype). 
---@parent EntityWithOwnerPrototype
---
--- typename: null
--- Abstract base for construction/logistics and combat robots.
FlyingRobotPrototype = {}


---@class (exact) CaptureRobotPrototype : FlyingRobotPrototype
---@field capture_animation Animation   
---@field capture_speed double (default: literal: value: 1) Must be >= 0.001. 
---@field destroy_action Trigger   
---@field search_radius double (default: literal: value: 1) Must be >= 0.0. 
---@parent FlyingRobotPrototype
---
--- typename: capture-robot
--- 
CaptureRobotPrototype = {}


---@class (exact) CarPrototype : VehiclePrototype
---@field animation RotatedAnimation  Animation speed 1 means 1 frame per tile. 
---@field auto_sort_inventory boolean (default: literal: value: False) If this car prototype keeps the trunk inventory sorted. 
---@field consumption Energy   
---@field darkness_to_render_light_animation float (default: literal: value: 0.3)  
---@field effectivity double  Modifies the efficiency of energy transfer from burner output to wheels. 
---@field energy_source {'complex_type': 'union', 'options': ['BurnerEnergySource', 'VoidEnergySource'], 'full_format': False}   
---@field guns {'complex_type': 'array', 'value': 'ItemID'}  The names of the  [GunPrototype](prototype:GunPrototype)s this car prototype uses. 
---@field has_belt_immunity boolean (default: literal: value: False) If this car is immune to movement by belts. 
---@field immune_to_cliff_impacts boolean (default: literal: value: True) If this car gets damaged by driving against [cliffs](prototype:CliffPrototype). 
---@field immune_to_rock_impacts boolean (default: literal: value: False) If this car gets damaged by driving over/against [rocks](prototype:SimpleEntityPrototype::count_as_rock_for_filtered_deconstruction). 
---@field immune_to_tree_impacts boolean (default: literal: value: False) If this car gets damaged by driving over/against [trees](prototype:TreePrototype). 
---@field inventory_size ItemStackIndex  Size of the car inventory. 
---@field light LightDefinition   
---@field light_animation RotatedAnimation  Must have the same frame count as `animation`. 
---@field render_layer RenderLayer (default: literal: value: object)  
---@field rotation_snap_angle double  Vehicle will snap the vertical, horizontal or diagonal axis if it's within this angle 
---@field rotation_speed double   
---@field sound_no_fuel Sound   
---@field tank_driving boolean (default: literal: value: False) If this car prototype uses tank controls to drive. 
---@field track_particle_triggers FootstepTriggerEffectList   
---@field trash_inventory_size ItemStackIndex (default: literal: value: 0) If set to 0 then the car will not have a Logistics tab. 
---@field turret_animation RotatedAnimation  Animation speed 1 means 1 frame per tile. 
---@field turret_return_timeout uint32 (default: literal: value: 60) Timeout in ticks specifying how long the turret must be inactive to return to the default position. 
---@field turret_rotation_speed float (default: literal: value: 0.01)  
---@parent VehiclePrototype
---
--- typename: car
--- Entity with specialized properties for acceleration, braking, and turning.
CarPrototype = {}


---@class (exact) CargoBayPrototype : EntityWithOwnerPrototype
---@field build_grid_size {'complex_type': 'literal', 'value': 2} (default: literal: value: 2) Has to be 2 for 2x2 grid. 
---@field graphics_set CargoBayConnectableGraphicsSet   
---@field hatch_definitions {'complex_type': 'array', 'value': 'CargoHatchDefinition'}   
---@field inventory_size_bonus ItemStackIndex  Cannot be 0. 
---@field platform_graphics_set CargoBayConnectableGraphicsSet  A special variant which renders on space platforms. If not specified, the game will fall back to the regular graphics set. 
---@parent EntityWithOwnerPrototype
---
--- typename: cargo-bay
--- 
CargoBayPrototype = {}


---@class (exact) CargoLandingPadPrototype : EntityWithOwnerPrototype
---@field cargo_station_parameters CargoStationParameters   
---@field circuit_connector CircuitConnectorDefinition   
---@field circuit_wire_max_distance double (default: literal: value: 0) The maximum circuit wire distance for this entity. 
---@field draw_circuit_wires boolean (default: literal: value: True)  
---@field draw_copper_wires boolean (default: literal: value: True)  
---@field graphics_set CargoBayConnectableGraphicsSet   
---@field inventory_size ItemStackIndex   
---@field radar_range uint32 (default: literal: value: 0) In chunks. The radius of how many chunks this cargo landing pad charts around itself. 
---@field radar_visualisation_color Color   
---@field robot_animation Animation  Drawn when a robot brings/takes items from this landing pad. 
---@field robot_animation_sound Sound  Played when a robot brings/takes items from this landing pad. Only loaded if `robot_animation` is defined. 
---@field robot_landing_location_offset Vector  The offset from the center of this landing pad where a robot visually brings/takes items. 
---@field robot_opened_duration uint8 (default: literal: value: 0)  
---@field trash_inventory_size ItemStackIndex (default: literal: value: 0)  
---@parent EntityWithOwnerPrototype
---
--- typename: cargo-landing-pad
--- 
CargoLandingPadPrototype = {}


---@class (exact) CargoPodPrototype : EntityWithOwnerPrototype
---@field default_graphic ProcessionGraphic  Has to be of type 'pod-catalogue'. 
---@field default_shadow_graphic ProcessionGraphic  Has to be of type 'pod-catalogue'. 
---@field impact_trigger Trigger   
---@field inventory_size ItemStackIndex   
---@field procession_audio_catalogue ProcessionAudioCatalogue   
---@field procession_graphic_catalogue ProcessionGraphicCatalogue   
---@field shadow_slave_entity EntityID   
---@field spawned_container EntityID   
---@parent EntityWithOwnerPrototype
---
--- typename: cargo-pod
--- 
CargoPodPrototype = {}


---@class (exact) CargoWagonPrototype : RollingStockPrototype
---@field inventory_size ItemStackIndex  Size of the inventory of the wagon. The inventory can be limited using the red bar and filtered. This functionality cannot be turned off. 
---@field quality_affects_inventory_size boolean (default: literal: value: False)  
---@parent RollingStockPrototype
---
--- typename: cargo-wagon
--- A [cargo wagon](https://wiki.factorio.com/Cargo_wagon).
CargoWagonPrototype = {}


---@class (exact) ChainActiveTriggerPrototype : ActiveTriggerPrototype
---@field action Trigger  The trigger to apply when jumping to a new target. 
---@field fork_chance double (default: literal: value: 0) Chance that a new fork will spawn after each jump. `0` for 0% chance and `1` for 100% chance.
---
---Must be between 0 and 1. 
---@field fork_chance_increase_per_quality_level double (default: literal: value: 0.1)  
---@field jump_delay_ticks MapTick (default: literal: value: 0) Tick delay between each jump. `0` means that all jumps are instantaneous. 
---@field max_forks uint32 (default: max uint32) Maximum number of forks allowed to spawn for the entire chain. 
---@field max_forks_per_jump uint32 (default: literal: value: 1) Maximum number of forks that can spawn from a single jump. 
---@field max_jumps uint32 (default: literal: value: 5) Max number of jumps per trigger. 
---@field max_range double (default: infinity) Max distance jumps are allowed to travel away from the original target. 
---@field max_range_per_jump double (default: literal: value: 5) Max length of jumps. 
---@parent ActiveTriggerPrototype
---
--- typename: chain-active-trigger
--- Jumps between targets and applies a [Trigger](prototype:Trigger) to them.
ChainActiveTriggerPrototype = {}


---@class (exact) ChangedSurfaceAchievementPrototype : AchievementPrototype
---@field surface string  This will trigger the achievement, if the player changes to this surface. 
---@parent AchievementPrototype
---
--- typename: change-surface-achievement
--- This prototype is used for receiving an achievement when the player changes to a surface.
ChangedSurfaceAchievementPrototype = {}


---@class (exact) CharacterCorpsePrototype : EntityPrototype
---@field armor_picture_mapping {'complex_type': 'dictionary', 'key': 'ItemID', 'value': 'int32'}  Table of key value pairs, the keys are armor names and the values are numbers. The number is the Animation that is associated with the armor, e.g. using `1` will associate the armor with the first Animation in the pictures table. 
---@field picture Animation  Mandatory if `pictures` is not defined. 
---@field pictures AnimationVariations  Mandatory if `picture` is not defined. 
---@field render_layer RenderLayer (default: literal: value: object)  
---@field time_to_live uint32  0 for infinite. 
---@parent EntityPrototype
---
--- typename: character-corpse
--- The corpse of a [CharacterPrototype](prototype:CharacterPrototype).
CharacterCorpsePrototype = {}


---@class (exact) CharacterPrototype : EntityWithOwnerPrototype
---@field animations {'complex_type': 'array', 'value': 'CharacterArmorAnimation'}   
---@field build_distance uint32   
---@field character_corpse EntityID  Name of the character corpse that is spawned when this character dies. 
---@field crafting_categories {'complex_type': 'array', 'value': 'RecipeCategoryID'}  Names of the crafting categories the character can craft recipes from. The built-in categories can be found [here](https://wiki.factorio.com/Data.raw#recipe-category). See also [RecipeCategory](prototype:RecipeCategory). 
---@field crafting_speed double (default: literal: value: 1)  
---@field damage_hit_tint Color   
---@field distance_per_frame double   
---@field drop_item_distance uint32   
---@field enter_vehicle_distance double (default: literal: value: 3.0) Must be >= 0. 
---@field flying_bob_speed float (default: literal: value: 1)  
---@field flying_collision_mask CollisionMaskConnector  This collision mask is used when the character is flying.
---
---Defaults to the mask from [UtilityConstants::default_collision_masks](prototype:UtilityConstants::default_collision_masks) when indexed by `"character/flying"`. 
---@field footprint_particles {'complex_type': 'array', 'value': 'FootprintParticle'}  Triggered when the running animation (`animations`) rolls over the frames defined in `right_footprint_frames` and `left_footprint_frames`. 
---@field footstep_particle_triggers FootstepTriggerEffectList  Triggered every tick of the running animation. 
---@field grounded_landing_search_radius double (default: literal: value: 0) The search radius for a non-colliding position to move the player to if they are grounded mid-flight. Must be >= 0. 
---@field guns_inventory_size ItemStackIndex (default: literal: value: 3) Must be between 1 and 15. 
---@field has_belt_immunity boolean (default: literal: value: False) Whether this character is moved by belts when standing on them. 
---@field heartbeat Sound  The sound played when the character's health is low. 
---@field inventory_size ItemStackIndex  Number of slots in the main inventory. May be 0. 
---@field is_military_target boolean (default: literal: value: True) Whether this prototype should be a high priority target for enemy forces. See [Military units and structures](https://wiki.factorio.com/Military_units_and_structures). 
---@field item_pickup_distance double   
---@field left_footprint_frames {'complex_type': 'array', 'value': 'float'}  The frames in the running animation (`animations`) where the left foot touches the ground. 
---@field left_footprint_offset Vector  Offset from the center of the entity for the left footprint. Used by `footprint_particles`. 
---@field light LightDefinition   
---@field loot_pickup_distance double   
---@field maximum_corner_sliding_distance double   
---@field mining_categories {'complex_type': 'array', 'value': 'ResourceCategoryID'}  Names of the resource categories the character can mine resources from. 
---@field mining_speed double   
---@field mining_with_tool_particles_animation_positions {'complex_type': 'array', 'value': 'float'}  List of positions in the mining with tool animation when the mining sound and mining particles are created. 
---@field moving_sound_animation_positions {'complex_type': 'array', 'value': 'float'}   
---@field reach_distance uint32   
---@field reach_resource_distance double   
---@field respawn_time uint32 (default: literal: value: 10) Time in seconds. Must be positive 
---@field right_footprint_frames {'complex_type': 'array', 'value': 'float'}  The frames in the running animation (`animations`) where the right foot touches the ground. 
---@field right_footprint_offset Vector  Offset from the center of the entity for the right footprint. Used by `footprint_particles`. 
---@field running_sound_animation_positions {'complex_type': 'array', 'value': 'float'}  List of positions in the running animation when the walking sound is played. 
---@field running_speed double   
---@field synced_footstep_particle_triggers FootstepTriggerEffectList  Triggered when the running animation (`animations`) rolls over the frames defined in `right_footprint_frames` and `left_footprint_frames`. 
---@field ticks_to_keep_aiming_direction uint32   
---@field ticks_to_keep_gun uint32   
---@field ticks_to_stay_in_combat uint32   
---@field tool_attack_distance double (default: literal: value: 1.5)  
---@field tool_attack_result Trigger   
---@parent EntityWithOwnerPrototype
---
--- typename: character
--- Entity that you move around on the screen during the campaign and freeplay.
CharacterPrototype = {}


---@class (exact) CliffPrototype : EntityPrototype
---@field cliff_explosive ItemID  Name of a capsule that has a robot_action to explode cliffs. 
---@field grid_offset Vector   
---@field grid_size Vector   
---@field orientations OrientedCliffPrototypeSet   
---@field place_as_crater CraterPlacementDefinition   
---@parent EntityPrototype
---
--- typename: cliff
--- A [cliff](https://wiki.factorio.com/Cliff).
CliffPrototype = {}


---@class (exact) CollisionLayerPrototype : Prototype
---@parent Prototype
---
--- typename: collision-layer
--- A collision layer. Used for [collision masks](prototype:CollisionMaskConnector).
---
---It's recommend to use underscores instead of dashes in `name` so that the name can easily be used as a table key when defining collision masks.
CollisionLayerPrototype = {}


---@class (exact) CombatRobotCountAchievementPrototype : AchievementPrototype
---@field count uint32 (default: literal: value: 1) This will trigger the achievement, if player's current robot count is over this amount. 
---@parent AchievementPrototype
---
--- typename: combat-robot-count-achievement
--- This prototype is used for receiving an achievement when the player has a certain robot follower count.
CombatRobotCountAchievementPrototype = {}


---@class (exact) CombatRobotPrototype : FlyingRobotPrototype
---@field attack_parameters AttackParameters   
---@field destroy_action Trigger  Applied when the combat robot expires (runs out of `time_to_live`). 
---@field follows_player boolean (default: literal: value: False)  
---@field friction double (default: literal: value: 0)  
---@field idle RotatedAnimation   
---@field in_motion RotatedAnimation   
---@field light LightDefinition   
---@field range_from_player double (default: literal: value: 0)  
---@field shadow_idle RotatedAnimation   
---@field shadow_in_motion RotatedAnimation   
---@field time_to_live uint32   
---@parent FlyingRobotPrototype
---
--- typename: combat-robot
--- A combat robot. Can attack enemies.
CombatRobotPrototype = {}


---@class (exact) CompleteObjectiveAchievementPrototype : AchievementPrototypeWithCondition
---@field within MapTick (default: `math.huge`) The achievement must be completed within this time limit. 
---@parent AchievementPrototypeWithCondition
---
--- typename: complete-objective-achievement
--- 
CompleteObjectiveAchievementPrototype = {}


---@class (exact) ConstantCombinatorPrototype : EntityWithOwnerPrototype
---@field activity_led_light LightDefinition   
---@field activity_led_light_offsets {'complex_type': 'tuple', 'values': ['Vector', 'Vector', 'Vector', 'Vector']}   
---@field activity_led_sprites Sprite4Way   
---@field circuit_wire_connection_points {'complex_type': 'tuple', 'values': ['WireConnectionPoint', 'WireConnectionPoint', 'WireConnectionPoint', 'WireConnectionPoint']}   
---@field circuit_wire_max_distance double (default: literal: value: 0) The maximum circuit wire distance for this entity. 
---@field draw_circuit_wires boolean (default: literal: value: True)  
---@field draw_copper_wires boolean (default: literal: value: True)  
---@field pulse_duration uint32 (default: literal: value: 0) When not zero, toggle entity will enable constant combinator for that amount of ticks and then turn it off. 
---@field sprites Sprite4Way   
---@parent EntityWithOwnerPrototype
---
--- typename: constant-combinator
--- A [constant combinator](https://wiki.factorio.com/Constant_combinator).
ConstantCombinatorPrototype = {}


---@class (exact) ConstructWithRobotsAchievementPrototype : AchievementPrototype
---@field amount uint32 (default: literal: value: 0) This will trigger the achievement, if enough entities were placed using construction robots. 
---@field limited_to_one_game boolean  If this is false, the player carries over their statistics from this achievement through all their saves. 
---@field more_than_manually boolean (default: literal: value: False)  
---@parent AchievementPrototype
---
--- typename: construct-with-robots-achievement
--- This prototype is used for receiving an achievement when the player constructs enough entities with construction robots.
ConstructWithRobotsAchievementPrototype = {}


---@class (exact) RobotWithLogisticInterfacePrototype : FlyingRobotPrototype
---@field charging_sound InterruptibleSound   
---@field destroy_action Trigger  Applied when the robot expires (runs out of energy and [FlyingRobotPrototype::speed_multiplier_when_out_of_energy](prototype:FlyingRobotPrototype::speed_multiplier_when_out_of_energy) is 0). 
---@field draw_cargo boolean (default: literal: value: True)  
---@field idle RotatedAnimation  Only the first frame of the animation is drawn. This means that the graphics for the idle state cannot be animated. 
---@field in_motion RotatedAnimation  Only the first frame of the animation is drawn. This means that the graphics for the in_motion state cannot be animated. 
---@field max_payload_size ItemCountType  The robot's cargo carrying capacity. Can be increased by [worker robot cargo size research](prototype:WorkerRobotStorageModifier). 
---@field max_payload_size_after_bonus ItemCountType (default: max ItemCountType) The robot's maximum possible cargo carrying capacity, including bonuses. Useful to limit the impact of [worker robot cargo size research](prototype:WorkerRobotStorageModifier).
---
---Must be >= max_payload_size. 
---@field shadow_idle RotatedAnimation  Only the first frame of the animation is drawn. This means that the graphics for the idle state cannot be animated. 
---@field shadow_in_motion RotatedAnimation  Only the first frame of the animation is drawn. This means that the graphics for the in_motion state cannot be animated. 
---@parent FlyingRobotPrototype
---
--- typename: null
--- The common properties of logistic and construction robots represented by an abstract prototype.
RobotWithLogisticInterfacePrototype = {}


---@class (exact) ConstructionRobotPrototype : RobotWithLogisticInterfacePrototype
---@field collision_box BoundingBox (default: Empty = `{{0, 0}, {0, 0}}`) Must have a collision box size of zero. 
---@field construction_vector Vector   
---@field mined_sound_volume_modifier float (default: literal: value: 1.0)  
---@field repairing_sound Sound   
---@field shadow_working RotatedAnimation   
---@field smoke Animation   
---@field sparks AnimationVariations   
---@field working RotatedAnimation   
---@field working_light LightDefinition   
---@parent RobotWithLogisticInterfacePrototype
---
--- typename: construction-robot
--- A [construction robot](https://wiki.factorio.com/Construction_robot).
ConstructionRobotPrototype = {}


---@class (exact) ContainerPrototype : EntityWithOwnerPrototype
---@field circuit_connector CircuitConnectorDefinition   
---@field circuit_wire_max_distance double (default: literal: value: 0) The maximum circuit wire distance for this container. 
---@field default_status EntityStatus (default: literal: value: normal)  
---@field draw_circuit_wires boolean (default: literal: value: True)  
---@field draw_copper_wires boolean (default: literal: value: True)  
---@field inventory_properties InventoryWithCustomStackSizeSpecification  Only used when `inventory_type` is `"with_custom_stack_size"`. 
---@field inventory_size ItemStackIndex  The number of slots in this container. 
---@field inventory_type {'complex_type': 'union', 'options': [{'complex_type': 'literal', 'value': 'normal'}, {'complex_type': 'literal', 'value': 'with_bar'}, {'complex_type': 'literal', 'value': 'with_filters_and_bar'}, {'complex_type': 'literal', 'value': 'with_custom_stack_size'}, {'complex_type': 'literal', 'value': 'with_weight_limit'}], 'full_format': False} (default: literal: value: with_bar) Determines the type of inventory that this container has. Whether the inventory has a limiter bar, can be filtered (like cargo wagons), uses a custom stack size for contained item stacks (like artillery wagon), or uses a weight limit (like space age rocket silo). 
---@field inventory_weight_limit Weight (default: literal: value: 0) Only used when `inventory_type` is `"with_weight_limit"`. 
---@field picture Sprite  The picture displayed for this entity. 
---@field quality_affects_inventory_size boolean (default: literal: value: True)  
---@parent EntityWithOwnerPrototype
---
--- typename: container
--- A generic container, such as a chest. Cannot be rotated.
ContainerPrototype = {}


---@class (exact) CopyPasteToolPrototype : SelectionToolPrototype
---@field alt_select SelectionModeData  The filters are parsed, but then ignored and forced to be empty. 
---@field always_include_tiles boolean (default: literal: value: False) This property is hardcoded to `false`. 
---@field cuts boolean (default: literal: value: False)  
---@field select SelectionModeData  The filters are parsed, but then ignored and forced to be empty. 
---@field stack_size {'complex_type': 'literal', 'value': 1}  Count of items of the same name that can be stored in one inventory slot. Must be 1 when the `"not-stackable"` flag is set. 
---@parent SelectionToolPrototype
---
--- typename: copy-paste-tool
--- A copy-paste or cut-paste tool.
CopyPasteToolPrototype = {}


---@class (exact) CorpsePrototype : EntityPrototype
---@field animation RotatedAnimationVariations  The dying animation. 
---@field animation_overlay RotatedAnimationVariations  Variation count must be the same as `animation` variation count. Direction count must be the same as `animation` direction count. Frame count must be the same as `animation` frame count. 
---@field animation_overlay_final_render_layer RenderLayer (default: literal: value: corpse)  
---@field animation_overlay_render_layer RenderLayer (default: literal: value: object)  
---@field animation_render_layer RenderLayer (default: literal: value: object)  
---@field auto_setup_collision_box boolean (default: literal: value: True) If true, and the collision box is unset, this will take the collision box of the first entity that uses this corpse. 
---@field decay_animation RotatedAnimationVariations   
---@field decay_frame_transition_duration float (default: literal: value: 0)  
---@field direction_shuffle {'complex_type': 'array', 'value': {'complex_type': 'array', 'value': 'uint16'}} (default: No direction shuffle) May not be an empty array. May not be used if there is no `animation` defined.
---
---The inner arrays are called "groups" and must all have the same size.
---
---The indices map to the directions of `animation` and they are 1-indexed. After the `shuffle_directions_at_frame` frame of the `animation`, these indices are used as the direction when choosing which frame to render. The chosen shuffled direction can be any direction in the same group as the non-shuffled direction. Which direction is chosen from the group depends on the shuffle variation which is `dying_graphics_variation % group_size`. 
---@field dying_speed float (default: literal: value: 1) Multiplier for `time_before_shading_off` and `time_before_removed`. Must be positive.
---
---Controls the speed of the animation: `1 ÷ dying_speed = duration of the animation` 
---@field expires boolean (default: literal: value: True)  
---@field final_render_layer RenderLayer (default: literal: value: corpse)  
---@field ground_patch AnimationVariations   
---@field ground_patch_decay AnimationVariations   
---@field ground_patch_fade_in_delay float (default: literal: value: 0)  
---@field ground_patch_fade_in_speed float (default: literal: value: 0)  
---@field ground_patch_fade_out_duration float (default: literal: value: 0)  
---@field ground_patch_fade_out_start float (default: literal: value: 0)  
---@field ground_patch_higher AnimationVariations   
---@field ground_patch_render_layer RenderLayer (default: literal: value: ground-patch)  
---@field protected_from_tile_building boolean (default: literal: value: False)  
---@field remove_on_entity_placement boolean (default: literal: value: True)  
---@field remove_on_tile_placement boolean (default: literal: value: True)  
---@field shuffle_directions_at_frame uint8 (default: literal: value: 1) Defines after which frame in the `animation` the `direction_shuffle` should be applied. Can be set to `0`, frames are 1-indexed. 
---@field splash AnimationVariations   
---@field splash_render_layer RenderLayer (default: literal: value: object)  
---@field splash_speed float (default: literal: value: 1) Controls the speed of the splash animation: `1 ÷ splash_speed = duration of the splash animation` 
---@field time_before_removed uint32 (default: 60 * 120 (120 seconds)) Time in ticks this corpse lasts. May not be 0. 
---@field time_before_shading_off uint32 (default: 60 * 15 (15 seconds)) Controls how long the corpse takes to fade, as in how long it takes to get from no transparency to full transparency/removed. This time is *not* added to `time_before_removed`, it is instead subtracted from it. So by default, the corpse starts fading about 15 seconds before it gets removed. 
---@field underwater_layer_offset int8 (default: literal: value: 1)  
---@field underwater_patch RotatedSprite   
---@field use_decay_layer boolean (default: literal: value: False)  
---@field use_tile_color_for_ground_patch_tint boolean (default: literal: value: False)  
---@parent EntityPrototype
---
--- typename: corpse
--- Used for corpses, for example the remnants when destroying buildings.
CorpsePrototype = {}


---@class (exact) CreatePlatformAchievementPrototype : AchievementPrototype
---@field amount uint32 (default: literal: value: 1) How many space platforms need to be created. 
---@parent AchievementPrototype
---
--- typename: create-platform-achievement
--- This prototype is used for receiving an achievement when the player creates a space platform.
CreatePlatformAchievementPrototype = {}


---@class (exact) RailPrototype : EntityWithOwnerPrototype
---@field build_grid_size {'complex_type': 'literal', 'value': 2} (default: literal: value: 2) Has to be 2 for 2x2 grid. 
---@field deconstruction_marker_positions {'complex_type': 'array', 'value': 'Vector'}   
---@field ending_shifts {'complex_type': 'array', 'value': 'Vector'}   
---@field extra_planner_goal_penalty double (default: literal: value: 0)  
---@field extra_planner_penalty double (default: literal: value: 0)  
---@field fence_pictures RailFenceGraphicsSet   
---@field forced_fence_segment_count uint8 (default: literal: value: 0) Must be 0, 2 or 4. Can't be non-zero if `fence_pictures` is defined. 
---@field pictures RailPictureSet   
---@field removes_soft_decoratives boolean (default: literal: value: False)  
---@field selection_box BoundingBox  The rail [selection_boxes](prototype:EntityPrototype::selection_box) are automatically calculated from the collision boxes, which are hardcoded. So effectively the selection boxes also hardcoded. 
---@field walking_sound Sound  Sound played when a character walks over this rail. 
---@parent EntityWithOwnerPrototype
---
--- typename: null
--- The abstract base of all rail prototypes.
RailPrototype = {}


---@class (exact) CurvedRailAPrototype : RailPrototype
---@field collision_box BoundingBox (default: `{{-0.7, -2.516}, {0.7, 2.516}}`) The [collision_box](prototype:EntityPrototype::collision_box) of straight rail is hardcoded to `{{-0.7, -2.516}, {0.7, 2.516}}`. 
---@parent RailPrototype
---
--- typename: curved-rail-a
--- A curved-A rail.
CurvedRailAPrototype = {}


---@class (exact) CurvedRailBPrototype : RailPrototype
---@field collision_box BoundingBox (default: `{{-0.7, -2.441}, {0.7, 2.441}}`) The [collision_box](prototype:EntityPrototype::collision_box) of straight rail is hardcoded to `{{-0.7, -2.441}, {0.7, 2.441}}`. 
---@parent RailPrototype
---
--- typename: curved-rail-b
--- A curved-B rail.
CurvedRailBPrototype = {}


---@class (exact) CustomEventPrototype : Prototype
---@parent Prototype
---
--- typename: custom-event
--- Custom events share the same namespace as custom inputs and built-in events for subscribing to and raising them.
CustomEventPrototype = {}


---@class (exact) CustomInputPrototype : Prototype
---@field action {'complex_type': 'union', 'options': [{'complex_type': 'literal', 'value': 'lua'}, {'complex_type': 'literal', 'value': 'spawn-item'}, {'complex_type': 'literal', 'value': 'toggle-personal-roboport'}, {'complex_type': 'literal', 'value': 'toggle-personal-logistic-requests'}, {'complex_type': 'literal', 'value': 'toggle-equipment-movement-bonus'}], 'full_format': False} (default: literal: value: lua) A [Lua event](runtime:CustomInputEvent) is only raised if the action is "lua". 
---@field alternative_key_sequence string  The alternative key binding for this control. See `key_sequence` for the format. 
---@field block_modifiers boolean (default: literal: value: False) If `true`, when the shortcut is activated, the modifiers used for this shortcut can't be re-used to press something else until unpressed. The example where this is useful is ALT+A to activate spidertron remote, where ALT is consumed, so pressing right mouse button before the ALT is unpressed will not trigger pin creation (ALT + right mouse button), but send the selected unit instead. 
---@field consuming ConsumingType (default: literal: value: none) Sets whether internal game events associated with the same key sequence should be fired or blocked. If they are fired ("none"), then the custom input event will happen before the internal game event. 
---@field controller_alternative_key_sequence string  The alternative controller (game pad) keybinding for this control. See `controller_key_sequence` for the format. 
---@field controller_key_sequence string  The controller (game pad) keybinding for this control. Use `""` (empty string) for unassigned.
---
---As modifier buttons, these names are used: `"controller-righttrigger"`, `"controller-lefttrigger"`.
---
---`" + "` is used to separate modifier buttons from normal buttons, like so: `"controller-righttrigger + controller-a"`. A key binding can contain any amount of individual modifier buttons, but only a single normal button (listed below). 
---@field enabled boolean (default: literal: value: True) If this custom input is enabled. Disabled custom inputs exist but are not used by the game. If disabled, no event is raised when the input is used. 
---@field enabled_while_in_cutscene boolean (default: literal: value: False)  
---@field enabled_while_spectating boolean (default: literal: value: False)  
---@field include_selected_prototype boolean (default: literal: value: False) If true, the type and name of the currently selected prototype will be provided as "selected_prototype" in the raised [Lua event](runtime:CustomInputEvent). [This also works in GUIs](https://forums.factorio.com/96125), not just the game world.
---
---This will also return an item in the cursor such as copper-wire or rail-planner, if nothing is beneath the cursor. 
---@field item_to_spawn ItemID  The item will be created when this input is pressed and action is set to "spawn-item". The item must have the [spawnable](prototype:ItemPrototypeFlags::spawnable) flag set. 
---@field key_sequence string  The default key sequence for this custom input. Use `""` (empty string) for unassigned.
---
---As modifier keys, these names are used: `"CONTROL"`, `"SHIFT"`, `"COMMAND"`, `"ALT"`. Note that `"COMMAND"` is loaded as `"CONTROL"` on Windows and Linux.
---
---`" + "` is used to separate modifier keys from normal keys, like so: `"ALT + G"`. A key binding can contain any amount of individual modifier keys, but only a single normal mouse button or keyboard key (listed below). 
---@field linked_game_control LinkedGameControl (default: literal: value: ) When a custom-input is linked to a game control it won't show up in the control-settings GUI and will fire when the linked control is pressed. 
---@field name string  Unique textual identification of the prototype. May only contain alphanumeric characters, dashes and underscores. May not exceed a length of 200 characters.
---
---For a list of all names used in vanilla, see [data.raw](https://wiki.factorio.com/Data.raw).
---
---It is also the name for the event that is raised when they key (combination) is pressed and action is `"lua"`, see [Tutorial:Script interfaces](https://wiki.factorio.com/Tutorial:Script_interfaces#Custom_input). 
---@parent Prototype
---
--- typename: custom-input
--- Used for custom keyboard shortcuts/key bindings in mods. The key associated with the custom input can be changed in the options. This means that `key_sequence` is simply the default key binding.
CustomInputPrototype = {}


---@class (exact) DamageType : Prototype
---@parent Prototype
---
--- typename: damage-type
--- A damage type. This is used in the [damage system](https://wiki.factorio.com/Damage). [A list of built-in damage types can be found here](https://wiki.factorio.com/Damage#Damage_types).
DamageType = {}


---@class (exact) DeciderCombinatorPrototype : CombinatorPrototype
---@field equal_symbol_sprites Sprite4Way   
---@field greater_or_equal_symbol_sprites Sprite4Way   
---@field greater_symbol_sprites Sprite4Way   
---@field less_or_equal_symbol_sprites Sprite4Way   
---@field less_symbol_sprites Sprite4Way   
---@field not_equal_symbol_sprites Sprite4Way   
---@parent CombinatorPrototype
---
--- typename: decider-combinator
--- A [decider combinator](https://wiki.factorio.com/Decider_combinator).
DeciderCombinatorPrototype = {}


---@class (exact) DeconstructWithRobotsAchievementPrototype : AchievementPrototype
---@field amount uint32  This will trigger the achievement, if enough entities were deconstructed using construction robots. 
---@parent AchievementPrototype
---
--- typename: deconstruct-with-robots-achievement
--- This prototype is used for receiving an achievement when the player deconstructs enough entities with construction robots.
DeconstructWithRobotsAchievementPrototype = {}


---@class (exact) DeconstructibleTileProxyPrototype : EntityPrototype
---@parent EntityPrototype
---
--- typename: deconstructible-tile-proxy
--- Entity used to signify that the tile below it should be deconstructed.
DeconstructibleTileProxyPrototype = {}


---@class (exact) DeconstructionItemPrototype : SelectionToolPrototype
---@field alt_select SelectionModeData  The [SelectionModeData::mode](prototype:SelectionModeData::mode) is hardcoded to `"cancel-deconstruct"`.
---
---The filters are parsed, but then ignored and forced to be empty. 
---@field always_include_tiles boolean (default: literal: value: False) This property is hardcoded to `false`. 
---@field entity_filter_count ItemStackIndex (default: literal: value: 0) Can't be > 255. 
---@field select SelectionModeData  The [SelectionModeData::mode](prototype:SelectionModeData::mode) is hardcoded to `"deconstruct"`.
---
---The filters are parsed, but then ignored and forced to be empty. 
---@field stack_size {'complex_type': 'literal', 'value': 1}  Count of items of the same name that can be stored in one inventory slot. Must be 1 when the `"not-stackable"` flag is set. 
---@field tile_filter_count ItemStackIndex (default: literal: value: 0) Can't be > 255. 
---@parent SelectionToolPrototype
---
--- typename: deconstruction-item
--- A [deconstruction planner](https://wiki.factorio.com/Deconstruction_planner).
DeconstructionItemPrototype = {}


---@class (exact) DecorativePrototype : Prototype
---@field autoplace AutoplaceSpecification   
---@field collision_box BoundingBox  Must contain the [0,0] point. Max radius of the collision box is 8. 
---@field collision_mask CollisionMaskConnector  Defaults to the mask from [UtilityConstants::default_collision_masks](prototype:UtilityConstants::default_collision_masks) when indexed by `"decorative"`. 
---@field decal_overdraw_priority uint16 (default: literal: value: 0) Loaded only if `render_layer` = "decals". When decoratives are being spawned by [EnemySpawnerPrototype::spawn_decoration](prototype:EnemySpawnerPrototype::spawn_decoration) or [TurretPrototype::spawn_decoration](prototype:TurretPrototype::spawn_decoration), decals with `decal_overdraw_priority` greater than 0 will be filtered such that they don't overlap too much. If two or more decals would overlap, only the one with the largest value of `decal_overdraw_priority` is placed. 
---@field grows_through_rail_path boolean (default: literal: value: False)  
---@field minimal_separation double (default: literal: value: 0.0)  
---@field opacity_over_water float (default: literal: value: 1) Loaded only if `render_layer` = "decals". Value lower than 1 enables masking by water for decals with `tile_layer` greater or equal to [UtilityConstants::capture_water_mask_at_layer](prototype:UtilityConstants::capture_water_mask_at_layer). Water tiles must use water `tile-effect` with [WaterTileEffectParameters::lightmap_alpha](prototype:WaterTileEffectParameters::lightmap_alpha) set to 0 or value less than 1. Graphics option `Occlude light sprites` must be enabled, as water mask is captured into terrain lightmap alpha channel. Tiles rendered in layer between [UtilityConstants::capture_water_mask_at_layer](prototype:UtilityConstants::capture_water_mask_at_layer) and decal's `tile_layer` will likely also mask decals in some way, as water mask will likely be 0 at their position, but this is considered undefined behavior. 
---@field pictures SpriteVariations  Must contain at least 1 picture. 
---@field placed_effect TriggerEffect   
---@field render_layer RenderLayer (default: literal: value: decorative) When "decals" render layer is used, the decorative is treated as decal. That means it will be rendered within tile layers instead of normal sprite layers. 
---@field stateless_visualisation {'complex_type': 'union', 'options': ['StatelessVisualisation', {'complex_type': 'array', 'value': 'StatelessVisualisation'}], 'full_format': False}  Can be defined only when decorative is not "decal" (see `render_layer`). 
---@field stateless_visualisation_variations {'complex_type': 'array', 'value': {'complex_type': 'union', 'options': ['StatelessVisualisation', {'complex_type': 'array', 'value': 'StatelessVisualisation'}], 'full_format': False}}  Only loaded if `stateless_visualisation` is not defined. Can be defined only when decorative is not "decal" (see `render_layer`). 
---@field target_count uint16 (default: literal: value: 0)  
---@field tile_layer int16 (default: literal: value: 0) Mandatory if `render_layer` = "decals". This int16 is converted to a [TileRenderLayer](prototype:TileRenderLayer) internally. It is offset from `ground-natural`. 
---@field trigger_effect TriggerEffect  Called by [DestroyDecorativesTriggerEffectItem](prototype:DestroyDecorativesTriggerEffectItem). 
---@field walking_sound Sound   
---@parent Prototype
---
--- typename: optimized-decorative
--- Simple decorative purpose objects on the map, they have no health and some of them are removed when the player builds over. Usually used for grass patches, roots, small plants etc.
DecorativePrototype = {}


---@class (exact) DelayedActiveTriggerPrototype : ActiveTriggerPrototype
---@field action Trigger  The trigger to apply after `delay` has elapsed. 
---@field cancel_when_source_is_destroyed boolean (default: literal: value: False) If true, the delayed trigger is cancelled if the source entity is destroyed. 
---@field delay uint32  The number of ticks to delay the delivery of the triggered effect. Must be greater than 0. 
---@field repeat_count uint32 (default: literal: value: 0) The number of times to repeat the delayed trigger. 
---@field repeat_delay uint32 (default: Value of `delay`) The number of ticks between repeat deliveries of the triggered effect. Must be greater than 0. 
---@parent ActiveTriggerPrototype
---
--- typename: delayed-active-trigger
--- Delays the delivery of triggered effect by some number of ticks.
DelayedActiveTriggerPrototype = {}


---@class (exact) DeliverByRobotsAchievementPrototype : AchievementPrototype
---@field amount uint32  This will trigger the achievement, when the player receives enough items through logistic robots. 
---@parent AchievementPrototype
---
--- typename: deliver-by-robots-achievement
--- This prototype is used for receiving an achievement, when the player requests and receives enough items using logistic robots.
DeliverByRobotsAchievementPrototype = {}


---@class (exact) DeliverCategory 
---@field name string  Name of the deliver category. 
---@field type {'complex_type': 'literal', 'value': 'deliver-category'}   
---
---
--- typename: deliver-category
--- 
DeliverCategory = {}


---@class (exact) DeliverImpactCombination 
---@field deliver_category string   
---@field impact_category string   
---@field name string  Name of the deliver impact combination. 
---@field trigger_effect_item TriggerEffect   
---@field type {'complex_type': 'literal', 'value': 'deliver-impact-combination'}   
---
---
--- typename: deliver-impact-combination
--- 
DeliverImpactCombination = {}


---@class (exact) DepleteResourceAchievementPrototype : AchievementPrototype
---@field amount uint32 (default: literal: value: 1) How many resource entities need to be depleted. 
---@field limited_to_one_game boolean (default: literal: value: False) If this is false, the player carries over their statistics from this achievement through all their saves. 
---@parent AchievementPrototype
---
--- typename: deplete-resource-achievement
--- This prototype is used for receiving an achievement when a resource entity is depleted.
DepleteResourceAchievementPrototype = {}


---@class (exact) DestroyCliffAchievementPrototype : AchievementPrototype
---@field amount uint32 (default: literal: value: 1)  
---@field limited_to_one_game boolean (default: literal: value: False) If this is false, the player carries over their statistics from this achievement through all their saves. 
---@parent AchievementPrototype
---
--- typename: destroy-cliff-achievement
--- 
DestroyCliffAchievementPrototype = {}


---@class (exact) DisplayPanelPrototype : EntityWithOwnerPrototype
---@field background_color Color  The background color of the display panel text. 
---@field circuit_connector {'complex_type': 'tuple', 'values': ['CircuitConnectorDefinition', 'CircuitConnectorDefinition', 'CircuitConnectorDefinition', 'CircuitConnectorDefinition']}   
---@field circuit_wire_max_distance double (default: literal: value: 0) The maximum circuit wire distance for this entity. 
---@field draw_circuit_wires boolean (default: literal: value: True)  
---@field draw_copper_wires boolean (default: literal: value: True)  
---@field max_text_width uint32 (default: literal: value: 400) The maximum display width of the text on the display panel. If the text exceeds this width it will be wrapped so that it continues on the next line. 
---@field sprites Sprite4Way  The display panel's graphics. 
---@field text_color Color  The color of the text on the display panel. 
---@field text_shift Vector  The shift of the text on the display panel. 
---@parent EntityWithOwnerPrototype
---
--- typename: display-panel
--- Entity that display a signal icon and some text, either configured directly in the entity or through the circuit network.
DisplayPanelPrototype = {}


---@class (exact) DontBuildEntityAchievementPrototype : AchievementPrototypeWithCondition
---@field amount uint32 (default: literal: value: 0)  
---@field dont_build {'complex_type': 'union', 'options': ['EntityID', {'complex_type': 'array', 'value': 'EntityID'}], 'full_format': False}  This will disable the achievement, if this entity is placed. If you finish the game without building this entity, you receive the achievement. 
---@field research_with {'complex_type': 'union', 'options': ['ItemID', {'complex_type': 'array', 'value': 'ItemID'}], 'full_format': False}  If you research technology using one of specified items before building entity, you receive the achievement. 
---@parent AchievementPrototypeWithCondition
---
--- typename: dont-build-entity-achievement
--- This prototype is used for receiving an achievement when the player finishes the game without building a specific entity.
DontBuildEntityAchievementPrototype = {}


---@class (exact) DontCraftManuallyAchievementPrototype : AchievementPrototypeWithCondition
---@field amount uint32  This will disable the achievement, if the player crafts more than this. 
---@parent AchievementPrototypeWithCondition
---
--- typename: dont-craft-manually-achievement
--- This prototype is used for receiving an achievement when the player finishes the game without crafting more than a set amount.
DontCraftManuallyAchievementPrototype = {}


---@class (exact) DontKillManuallyAchievementPrototype : AchievementPrototypeWithCondition
---@field to_kill EntityID  This will disable the achievement, if this entity is killed manually. If you kill this entity with artillery first, you receive the achievement. 
---@field type_not_to_kill string  This will disable the achievement, if this entity type is killed manually. If you kill this entity type with artillery first, you receive the achievement. 
---@parent AchievementPrototypeWithCondition
---
--- typename: dont-kill-manually-achievement
--- This prototype is used for receiving an achievement when the player kill first entity using artillery.
DontKillManuallyAchievementPrototype = {}


---@class (exact) DontResearchBeforeResearchingAchievementPrototype : AchievementPrototypeWithCondition
---@field dont_research {'complex_type': 'union', 'options': ['ItemID', {'complex_type': 'array', 'value': 'ItemID'}], 'full_format': False}  This will disable the achievement, if technology unlocking this item is researched before meeting requirements. 
---@field research_with {'complex_type': 'union', 'options': ['ItemID', {'complex_type': 'array', 'value': 'ItemID'}], 'full_format': False}  If you research technology using one of specified items, you receive the achievement. 
---@parent AchievementPrototypeWithCondition
---
--- typename: dont-research-before-researching-achievement
--- This prototype is used for receiving an achievement when the player researches with a specific science pack before unlocking another.
DontResearchBeforeResearchingAchievementPrototype = {}


---@class (exact) DontUseEntityInEnergyProductionAchievementPrototype : AchievementPrototypeWithCondition
---@field excluded {'complex_type': 'union', 'options': ['EntityID', {'complex_type': 'array', 'value': 'EntityID'}], 'full_format': False}  This will **not** disable the achievement, if this entity is placed, and you have received any amount of power from it. 
---@field included {'complex_type': 'union', 'options': ['EntityID', {'complex_type': 'array', 'value': 'EntityID'}], 'full_format': False}  This will disable the achievement, if this entity is placed, and you have received any amount of power from it. If you finish the game without receiving power from this entity, you receive the achievement. 
---@field last_hour_only boolean (default: literal: value: False) If `true`, the achievements will only be checked for the last hour of the game, independently of finishing the game. 
---@field minimum_energy_produced Energy (default: literal: value: 0J) The minimum amount of energy that needs to be produced by the allowed entities to trigger the achievement. 
---@parent AchievementPrototypeWithCondition
---
--- typename: dont-use-entity-in-energy-production-achievement
--- This prototype is used for receiving an achievement when the player finishes the game without receiving energy from a specific energy source.
DontUseEntityInEnergyProductionAchievementPrototype = {}


---@class (exact) EditorControllerPrototype 
---@field adjust_speed_based_off_zoom boolean   
---@field enable_flash_light boolean   
---@field fill_built_entity_energy_buffers boolean   
---@field generate_neighbor_chunks boolean   
---@field gun_inventory_size ItemStackIndex   
---@field ignore_tile_conditions boolean   
---@field instant_blueprint_building boolean   
---@field instant_deconstruction boolean   
---@field instant_rail_planner boolean   
---@field instant_upgrading boolean   
---@field inventory_size ItemStackIndex   
---@field item_pickup_distance double   
---@field loot_pickup_distance double   
---@field mining_speed double   
---@field movement_speed double  Must be >= 0.34375. 
---@field name string  Name of the editor controller. Base game uses "default". 
---@field placed_corpses_never_expire boolean   
---@field render_as_day boolean   
---@field show_additional_entity_info_gui boolean   
---@field show_character_tab_in_controller_gui boolean   
---@field show_entity_health_bars boolean   
---@field show_entity_tags boolean   
---@field show_hidden_entities boolean   
---@field show_infinity_filters_in_controller_gui boolean   
---@field show_status_icons boolean   
---@field type {'complex_type': 'literal', 'value': 'editor-controller'}   
---
---
--- typename: editor-controller
--- Properties of the editor controller.
EditorControllerPrototype = {}


---@class (exact) ElectricEnergyInterfacePrototype : EntityWithOwnerPrototype
---@field allow_copy_paste boolean (default: literal: value: False)  
---@field animation Animation  Only loaded if both `picture` and `pictures` are not defined. 
---@field animations Animation4Way  Only loaded if `picture`, `pictures`, and `animation` are not defined. 
---@field continuous_animation boolean (default: literal: value: False) Whether the electric energy interface animation always runs instead of being scaled to activity. 
---@field energy_production Energy (default: literal: value: 0)  
---@field energy_source ElectricEnergySource   
---@field energy_usage Energy (default: literal: value: 0)  
---@field gui_mode {'complex_type': 'union', 'options': [{'complex_type': 'literal', 'value': 'all'}, {'complex_type': 'literal', 'value': 'none'}, {'complex_type': 'literal', 'value': 'admins'}], 'full_format': False} (default: literal: value: none)  
---@field light LightDefinition  The light that this electric energy interface emits. 
---@field picture Sprite   
---@field pictures Sprite4Way  Only loaded if `picture` is not defined. 
---@field render_layer RenderLayer (default: literal: value: object)  
---@parent EntityWithOwnerPrototype
---
--- typename: electric-energy-interface
--- Entity with electric energy source with that can have some of its values changed runtime. Useful for modding in energy consumers/producers.
ElectricEnergyInterfacePrototype = {}


---@class (exact) ElectricPolePrototype : EntityWithOwnerPrototype
---@field active_picture Sprite  Drawn above the `pictures` when the electric pole is connected to an electric network. 
---@field auto_connect_up_to_n_wires uint8 (default: literal: value: 5) `0` means disable auto-connect. 
---@field connection_points {'complex_type': 'array', 'value': 'WireConnectionPoint'}   
---@field draw_circuit_wires boolean (default: literal: value: True)  
---@field draw_copper_wires boolean (default: literal: value: True)  
---@field light LightDefinition  Drawn when the electric pole is connected to an electric network. 
---@field maximum_wire_distance double (default: literal: value: 0) The maximum distance between this pole and any other connected pole - if two poles are farther apart than this, they cannot be connected together directly. Corresponds to "wire reach" in the item tooltip.
---
---Max value is 64. 
---@field pictures RotatedSprite   
---@field radius_visualisation_picture Sprite   
---@field rewire_neighbours_when_destroying boolean (default: literal: value: True)  
---@field supply_area_distance double  The "radius" of this pole's supply area. Corresponds to *half* of the "supply area" in the item tooltip. If this is 3.5, the pole will have a 7x7 supply area.
---
---Max value is 64. 
---@field track_coverage_during_build_by_moving boolean (default: literal: value: False)  
---@parent EntityWithOwnerPrototype
---
--- typename: electric-pole
--- An electric pole - part of the [electric system](https://wiki.factorio.com/Electric_system).
ElectricPolePrototype = {}


---@class (exact) ElectricTurretPrototype : TurretPrototype
---@field energy_source {'complex_type': 'union', 'options': ['ElectricEnergySource', 'VoidEnergySource'], 'full_format': False}   
---@parent TurretPrototype
---
--- typename: electric-turret
--- A turret that uses electricity as ammunition.
ElectricTurretPrototype = {}


---@class (exact) ElevatedCurvedRailAPrototype : CurvedRailAPrototype
---@field name string  Unique textual identification of the prototype. May only contain alphanumeric characters, dashes and underscores. May not exceed a length of 200 characters.
---
---Requires Space Age to create prototypes with name not starting with `dummy-`. Dummy prototypes cannot be built. 
---@parent CurvedRailAPrototype
---
--- typename: elevated-curved-rail-a
--- An elevated curved-A rail.
ElevatedCurvedRailAPrototype = {}


---@class (exact) ElevatedCurvedRailBPrototype : CurvedRailBPrototype
---@field name string  Unique textual identification of the prototype. May only contain alphanumeric characters, dashes and underscores. May not exceed a length of 200 characters.
---
---Requires Space Age to create prototypes with name not starting with `dummy-`. Dummy prototypes cannot be built. 
---@parent CurvedRailBPrototype
---
--- typename: elevated-curved-rail-b
--- An elevated curved-B rail.
ElevatedCurvedRailBPrototype = {}


---@class (exact) HalfDiagonalRailPrototype : RailPrototype
---@field collision_box BoundingBox (default: `{{-0.75, -1.9}, {0.75, 1.9}}`) The [collision_box](prototype:EntityPrototype::collision_box) of straight rail is hardcoded to `{{-0.75, -1.9}, {0.75, 1.9}}`. 
---@parent RailPrototype
---
--- typename: half-diagonal-rail
--- A half diagonal rail.
HalfDiagonalRailPrototype = {}


---@class (exact) ElevatedHalfDiagonalRailPrototype : HalfDiagonalRailPrototype
---@field name string  Unique textual identification of the prototype. May only contain alphanumeric characters, dashes and underscores. May not exceed a length of 200 characters.
---
---Requires Space Age to create prototypes with name not starting with `dummy-`. Dummy prototypes cannot be built. 
---@parent HalfDiagonalRailPrototype
---
--- typename: elevated-half-diagonal-rail
--- An elevated half diagonal rail.
ElevatedHalfDiagonalRailPrototype = {}


---@class (exact) StraightRailPrototype : RailPrototype
---@field collision_box BoundingBox (default: `{{-0.7, -0.99}, {0.7, 0.99}}`) The [collision_box](prototype:EntityPrototype::collision_box) of straight rail is hardcoded to `{{-0.7, -0.99}, {0.7, 0.99}}`. 
---@parent RailPrototype
---
--- typename: straight-rail
--- A straight rail.
StraightRailPrototype = {}


---@class (exact) ElevatedStraightRailPrototype : StraightRailPrototype
---@field name string  Unique textual identification of the prototype. May only contain alphanumeric characters, dashes and underscores. May not exceed a length of 200 characters.
---
---Requires Space Age to create prototypes with name not starting with `dummy-`. Dummy prototypes cannot be built. 
---@parent StraightRailPrototype
---
--- typename: elevated-straight-rail
--- An elevated straight rail.
ElevatedStraightRailPrototype = {}


---@class (exact) EnemySpawnerPrototype : EntityWithOwnerPrototype
---@field absorptions_per_second {'complex_type': 'dictionary', 'key': 'AirbornePollutantID', 'value': 'EnemySpawnerAbsorption'}   
---@field allow_run_time_change_of_is_military_target {'complex_type': 'literal', 'value': False} (default: literal: value: False) If this is true, this entities `is_military_target property` can be changed runtime (on the entity, not on the prototype itself). 
---@field call_for_help_radius double   
---@field captured_spawner_entity EntityID   
---@field dying_sound Sound   
---@field graphics_set EnemySpawnerGraphicsSet   
---@field is_military_target {'complex_type': 'literal', 'value': True} (default: literal: value: True) Whether this prototype should be a high priority target for enemy forces. See [Military units and structures](https://wiki.factorio.com/Military_units_and_structures). 
---@field max_count_of_owned_defensive_units uint32 (default: Value of `max_count_of_owned_units`) Count of defensive enemies this spawner can sustain. Defensive units are units with [UnitAISettings::join_attacks](prototype:UnitAISettings::join_attacks) set to false. If set below [EnemySpawnerPrototype::max_count_of_owned_units](prototype:EnemySpawnerPrototype::max_count_of_owned_units), the difference will be the space reserved for non-defensive units. 
---@field max_count_of_owned_units uint32  Count of enemies this spawner can sustain. 
---@field max_darkness_to_spawn float (default: literal: value: 1.0)  
---@field max_defensive_friends_around_to_spawn uint32 (default: Value of `max_friends_around_to_spawn`) How many friendly defensive units are required within the [EnemySpawnerPrototype::spawning_radius](prototype:EnemySpawnerPrototype::spawning_radius) of this spawner for it to stop producing more units. Defensive units are units with [UnitAISettings::join_attacks](prototype:UnitAISettings::join_attacks) set to false. If set below [EnemySpawnerPrototype::max_friends_around_to_spawn](prototype:EnemySpawnerPrototype::max_friends_around_to_spawn), the difference will be the space reserved for non-defensive units. 
---@field max_friends_around_to_spawn uint32  How many friendly units are required within the [EnemySpawnerPrototype::spawning_radius](prototype:EnemySpawnerPrototype::spawning_radius) of this spawner for it to stop producing more units. 
---@field max_richness_for_spawn_shift double  Max richness to determine spawn shift. Spawn shift is linear interpolation between 0 and max_spawn_shift. 
---@field max_spawn_shift double  Caps how much richness can be added on top of evolution when spawning units. [See also](https://www.reddit.com/r/factorio/comments/8pjscm/friday_facts_246_the_gui_update_part_3/e0bttnp/) 
---@field min_darkness_to_spawn float (default: literal: value: 0.0)  
---@field result_units {'complex_type': 'array', 'value': 'UnitSpawnDefinition'}  Array of the [entities](prototype:EntityPrototype) that this spawner can spawn and their spawn probabilities. The sum of probabilities is expected to be 1.0. The array must not be empty. 
---@field spawn_decoration {'complex_type': 'array', 'value': 'CreateDecorativesTriggerEffectItem'}  Decoratives to be created when the spawner is created by the [map generator](https://wiki.factorio.com/Map_generator). Placed when enemies expand if `spawn_decorations_on_expansion` is set to true. 
---@field spawn_decorations_on_expansion boolean (default: literal: value: False) Whether `spawn_decoration` should be spawned when enemies [expand](https://wiki.factorio.com/Enemies#Expansions). 
---@field spawning_cooldown {'complex_type': 'tuple', 'values': ['double', 'double']}  Ticks for cooldown after unit is spawned. The first member of the tuple is min, the second member of the tuple is max. 
---@field spawning_radius double  How far from the spawner can the units be spawned. 
---@field spawning_spacing double  What spaces should be between the spawned units. 
---@field time_to_capture uint32 (default: literal: value: 0)  
---@parent EntityWithOwnerPrototype
---
--- typename: unit-spawner
--- Can spawn entities. Used for biter/spitter nests.
EnemySpawnerPrototype = {}


---@class (exact) EnergyShieldEquipmentPrototype : EquipmentPrototype
---@field energy_per_shield Energy   
---@field max_shield_value float   
---@parent EquipmentPrototype
---
--- typename: energy-shield-equipment
--- Used by [energy shield](https://wiki.factorio.com/Energy_shield).
EnergyShieldEquipmentPrototype = {}


---@class (exact) EntityGhostPrototype : EntityPrototype
---@field huge_build_animated_sound Sound   
---@field huge_build_sound Sound   
---@field large_build_animated_sound Sound   
---@field large_build_sound Sound   
---@field medium_build_animated_sound Sound   
---@field medium_build_sound Sound   
---@field small_build_animated_sound Sound   
---@parent EntityPrototype
---
--- typename: entity-ghost
--- The entity used for ghosts of entities. In-game, the inner entity (the entity this is a ghost of) is rendered with a [UtilityConstants::ghost_tint](prototype:UtilityConstants::ghost_tint).
EntityGhostPrototype = {}


---@class (exact) EquipArmorAchievementPrototype : AchievementPrototype
---@field alternative_armor ItemID  The achievement will trigger if this armor or the other armor is equipped. 
---@field amount uint32 (default: literal: value: 1) How many armors need to be equipped. 
---@field armor ItemID  The achievement will trigger if this armor or the alternative armor is equipped. 
---@field limit_quality QualityID   
---@field limited_to_one_game boolean (default: literal: value: False) If this is false, the player carries over their statistics from this achievement through all their saves. 
---@parent AchievementPrototype
---
--- typename: equip-armor-achievement
--- This prototype is used for receiving an achievement when the player equips armor.
EquipArmorAchievementPrototype = {}


---@class (exact) EquipmentCategory : Prototype
---@parent Prototype
---
--- typename: equipment-category
--- Defines a category to be available to [equipment](prototype:EquipmentPrototype) and [equipment grids](prototype:EquipmentGridPrototype).
EquipmentCategory = {}


---@class (exact) EquipmentGhostPrototype : EquipmentPrototype
---@field categories {'complex_type': 'array', 'value': 'EquipmentCategoryID'}  Not loaded for equipment ghosts. 
---@field energy_source ElectricEnergySource  Not loaded for equipment ghosts. 
---@field shape EquipmentShape  Not loaded for equipment ghosts. 
---@field take_result ItemID  Not loaded for equipment ghosts. 
---@parent EquipmentPrototype
---
--- typename: equipment-ghost
--- The equipment used for ghosts of equipment.
EquipmentGhostPrototype = {}


---@class (exact) EquipmentGridPrototype : Prototype
---@field equipment_categories {'complex_type': 'array', 'value': 'EquipmentCategoryID'}  Only [equipment](prototype:EquipmentPrototype) with at least one of these [categories](prototype:EquipmentCategory) can be inserted into the grid. 
---@field height uint32   
---@field locked boolean (default: literal: value: False) Whether this locked from user interaction which means that the user cannot put equipment into or take equipment from this equipment grid. 
---@field width uint32   
---@parent Prototype
---
--- typename: equipment-grid
--- The prototype of an equipment grid, for example the one used in a [power armor](https://wiki.factorio.com/Power_armor).
EquipmentGridPrototype = {}


---@class (exact) ExplosionPrototype : EntityPrototype
---@field animations AnimationVariations   
---@field beam boolean (default: literal: value: False)  
---@field correct_rotation boolean (default: literal: value: False)  
---@field delay MapTick (default: literal: value: 0) Number of ticks to delay the explosion effects by. 
---@field delay_deviation MapTick (default: literal: value: 0) The maximum number of ticks to randomly delay the explosion effects by. In addition to the number of ticks defined by `delay`, the explosion will be delayed by a random number of ticks between 0 and `delay_deviation` (inclusive). 
---@field explosion_effect Trigger  The effect/trigger that happens when the explosion effect triggers after the initial delay as defined by `delay` and `delay_deviation`. 
---@field fade_in_duration uint8 (default: literal: value: 0)  
---@field fade_out_duration uint8 (default: literal: value: 0)  
---@field height float (default: literal: value: 1)  
---@field light LightDefinition   
---@field light_intensity_factor_final float (default: literal: value: 0.0) Silently clamped to be between 0 and 1. 
---@field light_intensity_factor_initial float (default: literal: value: 0.0) Silently clamped to be between 0 and 1. 
---@field light_intensity_peak_end_progress float (default: literal: value: 0.9)  
---@field light_intensity_peak_start_progress float (default: literal: value: 0.0)  
---@field light_size_factor_final float (default: literal: value: 0.1) Silently clamped to be between 0 and 1. 
---@field light_size_factor_initial float (default: literal: value: 0.05) Silently clamped to be between 0 and 1. 
---@field light_size_peak_end_progress float (default: literal: value: 0.5)  
---@field light_size_peak_start_progress float (default: literal: value: 0.1)  
---@field render_layer RenderLayer (default: literal: value: explosion)  
---@field rotate boolean (default: literal: value: False)  
---@field scale float (default: literal: value: 1)  
---@field scale_animation_speed boolean (default: literal: value: False)  
---@field scale_deviation float (default: literal: value: 0)  
---@field scale_end float (default: literal: value: 1)  
---@field scale_in_duration uint8 (default: literal: value: 0)  
---@field scale_increment_per_tick float (default: literal: value: 0)  
---@field scale_initial float (default: literal: value: 1)  
---@field scale_initial_deviation float (default: literal: value: 0)  
---@field scale_out_duration uint8 (default: literal: value: 0)  
---@field smoke TrivialSmokeID  Mandatory if `smoke_count` > 0. 
---@field smoke_count uint16 (default: literal: value: 0)  
---@field smoke_slow_down_factor float (default: literal: value: 0)  
---@field sound Sound   
---@parent EntityPrototype
---
--- typename: explosion
--- Used to play an animation and a sound.
ExplosionPrototype = {}


---@class (exact) FireFlamePrototype : EntityPrototype
---@field add_fuel_cooldown uint32 (default: literal: value: 10)  
---@field burnt_patch_alpha_default float (default: literal: value: 1)  
---@field burnt_patch_alpha_variations {'complex_type': 'array', 'value': 'TileAndAlpha'}   
---@field burnt_patch_lifetime uint32 (default: literal: value: 1800)  
---@field burnt_patch_pictures SpriteVariations   
---@field damage_multiplier_decrease_per_tick float (default: literal: value: 0.0)  
---@field damage_multiplier_increase_per_added_fuel float (default: literal: value: 0.0)  
---@field damage_per_tick DamageParameters   
---@field delay_between_initial_flames uint32 (default: literal: value: 10)  
---@field fade_in_duration uint32 (default: literal: value: 30)  
---@field fade_out_duration uint32 (default: literal: value: 30)  
---@field flame_alpha float (default: literal: value: 1) Only loaded if `uses_alternative_behavior` is false. 
---@field flame_alpha_deviation float (default: literal: value: 0) Only loaded if `uses_alternative_behavior` is false. 
---@field initial_flame_count uint8 (default: literal: value: 0) Spawns this many `secondary_pictures` around the entity when it first spawns. It waits `delay_between_initial_flames` between each spawned `secondary_pictures`. This can be used to make fires look less repetitive.
---
---For example, spitters use this to make several smaller splashes around the main one. 
---@field initial_lifetime uint32 (default: literal: value: 300)  
---@field initial_render_layer RenderLayer (default: literal: value: object)  
---@field lifetime_increase_by uint32 (default: literal: value: 20)  
---@field lifetime_increase_cooldown uint32 (default: literal: value: 10)  
---@field light LightDefinition   
---@field light_size_modifier_maximum float (default: literal: value: 1)  
---@field light_size_modifier_per_flame float (default: literal: value: 0)  
---@field limit_overlapping_particles boolean (default: literal: value: False)  
---@field maximum_damage_multiplier float (default: literal: value: 1.0)  
---@field maximum_lifetime uint32 (default: Max uint32)  
---@field maximum_spread_count uint16 (default: literal: value: 200)  
---@field on_damage_tick_effect Trigger   
---@field on_fuel_added_action Trigger   
---@field particle_alpha float (default: literal: value: 1) Only loaded if `uses_alternative_behavior` is true. 
---@field particle_alpha_blend_duration uint16 (default: literal: value: 0)  
---@field particle_alpha_deviation float (default: literal: value: 0) Only loaded if `uses_alternative_behavior` is true. 
---@field pictures AnimationVariations   
---@field render_layer RenderLayer (default: literal: value: object)  
---@field secondary_picture_fade_out_duration uint32 (default: literal: value: 30)  
---@field secondary_picture_fade_out_start uint32 (default: literal: value: 0)  
---@field secondary_pictures AnimationVariations   
---@field secondary_render_layer RenderLayer (default: literal: value: object)  
---@field small_tree_fire_pictures AnimationVariations   
---@field smoke {'complex_type': 'array', 'value': 'SmokeSource'}   
---@field smoke_fade_in_duration uint32 (default: literal: value: 30)  
---@field smoke_fade_out_duration uint32 (default: literal: value: 30)  
---@field smoke_source_pictures AnimationVariations   
---@field spawn_entity EntityID   
---@field spread_delay uint32   
---@field spread_delay_deviation uint32   
---@field tree_dying_factor float (default: literal: value: 0)  
---@field uses_alternative_behavior boolean (default: literal: value: False) If `false`, then all animations loop. If `true`, they run once and stay on the final frame. Also changes the behavior of several other fire properties as mentioned in their descriptions.
---
---For example, spitters use alternate behavior, flamethrower flames don't. 
---@parent EntityPrototype
---
--- typename: fire
--- A fire.
FireFlamePrototype = {}


---@class (exact) FishPrototype : EntityWithHealthPrototype
---@field pictures SpriteVariations   
---@parent EntityWithHealthPrototype
---
--- typename: fish
--- Entity that spawns in water tiles, which can be mined. Moves around unless deactivated with [LuaEntity::active](runtime:LuaEntity::active) = false.
FishPrototype = {}


---@class (exact) FluidPrototype : Prototype
---@field auto_barrel boolean (default: literal: value: True) Whether the fluid should be included in the barrel recipes automatically generated by the base mod.
---
---This property is not read by the game engine itself, but the base mod's data-updates.lua file. This means it is discarded by the game engine after loading finishes. 
---@field base_color Color  Used by bars that show the fluid color, like the flamethrower turret fill bar in the tooltip, or the fill bar for the fluid wagon tooltip; and for the pipe windows and storage tank fill gauges. 
---@field default_temperature float  Also the minimum temperature of the fluid. Has to be lower than `max_temperature`. 
---@field emissions_multiplier double (default: literal: value: 1.0) Scales pollution generated when the fluid is consumed. 
---@field flow_color Color  Used only for pipe windows or storage tank fill gauges. 
---@field fuel_value Energy (default: literal: value: 0J)  
---@field gas_temperature float (default: max value of float) Above this temperature the `gas_flow` animation is used to display the fluid inside storage tanks and pipes. 
---@field heat_capacity Energy (default: literal: value: 1kJ) Joule needed to heat 1 Unit by 1 °C. 
---@field hidden boolean (default: literal: value: False) Hides the fluid from the signal selection screen. 
---@field icon FileName  Path to the icon file.
---
---Only loaded, and mandatory if `icons` is not defined. 
---@field icon_size SpriteSizeType (default: literal: value: 64) The size of the square icon, in pixels. E.g. `32` for a 32px by 32px icon. Must be larger than `0`.
---
---Only loaded if `icons` is not defined. 
---@field icons {'complex_type': 'array', 'value': 'IconData'}  Can't be an empty array. 
---@field max_temperature float (default: value of `default_temperature`)  
---@field visualization_color Color  Color to use for visualization. This color should be vibrant and easily distinguished.
---
---If not specified, this will be auto-generated from `base_color` by converting to HSV, decreasing saturation by 10% and setting value to 80%. 
---@parent Prototype
---
--- typename: fluid
--- A fluid.
FluidPrototype = {}


---@class (exact) FluidStreamPrototype : EntityPrototype
---@field action Trigger  Action that is triggered every time a particle lands. Not triggered for the first particle if `initial_action` is non-empty. 
---@field ground_light LightDefinition   
---@field initial_action Trigger  Action that is triggered when the first particle lands. 
---@field oriented_particle boolean (default: literal: value: False)  
---@field particle Animation   
---@field particle_alpha_per_part float (default: literal: value: 1)  
---@field particle_buffer_size uint32 (default: literal: value: 20) Number of spawned child particles of the stream. Must be greater than 0 and less than 256. 
---@field particle_end_alpha float (default: literal: value: 1)  
---@field particle_fade_out_duration uint16 (default: literal: value: 65535) Will be set to 1 by the game if less than 1. 
---@field particle_fade_out_threshold float (default: literal: value: 1) Value between 0 and 1. 
---@field particle_horizontal_speed float  Must be larger than 0. `particle_horizontal_speed` has to be greater than `particle_horizontal_speed_deviation`. 
---@field particle_horizontal_speed_deviation float   
---@field particle_loop_exit_threshold float (default: literal: value: 0) Value between 0 and 1. 
---@field particle_loop_frame_count uint16 (default: literal: value: 1) Will be set to 1 by the game if less than 1. 
---@field particle_scale_per_part float (default: literal: value: 1)  
---@field particle_spawn_interval uint16  The stream will spawn one particle every `particle_spawn_interval` ticks until the `particle_spawn_timeout` is reached. The first particle will trigger an `initial_action` upon landing. Each particle triggers an `action` upon landing. Particles spawned within a single `particle_spawn_timeout` interval will be connected by a stretched `spine_animation`. 
---@field particle_spawn_timeout uint16 (default: 4 * `particle_spawn_interval`)  
---@field particle_start_alpha float (default: literal: value: 1)  
---@field particle_start_scale float (default: literal: value: 1)  
---@field particle_vertical_acceleration float   
---@field progress_to_create_smoke float (default: literal: value: 0.5) The point in the particles projectile arc to start spawning smoke. 0.5 (the default) starts spawning smoke at the halfway point between the source and target. 
---@field shadow Animation   
---@field shadow_scale_enabled boolean (default: literal: value: False)  
---@field smoke_sources {'complex_type': 'array', 'value': 'SmokeSource'}  Smoke spawning is controlled by `progress_to_create_smoke`. 
---@field special_neutral_target_damage DamageParameters   
---@field spine_animation Animation   
---@field stream_light LightDefinition   
---@field target_initial_position_only boolean (default: literal: value: False)  
---@field target_position_deviation double (default: literal: value: 0)  
---@field width float (default: literal: value: 0.5)  
---@parent EntityPrototype
---
--- typename: stream
--- Used for example for the handheld flamethrower.
FluidStreamPrototype = {}


---@class (exact) FluidTurretPrototype : TurretPrototype
---@field activation_buffer_ratio FluidAmount  Before an turret that was out of fluid ammunition is able to fire again, the `fluid_buffer_size` must fill to this proportion. 
---@field attack_parameters StreamAttackParameters  Requires ammo_type in attack_parameters. 
---@field attacking_muzzle_animation_shift AnimatedVector   
---@field ending_attack_muzzle_animation_shift AnimatedVector   
---@field enough_fuel_indicator_light LightDefinition   
---@field enough_fuel_indicator_picture Sprite4Way   
---@field fluid_box FluidBox   
---@field fluid_buffer_input_flow FluidAmount   
---@field fluid_buffer_size FluidAmount   
---@field folded_muzzle_animation_shift AnimatedVector   
---@field folding_muzzle_animation_shift AnimatedVector   
---@field muzzle_animation Animation   
---@field muzzle_light LightDefinition   
---@field not_enough_fuel_indicator_light LightDefinition   
---@field not_enough_fuel_indicator_picture Sprite4Way   
---@field out_of_ammo_alert_icon Sprite  The sprite will be drawn on top of fluid turrets that are out of fluid ammunition. If the `out_of_ammo_alert_icon` is not set, [UtilitySprites::fluid_icon](prototype:UtilitySprites::fluid_icon) will be used instead. 
---@field prepared_muzzle_animation_shift AnimatedVector   
---@field preparing_muzzle_animation_shift AnimatedVector   
---@field starting_attack_muzzle_animation_shift AnimatedVector   
---@field turret_base_has_direction {'complex_type': 'literal', 'value': True}  Always `true`, forcing the turret's collision box to be affected by its rotation. 
---@parent TurretPrototype
---
--- typename: fluid-turret
--- A turret that uses [fluid](prototype:FluidPrototype) as ammunition.
FluidTurretPrototype = {}


---@class (exact) FluidWagonPrototype : RollingStockPrototype
---@field capacity FluidAmount   
---@field connection_category {'complex_type': 'union', 'options': ['string', {'complex_type': 'array', 'value': 'string'}], 'full_format': False} (default: literal: value: default) Pumps are only allowed to connect to this fluid wagon if the pump's [fluid box connection](prototype:PipeConnectionDefinition) and this fluid wagon share a connection category. Pump may have different connection categories on the input and output side, connection categories will be taken from the connection that is facing towards fluid wagon. 
---@field quality_affects_capacity boolean (default: literal: value: False)  
---@field tank_count uint8 (default: literal: value: 3) Must be 1, 2 or 3. 
---@parent RollingStockPrototype
---
--- typename: fluid-wagon
--- A [fluid wagon](https://wiki.factorio.com/Fluid_wagon).
FluidWagonPrototype = {}


---@class (exact) FontPrototype 
---@field border boolean (default: literal: value: False) Whether the font has a border. 
---@field border_color Color  The color of the border, if enabled. 
---@field filtered boolean (default: literal: value: False)  
---@field from string  The name of the fonts .ttf descriptor. This descriptor must be defined in the locale info.json. Refer to `data/core/locale/_language_/info.json` for examples. 
---@field name string  Name of the font. 
---@field size int32  Size of the font. 
---@field spacing float (default: literal: value: 0)  
---@field type {'complex_type': 'literal', 'value': 'font'}   
---
---
--- typename: font
--- Fonts are used in all GUIs in the game.
FontPrototype = {}


---@class (exact) FuelCategory : Prototype
---@field fuel_value_type LocalisedString (default: `{"description.fuel-value"}`)  
---@parent Prototype
---
--- typename: fuel-category
--- Each item which has a fuel_value must have a fuel category. The fuel categories are used to allow only certain fuels to be used in [EnergySource](prototype:EnergySource).
FuelCategory = {}


---@class (exact) FurnacePrototype : CraftingMachinePrototype
---@field cant_insert_at_source_message_key string (default: literal: value: inventory-restriction.cant-be-smelted) The locale key of the message shown when the player attempts to insert an item into the furnace that cannot be processed by that furnace. In-game, the locale is provided the `__1__` parameter, which is the localised name of the item.
---
---The locale key is also used with an `_until` suffix for items that cannot be processed until they recipe is unlocked by a technology. 
---@field circuit_connector {'complex_type': 'tuple', 'values': ['CircuitConnectorDefinition', 'CircuitConnectorDefinition', 'CircuitConnectorDefinition', 'CircuitConnectorDefinition']}   
---@field circuit_connector_flipped {'complex_type': 'tuple', 'values': ['CircuitConnectorDefinition', 'CircuitConnectorDefinition', 'CircuitConnectorDefinition', 'CircuitConnectorDefinition']}   
---@field circuit_wire_max_distance double (default: literal: value: 0) The maximum circuit wire distance for this entity. 
---@field custom_input_slot_tooltip_key string (default: literal: value: ) The locale key of the tooltip to be shown in the input slot instead of the automatically generated list of items that fit there 
---@field default_recipe_finished_signal SignalIDConnector   
---@field default_working_signal SignalIDConnector   
---@field draw_circuit_wires boolean (default: literal: value: True)  
---@field draw_copper_wires boolean (default: literal: value: True)  
---@field result_inventory_size ItemStackIndex  The number of output slots. 
---@field source_inventory_size ItemStackIndex  The number of input slots, but not more than 1. 
---@parent CraftingMachinePrototype
---
--- typename: furnace
--- A furnace. Normal furnaces only process "smelting" category recipes, but you can make furnaces that process other [recipe categories](prototype:RecipeCategory). The difference to assembling machines is that furnaces automatically choose their recipe based on input.
FurnacePrototype = {}


---@class (exact) FusionGeneratorPrototype : EntityWithOwnerPrototype
---@field burns_fluid boolean (default: literal: value: False) If set to `true`, the available power output is based on the [FluidPrototype::fuel_value](prototype:FluidPrototype::fuel_value). Otherwise, the available power output will be based on the fluid temperature and [FluidPrototype::heat_capacity](prototype:FluidPrototype::heat_capacity): `energy = fluid_amount * fluid_temperature * fluid_heat_capacity * effectivity` 
---@field effectivity double (default: literal: value: 1) `1` means 100% effectivity. Must be greater than `0`. Multiplier of the energy output. 
---@field energy_source ElectricEnergySource  `output_flow_limit` is mandatory and must be positive. `output_flow_limit` is the maximum power output of the generator. 
---@field graphics_set FusionGeneratorGraphicsSet   
---@field input_fluid_box FluidBox  [filter](prototype:FluidBox::filter) is mandatory. The temperature (or fuel value if `burns_fluid` is true) of this fluid is used to calculate the available power output. 
---@field max_fluid_usage FluidAmount  Must be positive. 
---@field output_fluid_box FluidBox  [filter](prototype:FluidBox::filter) is mandatory. 
---@field perceived_performance PerceivedPerformance  Affects animation speed and working sound. 
---@parent EntityWithOwnerPrototype
---
--- typename: fusion-generator
--- Consumes a fluid to generate electricity and create another fluid.
FusionGeneratorPrototype = {}


---@class (exact) FusionReactorPrototype : EntityWithOwnerPrototype
---@field burner BurnerEnergySource  Second energy source for the process: provides fuel 
---@field energy_source ElectricEnergySource  First energy source for the process: provides energy 
---@field graphics_set FusionReactorGraphicsSet   
---@field input_fluid_box FluidBox  The input fluid box.
---
---[filter](prototype:FluidBox::filter) is mandatory. 
---@field max_fluid_usage FluidAmount  Maximum amount of fluid converted from `input_fluid_box` to `output_fluid_box` within a single tick.
---
---Must be positive. 
---@field neighbour_bonus float (default: literal: value: 1)  
---@field neighbour_connectable NeighbourConnectable  Defines connection points to neighbours used to compute neighbour bonus. 
---@field output_fluid_box FluidBox  The output fluid box.
---
---[filter](prototype:FluidBox::filter) is mandatory. 
---@field perceived_performance PerceivedPerformance  Affects working sound. 
---@field power_input Energy  Power input consumed from first energy source at full performance.
---
---Cannot be negative. 
---@field target_temperature float  The temperature of the fluid to output. If not defined, the default temperature of the output fluid will be used. 
---@field two_direction_only boolean (default: literal: value: False) If set to true, only North and East direction will be buildable. 
---@parent EntityWithOwnerPrototype
---
--- typename: fusion-reactor
--- Fusion reactor. Consumes fluid, fuel and additional energy to produce other fluid. Kind of advanced boiler. Can also have neighbour bonus.
FusionReactorPrototype = {}


---@class (exact) GatePrototype : EntityWithOwnerPrototype
---@field activation_distance double   
---@field closing_sound Sound  Played when the gate closes. 
---@field fadeout_interval uint32 (default: literal: value: 0)  
---@field horizontal_animation Animation   
---@field horizontal_rail_animation_left Animation   
---@field horizontal_rail_animation_right Animation   
---@field horizontal_rail_base Animation   
---@field opened_collision_mask CollisionMaskConnector  This collision mask is used when the gate is open.
---
---Defaults to the mask from [UtilityConstants::default_collision_masks](prototype:UtilityConstants::default_collision_masks) when indexed by `"gate/opened"`. 
---@field opening_sound Sound  Played when the gate opens. 
---@field opening_speed float   
---@field timeout_to_close uint32   
---@field vertical_animation Animation   
---@field vertical_rail_animation_left Animation   
---@field vertical_rail_animation_right Animation   
---@field vertical_rail_base Animation   
---@field wall_patch Animation   
---@parent EntityWithOwnerPrototype
---
--- typename: gate
--- A [gate](https://wiki.factorio.com/Gate).
GatePrototype = {}


---@class (exact) GeneratorEquipmentPrototype : EquipmentPrototype
---@field burner BurnerEnergySource  If not defined, this equipment produces power for free. 
---@field power Energy  The power output of this equipment. 
---@parent EquipmentPrototype
---
--- typename: generator-equipment
--- Used by [portable fusion reactor](https://wiki.factorio.com/Portable_fusion_reactor). Provides power in equipment grids. Can produce power for free or use a burner energy source.
GeneratorEquipmentPrototype = {}


---@class (exact) GeneratorPrototype : EntityWithOwnerPrototype
---@field burns_fluid boolean (default: literal: value: False) If set to `true`, the available power output is based on the [FluidPrototype::fuel_value](prototype:FluidPrototype::fuel_value). Otherwise, the available power output will be based on the fluid temperature and [FluidPrototype::heat_capacity](prototype:FluidPrototype::heat_capacity): `energy = fluid_amount * (fluid_temperature - fluid_default_temperature) * fluid_heat_capacity * effectivity` 
---@field destroy_non_fuel_fluid boolean (default: literal: value: True) This property is used when `burns_fluid` is true and the fluid has a [fuel_value](prototype:FluidPrototype::fuel_value) of 0.
---
---This property is also used when `burns_fluid` is false and the fluid is at default temperature.
---
---In these cases, this property determines whether the fluid should be destroyed, meaning that the fluid is consumed at the rate of `fluid_usage_per_tick`, without producing any power. 
---@field effectivity double (default: literal: value: 1) How much energy the generator produces compared to how much energy it consumes. For example, an effectivity of 0.5 means that half of the consumed energy is output as power. 
---@field energy_source ElectricEnergySource   
---@field fluid_box FluidBox  This must have a filter if `max_power_output` is not defined. 
---@field fluid_usage_per_tick FluidAmount  The number of fluid units the generator uses per tick. 
---@field horizontal_animation Animation   
---@field horizontal_frozen_patch Sprite   
---@field max_power_output Energy  The power production of the generator is capped to this value. This is also the value that is shown as the maximum power output in the tooltip of the generator.
---
---`fluid_box` must have a filter if this is not defined. 
---@field maximum_temperature float  The maximum temperature to which the efficiency can increase. At this temperature the generator will run at 100% efficiency. Note: Higher temperature fluid can still be consumed.
---
---Used to calculate the `max_power_output` if it is not defined and `burns_fluid` is false. Then, the max power output is `(min(fluid_max_temp, maximum_temperature) - fluid_default_temp) × fluid_usage_per_tick × fluid_heat_capacity × effectivity`, the fluid is the filter specified on the `fluid_box`. 
---@field perceived_performance PerceivedPerformance  Affects animation speed and working sound. 
---@field scale_fluid_usage boolean (default: literal: value: False) Scales the generator's fluid usage to its maximum power output.
---
---Setting this to true prevents the generator from overconsuming fluid, for example when higher than`maximum_temperature` fluid is fed to the generator.
---
---If scale_fluid_usage is false, the generator consumes the full `fluid_usage_per_tick` and any of the extra energy in the fluid (in the form of higher temperature) is wasted. The [steam engine](https://wiki.factorio.com/Steam_engine) exhibits this behavior when fed steam from [heat exchangers](https://wiki.factorio.com/Heat_exchanger). 
---@field smoke {'complex_type': 'array', 'value': 'SmokeSource'}   
---@field vertical_animation Animation   
---@field vertical_frozen_patch Sprite   
---@parent EntityWithOwnerPrototype
---
--- typename: generator
--- An entity that produces power from fluids, for example a [steam engine](https://wiki.factorio.com/Steam_engine).
GeneratorPrototype = {}


---@class (exact) GodControllerPrototype 
---@field crafting_categories {'complex_type': 'array', 'value': 'RecipeCategoryID'}  Names of the crafting categories the player can craft recipes from. 
---@field inventory_size ItemStackIndex   
---@field item_pickup_distance double   
---@field loot_pickup_distance double   
---@field mining_categories {'complex_type': 'array', 'value': 'ResourceCategoryID'}  Names of the resource categories the player can mine resources from. 
---@field mining_speed double   
---@field movement_speed double  Must be >= 0.34375. 
---@field name string  Name of the god-controller. Base game uses "default". 
---@field type {'complex_type': 'literal', 'value': 'god-controller'}   
---
---
--- typename: god-controller
--- Properties of the god controller.
GodControllerPrototype = {}


---@class (exact) GroupAttackAchievementPrototype : AchievementPrototype
---@field amount uint32 (default: literal: value: 1) This will trigger the achievement, if the player receives this amount of attacks. **Note**: The default achievement "it stinks and they don't like it" uses the amount of 1. (As in getting attacked once.) 
---@field attack_type {'complex_type': 'union', 'options': [{'complex_type': 'literal', 'value': 'autonomous'}, {'complex_type': 'literal', 'value': 'distraction'}, {'complex_type': 'literal', 'value': 'scripted'}], 'full_format': False}  The type of attack that triggers this achievement. "autonomous" attacks are triggered in response to pollution or a territory disturbance. "distraction" attacks are in response to taking damage or seeing a nearby enemy. "scripted" attacks are triggered from mods. 
---@field entities {'complex_type': 'array', 'value': 'EntityID'}  The achievement is only triggered if the attacking group of enemies contains at least one of the entities listed here. 
---@parent AchievementPrototype
---
--- typename: group-attack-achievement
--- This prototype is used for receiving an achievement when the player gets attacked due to pollution.
GroupAttackAchievementPrototype = {}


---@class (exact) GuiStyle : PrototypeBase
---@field default_sprite_priority SpritePriority (default: literal: value: medium)  
---@field default_sprite_scale double (default: literal: value: 1)  
---@field default_tileset FileName (default: literal: value: )  
---@parent PrototypeBase
---
--- typename: gui-style
--- The available GUI styles.
GuiStyle = {}


---@class (exact) GunPrototype : ItemPrototype
---@field attack_parameters AttackParameters  The information the item needs to know in order to know what ammo it requires, the sounds, and range. 
---@parent ItemPrototype
---
--- typename: gun
--- A gun. A weapon to deal damage to entities.
GunPrototype = {}


---@class (exact) HeatInterfacePrototype : EntityWithOwnerPrototype
---@field gui_mode {'complex_type': 'union', 'options': [{'complex_type': 'literal', 'value': 'all'}, {'complex_type': 'literal', 'value': 'none'}, {'complex_type': 'literal', 'value': 'admins'}], 'full_format': False} (default: literal: value: all)  
---@field heat_buffer HeatBuffer   
---@field heating_radius float (default: literal: value: 1)  
---@field picture Sprite   
---@parent EntityWithOwnerPrototype
---
--- typename: heat-interface
--- This entity produces or consumes heat. Its heat settings can be changed runtime.
HeatInterfacePrototype = {}


---@class (exact) HeatPipePrototype : EntityWithOwnerPrototype
---@field connection_sprites ConnectableEntityGraphics   
---@field heat_buffer HeatBuffer   
---@field heat_glow_sprites ConnectableEntityGraphics   
---@field heating_radius float (default: literal: value: 1) Must be >= 0. 
---@parent EntityWithOwnerPrototype
---
--- typename: heat-pipe
--- A [heat pipe](https://wiki.factorio.com/Heat_pipe).
HeatPipePrototype = {}


---@class (exact) HighlightBoxEntityPrototype : EntityPrototype
---@parent EntityPrototype
---
--- typename: highlight-box
--- Used to attach graphics for [cursor boxes](prototype:CursorBoxType) to entities during runtime. HighlightBoxEntity can also be independent from entities so it is simply drawn somewhere in the world. See [LuaSurface::create_entity](runtime:LuaSurface::create_entity) for the available options for type "highlight-box".
---
---The [collision_box](prototype:EntityPrototype::collision_box) of the highlight box prototype is ignored during runtime, instead the "bounding_box" given in create_entity() or the selection box of the target entity is used.
HighlightBoxEntityPrototype = {}


---@class (exact) ImpactCategory 
---@field name string  Name of the impact category. 
---@field type {'complex_type': 'literal', 'value': 'impact-category'}   
---
---
--- typename: impact-category
--- 
ImpactCategory = {}


---@class (exact) InfinityCargoWagonPrototype : CargoWagonPrototype
---@field erase_contents_when_mined boolean (default: literal: value: True)  
---@field gui_mode {'complex_type': 'union', 'options': [{'complex_type': 'literal', 'value': 'all'}, {'complex_type': 'literal', 'value': 'none'}, {'complex_type': 'literal', 'value': 'admins'}], 'full_format': False} (default: literal: value: all) Controls which players can control what the chest spawns. 
---@field preserve_contents_when_created boolean (default: literal: value: True) When true, items created inside the infinity cargo wagon will not start to spoil until they have been removed from the wagon. 
---@parent CargoWagonPrototype
---
--- typename: infinity-cargo-wagon
--- A cargo wagon that can spawn or void items at will.
InfinityCargoWagonPrototype = {}


---@class (exact) LogisticContainerPrototype : ContainerPrototype
---@field animation Animation  Drawn when a robot brings/takes items from this container. 
---@field animation_sound Sound  Played when a robot brings/takes items from this container. Only loaded if `animation` is defined. 
---@field landing_location_offset Vector  The offset from the center of this container where a robot visually brings/takes items. 
---@field logistic_mode {'complex_type': 'union', 'options': [{'complex_type': 'literal', 'value': 'active-provider', 'description': ''}, {'complex_type': 'literal', 'value': 'passive-provider', 'description': ''}, {'complex_type': 'literal', 'value': 'requester', 'description': ''}, {'complex_type': 'literal', 'value': 'storage', 'description': ''}, {'complex_type': 'literal', 'value': 'buffer', 'description': ''}], 'full_format': True}  The way this chest interacts with the logistic network. 
---@field max_logistic_slots uint16  The number of request slots this logistics container has. Requester-type containers must have > 0 slots and can have a maximum of [UtilityConstants::max_logistic_filter_count](prototype:UtilityConstants::max_logistic_filter_count) slots. Storage-type containers must have <= 1 slot. 
---@field opened_duration uint8 (default: literal: value: 0)  
---@field render_not_in_network_icon boolean (default: literal: value: True) Whether the "no network" icon should be rendered on this entity if the entity is not within a logistics network. 
---@field trash_inventory_size ItemStackIndex (default: literal: value: 0)  
---@field use_exact_mode boolean (default: literal: value: False) Whether logistic robots have to deliver the exact amount of items requested to this logistic container instead of over-delivering (within their cargo size). 
---@parent ContainerPrototype
---
--- typename: logistic-container
--- A generic container, such as a chest, that interacts with the logistics network.
LogisticContainerPrototype = {}


---@class (exact) InfinityContainerPrototype : LogisticContainerPrototype
---@field erase_contents_when_mined boolean   
---@field gui_mode {'complex_type': 'union', 'options': [{'complex_type': 'literal', 'value': 'all'}, {'complex_type': 'literal', 'value': 'none'}, {'complex_type': 'literal', 'value': 'admins'}], 'full_format': False} (default: literal: value: all) Controls which players can control what the chest spawns. 
---@field inventory_size ItemStackIndex  The number of slots in this container. May not be zero. 
---@field logistic_mode {'complex_type': 'union', 'options': [{'complex_type': 'literal', 'value': 'active-provider'}, {'complex_type': 'literal', 'value': 'passive-provider'}, {'complex_type': 'literal', 'value': 'requester'}, {'complex_type': 'literal', 'value': 'storage'}, {'complex_type': 'literal', 'value': 'buffer'}], 'full_format': False}  The way this chest interacts with the logistic network. 
---@field preserve_contents_when_created boolean (default: literal: value: True) When true, items created inside the infinity chest will not start to spoil until they have been removed from the chest. 
---@field render_not_in_network_icon boolean (default: literal: value: False) Whether the "no network" icon should be rendered on this entity if the entity is not within a logistics network. 
---@parent LogisticContainerPrototype
---
--- typename: infinity-container
--- A generic container, such as a chest, that can spawn or void items and interact with the logistics network.
InfinityContainerPrototype = {}


---@class (exact) PipePrototype : EntityWithOwnerPrototype
---@field fluid_box FluidBox  The area of the entity where fluid/gas inputs, and outputs. 
---@field horizontal_window_bounding_box BoundingBox   
---@field pictures PipePictures  All graphics for this pipe. 
---@field vertical_window_bounding_box BoundingBox   
---@parent EntityWithOwnerPrototype
---
--- typename: pipe
--- An entity to transport fluids over a distance and between machines.
PipePrototype = {}


---@class (exact) InfinityPipePrototype : PipePrototype
---@field gui_mode {'complex_type': 'union', 'options': [{'complex_type': 'literal', 'value': 'all'}, {'complex_type': 'literal', 'value': 'none'}, {'complex_type': 'literal', 'value': 'admins'}], 'full_format': False} (default: literal: value: all)  
---@parent PipePrototype
---
--- typename: infinity-pipe
--- This entity produces or consumes fluids. Its fluid settings can be changed runtime.
InfinityPipePrototype = {}


---@class (exact) InserterPrototype : EntityWithOwnerPrototype
---@field allow_burner_leech boolean (default: literal: value: False) Whether this burner inserter can fuel itself from the fuel inventory of the entity it is picking up items from. 
---@field allow_custom_vectors boolean (default: literal: value: False) Whether pickup and insert position can be set run-time. 
---@field bulk boolean (default: literal: value: False) Whether this inserter is considered a bulk inserter. Relevant for determining how [inserter capacity bonus (research)](https://wiki.factorio.com/Inserter_capacity_bonus_(research)) applies to the inserter. 
---@field chases_belt_items boolean (default: literal: value: True) Whether the inserter hand should move to the items it picks up from belts, leading to item chasing behaviour. If this is off, the inserter hand will stay in the center of the belt and any items picked up from the edges of the belt "teleport" to the inserter hand. 
---@field circuit_connector {'complex_type': 'tuple', 'values': ['CircuitConnectorDefinition', 'CircuitConnectorDefinition', 'CircuitConnectorDefinition', 'CircuitConnectorDefinition']}   
---@field circuit_wire_max_distance double (default: literal: value: 0) The maximum circuit wire distance for this entity. 
---@field default_stack_control_input_signal SignalIDConnector   
---@field draw_circuit_wires boolean (default: literal: value: True)  
---@field draw_copper_wires boolean (default: literal: value: True)  
---@field draw_held_item boolean (default: literal: value: True) Whether the item that the inserter is holding should be drawn. 
---@field draw_inserter_arrow boolean (default: literal: value: True) Whether the yellow arrow that indicates the drop point of the inserter and the line that indicates the pickup position should be drawn. 
---@field energy_per_movement Energy (default: literal: value: 0)  
---@field energy_per_rotation Energy (default: literal: value: 0)  
---@field energy_source EnergySource  Defines how this inserter gets energy. The emissions set on the energy source are ignored so inserters cannot produce pollution. 
---@field enter_drop_mode_if_held_stack_spoiled boolean (default: literal: value: False) If inserter waits for full hand it could become stuck when item in hand changed because of spoiling. If this flag is set then inserter will start dropping held stack even if it was waiting for full hand. 
---@field extension_speed double   
---@field filter_count uint8 (default: literal: value: 0) How many filters this inserter has. Maximum count of filtered items in inserter is 5. 
---@field grab_less_to_match_belt_stack boolean (default: literal: value: False) If drop target is belt, inserter may grab less so that it does not drop partial stacks unless it is forced to drop partial. 
---@field hand_base_frozen Sprite   
---@field hand_base_picture Sprite   
---@field hand_base_shadow Sprite   
---@field hand_closed_frozen Sprite   
---@field hand_closed_picture Sprite   
---@field hand_closed_shadow Sprite   
---@field hand_open_frozen Sprite   
---@field hand_open_picture Sprite   
---@field hand_open_shadow Sprite   
---@field hand_size double (default: literal: value: 0.75) Used to determine how long the arm of the inserter is when drawing it. Does not affect gameplay. The lower the value, the straighter the arm. Increasing the value will give the inserter a bigger bend due to its longer parts. 
---@field insert_position Vector   
---@field max_belt_stack_size uint8 (default: literal: value: 1) This inserter will not create stacks on belt with more than this amount of items. Must be >= 1. 
---@field pickup_position Vector   
---@field platform_frozen Sprite4Way   
---@field platform_picture Sprite4Way   
---@field rotation_speed double   
---@field stack_size_bonus uint8 (default: literal: value: 0) Stack size bonus that is inherent to the prototype without having to be researched. 
---@field starting_distance double (default: literal: value: 0.7)  
---@field use_easter_egg boolean (default: literal: value: True) Whether the inserter should be able to fish [fish](https://wiki.factorio.com/Raw_fish). 
---@field uses_inserter_stack_size_bonus boolean (default: literal: value: True) When set to false, then relevant value of inserter stack size bonus ([LuaForce::inserter_stack_size_bonus](runtime:LuaForce::inserter_stack_size_bonus) or [LuaForce::bulk_inserter_capacity_bonus](runtime:LuaForce::bulk_inserter_capacity_bonus)) will not affect inserter stack size. 
---@field wait_for_full_hand boolean (default: literal: value: False) Inserter will wait until its hand is full. 
---@parent EntityWithOwnerPrototype
---
--- typename: inserter
--- An [inserter](https://wiki.factorio.com/Inserter).
InserterPrototype = {}


---@class (exact) InventoryBonusEquipmentPrototype : EquipmentPrototype
---@field energy_source ElectricEnergySource   
---@field inventory_size_bonus ItemStackIndex   
---@parent EquipmentPrototype
---
--- typename: inventory-bonus-equipment
--- 
InventoryBonusEquipmentPrototype = {}


---@class (exact) ItemEntityPrototype : EntityPrototype
---@field collision_box BoundingBox (default: Empty = `{{0, 0}, {0, 0}}`) Item entity collision box has to have same width as height.
---
---Specification of the entity collision boundaries. Empty collision box means no collision and is used for smoke, projectiles, particles, explosions etc.
---
---The `{0,0}` coordinate in the collision box will match the entity position. It should be near the center of the collision box, to keep correct entity drawing order. The bounding box must include the `{0,0}` coordinate.
---
---Note, that for buildings, it is customary to leave 0.1 wide border between the edge of the tile and the edge of the building, this lets the player move between the building and electric poles/inserters etc. 
---@parent EntityPrototype
---
--- typename: item-entity
--- The entity used for items on the ground.
ItemEntityPrototype = {}


---@class (exact) ItemGroup : Prototype
---@field icon FileName  Path to the icon that is shown to represent this item group.
---
---Only loaded, and mandatory if `icons` is not defined. 
---@field icon_size SpriteSizeType (default: literal: value: 64) The size of the square icon, in pixels. E.g. `32` for a 32px by 32px icon. Must be larger than `0`.
---
---The base game uses 128px icons for item groups.
---
---Only loaded if `icons` is not defined. 
---@field icons {'complex_type': 'array', 'value': 'IconData'}  The icon that is shown to represent this item group. Can't be an empty array. 
---@field order_in_recipe Order (default: The `order` of this item group.) Item ingredients in recipes are ordered by item group. The `order_in_recipe` property can be used to specify the ordering in recipes without affecting the inventory order. 
---@parent Prototype
---
--- typename: item-group
--- An item group. Item groups are the tabs shown above the list of craftable items in the player's inventory GUI. The built-in groups are "logistics", "production", "intermediate-products" and "combat" but mods can define their own.
---
---Items are sorted into item groups by sorting them into a [subgroup](prototype:ItemPrototype::subgroup) which then belongs to an [item group](prototype:ItemSubGroup::group).
ItemGroup = {}


---@class (exact) ItemRequestProxyPrototype : EntityPrototype
---@field use_target_entity_alert_icon_shift boolean (default: literal: value: True)  
---@parent EntityPrototype
---
--- typename: item-request-proxy
--- Entity used to signify that an entity is requesting items, for example modules for an assembling machine after it was blueprinted with modules inside.
ItemRequestProxyPrototype = {}


---@class (exact) ItemSubGroup : Prototype
---@field group ItemGroupID  The item group this subgroup is located in. 
---@parent Prototype
---
--- typename: item-subgroup
--- An item subgroup. Item subgroups are the rows in the recipe list in the player's inventory GUI. The subgroup of a prototype also determines its item [group](prototype:ItemGroup::group) (tab in the recipe list).
---
---The built-in subgroups can be found [here](https://wiki.factorio.com/Data.raw#item-subgroup). See [ItemPrototype::subgroup](prototype:ItemPrototype::subgroup) for setting the subgroup of an item.
ItemSubGroup = {}


---@class (exact) ItemWithEntityDataPrototype : ItemPrototype
---@field icon_tintable FileName  Path to the icon file.
---
---Only loaded if `icon_tintables` is not defined. 
---@field icon_tintable_mask FileName  Path to the icon file.
---
---Only loaded if `icon_tintable_masks` is not defined and `icon_tintable` is defined. 
---@field icon_tintable_mask_size SpriteSizeType (default: literal: value: 64) The size of the square icon, in pixels. E.g. `32` for a 32px by 32px icon. Must be larger than `0`.
---
---Only loaded if `icon_tintable_masks` is not defined and `icon_tintable` is defined. 
---@field icon_tintable_masks {'complex_type': 'array', 'value': 'IconData'}  Can't be an empty array.
---
---Only loaded if `icon_tintable` is defined. 
---@field icon_tintable_size SpriteSizeType (default: literal: value: 64) The size of the square icon, in pixels. E.g. `32` for a 32px by 32px icon. Must be larger than `0`.
---
---Only loaded if `icon_tintables` is not defined and `icon_tintable` is defined. 
---@field icon_tintables {'complex_type': 'array', 'value': 'IconData'}  Can't be an empty array.
---
---Only loaded if `icon_tintable` is defined (`icon_tintables` takes precedence over `icon_tintable`). 
---@parent ItemPrototype
---
--- typename: item-with-entity-data
--- ItemWithEntityData saves data associated with the entity that it represents, for example the content of the equipment grid of a car.
ItemWithEntityDataPrototype = {}


---@class (exact) ItemWithTagsPrototype : ItemWithLabelPrototype
---@parent ItemWithLabelPrototype
---
--- typename: item-with-tags
--- Item type that can store any basic arbitrary Lua data, see [LuaItemStack::tags](runtime:LuaItemStack::tags).
ItemWithTagsPrototype = {}


---@class (exact) KillAchievementPrototype : AchievementPrototype
---@field amount uint32 (default: literal: value: 1) This is the amount of entity of the specified type the player needs to destroy to receive the achievement. 
---@field damage_dealer {'complex_type': 'union', 'options': ['EntityID', {'complex_type': 'array', 'value': 'EntityID'}], 'full_format': False}  The killer of the entity must be one of these entities. 
---@field damage_type DamageTypeID  This defines how the player needs to destroy the specific entity. 
---@field in_vehicle boolean (default: literal: value: False) This defines if the player needs to be in a vehicle. 
---@field personally boolean (default: literal: value: False) This defines to make sure you are the one driving, for instance, in a tank rather than an automated train. 
---@field to_kill {'complex_type': 'union', 'options': ['EntityID', {'complex_type': 'array', 'value': 'EntityID'}], 'full_format': False}  This defines which entity needs to be destroyed in order to receive the achievement. 
---@field type_to_kill string  This defines what entity type needs to be destroyed in order to receive the achievement. 
---@parent AchievementPrototype
---
--- typename: kill-achievement
--- This prototype is used for receiving an achievement when the player destroys a certain amount of an entity, with a specific damage type.
KillAchievementPrototype = {}


---@class (exact) LabPrototype : EntityWithOwnerPrototype
---@field allowed_effects EffectTypeLimitation (default: All effects except quality are allowed) Sets the [modules](prototype:ModulePrototype) and [beacon](prototype:BeaconPrototype) effects that are allowed to be used on this lab. 
---@field allowed_module_categories {'complex_type': 'array', 'value': 'ModuleCategoryID'} (default: All module categories are allowed) Sets the [module categories](prototype:ModuleCategory) that are allowed to be inserted into this machine. 
---@field effect_receiver EffectReceiver   
---@field energy_source EnergySource  Defines how this lab gets energy. 
---@field energy_usage Energy  The amount of energy this lab uses. 
---@field frozen_patch Sprite   
---@field inputs {'complex_type': 'array', 'value': 'ItemID'}  A list of the names of science packs that can be used in this lab.
---
---If a technology requires other types of science packs, it cannot be researched in this lab. 
---@field light LightDefinition   
---@field module_slots ItemStackIndex  The number of module slots in this lab. 
---@field off_animation Animation  The animation that plays when the lab is idle. 
---@field on_animation Animation  The animation that plays when the lab is active. 
---@field quality_affects_module_slots boolean (default: literal: value: False) If set, [QualityPrototype::lab_module_slots_bonus](prototype:QualityPrototype::lab_module_slots_bonus) will be added to module slots count. 
---@field researching_speed double (default: literal: value: 1)  
---@field science_pack_drain_rate_percent uint8 (default: literal: value: 100) May not be `0` or larger than `100`. 
---@field trash_inventory_size ItemStackIndex   
---@field uses_quality_drain_modifier boolean (default: literal: value: False) Whether the [QualityPrototype::science_pack_drain_multiplier](prototype:QualityPrototype::science_pack_drain_multiplier) of the quality of this lab should affect how much science is consumed to research one unit of technology. 
---@parent EntityWithOwnerPrototype
---
--- typename: lab
--- A [lab](https://wiki.factorio.com/Lab). It consumes [science packs](prototype:ToolPrototype) to research [technologies](prototype:TechnologyPrototype).
LabPrototype = {}


---@class (exact) LampPrototype : EntityWithOwnerPrototype
---@field always_on boolean (default: literal: value: False) Whether the lamp should always be on. 
---@field circuit_connector CircuitConnectorDefinition   
---@field circuit_wire_max_distance double (default: literal: value: 0) The maximum circuit wire distance for this entity. 
---@field darkness_for_all_lamps_off float (default: literal: value: 0.3) darkness_for_all_lamps_on must be > darkness_for_all_lamps_off. Values must be between 0 and 1. 
---@field darkness_for_all_lamps_on float (default: literal: value: 0.5) darkness_for_all_lamps_on must be > darkness_for_all_lamps_off. Values must be between 0 and 1. 
---@field default_blue_signal SignalIDConnector   
---@field default_green_signal SignalIDConnector   
---@field default_red_signal SignalIDConnector   
---@field default_rgb_signal SignalIDConnector   
---@field draw_circuit_wires boolean (default: literal: value: True)  
---@field draw_copper_wires boolean (default: literal: value: True)  
---@field energy_source {'complex_type': 'union', 'options': ['ElectricEnergySource', 'VoidEnergySource'], 'full_format': False}  The emissions set on the energy source are ignored so lamps cannot produce pollution. 
---@field energy_usage_per_tick Energy  The amount of energy the lamp uses. Must be greater than > 0. 
---@field glow_color_intensity float (default: literal: value: 0)  
---@field glow_render_mode {'complex_type': 'union', 'options': [{'complex_type': 'literal', 'value': 'additive'}, {'complex_type': 'literal', 'value': 'multiplicative'}], 'full_format': False} (default: literal: value: additive)  
---@field glow_size float (default: literal: value: 0)  
---@field light LightDefinition  What color the lamp will be when it is on, and receiving power. 
---@field light_when_colored LightDefinition  This refers to when the light is in a circuit network, and is lit a certain color based on a signal value. 
---@field picture_off Sprite  The lamps graphics when it's off. 
---@field picture_on Sprite  The lamps graphics when it's on. 
---@field signal_to_color_mapping {'complex_type': 'array', 'value': 'SignalColorMapping'}   
---@parent EntityWithOwnerPrototype
---
--- typename: lamp
--- A [lamp](https://wiki.factorio.com/Lamp) to provide light, using energy.
LampPrototype = {}


---@class (exact) LandMinePrototype : EntityWithOwnerPrototype
---@field action Trigger   
---@field ammo_category AmmoCategoryID   
---@field force_die_on_attack boolean (default: literal: value: True) Force the landmine to kill itself when exploding. 
---@field is_military_target boolean (default: literal: value: True) Whether this prototype should be a high priority target for enemy forces. See [Military units and structures](https://wiki.factorio.com/Military_units_and_structures). 
---@field picture_safe Sprite  The sprite of the landmine before it is armed (just after placing). 
---@field picture_set Sprite  The sprite of the landmine of a friendly force when it is armed. 
---@field picture_set_enemy Sprite  The sprite of the landmine of an enemy force when it is armed. 
---@field timeout uint32 (default: literal: value: 120) Time between placing and the landmine being armed, in ticks. 
---@field trigger_collision_mask CollisionMaskConnector (default: Value of UtilityConstants::building_collision_mask) Collision mask that another entity must collide with to make this landmine blow up. 
---@field trigger_force ForceCondition (default: literal: value: enemy)  
---@field trigger_interval uint32 (default: literal: value: 10) Time between checks to detonate due to nearby enemies, in ticks. A larger time will be more performant. 
---@field trigger_radius double   
---@parent EntityWithOwnerPrototype
---
--- typename: land-mine
--- A [land mine](https://wiki.factorio.com/Land_mine).
LandMinePrototype = {}


---@class (exact) TransportBeltConnectablePrototype : EntityWithOwnerPrototype
---@field animation_speed_coefficient double (default: literal: value: 1)  
---@field belt_animation_set TransportBeltAnimationSet   
---@field collision_box BoundingBox (default: Empty = `{{0, 0}, {0, 0}}`) Transport belt connectable entities must have [collision_box](prototype:EntityPrototype::collision_box) of an appropriate minimal size, they should occupy more than half of every tile the entity covers. 
---@field flags EntityPrototypeFlags  Transport belt connectable entities cannot have the `"building-direction-8-way"` flag. 
---@field speed double  The speed of the belt: `speed × 480 = x Items/second`.
---
---The raw value is expressed as the number of tiles traveled by each item on the belt per tick, relative to the belt's maximum density - e.g. `x items/second ÷ (4 items/lane × 2 lanes/belt × 60 ticks/second) = <speed> belts/tick` where a "belt" is the size of one tile. See [Transport_belts/Physics](https://wiki.factorio.com/Transport_belts/Physics) for more details.
---
---Must be a positive non-infinite number. The number is a fixed point number with 8 bits reserved for decimal precision, meaning the smallest value step is `1/2^8 = 0.00390625`. In the simple case of a non-curved belt, the rate is multiples of `1.875` items/s, even though the entity tooltip may show a different rate. 
---@parent EntityWithOwnerPrototype
---
--- typename: null
--- Abstract class that anything that is a belt or can connect to belts uses.
TransportBeltConnectablePrototype = {}


---@class (exact) LaneSplitterPrototype : TransportBeltConnectablePrototype
---@field structure Animation4Way   
---@field structure_animation_movement_cooldown uint32 (default: literal: value: 10)  
---@field structure_animation_speed_coefficient double (default: literal: value: 1)  
---@field structure_patch Animation4Way   
---@parent TransportBeltConnectablePrototype
---
--- typename: lane-splitter
--- 
LaneSplitterPrototype = {}


---@class (exact) LegacyCurvedRailPrototype : RailPrototype
---@field collision_box BoundingBox (default: `{{-0.75, -0.55}, {0.75, 1.6}}`) The [collision_box](prototype:EntityPrototype::collision_box) of legacy curved rail is hardcoded to `{{-0.75, -0.55}, {0.75, 1.6}}`.
---
---The secondary collision box of legacy curved rail is hardcoded to `{{-0.68, -2.7}, {0.68, 2.7}}`. 
---@parent RailPrototype
---
--- typename: legacy-curved-rail
--- A legacy curved rail.
LegacyCurvedRailPrototype = {}


---@class (exact) LegacyStraightRailPrototype : RailPrototype
---@field collision_box BoundingBox (default: `{{-0.7, -0.99}, {0.7, 0.99}}`) The [collision_box](prototype:EntityPrototype::collision_box) of legacy straight rail is hardcoded to `{{-0.7, -0.99}, {0.7, 0.99}}`. 
---@parent RailPrototype
---
--- typename: legacy-straight-rail
--- A legacy straight rail.
LegacyStraightRailPrototype = {}


---@class (exact) LightningAttractorPrototype : EntityWithOwnerPrototype
---@field chargable_graphics ChargableGraphics   
---@field efficiency double (default: literal: value: 0) Cannot be less than 0. 
---@field energy_source ElectricEnergySource  Mandatory if `efficiency` is larger than 0. May not be defined if `efficiency` is 0. 
---@field lightning_strike_offset MapPosition   
---@field range_elongation double (default: literal: value: 0)  
---@parent EntityWithOwnerPrototype
---
--- typename: lightning-attractor
--- Absorbs [lightning](prototype:LightningPrototype) and optionally converts it into electricity.
LightningAttractorPrototype = {}


---@class (exact) LightningPrototype : EntityPrototype
---@field attracted_volume_modifier float (default: literal: value: 1.0)  
---@field attractor_hit_effect Trigger  Effect that is triggered when lightning hits  a [lightning attractor](prototype:LightningAttractorPrototype). Triggered after the attractor is charged by the lightning hit. 
---@field damage double (default: literal: value: 100) When lightning strikes something that is not a lightning attractor, this damage is applied to the target. 
---@field effect_duration uint16   
---@field energy Energy (default: Max double) When lightning hits a [lightning attractor](prototype:LightningAttractorPrototype), this amount of energy is transferred to the lightning attractor. 
---@field graphics_set LightningGraphicsSet   
---@field sound Sound   
---@field source_offset Vector   
---@field source_variance Vector   
---@field strike_effect Trigger  Effect that is triggered when lightning strikes something that is not a lightning attractor. Triggered before `damage` is applied. 
---@field time_to_damage uint16 (default: literal: value: 0) Must be less than or equal to `effect_duration`. 
---@parent EntityPrototype
---
--- typename: lightning
--- Lightning randomly hits entities on planets with [lightning_properties](prototype:PlanetPrototype::lightning_properties).
---
---If a [lightning attractor](prototype:LightningAttractorPrototype) is hit by lightning it will absorb the lightning hit for energy.
---
---If a something that is not an attractor is hit by lightning it will be damaged by the strike.
LightningPrototype = {}


---@class (exact) LinkedBeltPrototype : TransportBeltConnectablePrototype
---@field allow_blueprint_connection boolean (default: literal: value: True)  
---@field allow_clone_connection boolean (default: literal: value: True)  
---@field allow_side_loading boolean (default: literal: value: False)  
---@field structure LinkedBeltStructure   
---@field structure_render_layer RenderLayer (default: literal: value: object)  
---@parent TransportBeltConnectablePrototype
---
--- typename: linked-belt
--- A belt that can be connected to a belt anywhere else, including on a different surface. The linked belts have to be [connected with console commands](https://wiki.factorio.com/Console#Connect_linked_belts) or runtime scripting in mods or scenarios. [LuaEntity::connect_linked_belts](runtime:LuaEntity::connect_linked_belts) and other runtime functions.
LinkedBeltPrototype = {}


---@class (exact) LinkedContainerPrototype : EntityWithOwnerPrototype
---@field circuit_connector CircuitConnectorDefinition   
---@field circuit_wire_max_distance double (default: literal: value: 0) The maximum circuit wire distance for this linked container. 
---@field draw_circuit_wires boolean (default: literal: value: True)  
---@field draw_copper_wires boolean (default: literal: value: True)  
---@field gui_mode {'complex_type': 'union', 'options': [{'complex_type': 'literal', 'value': 'all'}, {'complex_type': 'literal', 'value': 'none'}, {'complex_type': 'literal', 'value': 'admins'}], 'full_format': False} (default: literal: value: all) Players that can access the GUI to change the link ID. 
---@field inventory_properties InventoryWithCustomStackSizeSpecification  Only used when `inventory_type` is `"with_custom_stack_size"`. 
---@field inventory_size ItemStackIndex  Must be > 0. 
---@field inventory_type {'complex_type': 'union', 'options': [{'complex_type': 'literal', 'value': 'normal'}, {'complex_type': 'literal', 'value': 'with_bar'}, {'complex_type': 'literal', 'value': 'with_filters_and_bar'}, {'complex_type': 'literal', 'value': 'with_custom_stack_size'}, {'complex_type': 'literal', 'value': 'with_weight_limit'}], 'full_format': False} (default: literal: value: with_bar) Determines the type of inventory that this linked container has. Whether the inventory has a limiter bar, can be filtered (like cargo wagons), uses a custom stack size for contained item stacks (like artillery wagon), or uses a weight limit (like space age rocket silo). 
---@field inventory_weight_limit Weight (default: literal: value: 0) Only used when `inventory_type` is `"with_weight_limit"`. 
---@field picture Sprite   
---@parent EntityWithOwnerPrototype
---
--- typename: linked-container
--- A container that shares its inventory with containers with the same [link_id](runtime:LuaEntity::link_id), which can be set via the GUI. The link IDs are per prototype and force, so only containers with the **same ID**, **same prototype name** and **same force** will share inventories.
LinkedContainerPrototype = {}


---@class (exact) LoaderPrototype : TransportBeltConnectablePrototype
---@field adjustable_belt_stack_size boolean (default: literal: value: False) Loader belt stack size can be adjusted at runtime. Requires [LoaderPrototype::max_belt_stack_size](prototype:LoaderPrototype::max_belt_stack_size) to be > 1. 
---@field allow_container_interaction boolean (default: literal: value: True) Whether this loader can load and unload stationary inventories such as containers and crafting machines. 
---@field allow_rail_interaction boolean (default: literal: value: True) Whether this loader can load and unload [RollingStockPrototype](prototype:RollingStockPrototype). 
---@field belt_length double (default: literal: value: 0.5) How long this loader's belt is. Should be the same as belt_distance, which is hardcoded to `0.5` for [Loader1x2Prototype](prototype:Loader1x2Prototype) and to 0 for [Loader1x1Prototype](prototype:Loader1x1Prototype). See the linked prototypes for an explanation of belt_distance. 
---@field circuit_connector {'complex_type': 'array', 'value': 'CircuitConnectorDefinition'}  First the four cardinal directions for `direction_out`, followed by the four directions for `direction_in`. 
---@field circuit_connector_layer RenderLayer (default: literal: value: object) Render layer for all directions of the circuit connectors. 
---@field circuit_wire_max_distance double (default: literal: value: 0) The maximum circuit wire distance for this entity. 
---@field container_distance double (default: literal: value: 1.5) The distance between the position of this loader and the tile of the loader's container target. 
---@field draw_circuit_wires boolean (default: literal: value: True)  
---@field draw_copper_wires boolean (default: literal: value: True)  
---@field energy_per_item Energy (default: literal: value: 0) Energy in Joules. Can't be negative. 
---@field energy_source {'complex_type': 'union', 'options': ['ElectricEnergySource', 'HeatEnergySource', 'FluidEnergySource', 'VoidEnergySource'], 'full_format': False}   
---@field filter_count uint8  How many item filters this loader has. Maximum count of filtered items in loader is 5. 
---@field max_belt_stack_size uint8 (default: literal: value: 1) Loader will not create stacks on belt that are larger than this value. Must be >= 1. 
---@field per_lane_filters boolean (default: literal: value: False) If filters are per lane. Can only be set to true if filter_count is equal to 2. 
---@field respect_insert_limits boolean (default: literal: value: False) When set, this loader will respect the same automated insertion limits as inserters do, instead of inserting up to the full ingredient stack capacity. 
---@field structure LoaderStructure   
---@field structure_render_layer RenderLayer (default: literal: value: object)  
---@field wait_for_full_stack boolean (default: literal: value: False) When set, this loader will ignore items for which there is not enough to create a full belt stack. Relevant only when loader can create belt stacks. 
---@parent TransportBeltConnectablePrototype
---
--- typename: null
--- Continuously loads and unloads machines, as an alternative to inserters.
LoaderPrototype = {}


---@class (exact) Loader1x1Prototype : LoaderPrototype
---@parent LoaderPrototype
---
--- typename: loader-1x1
--- Continuously loads and unloads machines, as an alternative to inserters.
---
---This loader type is identical to [Loader1x2Prototype](prototype:Loader1x2Prototype) with the exception of its hardcoded belt_distance. The belt_distance of the loader determines the distance between the position of this loader and the tile of the loader's belt target.
---
---This loader type always has a belt_distance of 0, meaning by default it is 1 tile long in total. For a loader type with a belt_distance of 0.5, see [Loader1x2Prototype](prototype:Loader1x2Prototype).
Loader1x1Prototype = {}


---@class (exact) Loader1x2Prototype : LoaderPrototype
---@parent LoaderPrototype
---
--- typename: loader
--- Continuously loads and unloads machines, as an alternative to inserters.
---
---This loader type is identical to [Loader1x1Prototype](prototype:Loader1x1Prototype) with the exception of its hardcoded belt_distance. The belt_distance of the loader determines the distance between the position of this loader and the tile of the loader's belt target.
---
---This loader type always has a belt_distance of 0.5, meaning by default it is 2 tiles long in total. For a loader type with a belt_distance of 0, see [Loader1x1Prototype](prototype:Loader1x1Prototype).
Loader1x2Prototype = {}


---@class (exact) LocomotivePrototype : RollingStockPrototype
---@field darkness_to_render_light_animation float (default: literal: value: 0.3)  
---@field energy_source {'complex_type': 'union', 'options': ['BurnerEnergySource', 'VoidEnergySource'], 'full_format': False}   
---@field front_light LightDefinition   
---@field front_light_pictures RollingStockRotatedSlopedGraphics   
---@field max_power Energy   
---@field max_snap_to_train_stop_distance float (default: literal: value: 3.0) In tiles. A locomotive will snap to a nearby train stop when the player places it within this distance to the stop. 
---@field reversing_power_modifier double   
---@parent RollingStockPrototype
---
--- typename: locomotive
--- A [locomotive](https://wiki.factorio.com/Locomotive).
LocomotivePrototype = {}


---@class (exact) LogisticRobotPrototype : RobotWithLogisticInterfacePrototype
---@field collision_box BoundingBox (default: Empty = `{{0, 0}, {0, 0}}`) Must have a collision box size of zero. 
---@field idle_with_cargo RotatedAnimation  Only the first frame of the animation is drawn. This means that the graphics for the idle state cannot be animated. 
---@field in_motion_with_cargo RotatedAnimation  Only the first frame of the animation is drawn. This means that the graphics for the in_motion state cannot be animated. 
---@field shadow_idle_with_cargo RotatedAnimation  Only the first frame of the animation is drawn. This means that the graphics for the idle state cannot be animated. 
---@field shadow_in_motion_with_cargo RotatedAnimation  Only the first frame of the animation is drawn. This means that the graphics for the in_motion state cannot be animated. 
---@parent RobotWithLogisticInterfacePrototype
---
--- typename: logistic-robot
--- A [logistic robot](https://wiki.factorio.com/Logistic_robot).
LogisticRobotPrototype = {}


---@class (exact) MapGenPresets 
---@field name string  Name of the map gen presets. Base game uses "default". 
---@field type {'complex_type': 'literal', 'value': 'map-gen-presets'}   
---
---
--- typename: map-gen-presets
--- The available map gen presets.
MapGenPresets = {}


---@class (exact) MapSettings 
---@field asteroids AsteroidSettings   
---@field difficulty_settings DifficultySettings   
---@field enemy_evolution EnemyEvolutionSettings   
---@field enemy_expansion EnemyExpansionSettings   
---@field max_failed_behavior_count uint32  If a behavior fails this many times, the enemy (or enemy group) is destroyed. This solves biters stuck within their own base. 
---@field name string  Name of the map-settings. Base game uses "map-settings". 
---@field path_finder PathFinderSettings   
---@field pollution PollutionSettings   
---@field steering SteeringSettings   
---@field type {'complex_type': 'literal', 'value': 'map-settings'}   
---@field unit_group UnitGroupSettings   
---
---
--- typename: map-settings
--- The default map settings.
MapSettings = {}


---@class (exact) MarketPrototype : EntityWithOwnerPrototype
---@field allow_access_to_all_forces boolean (default: literal: value: True) Whether all forces are allowed to open this market. 
---@field picture Sprite   
---@parent EntityWithOwnerPrototype
---
--- typename: market
--- Offers can be added to a market and they are shown when opening the entity. Offers allow to spend items to get research bonuses or items.
MarketPrototype = {}


---@class (exact) MiningDrillPrototype : EntityWithOwnerPrototype
---@field allowed_effects EffectTypeLimitation (default: All effects are allowed) Sets the [modules](prototype:ModulePrototype) and [beacon](prototype:BeaconPrototype) effects that are allowed to be used on this mining drill. 
---@field allowed_module_categories {'complex_type': 'array', 'value': 'ModuleCategoryID'} (default: All module categories are allowed) Sets the [module categories](prototype:ModuleCategory) that are allowed to be inserted into this machine. 
---@field base_picture Sprite4Way  Used by the [pumpjack](https://wiki.factorio.com/Pumpjack) to have a static 4 way sprite. 
---@field base_render_layer RenderLayer (default: literal: value: lower-object)  
---@field circuit_connector {'complex_type': 'tuple', 'values': ['CircuitConnectorDefinition', 'CircuitConnectorDefinition', 'CircuitConnectorDefinition', 'CircuitConnectorDefinition']}   
---@field circuit_wire_max_distance double (default: literal: value: 0) The maximum circuit wire distance for this entity. 
---@field draw_circuit_wires boolean (default: literal: value: True)  
---@field draw_copper_wires boolean (default: literal: value: True)  
---@field drilling_sound InterruptibleSound   
---@field drilling_sound_animation_end_frame uint16 (default: literal: value: 0)  
---@field drilling_sound_animation_start_frame uint16 (default: literal: value: 0)  
---@field drops_full_belt_stacks boolean (default: literal: value: False)  
---@field effect_receiver EffectReceiver   
---@field energy_source EnergySource  The energy source of this mining drill. 
---@field energy_usage Energy  The amount of energy used by the drill while mining. Can't be less than or equal to 0. 
---@field filter_count uint8 (default: literal: value: 0) How many filters this mining drill has. Maximum count of filtered resources in a mining drill is 5. 
---@field graphics_set MiningDrillGraphicsSet   
---@field input_fluid_box FluidBox   
---@field mining_speed double  The speed of this drill. 
---@field module_slots ItemStackIndex  The number of module slots in this machine. 
---@field monitor_visualization_tint Color  When this mining drill is connected to the circuit network, the resource that it is reading (either the entire resource patch, or the resource in the mining area of the drill, depending on circuit network setting), is tinted in this color when mousing over the mining drill. 
---@field moving_sound InterruptibleSound   
---@field output_fluid_box FluidBox   
---@field perceived_performance PerceivedPerformance  Affects animation speed. 
---@field quality_affects_mining_radius boolean (default: literal: value: False) If set, [QualityPrototype::mining_drill_mining_radius_bonus](prototype:QualityPrototype::mining_drill_mining_radius_bonus) will be added to resource_searching_radius. 
---@field quality_affects_module_slots boolean (default: literal: value: False) If set, [QualityPrototype::mining_drill_module_slots_bonus](prototype:QualityPrototype::mining_drill_module_slots_bonus) will be added to module slots count. 
---@field radius_visualisation_picture Sprite  The sprite used to show the range of the mining drill. 
---@field resource_categories {'complex_type': 'array', 'value': 'ResourceCategoryID'}  The names of the [ResourceCategory](prototype:ResourceCategory) that can be mined by this drill. For a list of built-in categories, see [here](https://wiki.factorio.com/Data.raw#resource-category).
---
---Note: Categories containing resources which produce items, fluids, or items+fluids may be combined on the same entity, but may not work as expected. Examples: Miner does not rotate fluid-resulting resources until depletion. Fluid isn't output (fluid resource change and fluidbox matches previous fluid). Miner with no `vector_to_place_result` can't output an item result and halts. 
---@field resource_drain_rate_percent uint8 (default: literal: value: 100) May not be `0` or larger than `100`. 
---@field resource_searching_offset Vector (default: `{0, 0}`) Offset of the `resource_searching_radius` from the entity center when the mining drill is facing north. 
---@field resource_searching_radius double  The distance from the center of the mining drill to search for resources in.
---
---This is 2.49 for electric mining drills (a 5x5 area) and 0.99 for burner mining drills (a 2x2 area). The drill searches resource outside its natural boundary box, which is 0.01 (the middle of the entity); making it 2.5 and 1.0 gives it another block radius. 
---@field shuffle_resources_to_mine boolean (default: literal: value: False)  
---@field uses_force_mining_productivity_bonus boolean (default: literal: value: True)  
---@field vector_to_place_result Vector  The position where any item results are placed, when the mining drill is facing north (default direction). If the drill does not produce any solid items but uses a fluidbox output instead (e.g. pumpjacks), a vector of `{0,0}` disables the yellow arrow alt-mode indicator for the placed item location. 
---@field wet_mining_graphics_set MiningDrillGraphicsSet   
---@parent EntityWithOwnerPrototype
---
--- typename: mining-drill
--- A mining drill for automatically extracting resources from [resource entities](prototype:ResourceEntityPrototype). This prototype type is used by [burner mining drill](https://wiki.factorio.com/Burner_mining_drill), [electric mining drill](https://wiki.factorio.com/Electric_mining_drill) and [pumpjack](https://wiki.factorio.com/Pumpjack) in vanilla.
MiningDrillPrototype = {}


---@class (exact) ModData : Prototype
---@field data {'complex_type': 'dictionary', 'key': 'string', 'value': 'AnyBasic'}   
---@field data_type string  Arbitrary string that mods can use to declare type of data. Can be used for mod compatibility when one mod declares block of data that is expected to be discovered by another mod. 
---@parent Prototype
---
--- typename: mod-data
--- Block of arbitrary data set by mods in data stage.
ModData = {}


---@class (exact) ModuleCategory : Prototype
---@parent Prototype
---
--- typename: module-category
--- A module category. The built-in categories can be found [here](https://wiki.factorio.com/Data.raw#module-category). See [ModulePrototype::category](prototype:ModulePrototype::category).
ModuleCategory = {}


---@class (exact) ModulePrototype : ItemPrototype
---@field art_style string  Chooses with what art style the module is shown inside [beacons](prototype:BeaconPrototype). See [BeaconModuleVisualizations::art_style](prototype:BeaconModuleVisualizations::art_style). Vanilla uses `"vanilla"` here. 
---@field beacon_tint BeaconVisualizationTints   
---@field category ModuleCategoryID  Used when upgrading modules: Ctrl + click modules into an entity and it will replace lower tier modules of the same category with higher tier modules. 
---@field effect Effect  The effect of the module on the machine it's inserted in, such as increased pollution. 
---@field requires_beacon_alt_mode boolean (default: literal: value: True)  
---@field tier uint32  Tier of the module inside its category. Used when upgrading modules: Ctrl + click modules into an entity and it will replace lower tier modules with higher tier modules if they have the same category. 
---@parent ItemPrototype
---
--- typename: module
--- A [module](https://wiki.factorio.com/Module). They are used to affect the capabilities of existing machines, for example by increasing the crafting speed of a [crafting machine](prototype:CraftingMachinePrototype).
ModulePrototype = {}


---@class (exact) ModuleTransferAchievementPrototype : AchievementPrototype
---@field amount uint32 (default: literal: value: 1) How many modules need to be transferred. 
---@field limited_to_one_game boolean (default: literal: value: False) If this is false, the player carries over their statistics from this achievement through all their saves. 
---@field module {'complex_type': 'union', 'options': ['ItemID', {'complex_type': 'array', 'value': 'ItemID'}], 'full_format': False}  This will trigger the achievement, if this module is transferred. 
---@parent AchievementPrototype
---
--- typename: module-transfer-achievement
--- This prototype is used for receiving an achievement when the player moves a module with the cursor.
ModuleTransferAchievementPrototype = {}


---@class (exact) MouseCursor 
---@field filename FileName  Mandatory if `system_cursor` is not defined. 
---@field hot_pixel_x int16  Mandatory if `system_cursor` is not defined. 
---@field hot_pixel_y int16  Mandatory if `system_cursor` is not defined. 
---@field name string  Name of the prototype. 
---@field system_cursor {'complex_type': 'union', 'options': [{'complex_type': 'literal', 'value': 'arrow'}, {'complex_type': 'literal', 'value': 'i-beam'}, {'complex_type': 'literal', 'value': 'crosshair'}, {'complex_type': 'literal', 'value': 'wait-arrow'}, {'complex_type': 'literal', 'value': 'size-all'}, {'complex_type': 'literal', 'value': 'no'}, {'complex_type': 'literal', 'value': 'hand'}], 'full_format': False}  Either this or the other three properties have to be present. 
---@field type {'complex_type': 'literal', 'value': 'mouse-cursor'}   
---
---
--- typename: mouse-cursor
--- Used by [SelectionToolPrototype::mouse_cursor](prototype:SelectionToolPrototype::mouse_cursor).
MouseCursor = {}


---@class (exact) MovementBonusEquipmentPrototype : EquipmentPrototype
---@field energy_consumption Energy   
---@field movement_bonus double  Multiplier of the character speed/vehicle acceleration. 
---@parent EquipmentPrototype
---
--- typename: movement-bonus-equipment
--- Used by [exoskeleton](https://wiki.factorio.com/Exoskeleton). Increases max speed of characters or acceleration of vehicles if they have this equipment in their grid.
MovementBonusEquipmentPrototype = {}


---@class (exact) NamedNoiseExpression : Prototype
---@field expression NoiseExpression  The noise expression itself. This is where most of the noise magic happens. 
---@field intended_property string  Names the property that this expression is intended to provide a value for, if any. This will make the expression show up as an option in the map generator GUI, unless it is the only expression with that intended property, in which case it will be hidden and selected by default.
---
---For example if a noise expression is intended to be used as an alternative temperature generator, `intended_property` should be "temperature". 
---@field local_expressions {'complex_type': 'dictionary', 'key': 'string', 'value': 'NoiseExpression'}  A map of expression name to expression.
---
---Local expressions are meant to store data locally similar to local variables in Lua. Their purpose is to hold noise expressions used multiple times in the named noise expression, or just to tell the reader that the local expression has a specific purpose. Local expressions can access other local definitions, but recursive definitions aren't supported. 
---@field local_functions {'complex_type': 'dictionary', 'key': 'string', 'value': 'NoiseFunction'}  A map of function name to function.
---
---Local functions serve the same purpose as local expressions - they aren't visible outside of the specific prototype and they have access to other local definitions. 
---@field order Order  Used to order alternative expressions in the map generator GUI. For a given property (e.g. 'temperature'), the NamedNoiseExpression with that property's name as its `intended_property` with the lowest order will be chosen as the default in the GUI.
---
---If no order is specified, it defaults to "2000" if the property name matches the expression name (making it the 'technical default' generator for the property if none is specified in MapGenSettings), or "3000" otherwise. A generator defined with an order less than "2000" but with a unique name can thereby override the default generator used when creating a new map through the GUI without automatically overriding the 'technical default' generator, which is probably used by existing maps. 
---@parent Prototype
---
--- typename: noise-expression
--- A [NoiseExpression](prototype:NoiseExpression) with a name. The base game uses named noise expressions to specify functions for many map properties to be used in map generation; e.g. the "elevation" expression is used to calculate elevation for every point on a map. For a list of the built-in named noise expressions, see [data.raw](https://wiki.factorio.com/Data.raw#noise-expression).
---
---Named noise expressions can be used by [MapGenSettings](prototype:MapGenSettings) and [MapGenPreset](prototype:MapGenPreset) to override which named expression is used to calculate a given property by having an entry in `property_expression_names`, e.g. `elevation = "elevation_island"`.
---
---Alternate expressions can be made available in the map generator GUI by setting their `intended_property` to the name of the property they should override.
---
---Named noise expressions can also be used as [noise variables](runtime:noise-expressions) e.g. `var("my-noise-expression")`.
NamedNoiseExpression = {}


---@class (exact) NamedNoiseFunction : Prototype
---@field expression NoiseExpression   
---@field local_expressions {'complex_type': 'dictionary', 'key': 'string', 'value': 'NoiseExpression'}  A map of expression name to expression.
---
---Local expressions are meant to store data locally similar to local variables in Lua. Their purpose is to hold noise expressions used multiple times in the named noise expression, or just to tell the reader that the local expression has a specific purpose. Local expressions can access other local definitions and also function parameters, but recursive definitions aren't supported. 
---@field local_functions {'complex_type': 'dictionary', 'key': 'string', 'value': 'NoiseFunction'}  A map of function name to function.
---
---Local functions serve the same purpose as local expressions - they aren't visible outside of the specific prototype and they have access to other local definitions. 
---@field parameters {'complex_type': 'array', 'value': 'string'}  The order of the parameters matters because functions can also be called with positional arguments.
---
---A function can't have more than 255 parameters. 
---@parent Prototype
---
--- typename: noise-function
--- Named noise functions are defined in the same way as [NamedNoiseExpression](prototype:NamedNoiseExpression) except that they also have parameters.
---
---Named noise functions are available to be used in [NoiseExpressions](prototype:NoiseExpression).
NamedNoiseFunction = {}


---@class (exact) NightVisionEquipmentPrototype : EquipmentPrototype
---@field activate_sound Sound   
---@field color_lookup DaytimeColorLookupTable   
---@field darkness_to_turn_on float (default: literal: value: 0.5) Must be >= 0 and <= 1. 
---@field deactivate_sound Sound   
---@field energy_input Energy   
---@parent EquipmentPrototype
---
--- typename: night-vision-equipment
--- Used by [nightvision](https://wiki.factorio.com/Nightvision).
NightVisionEquipmentPrototype = {}


---@class (exact) OffshorePumpPrototype : EntityWithOwnerPrototype
---@field always_draw_fluid boolean (default: literal: value: True) If false, the offshore pump will not show fluid present (visually) before there is an output connected. The pump will also animate yet not show fluid when the fluid is 100% extracted (e.g. such as with a pump). 
---@field circuit_connector {'complex_type': 'tuple', 'values': ['CircuitConnectorDefinition', 'CircuitConnectorDefinition', 'CircuitConnectorDefinition', 'CircuitConnectorDefinition']}   
---@field circuit_wire_max_distance double (default: literal: value: 0) The maximum circuit wire distance for this entity. 
---@field draw_circuit_wires boolean (default: literal: value: True)  
---@field draw_copper_wires boolean (default: literal: value: True)  
---@field energy_source EnergySource  Defines how the offshore pump is powered.
---
---When using an electric energy source and `drain` is not specified, it will be set to `energy_usage ÷ 30` automatically. 
---@field energy_usage Energy  Sets how much energy this offshore pump consumes. Energy usage has to be positive. 
---@field fluid_box FluidBox   
---@field fluid_source_offset Vector   
---@field graphics_set OffshorePumpGraphicsSet   
---@field perceived_performance PerceivedPerformance  Affects animation speed. 
---@field pumping_speed FluidAmount  How many units of fluid are produced per tick. Must be > 0. 
---@field remove_on_tile_collision boolean (default: literal: value: False)  
---@parent EntityWithOwnerPrototype
---
--- typename: offshore-pump
--- An [offshore pump](https://wiki.factorio.com/Offshore_pump).
OffshorePumpPrototype = {}


---@class (exact) ParticlePrototype : Prototype
---@field draw_shadow_when_on_ground boolean (default: literal: value: True)  
---@field ended_in_water_trigger_effect TriggerEffect   
---@field ended_on_ground_trigger_effect TriggerEffect   
---@field fade_away_duration uint16  Defaults to `life_time` / 5, but at most 60. If this is 0, it is silently changed to 1. 
---@field life_time uint16  Can't be 1. 
---@field mining_particle_frame_speed float (default: literal: value: 0)  
---@field movement_modifier float (default: literal: value: 1)  
---@field movement_modifier_when_on_ground float (default: literal: value: 0.8)  
---@field pictures AnimationVariations  Picture variation count and individual frame count must be equal to shadow variation count. 
---@field regular_trigger_effect TriggerEffect   
---@field regular_trigger_effect_frequency uint32 (default: literal: value: 0) Can't be 1. 
---@field render_layer RenderLayer (default: literal: value: object)  
---@field render_layer_when_on_ground RenderLayer (default: literal: value: lower-object)  
---@field shadows AnimationVariations  Shadow variation variation count and individual frame count must be equal to picture variation count. 
---@field vertical_acceleration float (default: literal: value: -0.004) Has to be >= -0.01 and <= 0.01. 
---@parent Prototype
---
--- typename: optimized-particle
--- An entity with a limited lifetime that can use trigger effects.
ParticlePrototype = {}


---@class (exact) ParticleSourcePrototype : EntityPrototype
---@field height float   
---@field height_deviation float (default: literal: value: 0)  
---@field horizontal_speed float   
---@field horizontal_speed_deviation float (default: literal: value: 0)  
---@field particle ParticleID  Mandatory if `smoke` is not defined. 
---@field smoke {'complex_type': 'array', 'value': 'SmokeSource'}  Mandatory if `particle` is not defined. 
---@field time_before_start float   
---@field time_before_start_deviation float (default: literal: value: 0)  
---@field time_to_live float   
---@field time_to_live_deviation float (default: literal: value: 0)  
---@field vertical_speed float   
---@field vertical_speed_deviation float (default: literal: value: 0)  
---@parent EntityPrototype
---
--- typename: particle-source
--- Creates particles.
ParticleSourcePrototype = {}


---@class (exact) PipeToGroundPrototype : EntityWithOwnerPrototype
---@field disabled_visualization Sprite4Way   
---@field draw_fluid_icon_override boolean (default: literal: value: False) Causes fluid icon to always be drawn, ignoring the usual pair requirement. 
---@field fluid_box FluidBox   
---@field frozen_patch Sprite4Way   
---@field pictures Sprite4Way   
---@field visualization Sprite4Way   
---@parent EntityWithOwnerPrototype
---
--- typename: pipe-to-ground
--- A [pipe to ground](https://wiki.factorio.com/Pipe_to_ground).
PipeToGroundPrototype = {}


---@class (exact) PlaceEquipmentAchievementPrototype : AchievementPrototype
---@field amount uint32 (default: literal: value: 1)  
---@field armor ItemID   
---@field limit_equip_quality QualityID   
---@field limit_quality QualityID   
---@field limited_to_one_game boolean (default: literal: value: False) If this is false, the player carries over their statistics from this achievement through all their saves. 
---@parent AchievementPrototype
---
--- typename: place-equipment-achievement
--- 
PlaceEquipmentAchievementPrototype = {}


---@class (exact) SpaceLocationPrototype : Prototype
---@field asteroid_spawn_definitions {'complex_type': 'array', 'value': 'SpaceLocationAsteroidSpawnDefinition'}   
---@field asteroid_spawn_influence double (default: literal: value: 0.1) If greater than 0, `asteroid_spawn_definitions` will be used on space connections of this location, interpolated based on distance. The number specifies the percentage of the route where the location stops spawning its asteroids. 
---@field auto_save_on_first_trip boolean (default: literal: value: True)  
---@field distance double  Distance from the sun in map coordinates. 
---@field draw_orbit boolean (default: literal: value: True) If `false`, the orbital ring around the sun will not be drawn for this location. 
---@field fly_condition boolean (default: literal: value: False) When set to true, it means that this connection offers fly condition rather than wait condition at the destination 
---@field gravity_pull double (default: literal: value: 0) A value which modifies platform speed; is subtracted when traveling from this location and added when traveling to this location. 
---@field hidden boolean (default: literal: value: False) Hides the space location from the planet selection lists and the space map. 
---@field icon FileName  Path to the icon file.
---
---Only loaded, and mandatory if `icons` is not defined. 
---@field icon_size SpriteSizeType (default: literal: value: 64) The size of the square icon, in pixels. E.g. `32` for a 32px by 32px icon. Must be larger than `0`.
---
---Only loaded if `icons` is not defined. 
---@field icons {'complex_type': 'array', 'value': 'IconData'}  Can't be an empty array. 
---@field label_orientation RealOrientation (default: literal: value: 0.25) The orientation where the location's name will be drawn. 
---@field magnitude double (default: literal: value: 1.0) The apparent size of the space location in map coordinates. 
---@field orientation RealOrientation  Angle in relation to the sun. 
---@field parked_platforms_orientation RealOrientation (default: same as orientation) The orientation where parked space platforms will be drawn. 
---@field planet_procession_set ProcessionSet  These transitions are used for anything traveling from the surface associated with this location. 
---@field platform_procession_set ProcessionSet  These transitions are used for any platform stopped at this location. 
---@field procession_audio_catalogue ProcessionAudioCatalogue   
---@field procession_graphic_catalogue ProcessionGraphicCatalogue   
---@field solar_power_in_space double (default: literal: value: 1.0)  
---@field starmap_icon FileName  Path to the icon file.
---
---Only loaded if `starmap_icons` is not defined. 
---@field starmap_icon_orientation RealOrientation  Orientation of the starmap icon, defaults to pointing towards the sun. 
---@field starmap_icon_size SpriteSizeType (default: literal: value: 64) The size of the starmap icon, in pixels. E.g. `32` for a 32px by 32px icon. Must be larger than `0`.
---
---Only loaded if `starmap_icons` is not defined. 
---@field starmap_icons {'complex_type': 'array', 'value': 'IconData'}  Can't be an empty array. 
---@parent Prototype
---
--- typename: space-location
--- A space location, such as a planet or the solar system edge.
SpaceLocationPrototype = {}


---@class (exact) PlanetPrototype : SpaceLocationPrototype
---@field entities_require_heating boolean (default: literal: value: False)  
---@field lightning_properties LightningProperties   
---@field map_gen_settings PlanetPrototypeMapGenSettings   
---@field map_seed_offset uint32 (default: CRC checksum of `name`)  
---@field persistent_ambient_sounds PersistentWorldAmbientSoundsDefinition   
---@field player_effects Trigger   
---@field pollutant_type AirbornePollutantID   
---@field surface_properties {'complex_type': 'dictionary', 'key': 'SurfacePropertyID', 'value': 'double'}   
---@field surface_render_parameters SurfaceRenderParameters   
---@field ticks_between_player_effects MapTick (default: literal: value: 0)  
---@parent SpaceLocationPrototype
---
--- typename: planet
--- 
PlanetPrototype = {}


---@class (exact) TreePrototype : EntityWithHealthPrototype
---@field colors {'complex_type': 'array', 'value': 'Color'}  Mandatory if `variations` is defined. 
---@field darkness_of_burnt_tree float (default: literal: value: 0.5)  
---@field healing_per_tick float (default: literal: value: 0.001666) The amount of health automatically regenerated. Trees will regenerate every 60 ticks with `healing_per_tick × 60`. 
---@field pictures SpriteVariations  Mandatory if `variations` is not defined. 
---@field stateless_visualisation_variations {'complex_type': 'array', 'value': {'complex_type': 'union', 'options': ['StatelessVisualisation', {'complex_type': 'array', 'value': 'StatelessVisualisation'}], 'full_format': False}}   
---@field variation_weights {'complex_type': 'array', 'value': 'float'}   
---@field variations {'complex_type': 'array', 'value': 'TreeVariation'}  If defined, it can't be empty. 
---@parent EntityWithHealthPrototype
---
--- typename: tree
--- A [tree](https://wiki.factorio.com/Tree).
TreePrototype = {}


---@class (exact) PlantPrototype : TreePrototype
---@field agricultural_tower_tint RecipeTints   
---@field growth_ticks MapTick  Must be positive. 
---@field harvest_emissions {'complex_type': 'dictionary', 'key': 'AirbornePollutantID', 'value': 'double'}  The burst of pollution to emit when the plant is harvested. 
---@parent TreePrototype
---
--- typename: plant
--- 
PlantPrototype = {}


---@class (exact) PlayerDamagedAchievementPrototype : AchievementPrototype
---@field minimum_damage float  This will trigger the achievement, if the amount of damage taken by the dealer, is more than this. 
---@field should_survive boolean  This sets the achievement to only trigger, if you survive the minimum amount of damage. If you don't need to survive, false. 
---@field type_of_dealer string (default: literal: value: ) This will trigger the achievement, if the player takes damage from this specific entity type. 
---@parent AchievementPrototype
---
--- typename: player-damaged-achievement
--- This prototype is used for receiving an achievement when the player receives damage.
PlayerDamagedAchievementPrototype = {}


---@class (exact) PlayerPortPrototype : EntityWithOwnerPrototype
---@parent EntityWithOwnerPrototype
---@deprecated
--- typename: player-port
--- Deprecated in 2.0.
PlayerPortPrototype = {}


---@class (exact) PowerSwitchPrototype : EntityWithOwnerPrototype
---@field circuit_wire_connection_point WireConnectionPoint   
---@field draw_circuit_wires boolean (default: literal: value: True)  
---@field draw_copper_wires boolean (default: literal: value: True)  
---@field frozen_patch Sprite   
---@field led_off Sprite   
---@field led_on Sprite   
---@field left_wire_connection_point WireConnectionPoint   
---@field overlay_loop Animation   
---@field overlay_start Animation   
---@field overlay_start_delay uint8   
---@field power_on_animation Animation   
---@field right_wire_connection_point WireConnectionPoint   
---@field wire_max_distance double (default: literal: value: 0)  
---@parent EntityWithOwnerPrototype
---
--- typename: power-switch
--- A [power switch](https://wiki.factorio.com/Power_switch).
PowerSwitchPrototype = {}


---@class (exact) ProcessionLayerInheritanceGroup : Prototype
---@field arrival_application TransitionApplication   
---@field intermezzo_application TransitionApplication   
---@parent Prototype
---
--- typename: procession-layer-inheritance-group
--- Helps [ProcessionLayers](prototype:ProcessionLayer) pass properties between subsequent transitions if they belong to the same group.
ProcessionLayerInheritanceGroup = {}


---@class (exact) ProcessionPrototype : Prototype
---@field ground_timeline ProcessionTimeline  Used alternatively when landing to ground. 
---@field procession_style {'complex_type': 'union', 'options': ['uint32', {'complex_type': 'array', 'value': 'uint32'}], 'full_format': False}  Indexes used to match transitions from different surfaces together. Only a single intermezzo of a given procession_style may exist. 
---@field timeline ProcessionTimeline  Used when leaving or arriving to a station. 
---@field usage {'complex_type': 'union', 'options': [{'complex_type': 'literal', 'value': 'departure'}, {'complex_type': 'literal', 'value': 'arrival'}, {'complex_type': 'literal', 'value': 'intermezzo'}], 'full_format': False}  Arrival and Departure are to be referenced by name. All intermezzos are collected during loading and filled in by `procession_style`. 
---@parent Prototype
---
--- typename: procession
--- Describes the duration and visuals of a departure, arrival or an intermezzo while traveling between surfaces. Usually provided inside of a [ProcessionSet](prototype:ProcessionSet).
ProcessionPrototype = {}


---@class (exact) ProduceAchievementPrototype : AchievementPrototype
---@field amount MaterialAmountType  This will set the amount of items or fluids needed to craft, for the player to complete the achievement. 
---@field fluid_product FluidID  Mandatory if `item_product` is not defined.
---
---This will tell the achievement what fluid the player needs to craft, to get the achievement. 
---@field item_product ItemIDFilter  Mandatory if `fluid_product` is not defined.
---
---This will tell the achievement what item the player needs to craft, to get the achievement. 
---@field limited_to_one_game boolean  If this is false, the player carries over their statistics from this achievement through all their saves. 
---@parent AchievementPrototype
---
--- typename: produce-achievement
--- This prototype is used for receiving an achievement when the player produces more than the specified amount of items.
ProduceAchievementPrototype = {}


---@class (exact) ProducePerHourAchievementPrototype : AchievementPrototype
---@field amount MaterialAmountType  This is how much the player has to craft in an hour, to receive the achievement. 
---@field fluid_product FluidID  Mandatory if `item_product` is not defined.
---
---This will tell the achievement what fluid the player needs to craft, to get the achievement. 
---@field item_product ItemIDFilter  Mandatory if `fluid_product` is not defined.
---
---This will tell the achievement what item the player needs to craft, to get the achievement. 
---@parent AchievementPrototype
---
--- typename: produce-per-hour-achievement
--- This prototype is used for receiving an achievement when the player crafts a specified item a certain amount, in an hour.
ProducePerHourAchievementPrototype = {}


---@class (exact) ProgrammableSpeakerPrototype : EntityWithOwnerPrototype
---@field audible_distance_modifier float (default: literal: value: 1)  
---@field circuit_connector CircuitConnectorDefinition   
---@field circuit_wire_max_distance double (default: literal: value: 0)  
---@field draw_circuit_wires boolean (default: literal: value: True)  
---@field draw_copper_wires boolean (default: literal: value: True)  
---@field energy_source {'complex_type': 'union', 'options': ['ElectricEnergySource', 'VoidEnergySource'], 'full_format': False}   
---@field energy_usage_per_tick Energy   
---@field instruments {'complex_type': 'array', 'value': 'ProgrammableSpeakerInstrument'}   
---@field maximum_polyphony uint32   
---@field sprite Sprite   
---@parent EntityWithOwnerPrototype
---
--- typename: programmable-speaker
--- A [programmable speaker](https://wiki.factorio.com/Programmable_speaker).
ProgrammableSpeakerPrototype = {}


---@class (exact) ProjectilePrototype : EntityPrototype
---@field acceleration double  Must be != 0 if `turning_speed_increases_exponentially_with_projectile_speed` is true. 
---@field action Trigger  Executed when the projectile hits something. 
---@field animation RotatedAnimationVariations   
---@field direction_only boolean (default: literal: value: False) Setting this to true can be used to disable projectile homing behaviour. 
---@field enable_drawing_with_mask boolean (default: literal: value: False)  
---@field final_action Trigger  Executed when the projectile hits something, after `action` and only if the entity that was hit was destroyed. The projectile is destroyed right after the final_action. 
---@field force_condition ForceCondition (default: literal: value: all)  
---@field height double (default: literal: value: 1)  
---@field hit_at_collision_position boolean (default: literal: value: False) When true the entity is hit at the position on its collision box the projectile first collides with. When false the entity is hit at its own position. 
---@field hit_collision_mask CollisionMaskConnector  Defaults to the mask from [UtilityConstants::default_collision_masks](prototype:UtilityConstants::default_collision_masks) when indexed by `"projectile/hit"`. 
---@field light LightDefinition   
---@field max_speed double (default: MAX_DOUBLE) Must be greater than or equal to 0. 
---@field piercing_damage float (default: literal: value: 0) Whenever an entity is hit by the projectile, this number gets reduced by the health of the entity. If the number is then below 0, the `final_action` is applied and the projectile destroyed. Otherwise, the projectile simply continues to its destination. 
---@field rotatable boolean (default: literal: value: True) Whether the animation of the projectile is rotated to match the direction of travel. 
---@field shadow RotatedAnimationVariations   
---@field smoke {'complex_type': 'array', 'value': 'SmokeSource'}   
---@field speed_modifier Vector (default: `{1, 1}`)  
---@field turn_speed float (default: literal: value: 1) Must be greater than or equal to 0. 
---@field turning_speed_increases_exponentially_with_projectile_speed boolean (default: literal: value: False)  
---@parent EntityPrototype
---
--- typename: projectile
--- Entity with limited lifetime that can hit other entities and has triggers when this happens.
ProjectilePrototype = {}


---@class (exact) ProxyContainerPrototype : EntityWithOwnerPrototype
---@field circuit_connector CircuitConnectorDefinition   
---@field circuit_wire_max_distance double (default: literal: value: 0) The maximum circuit wire distance for this entity. 
---@field draw_circuit_wires boolean (default: literal: value: True)  
---@field draw_copper_wires boolean (default: literal: value: True)  
---@field draw_inventory_content boolean (default: literal: value: True) If the content of the inventory should be rendered in alt mode. 
---@field picture Sprite   
---@parent EntityWithOwnerPrototype
---
--- typename: proxy-container
--- A container that must be set to point at other entity and inventory index so it can forward all inventory interactions to the other entity.
ProxyContainerPrototype = {}


---@class (exact) PumpPrototype : EntityWithOwnerPrototype
---@field animations Animation4Way  The animation for the pump. 
---@field circuit_connector {'complex_type': 'tuple', 'values': ['CircuitConnectorDefinition', 'CircuitConnectorDefinition', 'CircuitConnectorDefinition', 'CircuitConnectorDefinition']}   
---@field circuit_wire_max_distance double (default: literal: value: 0)  
---@field draw_circuit_wires boolean (default: literal: value: True)  
---@field draw_copper_wires boolean (default: literal: value: True)  
---@field energy_source EnergySource  The type of energy the pump uses. 
---@field energy_usage Energy  The amount of energy the pump uses. 
---@field flow_scaling boolean (default: literal: value: True) When true, pump will reduce pumping speed based on fullness of the input fluid segment. 
---@field fluid_animation Animation4Way   
---@field fluid_box FluidBox  The area of the entity where fluid travels. 
---@field fluid_wagon_connector_alignment_tolerance double (default: 2 / 32.0)  
---@field fluid_wagon_connector_frame_count uint8 (default: literal: value: 1)  
---@field fluid_wagon_connector_graphics FluidWagonConnectorGraphics   
---@field fluid_wagon_connector_speed double (default: 1 / 64.0)  
---@field frozen_patch Sprite4Way   
---@field glass_pictures Sprite4Way   
---@field pumping_speed FluidAmount  The amount of fluid this pump transfers per tick. 
---@parent EntityWithOwnerPrototype
---
--- typename: pump
--- The pump is used to transfer fluids between tanks, fluid wagons and pipes.
PumpPrototype = {}


---@class (exact) QualityPrototype : Prototype
---@field accumulator_capacity_multiplier double (default: 1 + `level`) Must be >= 0.01. 
---@field asteroid_collector_collection_radius_bonus double (default: Value of `level`) Must be >= 0.
---
---Performance warning: the navigation has to pre-calculate ranges for the highest tier collector possible, so you should keep this collection radius within reasonable values. 
---@field beacon_module_slots_bonus ItemStackIndex (default: Value of `level`) Only affects beacons with [BeaconPrototype::quality_affects_module_slots](prototype:BeaconPrototype::quality_affects_module_slots) set. 
---@field beacon_power_usage_multiplier float (default: literal: value: 1) Must be >= 0. 
---@field beacon_supply_area_distance_bonus float (default: clamp(`level`, 0, 64)) Only affects beacons with [BeaconPrototype::quality_affects_supply_area_distance](prototype:BeaconPrototype::quality_affects_supply_area_distance) set.
---
---Must be >= 0 and <= 64. 
---@field color Color   
---@field crafting_machine_energy_usage_multiplier double (default: literal: value: 1) Must be >= 0.01.
---
---Only affects crafting machines with [CraftingMachinePrototype::quality_affects_energy_usage](prototype:CraftingMachinePrototype::quality_affects_energy_usage) set.
---
---Will be ignored by crafting machines with [CraftingMachinePrototype::energy_usage_quality_multiplier](prototype:CraftingMachinePrototype::energy_usage_quality_multiplier) set. 
---@field crafting_machine_module_slots_bonus ItemStackIndex (default: Value of `level`) Only affects crafting machines with [CraftingMachinePrototype::quality_affects_module_slots](prototype:CraftingMachinePrototype::quality_affects_module_slots) set.
---
---Will be ignored by crafting machines with [CraftingMachinePrototype::module_slots_quality_bonus](prototype:CraftingMachinePrototype::module_slots_quality_bonus) set. 
---@field crafting_machine_speed_multiplier double (default: Value of `default_multiplier`) Must be >= 0.01.
---
---Will be ignored by crafting machines with [CraftingMachinePrototype::crafting_speed_quality_multiplier](prototype:CraftingMachinePrototype::crafting_speed_quality_multiplier) set. 
---@field default_multiplier double (default: 1 + 0.3 * `level`) Must be >= 0.01. 
---@field draw_sprite_by_default boolean (default: literal: value: True)  
---@field electric_pole_supply_area_distance_bonus float (default: Value of `level`) Must be >= 0. 
---@field electric_pole_wire_reach_bonus float (default: 2 * `level`) Must be >= 0. 
---@field equipment_grid_height_bonus int16 (default: Value of `level`)  
---@field equipment_grid_width_bonus int16 (default: Value of `level`)  
---@field fluid_wagon_capacity_multiplier double (default: Value of `default_multiplier`) Must be >= 0.01.
---
---Only affects fluid wagons with [FluidWagonPrototype::quality_affects_capacity](prototype:FluidWagonPrototype::quality_affects_capacity) set. 
---@field flying_robot_max_energy_multiplier double (default: 1 + `level`) Must be >= 0.01. 
---@field icon FileName  Path to the icon file.
---
---Only loaded, and mandatory if `icons` is not defined. 
---@field icon_size SpriteSizeType (default: literal: value: 64) The size of the square icon, in pixels. E.g. `32` for a 32px by 32px icon. Must be larger than `0`.
---
---Only loaded if `icons` is not defined. 
---@field icons {'complex_type': 'array', 'value': 'IconData'}  Can't be an empty array. 
---@field inserter_speed_multiplier double (default: Value of `default_multiplier`) Must be >= 0.01. 
---@field inventory_size_multiplier double (default: Value of `default_multiplier`) Must be >= 0.01. 
---@field lab_module_slots_bonus ItemStackIndex (default: Value of `level`) Only affects labs with [LabPrototype::quality_affects_module_slots](prototype:LabPrototype::quality_affects_module_slots) set. 
---@field lab_research_speed_multiplier double (default: Value of `default_multiplier`) Must be >= 0.01. 
---@field level uint32  Requires Space Age to use level greater than `0`. 
---@field logistic_cell_charging_energy_multiplier double (default: Value of `default_multiplier`) Must be >= 0.01. 
---@field logistic_cell_charging_station_count_bonus uint32 (default: Value of `level`) Only affects roboports with [RoboportPrototype::charging_station_count_affected_by_quality](prototype:RoboportPrototype::charging_station_count_affected_by_quality) set.
---
---Only affects roboport equipment with [RoboportEquipmentPrototype::charging_station_count_affected_by_quality](prototype:RoboportEquipmentPrototype::charging_station_count_affected_by_quality) set. 
---@field mining_drill_mining_radius_bonus float (default: Value of `level`) Only affects mining drills with [MiningDrillPrototype::quality_affects_mining_radius](prototype:MiningDrillPrototype::quality_affects_mining_radius) set.
---
---Must be >= 0. 
---@field mining_drill_module_slots_bonus ItemStackIndex (default: Value of `level`) Only affects mining drills with [MiningDrillPrototype::quality_affects_module_slots](prototype:MiningDrillPrototype::quality_affects_module_slots) set. 
---@field mining_drill_resource_drain_multiplier float (default: literal: value: 1) Must be in range `[0, 1]`. 
---@field name string  Unique textual identification of the prototype. May only contain alphanumeric characters, dashes and underscores. May not exceed a length of 200 characters.
---
---Requires Space Age to create prototypes with name other than `normal` or `quality-unknown`. 
---@field next QualityID   
---@field next_probability double (default: literal: value: 0) The quality [effect of the module](prototype:ModulePrototype::effect) is multiplied by this. For example, if a module's quality effect is 0.2 and the current quality's next_probability is 0.1, then the chance to get the next quality item is 2%.
---
---Must be in range [0, 1.0]. 
---@field range_multiplier double (default: min(1 + 0.1 * `level`, 3)) Must be within `[1, 3]`.
---
---Affects the range of [attack parameters](prototype:AttackParameters), e.g. those used by combat robots, units, guns and turrets. 
---@field science_pack_drain_multiplier float (default: literal: value: 1) Must be in range `[0, 1]`.
---
---Only affects labs with [LabPrototype::uses_quality_drain_modifier](prototype:LabPrototype::uses_quality_drain_modifier) set. 
---@field tool_durability_multiplier double (default: 1 + `level`) Must be >= 0.01.
---
---Affects the durability of [tool items](prototype:ToolPrototype) like science packs, repair tools and armor. 
---@parent Prototype
---
--- typename: quality
--- One quality step. Its effects are specified by the level and the various multiplier and bonus properties. Properties ending in `_multiplier` are applied multiplicatively to their base property, properties ending in `_bonus` are applied additively.
QualityPrototype = {}


---@class (exact) RadarPrototype : EntityWithOwnerPrototype
---@field circuit_connector CircuitConnectorDefinition   
---@field circuit_wire_max_distance double (default: literal: value: 0) The maximum circuit wire distance for this entity. 
---@field connects_to_other_radars boolean (default: literal: value: True) If set to true, radars on the same surface will connect to other radars on the same surface using hidden wires with [radar](runtime:defines.wire_origin.radars) origin. 
---@field draw_circuit_wires boolean (default: literal: value: True)  
---@field draw_copper_wires boolean (default: literal: value: True)  
---@field energy_fraction_to_connect float (default: literal: value: 0.9) Must be between 0 and 1. Must be larger than or equal to `energy_fraction_to_disconnect`. 
---@field energy_fraction_to_disconnect float (default: literal: value: 0.1) Must be between 0 and 1. Must be less than or equal to `energy_fraction_to_connect`. 
---@field energy_per_nearby_scan Energy  The amount of energy the radar has to consume for nearby scan to be performed. This value doesn't have any effect on sector scanning.
---
---Performance warning: nearby scan causes re-charting of many chunks, which is expensive operation. If you want to make a radar that updates map more in real time, you should keep its range low. If you are making radar with high range, you should set this value such that nearby scan is performed once a second or so. For example if you set `energy_usage` to 100kW, setting `energy_per_nearby_scan` to 100kJ will cause nearby scan to happen once per second. 
---@field energy_per_sector Energy  The amount of energy it takes to scan a sector. This value doesn't have any effect on nearby scanning. 
---@field energy_source EnergySource  The energy source for this radar. 
---@field energy_usage Energy  The amount of energy this radar uses. 
---@field frozen_patch Sprite   
---@field is_military_target boolean (default: literal: value: True) Whether this prototype should be a high priority target for enemy forces. See [Military units and structures](https://wiki.factorio.com/Military_units_and_structures). 
---@field max_distance_of_nearby_sector_revealed uint32  The radius of the area constantly revealed by this radar, in chunks. 
---@field max_distance_of_sector_revealed uint32  The radius of the area this radar can chart, in chunks. 
---@field pictures RotatedSprite   
---@field radius_minimap_visualisation_color Color   
---@field reset_orientation_when_frozen boolean (default: literal: value: False)  
---@field rotation_speed double (default: literal: value: 0.01)  
---@parent EntityWithOwnerPrototype
---
--- typename: radar
--- A [radar](https://wiki.factorio.com/Radar).
RadarPrototype = {}


---@class (exact) RailSignalBasePrototype : EntityWithOwnerPrototype
---@field circuit_wire_max_distance double (default: literal: value: 0) The maximum circuit wire distance for this entity. 
---@field collision_box BoundingBox (default: `{{-0.2, -0.2}, {0.2, 0.2}}`) The [collision_box](prototype:EntityPrototype::collision_box) of rail signals is hardcoded to `{{-0.2, -0.2}, {0.2, 0.2}}`. 
---@field default_blue_output_signal SignalIDConnector   
---@field default_green_output_signal SignalIDConnector   
---@field default_orange_output_signal SignalIDConnector   
---@field default_red_output_signal SignalIDConnector   
---@field draw_circuit_wires boolean (default: literal: value: True)  
---@field draw_copper_wires boolean (default: literal: value: True)  
---@field elevated_collision_mask CollisionMaskConnector  Defaults to the mask from [UtilityConstants::default_collision_masks](prototype:UtilityConstants::default_collision_masks) when indexed by  `type .. "/elevated"`. 
---@field elevated_picture_set RailSignalPictureSet   
---@field elevated_selection_priority uint8 (default: literal: value: 55)  
---@field flags EntityPrototypeFlags  The "placeable-off-grid" flag will be ignored for rail signals. 
---@field ground_picture_set RailSignalPictureSet   
---@parent EntityWithOwnerPrototype
---
--- typename: null
--- The abstract base entity for both rail signals.
RailSignalBasePrototype = {}


---@class (exact) RailChainSignalPrototype : RailSignalBasePrototype
---@parent RailSignalBasePrototype
---
--- typename: rail-chain-signal
--- A [rail chain signal](https://wiki.factorio.com/Rail_chain_signal).
RailChainSignalPrototype = {}


---@class (exact) RailPlannerPrototype : ItemPrototype
---@field manual_length_limit double (default: 8 * 2 + 1.41 + 0.5)  
---@field rails {'complex_type': 'array', 'value': 'EntityID'}  May not be an empty array. Entities must be rails and their first item-to-place must be this item. 
---@field support EntityID  Name of a rail support. 
---@parent ItemPrototype
---
--- typename: rail-planner
--- A [rail planner](https://wiki.factorio.com/Rail_planner).
RailPlannerPrototype = {}


---@class (exact) RailRampPrototype : RailPrototype
---@field collision_box BoundingBox (default: `{{-1.6, -7.6}, {1.6, 7.6}}`) The [collision_box](prototype:EntityPrototype::collision_box) of straight rail is hardcoded to `{{-1.6, -7.6}, {1.6, 7.6}}`. 
---@field collision_mask_allow_on_deep_oil_ocean CollisionMaskConnector  Defaults to the mask from [UtilityConstants::default_collision_masks](prototype:UtilityConstants::default_collision_masks) when indexed by `"rail-ramp/allow_on_deep_oil_ocean"`. 
---@field name string  Unique textual identification of the prototype. May only contain alphanumeric characters, dashes and underscores. May not exceed a length of 200 characters.
---
---Requires Space Age to create prototypes with name not starting with `dummy-`. Dummy prototypes cannot be built. 
---@field support_range float (default: literal: value: 15.0) Must be lower than 500 and at least 1. 
---@parent RailPrototype
---
--- typename: rail-ramp
--- A rail ramp.
RailRampPrototype = {}


---@class (exact) RailRemnantsPrototype : CorpsePrototype
---@field build_grid_size {'complex_type': 'literal', 'value': 2} (default: literal: value: 2) Has to be 2 for 2x2 grid. 
---@field collision_box BoundingBox (default: Empty = `{{0, 0}, {0, 0}}`) "Rail remnant entities must have a non-zero [collision_box](prototype:EntityPrototype::collision_box) defined. 
---@field pictures RailPictureSet   
---@field related_rail EntityID   
---@field secondary_collision_box BoundingBox   
---@parent CorpsePrototype
---
--- typename: rail-remnants
--- Used for rail corpses.
RailRemnantsPrototype = {}


---@class (exact) RailSignalPrototype : RailSignalBasePrototype
---@parent RailSignalBasePrototype
---
--- typename: rail-signal
--- A [rail signal](https://wiki.factorio.com/Rail_signal).
RailSignalPrototype = {}


---@class (exact) RailSupportPrototype : EntityWithOwnerPrototype
---@field build_grid_size {'complex_type': 'literal', 'value': 2} (default: literal: value: 2) Has to be 2 for 2x2 grid. 
---@field collision_mask_allow_on_deep_oil_ocean CollisionMaskConnector  Defaults to the mask from [UtilityConstants::default_collision_masks](prototype:UtilityConstants::default_collision_masks) when indexed by `"rail-support/allow_on_deep_oil_ocean"`. 
---@field elevated_selection_boxes {'complex_type': 'array', 'value': 'BoundingBox'}  Array must contain 8 items. 
---@field graphics_set RailSupportGraphicsSet   
---@field name string  Unique textual identification of the prototype. May only contain alphanumeric characters, dashes and underscores. May not exceed a length of 200 characters.
---
---Requires Space Age to create prototypes with name not starting with `dummy-`. Dummy prototypes cannot be built. 
---@field not_buildable_if_no_rails boolean (default: literal: value: False)  
---@field snap_to_spots_distance float (default: literal: value: 1.0)  
---@field support_range float (default: literal: value: 15.0) Must be lower than 500 and at least 1. 
---@parent EntityWithOwnerPrototype
---
--- typename: rail-support
--- 
RailSupportPrototype = {}


---@class (exact) ReactorPrototype : EntityWithOwnerPrototype
---@field circuit_connector CircuitConnectorDefinition   
---@field circuit_wire_max_distance double (default: literal: value: 0) The maximum circuit wire distance for this entity. 
---@field connection_patches_connected SpriteVariations  If defined, number of variations must be at least equal to count of [connections](prototype:HeatBuffer::connections) defined in `heat_buffer`. Each variation represents connected heat buffer connection of corresponding index. 
---@field connection_patches_disconnected SpriteVariations  If defined, number of variations must be at least equal to count of [connections](prototype:HeatBuffer::connections) defined in `heat_buffer`. Each variation represents unconnected heat buffer connection of corresponding index. 
---@field consumption Energy  How much energy this reactor can consume (from the input energy source) and then output as heat. 
---@field default_fuel_glow_color Color (default: `{1, 1, 1, 1} (white)`) When `use_fuel_glow_color` is true, this is the color used as `working_light_picture` tint for fuels that don't have glow color defined. 
---@field default_temperature_signal SignalIDConnector   
---@field draw_circuit_wires boolean (default: literal: value: True)  
---@field draw_copper_wires boolean (default: literal: value: True)  
---@field energy_source EnergySource  May not be a heat energy source.
---
---The input energy source, in vanilla it is a burner energy source. 
---@field heat_buffer HeatBuffer  The energy output as heat. 
---@field heat_connection_patches_connected SpriteVariations  If defined, number of variations must be at least equal to count of [connections](prototype:HeatBuffer::connections) defined in `heat_buffer`. When reactor is heated, corresponding variations are drawn over `connection_patches_connected`. 
---@field heat_connection_patches_disconnected SpriteVariations  If defined, number of variations must be at least equal to count of [connections](prototype:HeatBuffer::connections) defined in `heat_buffer`. When reactor is heated, corresponding variations are drawn over `connection_patches_disconnected`. 
---@field heat_lower_layer_picture Sprite   
---@field heating_radius double (default: literal: value: 1) Must be >= 0. 
---@field light LightDefinition   
---@field lower_layer_picture Sprite   
---@field meltdown_action Trigger  The action is triggered when the reactor dies (is destroyed) at over 90% of max temperature. 
---@field neighbour_bonus double (default: literal: value: 1)  
---@field picture Sprite   
---@field scale_energy_usage boolean (default: literal: value: False) When this is true, the reactor will stop consuming fuel/energy when the temperature has reached the maximum. 
---@field use_fuel_glow_color boolean (default: literal: value: False) Whether the reactor should use [fuel_glow_color](prototype:ItemPrototype::fuel_glow_color) from the fuel item prototype as light color and tint for `working_light_picture`. [Forum post.](https://forums.factorio.com/71121) 
---@field working_light_picture Animation   
---@parent EntityWithOwnerPrototype
---
--- typename: reactor
--- A [reactor](https://wiki.factorio.com/Reactor).
ReactorPrototype = {}


---@class (exact) RecipeCategory : Prototype
---@parent Prototype
---
--- typename: recipe-category
--- A recipe category. The built-in categories can be found [here](https://wiki.factorio.com/Data.raw#recipe-category). See [RecipePrototype::category](prototype:RecipePrototype::category). Recipe categories can be used to specify which [machine](prototype:CraftingMachinePrototype::crafting_categories) can craft which [recipes](prototype:RecipePrototype).
---
---The recipe category with the name "crafting" cannot contain recipes with fluid ingredients or products.
RecipeCategory = {}


---@class (exact) RecipePrototype : Prototype
---@field additional_categories {'complex_type': 'array', 'value': 'RecipeCategoryID'}   
---@field allow_as_intermediate boolean (default: literal: value: True) Whether the recipe can be used as an intermediate recipe in hand-crafting. 
---@field allow_consumption boolean (default: literal: value: True)  
---@field allow_consumption_message LocalisedString (default: `{"item-limitation.consumption-effect"}`)  
---@field allow_decomposition boolean (default: literal: value: True) Whether this recipe is allowed to be broken down for the recipe tooltip "Total raw" calculations. 
---@field allow_inserter_overload boolean (default: literal: value: True) Whether the recipe is allowed to have the extra inserter overload bonus applied (4 * stack inserter stack size). 
---@field allow_intermediates boolean (default: literal: value: True) Whether the recipe is allowed to use intermediate recipes when hand-crafting. 
---@field allow_pollution boolean (default: literal: value: True)  
---@field allow_pollution_message LocalisedString (default: `{"item-limitation.pollution-effect"}`)  
---@field allow_productivity boolean (default: literal: value: False)  
---@field allow_productivity_message LocalisedString (default: `{"item-limitation.productivity-effect"}`)  
---@field allow_quality boolean (default: literal: value: True)  
---@field allow_quality_message LocalisedString (default: `{"item-limitation.quality-effect"}`)  
---@field allow_speed boolean (default: literal: value: True)  
---@field allow_speed_message LocalisedString (default: `{"item-limitation.speed-effect"}`)  
---@field allowed_module_categories {'complex_type': 'array', 'value': 'ModuleCategoryID'} (default: All module categories are allowed) Sets the [module categories](prototype:ModuleCategory) that are allowed to be used with this recipe. 
---@field alternative_unlock_methods {'complex_type': 'array', 'value': 'TechnologyID'}  Additional technologies to list under "Unlocked by" on a recipe's Factoriopedia page. 
---@field always_show_made_in boolean (default: literal: value: False) Whether the "Made in: <Machine>" part of the tool-tip should always be present, and not only when the recipe can't be hand-crafted. 
---@field always_show_products boolean (default: literal: value: False) Whether the products are always shown in the recipe tooltip. 
---@field auto_recycle boolean (default: literal: value: True) Whether the recipe should be included in the recycling recipes automatically generated by the quality mod.
---
---This property is not read by the game engine itself, but the quality mod's recycling.lua file. This means it is discarded by the game engine after loading finishes. 
---@field category RecipeCategoryID (default: literal: value: crafting) The [category](prototype:RecipeCategory) of this recipe. Controls which machines can craft this recipe.
---
---The built-in categories can be found [here](https://wiki.factorio.com/Data.raw#recipe-category). The base `"crafting"` category can not contain recipes with fluid ingredients or products. 
---@field crafting_machine_tint RecipeTints  Used by [WorkingVisualisations::working_visualisations](prototype:WorkingVisualisations::working_visualisations) to tint certain layers with the recipe color. [WorkingVisualisation::apply_recipe_tint](prototype:WorkingVisualisation::apply_recipe_tint) determines which of the four colors is used for that layer, if any. 
---@field emissions_multiplier double (default: literal: value: 1)  
---@field enabled boolean (default: literal: value: True) This can be `false` to disable the recipe at the start of the game, or `true` to leave it enabled.
---
---If a recipe is unlocked via technology, this should be set to `false`. 
---@field energy_required double (default: literal: value: 0.5) The amount of time it takes to make this recipe. Must be `> 0.001`. Equals the number of seconds it takes to craft at crafting speed `1`. 
---@field hidden boolean (default: literal: value: False) Hides the recipe from crafting menus and other recipe selection lists. 
---@field hide_from_bonus_gui boolean (default: literal: value: False)  
---@field hide_from_player_crafting boolean (default: literal: value: False) Hides the recipe from the player's crafting screen. The recipe will still show up for selection in machines. 
---@field hide_from_signal_gui boolean  If left unset, this property will be determined automatically: If the recipe is not `hidden`, and no item, fluid, or virtual signal has the same icon as this recipe, this property will be set to `false`. It'll be `true` otherwise. 
---@field hide_from_stats boolean (default: literal: value: False) Hides the recipe from item/fluid production statistics. 
---@field icon FileName  If given, this determines the recipe's icon. Otherwise, the icon of `main_product` or the singular product is used.
---
---Only loaded if `icons` is not defined.
---
---Mandatory if `icons` is not defined for a recipe with more than one product and no `main_product`, or no product. 
---@field icon_size SpriteSizeType (default: literal: value: 64) The size of the square icon, in pixels. E.g. `32` for a 32px by 32px icon. Must be larger than `0`.
---
---Only loaded if `icons` is not defined. 
---@field icons {'complex_type': 'array', 'value': 'IconData'}  Can't be an empty array. 
---@field ingredients {'complex_type': 'array', 'value': 'IngredientPrototype'}  A table containing ingredient names and amounts. Can also contain information about fluid temperature and whether some of the amount is ignored by production statistics.
---
---The maximum ingredient amount is 65 535. Can be set to an empty table to create a recipe that needs no ingredients.
---
---Duplicate ingredients, e.g. two entries with the same name, are *not* allowed. In-game, the item ingredients are ordered by [ItemGroup::order_in_recipe](prototype:ItemGroup::order_in_recipe). 
---@field main_product string  For recipes with one or more products: Subgroup, localised_name and icon default to the values of the singular/main product, but can be overwritten by the recipe. Setting the main_product to an empty string (`""`) forces the title in the recipe tooltip to use the recipe's name (not that of the product) and shows the products in the tooltip.
---
---If 1) there are multiple products and this property is nil, 2) this property is set to an empty string (`""`), or 3) there are no products, the recipe will use the localised_name, icon, and subgroup of the recipe. icon and subgroup become non-optional. 
---@field maximum_productivity double (default: literal: value: 3.0) Must be >= 0. 
---@field overload_multiplier uint32 (default: literal: value: 0) Used to determine how many extra items are put into an assembling machine before it's considered "full enough". See [insertion limits](https://wiki.factorio.com/Inserters#Insertion_limits).
---
---If set to `0`, it instead uses the following formula: `1.166 / (energy_required / the assembler's crafting_speed)`, rounded up, and clamped to be between`2` and `100`. The numbers used in this formula can be changed by the [UtilityConstants](prototype:UtilityConstants) properties `dynamic_recipe_overload_factor`, `minimum_recipe_overload_multiplier`, and `maximum_recipe_overload_multiplier`. 
---@field preserve_products_in_machine_output boolean (default: literal: value: False)  
---@field requester_paste_multiplier uint32 (default: literal: value: 30)  
---@field reset_freshness_on_craft boolean (default: literal: value: False) When set to true, if the recipe successfully finishes crafting without spoiling, the result is produced fresh (non-spoiled). 
---@field result_is_always_fresh boolean (default: literal: value: False) When set to true, the recipe will always produce fresh (non-spoiled) item even when the ingredients are spoiled. 
---@field results {'complex_type': 'array', 'value': 'ProductPrototype'}  A table containing result names and amounts. Products also contain information such as fluid temperature, probability of results and whether some of the amount is ignored by productivity.
---
---Can be set to an empty table to create a recipe that produces nothing. Duplicate results, e.g. two entries with the same name, are allowed. 
---@field show_amount_in_title boolean (default: literal: value: True) Whether the recipe name should have the product amount in front of it. E.g. "2x Transport belt". 
---@field surface_conditions {'complex_type': 'array', 'value': 'SurfaceCondition'}   
---@field unlock_results boolean (default: literal: value: True) Whether enabling this recipe unlocks its item products to show in selection lists (item filters, logistic requests, etc.). 
---@parent Prototype
---
--- typename: recipe
--- A recipe. It can be a crafting recipe, a smelting recipe, or a custom type of recipe, see [RecipeCategory](prototype:RecipeCategory).
RecipePrototype = {}


---@class (exact) RemoteControllerPrototype 
---@field movement_speed double  Must be >= 0.34375. 
---@field name string  Name of the remote controller. Base game uses "default". 
---@field type {'complex_type': 'literal', 'value': 'remote-controller'}   
---
---
--- typename: remote-controller
--- Properties of the remote controller.
RemoteControllerPrototype = {}


---@class (exact) RepairToolPrototype : ToolPrototype
---@field speed float  Entity health repaired per used [ToolPrototype::durability](prototype:ToolPrototype::durability). E.g. a repair tool with 5 durability and a repair speed of 2 will restore 10 health.
---
---This is then multiplied by the [EntityWithHealthPrototype::repair_speed_modifier](prototype:EntityWithHealthPrototype::repair_speed_modifier) of the entity. 
---@parent ToolPrototype
---
--- typename: repair-tool
--- A [repair pack](https://wiki.factorio.com/Repair_pack). Using the tool decreases durability to restore entity health.
RepairToolPrototype = {}


---@class (exact) ResearchAchievementPrototype : AchievementPrototype
---@field research_all boolean (default: literal: value: False) Mandatory if `technology` is not defined.
---
---This will only trigger if the player has learned every research in the game. 
---@field technology TechnologyID  Mandatory if `research_all` is not defined.
---
---Researching this technology will trigger the achievement. 
---@parent AchievementPrototype
---
--- typename: research-achievement
--- This prototype is used for receiving an achievement when the player completes a specific research.
ResearchAchievementPrototype = {}


---@class (exact) ResearchWithSciencePackAchievementPrototype : AchievementPrototype
---@field amount uint32 (default: literal: value: 1)  
---@field science_pack ItemID   
---@parent AchievementPrototype
---
--- typename: research-with-science-pack-achievement
--- 
ResearchWithSciencePackAchievementPrototype = {}


---@class (exact) ResourceCategory : Prototype
---@parent Prototype
---
--- typename: resource-category
--- A resource category. The built-in categories can be found [here](https://wiki.factorio.com/Data.raw#resource-category). See [ResourceEntityPrototype::category](prototype:ResourceEntityPrototype::category).
ResourceCategory = {}


---@class (exact) ResourceEntityPrototype : EntityPrototype
---@field category ResourceCategoryID (default: literal: value: basic-solid) The category for the resource. Available categories in vanilla can be found [here](https://wiki.factorio.com/Data.raw#resource-category). 
---@field cliff_removal_probability double (default: literal: value: 1.0) Must be greater than or equal to `0`. 
---@field draw_stateless_visualisation_under_building boolean (default: literal: value: True)  
---@field driving_sound InterruptibleSound  Sound played when a [CarPrototype](prototype:CarPrototype) drives over this resource. 
---@field effect_animation_period float (default: literal: value: 0.0) How long it takes `stages_effect` to go from `min_effect_alpha` to `max_effect_alpha`. 
---@field effect_animation_period_deviation float (default: literal: value: 0.0) How much `effect_animation_period` can deviate from its original value. Used to make the stages effect alpha change look less uniform. 
---@field effect_darkness_multiplier float (default: literal: value: 1.0) How much the surface darkness should affect the alpha of `stages_effect`. 
---@field highlight boolean (default: literal: value: False) If the resource should be highlighted when holding a mining drill that can mine it (holding a pumpjack highlights crude-oil in the base game). 
---@field infinite boolean (default: literal: value: False) If the ore is infinitely minable, or if it will eventually run out of resource. 
---@field infinite_depletion_amount uint32 (default: literal: value: 1) Every time an infinite-type resource "ticks" lower it's lowered by that amount. 
---@field map_grid boolean (default: literal: value: True) Whether the resource should have a grid pattern on the map instead of a solid map color. 
---@field max_effect_alpha float (default: literal: value: 1.0) Maximal alpha value of `stages_effect`. 
---@field min_effect_alpha float (default: literal: value: 0.0) Minimal alpha value of `stages_effect`. 
---@field minimum uint32 (default: literal: value: 0) Must be not 0 when `infinite = true`. 
---@field mining_visualisation_tint Color  Defaults to the resources map color if left unset and map color is set, otherwise defaults to white if left unset. 
---@field normal uint32 (default: literal: value: 1) Must be not 0 when `infinite = true`. 
---@field randomize_visual_position boolean (default: literal: value: True) Whether there should be a slight offset to graphics of the resource. Used to make patches a little less uniform in appearance. 
---@field resource_patch_search_radius uint32 (default: literal: value: 3) When hovering over this resource in the map view: How far to search for other resource patches of this type to display as one (summing amount, white outline). 
---@field stage_counts {'complex_type': 'array', 'value': 'uint32'}  Number of stages the animation has. 
---@field stages AnimationVariations  Entity's graphics, using a graphic sheet, with variation and depletion. At least one stage must be defined.
---
---When using [AnimationVariations::sheet](prototype:AnimationVariations::sheet), `frame_count` is the amount of frames per row in the spritesheet. `variation_count` is the amount of rows in the spritesheet. Each row in the spritesheet is one stage of the animation. 
---@field stages_effect AnimationVariations  An effect that can be overlaid above the normal ore graphics. Used in the base game to make [uranium ore](https://wiki.factorio.com/Uranium_ore) glow. 
---@field tree_removal_max_distance double (default: literal: value: 0) Must be positive when `tree_removal_probability` is set. 
---@field tree_removal_probability double (default: literal: value: 0) Must be greater than or equal to `0`. 
---@field walking_sound Sound  Sound played when the player walks over this resource. 
---@parent EntityPrototype
---
--- typename: resource
--- A mineable/gatherable entity.
ResourceEntityPrototype = {}


---@class (exact) RoboportEquipmentPrototype : EquipmentPrototype
---@field burner BurnerEnergySource  Add this is if the roboport should be fueled directly instead of using power from the equipment grid. 
---@field charge_approach_distance float  Presumably, the distance from the roboport at which robots will wait to charge. 
---@field charging_distance float (default: literal: value: 0.0)  
---@field charging_energy Energy   
---@field charging_offsets {'complex_type': 'array', 'value': 'Vector'}  The offsets from the center of the roboport at which robots will charge. Only used if `charging_station_count` is equal to 0. 
---@field charging_station_count uint32 (default: literal: value: 0) How many charging points this roboport has. If this is 0, the length of the charging_offsets table is used to calculate the charging station count. 
---@field charging_station_count_affected_by_quality boolean (default: literal: value: False)  
---@field charging_station_shift Vector   
---@field charging_threshold_distance float (default: literal: value: 1.0) Distance in tiles. This defines how far away a robot can be from the charging spot and still be charged, however the bot is still required to reach a charging spot in the first place. 
---@field construction_radius float  Can't be negative. 
---@field draw_construction_radius_visualization boolean (default: literal: value: True)  
---@field draw_logistic_radius_visualization boolean (default: literal: value: True) Unused, as roboport equipment does not have a logistic radius that could be drawn. 
---@field power Energy  Mandatory if `burner` is defined.
---
---The size of the buffer of the burner energy source, so effectively the amount of power that the energy source can produce per tick. 
---@field recharging_animation Animation  The animation played at each charging point when a robot is charging there. 
---@field recharging_light LightDefinition  The light emitted when charging a robot. 
---@field robot_limit ItemCountType (default: max uint) How many robots can exist in the network (cumulative). 
---@field robot_vertical_acceleration float (default: literal: value: 0.01)  
---@field robots_shrink_when_entering_and_exiting boolean (default: literal: value: False)  
---@field spawn_and_station_height float  Presumably states the height of the charging stations and thus an additive offset for the charging_offsets. 
---@field spawn_and_station_shadow_height_offset float (default: literal: value: 0)  
---@field spawn_minimum Energy (default: 0.2 * energy_source.buffer_capacity) Minimum amount of energy that needs to available inside the roboport's buffer so that robots can be spawned. 
---@field stationing_offset Vector  The offset from the center of the roboport at which robots will enter and exit. 
---@field stationing_render_layer_swap_height float (default: literal: value: 0.87) When robot ascends or descends to this roboport, at which height is should switch between `"air-object"` and `"object"` [render layer](prototype:RenderLayer). 
---@parent EquipmentPrototype
---
--- typename: roboport-equipment
--- Used by [personal roboport](https://wiki.factorio.com/Personal_roboport).
RoboportEquipmentPrototype = {}


---@class (exact) RoboportPrototype : EntityWithOwnerPrototype
---@field base Sprite   
---@field base_animation Animation  The animation played when the roboport is idle. 
---@field base_patch Sprite   
---@field charge_approach_distance float  The distance (in tiles) from the roboport at which robots will wait to charge. Notably, if the robot is already in range, then it will simply wait at its current position. 
---@field charging_distance float (default: literal: value: 0.0)  
---@field charging_energy Energy  The maximum power provided to each charging station. 
---@field charging_offsets {'complex_type': 'array', 'value': 'Vector'}  The offsets from the center of the roboport at which robots will charge. Only used if `charging_station_count` is equal to 0. 
---@field charging_station_count uint32 (default: literal: value: 0) How many charging points this roboport has. If this is 0, the length of the charging_offsets table is used to calculate the charging station count. 
---@field charging_station_count_affected_by_quality boolean (default: literal: value: False)  
---@field charging_station_shift Vector   
---@field charging_threshold_distance float (default: literal: value: 1.0) Unused. 
---@field circuit_connector CircuitConnectorDefinition   
---@field circuit_wire_max_distance double (default: literal: value: 0) The maximum circuit wire distance for this entity. 
---@field close_door_trigger_effect TriggerEffect   
---@field construction_radius float  Can't be negative. 
---@field default_available_construction_output_signal SignalIDConnector   
---@field default_available_logistic_output_signal SignalIDConnector   
---@field default_roboport_count_output_signal SignalIDConnector   
---@field default_total_construction_output_signal SignalIDConnector   
---@field default_total_logistic_output_signal SignalIDConnector   
---@field door_animation_down Animation   
---@field door_animation_up Animation   
---@field draw_circuit_wires boolean (default: literal: value: True)  
---@field draw_construction_radius_visualization boolean (default: literal: value: True)  
---@field draw_copper_wires boolean (default: literal: value: True)  
---@field draw_logistic_radius_visualization boolean (default: literal: value: True)  
---@field energy_source {'complex_type': 'union', 'options': ['ElectricEnergySource', 'VoidEnergySource'], 'full_format': False}  The roboport's energy source. 
---@field energy_usage Energy  The amount of energy the roboport uses when idle. 
---@field frozen_patch Sprite   
---@field logistics_connection_distance float (default: value of `logistics_radius`) Must be >= `logistics_radius`. 
---@field logistics_radius float  Can't be negative. 
---@field material_slots_count ItemStackIndex  The number of repair pack slots in the roboport. 
---@field max_logistic_slots LogisticFilterIndex   
---@field open_door_trigger_effect TriggerEffect   
---@field radar_range uint32  In chunks. The radius of how many chunks this roboport charts around itself. Defaults to the max of logistic range or construction range rounded up to chunks. 
---@field radar_visualisation_color Color   
---@field recharge_minimum Energy  Minimum charge that the roboport has to have after a blackout (0 charge/buffered energy) to begin working again. Additionally, freshly placed roboports will have their energy buffer filled with `0.25 × recharge_minimum` energy.
---
---Must be larger than or equal to `energy_usage` otherwise during low power the roboport will toggle on and off every tick. 
---@field recharging_animation Animation  The animation played at each charging point when a robot is charging there. 
---@field recharging_light LightDefinition  The light emitted when charging a robot. 
---@field render_recharge_icon boolean (default: literal: value: True) Whether to render the [no charge](prototype:UtilitySprites::recharge_icon) icon if the roboport has less energy than `recharge_minimum` in its internal buffer and is recovering from a blackout. 
---@field request_to_open_door_timeout uint32   
---@field robot_limit ItemCountType (default: max uint) Unused. 
---@field robot_slots_count ItemStackIndex  The number of robot slots in the roboport. 
---@field robot_vertical_acceleration float (default: literal: value: 0.01)  
---@field robots_shrink_when_entering_and_exiting boolean (default: literal: value: False)  
---@field spawn_and_station_height float  Presumably states the height of the charging stations and thus an additive offset for the charging_offsets. 
---@field spawn_and_station_shadow_height_offset float (default: literal: value: 0)  
---@field stationing_offset Vector  The offset from the center of the roboport at which robots will enter and exit. 
---@field stationing_render_layer_swap_height float (default: literal: value: 0.87) When robot ascends or descends to this roboport, at which height is should switch between `"air-object"` and `"object"` [render layer](prototype:RenderLayer). 
---@parent EntityWithOwnerPrototype
---
--- typename: roboport
--- A [roboport](https://wiki.factorio.com/Roboport).
RoboportPrototype = {}


---@class (exact) RocketSiloPrototype : AssemblingMachinePrototype
---@field active_energy_usage Energy  Additional energy used during the following parts of the [launch sequence](runtime:defines.rocket_silo_status): doors_opening, rocket_rising, arms_advance, engine_starting, arms_retract, doors_closing. 
---@field alarm_sound Sound  Played when switching into the [lights_blinking_open](runtime:defines.rocket_silo_status.lights_blinking_open) state. 
---@field alarm_trigger TriggerEffect  Applied when switching into the [lights_blinking_open](runtime:defines.rocket_silo_status.lights_blinking_open) state. 
---@field arm_01_back_animation Animation   
---@field arm_02_right_animation Animation   
---@field arm_03_front_animation Animation   
---@field base_day_sprite Sprite   
---@field base_engine_light LightDefinition   
---@field base_front_frozen Sprite   
---@field base_front_sprite Sprite   
---@field base_frozen Sprite   
---@field base_light LightDefinition   
---@field base_night_sprite Sprite  Drawn instead of `base_day_sprite` during the night, that is when [LuaSurface::darkness](runtime:LuaSurface::darkness) is larger than 0.3. 
---@field can_launch_without_landing_pads boolean (default: literal: value: False)  
---@field cargo_station_parameters CargoStationParameters  Must have exactly one entry in [CargoStationParameters::hatch_definitions](prototype:CargoStationParameters::hatch_definitions). 
---@field clamps_off_sound Sound  Played when switching into the [arms_retract](runtime:defines.rocket_silo_status.arms_retract) state. 
---@field clamps_off_trigger TriggerEffect  Applied when switching into the [arms_retract](runtime:defines.rocket_silo_status.arms_retract) state. 
---@field clamps_on_sound Sound  Played when switching into the [arms_advance](runtime:defines.rocket_silo_status.arms_advance) state. 
---@field clamps_on_trigger TriggerEffect  Applied when switching into the [arms_advance](runtime:defines.rocket_silo_status.arms_advance) state. 
---@field door_back_frozen Sprite   
---@field door_back_open_offset Vector   
---@field door_back_sprite Sprite   
---@field door_front_frozen Sprite   
---@field door_front_open_offset Vector   
---@field door_front_sprite Sprite   
---@field door_opening_speed double  The inverse of the duration in ticks of [doors_opening](runtime:defines.rocket_silo_status.doors_opening) and [closing](runtime:defines.rocket_silo_status.doors_closing). 
---@field doors_sound Sound  Played when switching into the [doors_opening](runtime:defines.rocket_silo_status.doors_opening) and [doors_closing](runtime:defines.rocket_silo_status.doors_closing) states. 
---@field doors_trigger TriggerEffect  Applied when switching into the [doors_opening](runtime:defines.rocket_silo_status.doors_opening) and [doors_closing](runtime:defines.rocket_silo_status.doors_closing) states. 
---@field hole_clipping_box BoundingBox   
---@field hole_frozen Sprite   
---@field hole_light_sprite Sprite   
---@field hole_sprite Sprite   
---@field lamp_energy_usage Energy  May be 0.
---
---Additional energy used during the night, that is when [LuaSurface::darkness](runtime:LuaSurface::darkness) is larger than 0.3. 
---@field launch_to_space_platforms boolean (default: literal: value: False) Enables 'Space Age' functionality for this rocket silo, allowing it to supply space platforms. 
---@field launch_wait_time uint8 (default: literal: value: 120) The time to wait in the [launch_started](runtime:defines.rocket_silo_status.launch_started) state before switching to [engine_starting](runtime:defines.rocket_silo_status.engine_starting). 
---@field light_blinking_speed double  The inverse of the duration in ticks of [lights_blinking_open](runtime:defines.rocket_silo_status.lights_blinking_open) and [lights_blinking_close](runtime:defines.rocket_silo_status.lights_blinking_close). 
---@field logistic_trash_inventory_size ItemStackIndex (default: literal: value: 0)  
---@field quick_alarm_sound Sound  Played when switching from [rocket_flying](runtime:defines.rocket_silo_status.rocket_flying) into the [doors_opened](runtime:defines.rocket_silo_status.doors_opened) state when a quick follow-up rocket is ready. 
---@field raise_rocket_sound Sound  Played when switching into the [rocket_rising](runtime:defines.rocket_silo_status.rocket_rising) state. 
---@field raise_rocket_trigger TriggerEffect  Applied when switching into the [rocket_rising](runtime:defines.rocket_silo_status.rocket_rising) state. 
---@field red_lights_back_sprites Sprite  Drawn from the start of the [lights_blinking_open](runtime:defines.rocket_silo_status.lights_blinking_open) state until the end of the [lights_blinking_close](runtime:defines.rocket_silo_status.lights_blinking_close) state. 
---@field red_lights_front_sprites Sprite  Drawn from the start of the [lights_blinking_open](runtime:defines.rocket_silo_status.lights_blinking_open) state until the end of the [lights_blinking_close](runtime:defines.rocket_silo_status.lights_blinking_close) state. 
---@field render_not_in_network_icon boolean (default: literal: value: True) Whether the "no network" icon should be rendered on this entity if the entity is not within a logistics network. 
---@field rocket_entity EntityID  Name of a [RocketSiloRocketPrototype](prototype:RocketSiloRocketPrototype). 
---@field rocket_glow_overlay_sprite Sprite   
---@field rocket_parts_required uint32  The number of crafts that must complete to produce a rocket. This includes bonus crafts from productivity. Recipe products are ignored. 
---@field rocket_parts_storage_cap uint32 (default: Value of `rocket_parts_required`) Must be at least `rocket_parts_required`. 
---@field rocket_quick_relaunch_start_offset double   
---@field rocket_rising_delay uint8 (default: literal: value: 30) The time to wait in the [doors_opened](runtime:defines.rocket_silo_status.doors_opened) state before switching to [rocket_rising](runtime:defines.rocket_silo_status.rocket_rising). 
---@field rocket_shadow_overlay_sprite Sprite   
---@field satellite_animation Animation   
---@field satellite_shadow_animation Animation   
---@field shadow_sprite Sprite   
---@field silo_fade_out_end_distance double   
---@field silo_fade_out_start_distance double   
---@field times_to_blink uint8  How many times the `red_lights_back_sprites` and `red_lights_front_sprites` should blink during [lights_blinking_open](runtime:defines.rocket_silo_status.lights_blinking_open) and [lights_blinking_close](runtime:defines.rocket_silo_status.lights_blinking_close).
---
---Does not affect the duration of the launch sequence. 
---@field to_be_inserted_to_rocket_inventory_size ItemStackIndex (default: literal: value: 0)  
---@parent AssemblingMachinePrototype
---
--- typename: rocket-silo
--- A [rocket silo](https://wiki.factorio.com/Rocket_silo).
RocketSiloPrototype = {}


---@class (exact) RocketSiloRocketPrototype : EntityPrototype
---@field cargo_attachment_offset Vector   
---@field cargo_pod_entity EntityID  Name of a [CargoPodPrototype](prototype:CargoPodPrototype). 
---@field dying_explosion EntityID   
---@field effects_fade_in_end_distance double   
---@field effects_fade_in_start_distance double   
---@field engine_starting_speed double   
---@field flying_acceleration double   
---@field flying_sound Sound   
---@field flying_speed double   
---@field flying_trigger TriggerEffect   
---@field full_render_layer_switch_distance double   
---@field glow_light LightDefinition   
---@field inventory_size ItemStackIndex   
---@field rising_speed double   
---@field rocket_above_wires_slice_offset_from_center float (default: literal: value: -3)  
---@field rocket_air_object_slice_offset_from_center float (default: literal: value: -6)  
---@field rocket_flame_animation Animation   
---@field rocket_flame_left_animation Animation   
---@field rocket_flame_left_rotation float   
---@field rocket_flame_right_animation Animation   
---@field rocket_flame_right_rotation float   
---@field rocket_fog_mask FogMaskShapeDefinition (default: `{rect={{-30, -30}, {30, rocket_above_wires_slice_offset_from_center}}, falloff=1}`)  
---@field rocket_glare_overlay_sprite Sprite   
---@field rocket_initial_offset Vector   
---@field rocket_launch_offset Vector   
---@field rocket_render_layer_switch_distance double   
---@field rocket_rise_offset Vector   
---@field rocket_shadow_sprite Sprite   
---@field rocket_smoke_bottom1_animation Animation   
---@field rocket_smoke_bottom2_animation Animation   
---@field rocket_smoke_top1_animation Animation   
---@field rocket_smoke_top2_animation Animation   
---@field rocket_smoke_top3_animation Animation   
---@field rocket_sprite Sprite   
---@field rocket_visible_distance_from_center float   
---@field shadow_fade_out_end_ratio double   
---@field shadow_fade_out_start_ratio double   
---@field shadow_slave_entity EntityID   
---@parent EntityPrototype
---
--- typename: rocket-silo-rocket
--- The rocket inside the rocket silo.
RocketSiloRocketPrototype = {}


---@class (exact) RocketSiloRocketShadowPrototype : EntityPrototype
---@parent EntityPrototype
---
--- typename: rocket-silo-rocket-shadow
--- The shadow of the rocket inside the rocket silo.
RocketSiloRocketShadowPrototype = {}


---@class (exact) SegmentPrototype : EntityWithOwnerPrototype
---@field animation RotatedAnimation  The animation to use of the entity. 
---@field backward_overlap uint8 (default: literal: value: 0) The number of segments behind this one that should always be rendered atop this one, giving the illusion that at all orientations, those following segments overlap this current segment.
---
---Must be 0 or greater, and the sum of `forward_overlap` and `backward_overlap` must be less than or equal to 4. 
---@field backward_padding double (default: literal: value: 0) The number of tiles of spacing to add behind this segment. Can be negative. Scales with the segment scale when used in a [SegmentEngineSpecification](prototype:SegmentEngineSpecification). 
---@field dying_sound Sound  The sound to play when the entity dies.
---
---If not specified, [UtilitySounds::segment_dying_sound](prototype:UtilitySounds::segment_dying_sound) is used. 
---@field dying_sound_volume_modifier float (default: literal: value: 1.0)  
---@field forward_overlap uint8 (default: literal: value: 0) The number of segments ahead of this one that should always be rendered atop this one, giving the illusion that at all orientations, those preceding segments overlap this current segment.
---
---Must be 0 or greater, and the sum of `forward_overlap` and `backward_overlap` must be less than or equal to 4. 
---@field forward_padding double (default: literal: value: 0) The number of tiles of spacing to add in front of this segment. Can be negative. Scales with the segment scale when used in a [SegmentEngineSpecification](prototype:SegmentEngineSpecification). 
---@field render_layer RenderLayer (default: literal: value: object) The layer to render the entity in. 
---@field update_effects {'complex_type': 'array', 'value': 'TriggerEffectWithCooldown'}  The effects to trigger every tick. 
---@field update_effects_while_enraged {'complex_type': 'array', 'value': 'TriggerEffectWithCooldown'}  The effects to trigger every tick while enraged, in addition to `update_effects`. 
---@parent EntityWithOwnerPrototype
---
--- typename: segment
--- Entity representing an individual segment in a [SegmentedUnitPrototype](prototype:SegmentedUnitPrototype)
SegmentPrototype = {}


---@class (exact) SegmentedUnitPrototype : SegmentPrototype
---@field acceleration_rate double  The acceleration rate when moving from one state to another. Cannot be negative. 
---@field attack_parameters AttackParameters  Attack parameters for when a segmented unit is attacking something. 
---@field attacking_speed double  The movement speed while attacking, in tiles per tick. Cannot be negative. 
---@field enraged_duration MapTick  The number of ticks to remain enraged after last taking damage. 
---@field enraged_speed double  The movement speed while enraged, in tiles per tick. Cannot be negative. 
---@field hurt_roar Sound  Sound which plays when health ratio drops below any of `hurt_thresholds`. 
---@field hurt_thresholds {'complex_type': 'array', 'value': 'float'}  Only loaded, and mandatory if `hurt_roar` is defined. 
---@field investigating_speed double  The movement speed while investigating, in tiles per tick. Cannot be negative. 
---@field patrolling_speed double  The movement speed while patrolling, in tiles per tick. Cannot be negative. 
---@field patrolling_turn_radius double (default: Value of `turn_radius`) Cannot be negative. 
---@field revenge_attack_parameters AttackParameters  Attack parameters for when a segmented unit is attacking something in retaliation because the target first attacked it. 
---@field roar Sound   
---@field roar_probability float (default: literal: value: 0.00277777785) The default is 1.0f / (6.0f * 60.0f), average pause between roars is 6 seconds. 
---@field segment_engine SegmentEngineSpecification  Specification of the segment engine, which should contain a list of the segments that compose the entity's body. 
---@field territory_radius uint32  The territory radius in chunks. The chunk in which the entity spawned is included. 
---@field ticks_per_scan uint32 (default: literal: value: 120) The number of ticks between territory scans. Greater values means longer time between scans, which means a slower reaction time. Cannot be `0`. 
---@field turn_radius double  Turn radius, in tiles. Cannot be negative. 
---@field turn_smoothing double (default: literal: value: 1) Attempts to smooth out tight turns by limiting how quickly the unit can change turning directions. 0 means no turn smoothing, 1 means no turning whatsoever. Must be between 0 and 1. 
---@field vision_distance double  Vision distance, affects scanning radius for enemies to attack. Must be non-negative. Max 100. 
---@parent SegmentPrototype
---
--- typename: segmented-unit
--- Entity composed of multiple segment entities that trail behind the head.
SegmentedUnitPrototype = {}


---@class (exact) SelectorCombinatorPrototype : CombinatorPrototype
---@field count_symbol_sprites Sprite4Way   
---@field max_symbol_sprites Sprite4Way   
---@field min_symbol_sprites Sprite4Way   
---@field quality_symbol_sprites Sprite4Way   
---@field random_symbol_sprites Sprite4Way   
---@field rocket_capacity_sprites Sprite4Way   
---@field stack_size_sprites Sprite4Way   
---@parent CombinatorPrototype
---
--- typename: selector-combinator
--- 
SelectorCombinatorPrototype = {}


---@class (exact) ShootAchievementPrototype : AchievementPrototype
---@field ammo_type ItemID  This will trigger the achievement, if this ammo is shot. 
---@field amount uint32 (default: literal: value: 1) How much of the ammo needs to be shot. 
---@parent AchievementPrototype
---
--- typename: shoot-achievement
--- This prototype is used for receiving an achievement when the player shoots certain ammo.
ShootAchievementPrototype = {}


---@class (exact) ShortcutPrototype : Prototype
---@field action {'complex_type': 'union', 'options': [{'complex_type': 'literal', 'value': 'toggle-alt-mode'}, {'complex_type': 'literal', 'value': 'undo'}, {'complex_type': 'literal', 'value': 'redo'}, {'complex_type': 'literal', 'value': 'paste'}, {'complex_type': 'literal', 'value': 'import-string'}, {'complex_type': 'literal', 'value': 'toggle-personal-roboport'}, {'complex_type': 'literal', 'value': 'toggle-personal-logistic-requests'}, {'complex_type': 'literal', 'value': 'toggle-equipment-movement-bonus'}, {'complex_type': 'literal', 'value': 'spawn-item'}, {'complex_type': 'literal', 'value': 'lua'}], 'full_format': False}  If this is `"lua"`, [on_lua_shortcut](runtime:on_lua_shortcut) is raised when the shortcut is clicked. 
---@field associated_control_input string (default: literal: value: ) Name of a custom input or vanilla control. This is **only** used to show the keybind in the tooltip of the shortcut. 
---@field icon FileName  Path to the icon file.
---
---Only loaded, and mandatory if `icons` is not defined. 
---@field icon_size SpriteSizeType (default: literal: value: 64) The size of the square icon, in pixels. E.g. `32` for a 32px by 32px icon. Must be larger than `0`.
---
---The base game uses 32px icons for shortcuts.
---
---Only loaded if `icons` is not defined. 
---@field icons {'complex_type': 'array', 'value': 'IconData'}  Can't be an empty array. 
---@field item_to_spawn ItemID  The item to create when clicking on a shortcut with the action set to `"spawn-item"`. The item must have the [spawnable](prototype:ItemPrototypeFlags::spawnable) flag set. 
---@field order Order (default: literal: value: ) Used to order the shortcuts in the [quick panel](https://wiki.factorio.com/Quick_panel), which replaces the shortcut bar when using a controller (game pad). It [is recommended](https://forums.factorio.com/106661) to order modded shortcuts after the vanilla shortcuts. 
---@field small_icon FileName  Path to the icon file. Used in the shortcut selection popup.
---
---Only loaded, and mandatory if `small_icons` is not defined. 
---@field small_icon_size SpriteSizeType (default: literal: value: 64) The size of the small icon, in pixels. E.g. `32` for a 32px by 32px icon. Must be larger than `0`.
---
---The base game uses 24px small icons for shortcuts.
---
---Only loaded if `small_icons` is not defined. 
---@field small_icons {'complex_type': 'array', 'value': 'IconData'}  Can't be an empty array. 
---@field style {'complex_type': 'union', 'options': [{'complex_type': 'literal', 'value': 'default'}, {'complex_type': 'literal', 'value': 'blue'}, {'complex_type': 'literal', 'value': 'red'}, {'complex_type': 'literal', 'value': 'green'}], 'full_format': False} (default: literal: value: default)  
---@field technology_to_unlock TechnologyID  The technology that must be researched before this shortcut can be used. Once a shortcut is unlocked in one save file, it is unlocked for all future save files. 
---@field toggleable boolean (default: literal: value: False) Must be enabled for the Factorio API to be able to set the toggled state on the shortcut button, see [LuaPlayer::set_shortcut_toggled](runtime:LuaPlayer::set_shortcut_toggled). 
---@field unavailable_until_unlocked boolean (default: literal: value: False) If `true`, the shortcut will not be available until its `technology_to_unlock` is researched, even if it was already researched in a different game. 
---@parent Prototype
---
--- typename: shortcut
--- Definition for a shortcut button in the [shortcut bar](https://wiki.factorio.com/Shortcut_bar).
---
---This is **not** a custom keybinding (keyboard shortcut), for that see [CustomInputPrototype](prototype:CustomInputPrototype).
ShortcutPrototype = {}


---@class (exact) SimpleEntityPrototype : EntityWithHealthPrototype
---@field animations AnimationVariations   
---@field count_as_rock_for_filtered_deconstruction boolean (default: literal: value: False) Whether this entity should be treated as a rock for the purpose of deconstruction and for [CarPrototype::immune_to_rock_impacts](prototype:CarPrototype::immune_to_rock_impacts). 
---@field lower_pictures SpriteVariations   
---@field lower_render_layer RenderLayer (default: literal: value: lower-object)  
---@field picture Sprite4Way  Takes priority over `animations`. Only the `north` sprite is used because this entity cannot be rotated. 
---@field pictures SpriteVariations  Takes priority over `picture` and `animations`. 
---@field random_animation_offset boolean (default: literal: value: False)  
---@field random_variation_on_create boolean (default: literal: value: True) Whether a random graphics variation is chosen when placing the entity/creating it via script/creating it via map generation. If this is `false`, the entity will use the first variation instead of a random one. 
---@field render_layer RenderLayer (default: literal: value: object)  
---@field secondary_draw_order int8 (default: literal: value: 0) Used to determine render order for entities with the same `render_layer` in the same position. Entities with a higher `secondary_draw_order` are drawn on top. 
---@field stateless_visualisation_variations {'complex_type': 'array', 'value': {'complex_type': 'union', 'options': ['StatelessVisualisation', {'complex_type': 'array', 'value': 'StatelessVisualisation'}], 'full_format': False}}  Loaded and drawn with all `pictures`, `picture` and `animations`. If graphics variation is larger than number of `lower_pictures` variations this layer is not drawn. 
---@parent EntityWithHealthPrototype
---
--- typename: simple-entity
--- An extremely basic entity with no special functionality. Used for minable rocks. Cannot be rotated.
SimpleEntityPrototype = {}


---@class (exact) SimpleEntityWithOwnerPrototype : EntityWithOwnerPrototype
---@field animations AnimationVariations   
---@field force_visibility ForceCondition (default: literal: value: all) If the entity is not visible to a player, the player cannot select it. 
---@field lower_pictures SpriteVariations  Loaded and drawn with all `pictures`, `picture` and `animations`. If graphics variation is larger than number of `lower_pictures` variations this layer is not drawn. 
---@field lower_render_layer RenderLayer (default: literal: value: lower-object)  
---@field picture Sprite4Way  Takes priority over `animations`. 
---@field pictures SpriteVariations  Takes priority over `picture` and `animations`. 
---@field random_animation_offset boolean (default: literal: value: False)  
---@field random_variation_on_create boolean (default: literal: value: True) Whether a random graphics variation is chosen when placing the entity/creating it via script/creating it via map generation. If this is false, the entity will use the first variation instead of a random one. 
---@field render_layer RenderLayer (default: literal: value: object)  
---@field secondary_draw_order int8 (default: literal: value: 0) Used to determine render order for entities with the same `render_layer` in the same position. Entities with a higher `secondary_draw_order` are drawn on top. 
---@field stateless_visualisation_variations {'complex_type': 'array', 'value': {'complex_type': 'union', 'options': ['StatelessVisualisation', {'complex_type': 'array', 'value': 'StatelessVisualisation'}], 'full_format': False}}   
---@parent EntityWithOwnerPrototype
---
--- typename: simple-entity-with-owner
--- Has a force, but unlike [SimpleEntityWithForcePrototype](prototype:SimpleEntityWithForcePrototype) it is only attacked if the biters get stuck on it (or if [EntityWithOwnerPrototype::is_military_target](prototype:EntityWithOwnerPrototype::is_military_target) set to true to make the two entity types equivalent).
---
---Can be rotated in 4 directions. `picture` can be used to specify different graphics per direction.
SimpleEntityWithOwnerPrototype = {}


---@class (exact) SimpleEntityWithForcePrototype : SimpleEntityWithOwnerPrototype
---@field is_military_target boolean (default: literal: value: True) Whether this prototype should be a high priority target for enemy forces. See [Military units and structures](https://wiki.factorio.com/Military_units_and_structures). 
---@parent SimpleEntityWithOwnerPrototype
---
--- typename: simple-entity-with-force
--- By default, this entity will be a priority target for units/turrets, who will choose to attack it even if it does not block their path. Setting [EntityWithOwnerPrototype::is_military_target](prototype:EntityWithOwnerPrototype::is_military_target) to `false` will turn this off, which then makes this type equivalent to [SimpleEntityWithOwnerPrototype](prototype:SimpleEntityWithOwnerPrototype).
SimpleEntityWithForcePrototype = {}


---@class (exact) SmokePrototype : EntityPrototype
---@field affected_by_wind boolean (default: literal: value: True) Smoke always moves randomly unless `movement_slow_down_factor` is 0. If `affected_by_wind` is true, the smoke will also be moved by wind. 
---@field animation Animation   
---@field collision_box BoundingBox (default: Empty = `{{0, 0}, {0, 0}}`) Must have a collision box size of zero. 
---@field color Color (default: `{r=0.375, g=0.375, b=0.375, a=0.375}`)  
---@field cyclic boolean (default: literal: value: False) If this is false then the smoke expires when the animation has played once. 
---@field duration uint32 (default: literal: value: 0) May not be 0 if `cyclic` is true. If `cyclic` is false then the smoke will be expire when the animation has played once, even if there would still be duration left. 
---@field end_scale double (default: literal: value: 1.0)  
---@field fade_away_duration uint32 (default: literal: value: 0) `fade_in_duration` + `fade_away_duration` must be <= `duration`. 
---@field fade_in_duration uint32 (default: literal: value: 0) `fade_in_duration` + `fade_away_duration` must be <= `duration`. 
---@field glow_animation Animation   
---@field glow_fade_away_duration uint32 (default: The value of `fade_away_duration`)  
---@field movement_slow_down_factor double (default: literal: value: 0.995) Value between 0 and 1, with 0 being no movement. 
---@field render_layer RenderLayer (default: literal: value: smoke)  
---@field show_when_smoke_off boolean (default: literal: value: False)  
---@field spread_duration uint32 (default: literal: value: 0)  
---@field start_scale double (default: literal: value: 1.0)  
---@parent EntityPrototype
---
--- typename: null
--- Abstract entity that has an animation.
SmokePrototype = {}


---@class (exact) SmokeWithTriggerPrototype : SmokePrototype
---@field action Trigger   
---@field action_cooldown uint32 (default: literal: value: 0) 0 means never apply. 
---@field attach_to_target boolean (default: literal: value: False) If true, causes the smoke to move with the target entity if one is specified. 
---@field fade_when_attachment_is_destroyed boolean (default: literal: value: False) If true, the smoke will immediately start fading away when the entity it is attached to is destroyed. If it was never attached to an entity in the first place, then the smoke will fade away immediately after being created. 
---@field particle_count uint8 (default: literal: value: 1)  
---@field particle_distance_scale_factor float (default: literal: value: 0.0)  
---@field particle_duration_variation uint32 (default: literal: value: 0)  
---@field particle_scale_factor Vector   
---@field particle_spread Vector   
---@field spread_duration_variation uint32 (default: literal: value: 0)  
---@field wave_distance Vector   
---@field wave_speed Vector   
---@parent SmokePrototype
---
--- typename: smoke-with-trigger
--- An entity with animation and a trigger.
SmokeWithTriggerPrototype = {}


---@class (exact) SolarPanelEquipmentPrototype : EquipmentPrototype
---@field performance_at_day double (default: literal: value: 1)  
---@field performance_at_night double (default: literal: value: 0)  
---@field power Energy  How much power should be provided. 
---@field solar_coefficient_property SurfacePropertyID (default: literal: value: solar-power) Surface property must have a positive [default value](prototype:SurfacePropertyPrototype::default_value). When [SolarPanelEquipmentPrototype::solar_coefficient_property](prototype:SolarPanelEquipmentPrototype::solar_coefficient_property) is set to point at a different surface property than "solar-power", then [LuaSurface::solar_power_multiplier](runtime:LuaSurface::solar_power_multiplier) and [SpaceLocationPrototype::solar_power_in_space](prototype:SpaceLocationPrototype::solar_power_in_space) will be ignored as the solar panel power output will be only affected by value of this surface property set on the surface using [PlanetPrototype::surface_properties](prototype:PlanetPrototype::surface_properties) or [LuaSurface::set_property](runtime:LuaSurface::set_property).
---
---Due to equipment grid overall description, when solar_coefficient_property is not solar-power, a different locale will be used to show total energy production of solar panels: `description.solar-panel-power-X` where X is the surface property name. 
---@parent EquipmentPrototype
---
--- typename: solar-panel-equipment
--- A [portable solar panel](https://wiki.factorio.com/Portable_solar_panel).
SolarPanelEquipmentPrototype = {}


---@class (exact) SolarPanelPrototype : EntityWithOwnerPrototype
---@field energy_source ElectricEnergySource  Sets how this solar panel connects to the energy network. The most relevant property seems to be the output_priority. 
---@field overlay SpriteVariations  Overlay has to be empty or have same number of variations as `picture`. 
---@field performance_at_day double (default: literal: value: 1)  
---@field performance_at_night double (default: literal: value: 0)  
---@field picture SpriteVariations  The picture displayed for this solar panel. 
---@field production Energy  The maximum amount of power this solar panel can produce. 
---@field solar_coefficient_property SurfacePropertyID (default: literal: value: solar-power) Surface property must have a positive [default value](prototype:SurfacePropertyPrototype::default_value). When [SolarPanelPrototype::solar_coefficient_property](prototype:SolarPanelPrototype::solar_coefficient_property) is set to point at a different surface property than "solar-power", then [LuaSurface::solar_power_multiplier](runtime:LuaSurface::solar_power_multiplier) and [SpaceLocationPrototype::solar_power_in_space](prototype:SpaceLocationPrototype::solar_power_in_space) will be ignored as the solar panel power output will be only affected by value of this surface property set on the surface using [PlanetPrototype::surface_properties](prototype:PlanetPrototype::surface_properties) or [LuaSurface::set_property](runtime:LuaSurface::set_property). 
---@parent EntityWithOwnerPrototype
---
--- typename: solar-panel
--- A [solar panel](https://wiki.factorio.com/Solar_panel).
SolarPanelPrototype = {}


---@class (exact) SoundPrototype 
---@field advanced_volume_control AdvancedVolumeControl   
---@field aggregation AggregationSpecification   
---@field allow_random_repeat boolean (default: literal: value: False)  
---@field audible_distance_modifier double (default: literal: value: 1.0) Modifies how far a sound can be heard. Must be between `0` and `1` inclusive. 
---@field category SoundType (default: literal: value: game-effect)  
---@field filename FileName  Supported sound file formats are `.ogg` (Vorbis and Opus) and `.wav`.
---
---Only loaded, and mandatory if `variations` is not defined. 
---@field game_controller_vibration_data GameControllerVibrationData   
---@field max_speed float (default: literal: value: 1.0) Must be `>= min_speed`.
---
---Only loaded if `variations` is not defined. Only loaded, and mandatory if `min_speed` is defined. 
---@field max_volume float (default: literal: value: 1.0) Only loaded if `variations` is not defined.
---
---Only loaded if `min_volume` is defined.
---
---Must be `>= min_volume`. 
---@field min_speed float (default: literal: value: 1.0) Must be `>= 1 / 64`.
---
---Only loaded if both `variations` and `speed` are not defined. 
---@field min_volume float (default: literal: value: 1.0) Only loaded if `variations` and `volume` are not defined.
---
---Must be `>= 0`. 
---@field modifiers {'complex_type': 'union', 'options': ['SoundModifier', {'complex_type': 'array', 'value': 'SoundModifier'}], 'full_format': False}  Only loaded if `variations` is not defined. 
---@field name string  Name of the sound. Can be used as a [SoundPath](runtime:SoundPath) at runtime. 
---@field preload boolean  Only loaded if `variations` is not defined. 
---@field priority uint8 (default: literal: value: 127) Sounds with higher priority will replace a sound with lower priority if the maximum sounds limit is reached.
---
---0 is the highest priority, 255 is the lowest priority. 
---@field speed float (default: literal: value: 1.0) Speed must be `>= 1 / 64`. This sets both min and max speeds.
---
---Only loaded if `variations` is not defined. 
---@field speed_smoothing_window_size uint32 (default: literal: value: 0)  
---@field type {'complex_type': 'literal', 'value': 'sound'}   
---@field variations {'complex_type': 'union', 'options': ['SoundDefinition', {'complex_type': 'array', 'value': 'SoundDefinition'}], 'full_format': False}   
---@field volume float (default: literal: value: 1.0) Only loaded if `variations` is not defined.
---
---This sets both min and max volumes.
---
---Must be `>= 0`. 
---
---
--- typename: sound
--- Specifies a sound that can be used with [SoundPath](runtime:SoundPath) at runtime.
SoundPrototype = {}


---@class (exact) SpaceConnectionDistanceTraveledAchievementPrototype : AchievementPrototype
---@field distance uint32  How far a platform must travel to gain this achievement. Repeated trips over a shorter distance do not count. 
---@field reversed boolean  The achievement is unidirectional, this property controls the direction (using space connection definition).
---
---When false, a platform must go through [from](prototype:SpaceConnectionPrototype::from) location and travel in [to](prototype:SpaceConnectionPrototype::to) direction. When true, a platform must go through `to` location and travel in `from` direction. 
---@field tracked_connection SpaceConnectionID   
---@parent AchievementPrototype
---
--- typename: space-connection-distance-traveled-achievement
--- 
SpaceConnectionDistanceTraveledAchievementPrototype = {}


---@class (exact) SpaceConnectionPrototype : Prototype
---@field asteroid_spawn_definitions {'complex_type': 'array', 'value': 'SpaceConnectionAsteroidSpawnDefinition'}   
---@field from SpaceLocationID   
---@field icon FileName  Path to the icon file.
---
---Only loaded, and mandatory if `icons` is not defined. 
---@field icon_size SpriteSizeType (default: literal: value: 64) The size of the square icon, in pixels. E.g. `32` for a 32px by 32px icon. Must be larger than `0`.
---
---Only loaded if `icons` is not defined. 
---@field icons {'complex_type': 'array', 'value': 'IconData'}  Can't be an empty array. 
---@field length uint32 (default: literal: value: 600) Length of the space connection in km.
---
---Cannot be 0. 
---@field to SpaceLocationID   
---@parent Prototype
---
--- typename: space-connection
--- 
SpaceConnectionPrototype = {}


---@class (exact) SpacePlatformHubPrototype : EntityWithOwnerPrototype
---@field build_grid_size {'complex_type': 'literal', 'value': 256} (default: literal: value: 256) Has to be 256 to make blueprints snap to (0, 0) most of the time. 
---@field cargo_station_parameters CargoStationParameters   
---@field circuit_connector CircuitConnectorDefinition   
---@field circuit_wire_max_distance double (default: literal: value: 0) The maximum circuit wire distance for this entity. 
---@field default_damage_taken_signal SignalIDConnector   
---@field default_speed_signal SignalIDConnector   
---@field draw_circuit_wires boolean (default: literal: value: True)  
---@field draw_copper_wires boolean (default: literal: value: True)  
---@field dump_container EntityID  Name of a [ContainerPrototype](prototype:ContainerPrototype). 
---@field graphics_set CargoBayConnectableGraphicsSet   
---@field inventory_size ItemStackIndex   
---@field persistent_ambient_sounds PersistentWorldAmbientSoundsDefinition   
---@field platform_repair_speed_modifier float (default: literal: value: 1)  
---@field surface_render_parameters SurfaceRenderParameters   
---@field weight Weight (default: literal: value: 0)  
---@parent EntityWithOwnerPrototype
---
--- typename: space-platform-hub
--- 
SpacePlatformHubPrototype = {}


---@class (exact) SpacePlatformStarterPackPrototype : ItemPrototype
---@field create_electric_network boolean (default: literal: value: False)  
---@field initial_items {'complex_type': 'array', 'value': 'ItemProductPrototype'}  The quality of the items will match the quality of the starter pack. 
---@field surface SurfaceID   
---@field tiles {'complex_type': 'array', 'value': 'SpacePlatformTileDefinition'}   
---@field trigger Trigger   
---@parent ItemPrototype
---
--- typename: space-platform-starter-pack
--- 
SpacePlatformStarterPackPrototype = {}


---@class (exact) SpectatorControllerPrototype 
---@field movement_speed double  Must be >= 0.34375. 
---@field name string  Name of the spectator controller. Base game uses "default". 
---@field type {'complex_type': 'literal', 'value': 'spectator-controller'}   
---
---
--- typename: spectator-controller
--- Properties of the spectator controller.
SpectatorControllerPrototype = {}


---@class (exact) SpeechBubblePrototype : EntityPrototype
---@field fade_in_out_ticks uint32 (default: literal: value: 60)  
---@field style string  Needs a style of the type "speech_bubble_style", defined inside the gui styles. 
---@field wrapper_flow_style string (default: literal: value: flow_style) Needs a style of the type "flow_style", defined inside the gui styles. 
---@field y_offset double (default: literal: value: 0)  
---@parent EntityPrototype
---
--- typename: speech-bubble
--- A speech bubble. It floats in the world and can display text.
SpeechBubblePrototype = {}


---@class (exact) SpiderLegPrototype : EntityWithOwnerPrototype
---@field ankle_height double (default: literal: value: 0) The height of the foot from the ground when at rest. 
---@field base_position_selection_distance double   
---@field graphics_set SpiderLegGraphicsSet   
---@field hip_flexibility double (default: literal: value: 1) The flexibility of hip. Must be between 0 and 1 inclusive. 0 means the hip doesn't flex at all, and 1 means the hip can bend the entire range, from straight up to straight down. Values less than one will dampen the hip flexibility and cause the upper and lower leg parts to stretch and squish more to compensate. Does not affect movement, only graphics. 
---@field initial_movement_speed double   
---@field knee_distance_factor double  The placement of the knee relative to the torso of the spider and the end of the foot when at rest. Used to calculate the shape of the leg and the length of the individual parts. Values between 0 and 1 place the knee between the torso and the leg. Values closer to 0 will place the knee closer to the torso. 
---@field knee_height double  The resting height of the knee from the ground. Used to derive leg part length and size. If set too low, this could cause the knee to invert, bending inwards underneath the spider. 
---@field lower_leg_dying_trigger_effects {'complex_type': 'array', 'value': 'SpiderLegTriggerEffect'}   
---@field minimal_step_size double   
---@field movement_acceleration double   
---@field movement_based_position_selection_distance double   
---@field stretch_force_scalar double (default: literal: value: 0.715) A scalar that controls the amount of influence this leg has over the position of the torso. Must be greater than 0. 
---@field target_position_randomisation_distance double   
---@field upper_leg_dying_trigger_effects {'complex_type': 'array', 'value': 'SpiderLegTriggerEffect'}   
---@field walking_sound_speed_modifier float (default: literal: value: 1)  
---@field walking_sound_volume_modifier float (default: literal: value: 1)  
---@parent EntityWithOwnerPrototype
---
--- typename: spider-leg
--- Used by [SpiderLegSpecification](prototype:SpiderLegSpecification) for [SpiderVehiclePrototype](prototype:SpiderVehiclePrototype), also known as [spidertron](https://wiki.factorio.com/Spidertron).
SpiderLegPrototype = {}


---@class (exact) SpiderUnitPrototype : EntityWithOwnerPrototype
---@field absorptions_to_join_attack {'complex_type': 'dictionary', 'key': 'AirbornePollutantID', 'value': 'float'}   
---@field ai_settings UnitAISettings   
---@field attack_parameters AttackParameters   
---@field distraction_cooldown uint32   
---@field dying_sound Sound   
---@field graphics_set SpiderTorsoGraphicsSet   
---@field height float  The height of the spider affects the shooting height and the drawing of the graphics and lights. 
---@field max_pursue_distance double (default: literal: value: 50)  
---@field min_pursue_time uint32 (default: literal: value: 600)  
---@field radar_range uint32 (default: literal: value: 0) In chunks. The radius of how many chunks this spider unit charts around itself. 
---@field spawning_time_modifier double (default: literal: value: 1)  
---@field spider_engine SpiderEngineSpecification   
---@field torso_bob_speed float (default: literal: value: 1) Cannot be negative. 
---@field torso_rotation_speed float (default: literal: value: 1) The orientation of the torso of the spider affects the shooting direction and the drawing of the graphics and lights. 
---@field vision_distance double  Must be less than or equal to 100. 
---@field warcry Sound  A sound the spider unit makes when it sets out to attack. 
---@parent EntityWithOwnerPrototype
---
--- typename: spider-unit
--- 
SpiderUnitPrototype = {}


---@class (exact) SpiderVehiclePrototype : VehiclePrototype
---@field automatic_weapon_cycling boolean   
---@field chain_shooting_cooldown_modifier float  This is applied whenever the spider shoots (manual and automatic targeting), `automatic_weapon_cycling` is true and the next gun in line (which is then selected) has ammo. When all of the above is the case, the chain_shooting_cooldown_modifier is a multiplier on the remaining shooting cooldown: `cooldown = (remaining_cooldown × chain_shooting_cooldown_modifier)`.
---
---chain_shooting_cooldown_modifier is intended to be in the range of 0 to 1. This means that setting chain_shooting_cooldown_modifier to 0 reduces the remaining shooting cooldown to 0 while a chain_shooting_cooldown_modifier of 1 does not affect the remaining shooting cooldown at all. 
---@field energy_source {'complex_type': 'union', 'options': ['BurnerEnergySource', 'VoidEnergySource'], 'full_format': False}   
---@field graphics_set SpiderVehicleGraphicsSet   
---@field guns {'complex_type': 'array', 'value': 'ItemID'}  The guns this spider vehicle uses. 
---@field height float  The height of the spider affects the shooting height and the drawing of the graphics and lights. 
---@field inventory_size ItemStackIndex   
---@field movement_energy_consumption Energy   
---@field spider_engine SpiderEngineSpecification   
---@field torso_bob_speed float (default: literal: value: 1) Cannot be negative. 
---@field torso_rotation_speed float (default: literal: value: 1) The orientation of the torso of the spider affects the shooting direction and the drawing of the graphics and lights. 
---@field trash_inventory_size ItemStackIndex (default: literal: value: 0) If set to 0 then the spider will not have a Logistics tab. 
---@parent VehiclePrototype
---
--- typename: spider-vehicle
--- A [spidertron](https://wiki.factorio.com/Spidertron).
SpiderVehiclePrototype = {}


---@class (exact) SpidertronRemotePrototype : SelectionToolPrototype
---@field icon_color_indicator_mask FileName  Color mask for the icon. This is used to show the color of the spidertron remote LEDS in the GUI. 
---@field stack_size {'complex_type': 'literal', 'value': 1}  Count of items of the same name that can be stored in one inventory slot. Must be 1 when the `"not-stackable"` flag is set. 
---@parent SelectionToolPrototype
---
--- typename: spidertron-remote
--- The [spidertron remote](https://wiki.factorio.com/Spidertron_remote). This remote can only be used for entities of type [SpiderVehiclePrototype](prototype:SpiderVehiclePrototype).
SpidertronRemotePrototype = {}


---@class (exact) SplitterPrototype : TransportBeltConnectablePrototype
---@field circuit_connector {'complex_type': 'tuple', 'values': ['CircuitConnectorDefinition', 'CircuitConnectorDefinition', 'CircuitConnectorDefinition', 'CircuitConnectorDefinition']}   
---@field circuit_wire_max_distance double (default: literal: value: 0) The maximum circuit wire distance for this entity. 
---@field default_input_left_condition CircuitConditionConnector   
---@field default_input_right_condition CircuitConditionConnector   
---@field default_output_left_condition CircuitConditionConnector   
---@field default_output_right_condition CircuitConditionConnector   
---@field draw_circuit_wires boolean (default: literal: value: True)  
---@field draw_copper_wires boolean (default: literal: value: True)  
---@field frozen_patch Sprite4Way   
---@field related_transport_belt EntityID  The name of the [TransportBeltPrototype](prototype:TransportBeltPrototype) which is used for the sound of the underlying belt. 
---@field structure Animation4Way   
---@field structure_animation_movement_cooldown uint32 (default: literal: value: 10)  
---@field structure_animation_speed_coefficient double (default: literal: value: 1)  
---@field structure_patch Animation4Way  Drawn 1 tile north of `structure` when the splitter is facing east or west. 
---@parent TransportBeltConnectablePrototype
---
--- typename: splitter
--- A [splitter](https://wiki.factorio.com/Splitter).
SplitterPrototype = {}


---@class (exact) SpritePrototype 
---@field allow_forced_downscale boolean (default: literal: value: False) Only loaded if `layers` is not defined.
---
---If `true`, the sprite may be downsampled to half its size on load even when 'Sprite quality' graphics setting is set to 'High'. Whether downsampling happens depends on detected hardware and other graphics settings. 
---@field apply_runtime_tint boolean (default: literal: value: False) Only loaded if `layers` is not defined. 
---@field apply_special_effect boolean (default: literal: value: False) Only loaded if `layers` is not defined. 
---@field blend_mode BlendMode (default: literal: value: normal) Only loaded if `layers` is not defined. 
---@field dice SpriteSizeType  Only loaded if `layers` is not defined.
---
---Number of slices this is sliced into when using the "optimized atlas packing" option. If you are a modder, you can just ignore this property. Example: If this is 4, the sprite will be sliced into a 4x4 grid. 
---@field dice_x SpriteSizeType  Only loaded if `layers` is not defined.
---
---Same as `dice` above, but this specifies only how many slices there are on the x axis. 
---@field dice_y SpriteSizeType  Only loaded if `layers` is not defined.
---
---Same as `dice` above, but this specifies only how many slices there are on the y axis. 
---@field draw_as_glow boolean (default: literal: value: False) Only loaded if `layers` is not defined.
---
---Only one of `draw_as_shadow`, `draw_as_glow` and `draw_as_light` can be true. This takes precedence over `draw_as_light`.
---
---Draws first as a normal sprite, then again as a light layer. See [https://forums.factorio.com/91682](https://forums.factorio.com/91682). 
---@field draw_as_light boolean (default: literal: value: False) Only loaded if `layers` is not defined.
---
---Only one of `draw_as_shadow`, `draw_as_glow` and `draw_as_light` can be true. 
---@field draw_as_shadow boolean (default: literal: value: False) Only loaded if `layers` is not defined.
---
---Only one of `draw_as_shadow`, `draw_as_glow` and `draw_as_light` can be true. This takes precedence over `draw_as_glow` and `draw_as_light`. 
---@field filename FileName  Only loaded, and mandatory if `layers` is not defined.
---
---The path to the sprite file to use. 
---@field flags SpriteFlags  Only loaded if `layers` is not defined. 
---@field generate_sdf boolean (default: literal: value: False) Only loaded if `layers` is not defined.
---
---Unused. 
---@field height SpriteSizeType  Only loaded if `layers` is not defined. Mandatory if `size` is not defined.
---
---Height of the picture in pixels, from 0-4096. 
---@field invert_colors boolean (default: literal: value: False) Only loaded if `layers` is not defined. 
---@field layers {'complex_type': 'array', 'value': 'Sprite'}  If this property is present, all Sprite definitions have to be placed as entries in the array, and they will all be loaded from there. `layers` may not be an empty table. Each definition in the array may also have the `layers` property.
---
---If this property is present, all other properties besides `name` and `type` are ignored. 
---@field load_in_minimal_mode boolean (default: literal: value: False) Only loaded if `layers` is not defined.
---
---Minimal mode is entered when mod loading fails. You are in it when you see the gray box after (part of) the loading screen that tells you a mod error. Modders can ignore this property. 
---@field mipmap_count uint8 (default: literal: value: 0) Only loaded if `layers` is not defined.
---
---Only loaded if this is an icon, that is it has the flag `"group=icon"` or `"group=gui"`. 
---@field name string  Name of the sprite. Can be used as a [SpritePath](runtime:SpritePath) at runtime. 
---@field position {'complex_type': 'tuple', 'values': ['SpriteSizeType', 'SpriteSizeType']}  Only loaded if `layers` is not defined.
---
---Loaded only when `x` and `y` are both `0`. The first member of the tuple is `x` and the second is `y`. 
---@field premul_alpha boolean (default: literal: value: True) Only loaded if `layers` is not defined.
---
---Whether alpha should be pre-multiplied. 
---@field priority SpritePriority (default: literal: value: medium) Only loaded if `layers` is not defined. 
---@field rotate_shift boolean (default: literal: value: False) Only loaded if `layers` is not defined. 
---@field scale double (default: literal: value: 1) Only loaded if `layers` is not defined.
---
---Values other than `1` specify the scale of the sprite on default zoom. A scale of `2` means that the picture will be two times bigger on screen (and thus more pixelated). 
---@field shift Vector (default: `{0, 0}`) Only loaded if `layers` is not defined.
---
---The shift in tiles. `util.by_pixel()` can be used to divide the shift by 32 which is the usual pixel height/width of 1 tile in normal resolution. Note that 32 pixel tile height/width is not enforced anywhere - any other tile height or width is also possible. 
---@field size {'complex_type': 'union', 'options': ['SpriteSizeType', {'complex_type': 'tuple', 'values': ['SpriteSizeType', 'SpriteSizeType']}], 'full_format': False}  Only loaded if `layers` is not defined.
---
---The width and height of the sprite. If this is a tuple, the first member of the tuple is the width and the second is the height. Otherwise the size is both width and height. Width and height may only be in the range of 0-4096. 
---@field surface SpriteUsageSurfaceHint (default: literal: value: any) Only loaded if `layers` is not defined.
---
---Provides hint to sprite atlas system, so it can try to put sprites that are intended to be used at the same locations to the same sprite atlas. 
---@field tint Color (default: `{r=1, g=1, b=1, a=1}`) Only loaded if `layers` is not defined. 
---@field tint_as_overlay boolean (default: literal: value: False) Only loaded if `layers` is not defined. 
---@field type {'complex_type': 'literal', 'value': 'sprite'}   
---@field usage SpriteUsageHint (default: literal: value: any) Only loaded if `layers` is not defined.
---
---Provides hint to sprite atlas system, so it can pack sprites that are related to each other to the same sprite atlas. 
---@field width SpriteSizeType  Only loaded if `layers` is not defined. Mandatory if `size` is not defined.
---
---Width of the picture in pixels, from 0-4096. 
---@field x SpriteSizeType (default: literal: value: 0) Only loaded if `layers` is not defined.
---
---Horizontal position of the sprite in the source file in pixels. 
---@field y SpriteSizeType (default: literal: value: 0) Only loaded if `layers` is not defined.
---
---Vertical position of the sprite in the source file in pixels. 
---
---
--- typename: sprite
--- Specifies an image that can be used with [SpritePath](runtime:SpritePath) at runtime.
SpritePrototype = {}


---@class (exact) StickerPrototype : EntityPrototype
---@field animation Animation   
---@field damage_interval uint32 (default: literal: value: 1) Interval between application of `damage_per_tick`, in ticks. 
---@field damage_per_tick DamageParameters  Applied every `damage_interval` ticks, so may not necessarily be "per tick". 
---@field duration_in_ticks uint32  Must be > 0. 
---@field fire_spread_cooldown uint8 (default: literal: value: 30)  
---@field fire_spread_radius float (default: literal: value: 1)  
---@field force_visibility ForceCondition (default: literal: value: all)  
---@field ground_target boolean (default: literal: value: False) If true, causes the target entity to become "grounded", disabling flight. This only applies to Character entities wearing mech armor. 
---@field hidden {'complex_type': 'literal', 'value': True}  The `hidden` property of stickers is hardcoded to `true`. 
---@field hidden_in_factoriopedia {'complex_type': 'literal', 'value': True}  The `hidden_in_factoriopedia` property of stickers is hardcoded to `true`. 
---@field render_layer RenderLayer (default: literal: value: object)  
---@field selection_box_type CursorBoxType (default: literal: value: entity) Using this property marks the sticker as a "selection sticker", meaning that the selection box will be rendered around the entity when the sticker is on it. 
---@field single_particle boolean (default: literal: value: False)  
---@field spread_fire_entity EntityID  If this is given, this sticker is considered a "fire sticker" for some functions, such as [BaseAttackParameters::fire_penalty](prototype:BaseAttackParameters::fire_penalty) and [EntityPrototypeFlags::not-flammable](prototype:EntityPrototypeFlags::not_flammable). 
---@field stickers_per_square_meter float (default: literal: value: 15)  
---@field target_movement_max float (default: literal: value: -1) The maximum movement speed for the target.
---
---Negative values are ignored. 
---@field target_movement_max_from float (default: Value of `target_movement_speed`) The maximum movement speed for the target when the sticker is attached. It linearly changes over time to reach `target_movement_max_to`.
---
---Negative values are ignored. 
---@field target_movement_max_to float (default: Value of `target_movement_speed`) The maximum movement speed for the target when the sticker expires. It linearly changes over time starting from `target_movement_max_from`.
---
---Negative values are ignored. 
---@field target_movement_modifier float (default: literal: value: 1) Less than 1 to reduce movement speed, more than 1 to increase it. 
---@field target_movement_modifier_from float (default: Value of `target_movement_modifier`) The modifier value when the sticker is attached. It linearly changes over time to reach `target_movement_modifier_to`. 
---@field target_movement_modifier_to float (default: Value of `target_movement_modifier`) The modifier value when the sticker expires. It linearly changes over time starting from `target_movement_modifier_from`. 
---@field update_effects {'complex_type': 'array', 'value': 'TriggerEffectWithCooldown'}  Effects (with cooldowns) to trigger every tick. 
---@field use_damage_substitute boolean (default: literal: value: True)  
---@field vehicle_friction_modifier float (default: literal: value: 1)  
---@field vehicle_friction_modifier_from float (default: Value of `vehicle_friction_modifier`) Works similarly to `target_movement_modifier_from`. 
---@field vehicle_friction_modifier_to float (default: Value of `vehicle_friction_modifier`) Works similarly to `target_movement_modifier_to`. 
---@field vehicle_speed_max float (default: literal: value: -1) The maximum movement speed for vehicles.
---
---Negative values are ignored. 
---@field vehicle_speed_max_from float (default: Value of `vehicle_speed_max`) The maximum movement speed for vehicles when the sticker is attached. It linearly changes over time to reach `vehicle_speed_max_to`.
---
---Negative values are ignored. 
---@field vehicle_speed_max_to float (default: Value of `vehicle_speed_max`) The maximum movement speed for vehicles when the sticker expires. It linearly changes over time starting from `vehicle_speed_max_from`.
---
---Negative values are ignored. 
---@field vehicle_speed_modifier float (default: literal: value: 1) Less than 1 to reduce vehicle speed, more than 1 to increase it. 
---@field vehicle_speed_modifier_from float (default: Value of `vehicle_speed_modifier`) Works similarly to `target_movement_modifier_from`. 
---@field vehicle_speed_modifier_to float (default: Value of `vehicle_speed_modifier`) Works similarly to `target_movement_modifier_to`. 
---@parent EntityPrototype
---
--- typename: sticker
--- Entity that sticks to another entity, and damages/slows it. Stickers can only be attached to [UnitPrototype](prototype:UnitPrototype), [CharacterPrototype](prototype:CharacterPrototype), [CarPrototype](prototype:CarPrototype) and [SpiderVehiclePrototype](prototype:SpiderVehiclePrototype).
StickerPrototype = {}


---@class (exact) StorageTankPrototype : EntityWithOwnerPrototype
---@field circuit_connector {'complex_type': 'tuple', 'values': ['CircuitConnectorDefinition', 'CircuitConnectorDefinition', 'CircuitConnectorDefinition', 'CircuitConnectorDefinition']}   
---@field circuit_wire_max_distance double (default: literal: value: 0)  
---@field draw_circuit_wires boolean (default: literal: value: True)  
---@field draw_copper_wires boolean (default: literal: value: True)  
---@field flow_length_in_ticks uint32  Must be positive.
---
---Used for determining the x position inside the `flow_sprite` when drawing the storage tank. Does not affect gameplay.
---
---The x position of the sprite will be `((game.tick % flow_length_in_ticks) ÷ flow_length_in_ticks) × (flow_sprite.width - 32)`. This means, that over `flow_length_in_ticks` ticks, the part of the `flow_sprite` that is drawn in-game is incrementally moved from most-left to most-right inside the actual sprite, that part always has a width of 32px. After `flow_length_in_ticks`, the part of the `flow_sprite` that is drawn will start from the left again. 
---@field fluid_box FluidBox   
---@field pictures StorageTankPictures   
---@field show_fluid_icon boolean (default: literal: value: True) Whether the "alt-mode icon" should be drawn at all. 
---@field two_direction_only boolean (default: literal: value: False)  
---@field window_bounding_box BoundingBox  The location of the window showing the contents. Note that for `window_background` the width and height are determined by the sprite and window_bounding_box only determines the drawing location. For `fluid_background` the width is determined by the sprite and the height and drawing location are determined by window_bounding_box. 
---@parent EntityWithOwnerPrototype
---
--- typename: storage-tank
--- A [storage tank](https://wiki.factorio.com/Storage_tank).
StorageTankPrototype = {}


---@class (exact) SurfacePropertyPrototype : Prototype
---@field default_value double   
---@field is_time boolean (default: literal: value: False)  
---@field localised_unit_key string (default: surface-property-unit.[prototype name]) The locale key of the unit of the property. In-game, the locale is provided the `__1__` parameter, which is the value of the property. 
---@parent Prototype
---
--- typename: surface-property
--- 
SurfacePropertyPrototype = {}


---@class (exact) SurfacePrototype : Prototype
---@field icon FileName  Path to the icon file.
---
---Only loaded, and mandatory if `icons` is not defined. 
---@field icon_size SpriteSizeType (default: literal: value: 64) The size of the square icon, in pixels. E.g. `32` for a 32px by 32px icon. Must be larger than `0`.
---
---Only loaded if `icons` is not defined. 
---@field icons {'complex_type': 'array', 'value': 'IconData'}  Can't be an empty array. 
---@field surface_properties {'complex_type': 'dictionary', 'key': 'SurfacePropertyID', 'value': 'double'}   
---@parent Prototype
---
--- typename: surface
--- 
SurfacePrototype = {}


---@class (exact) TechnologyPrototype : Prototype
---@field allows_productivity boolean (default: literal: value: True)  
---@field effects {'complex_type': 'array', 'value': 'Modifier'}  List of effects of the technology (applied when the technology is researched). 
---@field enabled boolean (default: literal: value: True)  
---@field essential boolean (default: literal: value: False) Whether the technology should be shown in the technology tree GUI when "Show only essential technologies" is enabled. 
---@field hidden boolean (default: literal: value: False) Hides the technology from the tech screen. 
---@field icon FileName  Path to the icon file.
---
---Only loaded, and mandatory if `icons` is not defined. 
---@field icon_size SpriteSizeType (default: literal: value: 64) The size of the square icon, in pixels. E.g. `32` for a 32px by 32px icon. Must be larger than `0`.
---
---The base game uses 256px icons for technologies.
---
---Only loaded if `icons` is not defined. 
---@field icons {'complex_type': 'array', 'value': 'IconData'}  Can't be an empty array. 
---@field ignore_tech_cost_multiplier boolean (default: literal: value: False) Controls whether the technology cost ignores the tech cost multiplier set in the [DifficultySettings](runtime:DifficultySettings). E.g. `4` for the default expensive difficulty. 
---@field max_level {'complex_type': 'union', 'options': ['uint32', {'complex_type': 'literal', 'value': 'infinite'}], 'full_format': False}  `"infinite"` for infinite technologies, otherwise `uint32`.
---
---Defaults to the same level as the technology, which is `0` for non-upgrades, and the level of the upgrade for upgrades. 
---@field name string  If this name ends with `-<number>`, that number is ignored for localization purposes. E.g. if the name is `technology-3`, the game looks for the `technology-name.technology` localization. The technology tree will also show the number on the technology icon. 
---@field prerequisites {'complex_type': 'array', 'value': 'TechnologyID'}  List of technologies needed to be researched before this one can be researched. 
---@field research_trigger TechnologyTrigger  Mandatory if `unit` is not defined. 
---@field show_levels_info boolean  Can be used to enable or disable showing levels info in technology slot. 
---@field unit TechnologyUnit  Determines the cost in items and time of the technology.
---
---Mandatory if `research_trigger` is not defined. 
---@field upgrade boolean (default: literal: value: False) When set to true, and the technology contains several levels, only the relevant one is displayed in the technology screen. 
---@field visible_when_disabled boolean (default: literal: value: False) Controls whether the technology is shown in the tech GUI when it is not `enabled`. 
---@parent Prototype
---
--- typename: technology
--- A [technology](https://wiki.factorio.com/Technologies).
TechnologyPrototype = {}


---@class (exact) TemporaryContainerPrototype : ContainerPrototype
---@field alert_after_time uint32 (default: literal: value: 0)  
---@field destroy_on_empty boolean (default: literal: value: True)  
---@field time_to_live uint32 (default: literal: value: 0)  
---@parent ContainerPrototype
---
--- typename: temporary-container
--- 
TemporaryContainerPrototype = {}


---@class (exact) ThrusterPrototype : EntityWithOwnerPrototype
---@field fuel_fluid_box FluidBox  If a [filter](prototype:FluidBox::filter) is set for this fluidbox it determines what the thruster considers the first fuel. 
---@field graphics_set ThrusterGraphicsSet   
---@field max_performance ThrusterPerformancePoint  `max_performance.fluid_volume` must not be smaller than `min_performance.fluid_volume`. 
---@field min_performance ThrusterPerformancePoint   
---@field oxidizer_fluid_box FluidBox  If a [filter](prototype:FluidBox::filter) is set for this fluidbox it determines what the thruster considers the second fuel. 
---@field plumes PlumesSpecification   
---@parent EntityWithOwnerPrototype
---
--- typename: thruster
--- Consumes two fluids as fuel to produce thrust for a space platform.
ThrusterPrototype = {}


---@class (exact) TileEffectDefinition 
---@field name string  Name of the tile-effect. 
---@field puddle PuddleTileEffectParameters  Only loaded, and mandatory if `shader` is `"puddle"`. 
---@field shader {'complex_type': 'union', 'options': [{'complex_type': 'literal', 'value': 'water'}, {'complex_type': 'literal', 'value': 'space'}, {'complex_type': 'literal', 'value': 'puddle'}], 'full_format': False}   
---@field space SpaceTileEffectParameters  Only loaded, and mandatory if `shader` is `"space"`. 
---@field type {'complex_type': 'literal', 'value': 'tile-effect'}   
---@field water WaterTileEffectParameters  Only loaded, and mandatory if `shader` is `"water"`. 
---
---
--- typename: tile-effect
--- Used to define the parameters for tile shaders.
TileEffectDefinition = {}


---@class (exact) TileGhostPrototype : EntityPrototype
---@parent EntityPrototype
---
--- typename: tile-ghost
--- The entity used for tile ghosts.
TileGhostPrototype = {}


---@class (exact) TilePrototype : Prototype
---@field absorptions_per_second {'complex_type': 'dictionary', 'key': 'AirbornePollutantID', 'value': 'double'}   
---@field allowed_neighbors {'complex_type': 'array', 'value': 'TileID'} (default: All tiles) Array of tile names that are allowed next to this one. 
---@field allows_being_covered boolean (default: literal: value: True)  
---@field ambient_sounds {'complex_type': 'union', 'options': ['WorldAmbientSoundDefinition', {'complex_type': 'array', 'value': 'WorldAmbientSoundDefinition'}], 'full_format': False}   
---@field ambient_sounds_group TileID   
---@field autoplace AutoplaceSpecification   
---@field bound_decoratives {'complex_type': 'union', 'options': ['DecorativeID', {'complex_type': 'array', 'value': 'DecorativeID'}], 'full_format': False}   
---@field build_animations Animation4Way  The build animation used when this tile is built on a space platform. 
---@field build_animations_background Animation4Way   
---@field build_sound {'complex_type': 'union', 'options': ['Sound', 'TileBuildSound'], 'full_format': False}  If this is loaded as one Sound, it is loaded as the "small" build sound. 
---@field built_animation_frame uint32  When the build_animations frame reaches this point the tile is built.
---
---Mandatory if `build_animations` is defined. 
---@field can_be_part_of_blueprint boolean (default: literal: value: True)  
---@field check_collision_with_entities boolean (default: literal: value: True) If set to true, the game will check for collisions with entities before building or mining the tile. If entities are in the way it is not possible to mine/build the tile. 
---@field collision_mask CollisionMaskConnector   
---@field decorative_removal_probability float (default: literal: value: 0.0)  
---@field default_cover_tile TileID   
---@field default_destroyed_dropped_item_trigger Trigger  The effect/trigger that runs when an item is destroyed by being dropped on this tile.
---
---If the item defines [its own trigger](prototype:ItemPrototype::destroyed_by_dropping_trigger) it will override this.
---
---If this is defined, `destroys_dropped_items` must be `true`. 
---@field destroys_dropped_items boolean (default: literal: value: False) If items dropped on this tile are destroyed. 
---@field driving_sound InterruptibleSound   
---@field dying_explosion {'complex_type': 'union', 'options': ['ExplosionDefinition', {'complex_type': 'array', 'value': 'ExplosionDefinition'}], 'full_format': False}  Triggers when a foundation tile is destroyed by an asteroid. 
---@field effect TileEffectDefinitionID   
---@field effect_color Color (default: `{r=1, g=1, b=1, a=1} (white)`)  
---@field effect_color_secondary Color  Used by the [pollution](https://wiki.factorio.com/Pollution) shader. 
---@field effect_is_opaque boolean (default: true if `effect_color` alpha equals 1)  
---@field fluid FluidID   
---@field frozen_variant TileID   
---@field icon FileName  Path to the icon file. If this and `icons` is not set, the `material_background` in `variants` is used as the icon.
---
---Only loaded if `icons` is not defined. 
---@field icon_size SpriteSizeType (default: literal: value: 64) The size of the square icon, in pixels. E.g. `32` for a 32px by 32px icon. Must be larger than `0`.
---
---Only loaded if `icons` is not defined. 
---@field icons {'complex_type': 'array', 'value': 'IconData'}  Can't be an empty array. If this and `icon` is not set, the `material_background` in `variants` is used as the icon. 
---@field is_foundation boolean (default: literal: value: False)  
---@field landing_steps_sound Sound   
---@field layer uint8  Specifies transition drawing priority. 
---@field layer_group TileRenderLayer (default: literal: value: ground-natural)  
---@field lowland_fog boolean (default: literal: value: False) For surfaces that use [fog effect](prototype:SurfaceRenderParameters::fog) of type `gleba`, this property determines whether given tile should contribute to fog intensity on a chunk or not. 
---@field map_color Color   
---@field max_health float (default: literal: value: 0) Must be equal to or greater than 0. 
---@field minable MinableProperties  If you want the tile to not be mineable, don't specify the minable property. Only non-mineable tiles become hidden tiles when placing mineable tiles on top of them. 
---@field mined_sound Sound   
---@field needs_correction boolean (default: literal: value: False) Whether the tile needs tile correction logic applied when it's generated in the world, to prevent graphical artifacts. The tile correction logic disallows 1-wide stripes of the tile, see [Friday Facts #346](https://factorio.com/blog/post/fff-346). 
---@field next_direction TileID   
---@field particle_tints TileBasedParticleTints   
---@field placeable_by {'complex_type': 'union', 'options': ['ItemToPlace', {'complex_type': 'array', 'value': 'ItemToPlace'}], 'full_format': False}   
---@field scorch_mark_color Color   
---@field searchable boolean (default: literal: value: False)  
---@field sprite_usage_surface SpriteUsageSurfaceHint (default: literal: value: any)  
---@field thawed_variant TileID   
---@field tint Color (default: `{r=1, g=1, b=1, a=1} (white)`)  
---@field transition_merges_with_tile TileID   
---@field transition_overlay_layer_offset int8 (default: literal: value: 0)  
---@field transitions {'complex_type': 'array', 'value': 'TileTransitionsToTiles'}  Extra transitions. 
---@field transitions_between_transitions {'complex_type': 'array', 'value': 'TileTransitionsBetweenTransitions'}   
---@field trigger_effect TriggerEffect  Called by [InvokeTileEffectTriggerEffectItem](prototype:InvokeTileEffectTriggerEffectItem). 
---@field variants TileTransitionsVariants  Graphics for this tile. 
---@field vehicle_friction_modifier double (default: literal: value: 1)  
---@field walking_sound Sound   
---@field walking_speed_modifier double (default: literal: value: 1)  
---@field weight Weight (default: literal: value: 0)  
---@parent Prototype
---
--- typename: tile
--- A [tile](https://wiki.factorio.com/Tile).
TilePrototype = {}


---@class (exact) TipsAndTricksItem : PrototypeBase
---@field category string (default: the `name` of this prototype) Name of a [TipsAndTricksItemCategory](prototype:TipsAndTricksItemCategory), used for the sorting of this tips and tricks entry. Tips and trick entries are sorted first by category and then by their `order` within that category. 
---@field dependencies {'complex_type': 'array', 'value': 'string'} (default: none) An array of names of other tips and tricks items. This tips and tricks entry is only shown to the player once they have marked all dependencies as read. 
---@field icon FileName  Path to the icon file.
---
---Only loaded if `icons` is not defined. 
---@field icon_size SpriteSizeType (default: literal: value: 64) The size of the square icon, in pixels. E.g. `32` for a 32px by 32px icon. Must be larger than `0`.
---
---Only loaded if `icons` is not defined. 
---@field icons {'complex_type': 'array', 'value': 'IconData'}  Can't be an empty array. 
---@field image FileName (default: literal: value: )  
---@field indent uint8 (default: literal: value: 0) The tips and tricks entry is indented by `indent`×6 spaces. 
---@field is_title boolean (default: literal: value: False) Whether the tip title on the left in the tips and tricks GUI should use the "title_tip_item" style (semi bold font). 
---@field order Order (default: Value of `name`) Used to order prototypes in inventory, recipes and GUIs. May not exceed a length of 200 characters. 
---@field player_input_method_filter PlayerInputMethodFilter (default: literal: value: all)  
---@field simulation SimulationDefinition   
---@field skip_trigger TipTrigger  Condition for never showing the tip notification to the player. 
---@field starting_status TipStatus (default: literal: value: locked)  
---@field tag string (default: literal: value: ) String to add in front of the tips and trick entries name. Can be anything, the base game tends to use [rich text](https://wiki.factorio.com/Rich_text) tags for items, e.g. `[item=wooden-chest]` here. 
---@field trigger TipTrigger  Condition for when the tip notification should be shown to the player. 
---@field tutorial string (default: literal: value: ) Name of a [TutorialDefinition](prototype:TutorialDefinition). 
---@parent PrototypeBase
---
--- typename: tips-and-tricks-item
--- A tips and tricks entry.
TipsAndTricksItem = {}


---@class (exact) TipsAndTricksItemCategory 
---@field name string   
---@field order Order  Tips and trick categories are sorted by `order`, and then the tips and tips entries are sorted by their own order within those categories. 
---@field type {'complex_type': 'literal', 'value': 'tips-and-tricks-item-category'}   
---
---
--- typename: tips-and-tricks-item-category
--- A [TipsAndTricksItem](prototype:TipsAndTricksItem) category, used for sorting of tips and tricks entries: Tips and trick entries are sorted first by category and then by their order within that category.
TipsAndTricksItemCategory = {}


---@class (exact) TrainPathAchievementPrototype : AchievementPrototype
---@field minimum_distance double  The achievement will trigger if a train path is longer than this. 
---@parent AchievementPrototype
---
--- typename: train-path-achievement
--- This prototype is used for receiving an achievement when the player has a specified train path length.
TrainPathAchievementPrototype = {}


---@class (exact) TrainStopPrototype : EntityWithOwnerPrototype
---@field animation_ticks_per_frame uint32   
---@field animations Animation4Way   
---@field build_grid_size {'complex_type': 'literal', 'value': 2} (default: literal: value: 2) Has to be 2 for 2x2 grid. 
---@field chart_name boolean (default: literal: value: True)  
---@field circuit_connector {'complex_type': 'tuple', 'values': ['CircuitConnectorDefinition', 'CircuitConnectorDefinition', 'CircuitConnectorDefinition', 'CircuitConnectorDefinition']}   
---@field circuit_wire_max_distance double (default: literal: value: 0)  
---@field color Color   
---@field default_priority_signal SignalIDConnector   
---@field default_train_stopped_signal SignalIDConnector   
---@field default_trains_count_signal SignalIDConnector   
---@field default_trains_limit_signal SignalIDConnector   
---@field draw_circuit_wires boolean (default: literal: value: True)  
---@field draw_copper_wires boolean (default: literal: value: True)  
---@field drawing_boxes TrainStopDrawingBoxes   
---@field light1 TrainStopLight   
---@field light2 TrainStopLight   
---@field rail_overlay_animations Animation4Way   
---@field top_animations Animation4Way   
---@parent EntityWithOwnerPrototype
---
--- typename: train-stop
--- A [train stop](https://wiki.factorio.com/Train_stop).
TrainStopPrototype = {}


---@class (exact) TransportBeltPrototype : TransportBeltConnectablePrototype
---@field belt_animation_set TransportBeltAnimationSetWithCorners   
---@field circuit_connector {'complex_type': 'array', 'value': 'CircuitConnectorDefinition'}  Set of 7 [circuit connector definitions](prototype:CircuitConnectorDefinition) in order: X, H, V, SE, SW, NE and NW. 
---@field circuit_wire_max_distance double (default: literal: value: 0) The maximum circuit wire distance for this entity. 
---@field connector_frame_sprites TransportBeltConnectorFrame   
---@field draw_circuit_wires boolean (default: literal: value: True)  
---@field draw_copper_wires boolean (default: literal: value: True)  
---@field related_underground_belt EntityID  The name of the [UndergroundBeltPrototype](prototype:UndergroundBeltPrototype) which is used in quick-replace fashion when the smart belt dragging behavior is triggered. 
---@parent TransportBeltConnectablePrototype
---
--- typename: transport-belt
--- A [transport belt](https://wiki.factorio.com/Transport_belt).
TransportBeltPrototype = {}


---@class (exact) TriggerTargetType 
---@field name string   
---@field type {'complex_type': 'literal', 'value': 'trigger-target-type'}   
---
---
--- typename: trigger-target-type
--- The base game always internally defines a "common" trigger target type. See [Design discussion: Trigger target type](https://forums.factorio.com/71657).
TriggerTargetType = {}


---@class (exact) TrivialSmokePrototype : Prototype
---@field affected_by_wind boolean (default: literal: value: True) Smoke always moves randomly unless `movement_slow_down_factor` is 0. If `affected_by_wind` is true, the smoke will also be moved by wind. 
---@field animation Animation   
---@field color Color (default: `{r=0.375, g=0.375, b=0.375, a=0.375}`)  
---@field cyclic boolean (default: literal: value: False)  
---@field duration uint32  Can't be 0 - the smoke will never render. 
---@field end_scale float (default: literal: value: 1.0)  
---@field fade_away_duration uint32 (default: literal: value: 0) `fade_in_duration` + `fade_away_duration` must be <= `duration`. 
---@field fade_in_duration uint32 (default: literal: value: 0) `fade_in_duration` + `fade_away_duration` must be <= `duration`. 
---@field glow_animation Animation   
---@field glow_fade_away_duration uint32 (default: Value of `fade_away_duration`)  
---@field movement_slow_down_factor double (default: literal: value: 0.995) Value between 0 and 1, with 1 being no slowdown and 0 being no movement. 
---@field render_layer RenderLayer (default: literal: value: smoke)  
---@field show_when_smoke_off boolean (default: literal: value: False)  
---@field spread_duration uint32 (default: literal: value: 0)  
---@field start_scale float (default: literal: value: 1.0)  
---@parent Prototype
---
--- typename: trivial-smoke
--- Smoke, but it's not an entity for optimization purposes.
TrivialSmokePrototype = {}


---@class (exact) TutorialDefinition : PrototypeBase
---@field order Order (default: Value of `name`) Used to order prototypes in inventory, recipes and GUIs. May not exceed a length of 200 characters. 
---@field scenario string  Name of the folder for this tutorial scenario in the [`tutorials` folder](runtime:mod-structure). 
---@parent PrototypeBase
---
--- typename: tutorial
--- The definition of the tutorial to be used in the tips and tricks, see [TipsAndTricksItem](prototype:TipsAndTricksItem). The actual tutorial scripting code is defined in the tutorial scenario. The scenario must be placed in the `tutorials` folder in the mod.
TutorialDefinition = {}


---@class (exact) UndergroundBeltPrototype : TransportBeltConnectablePrototype
---@field max_distance uint8   
---@field max_distance_tint Color   
---@field max_distance_underground_remove_belts_sprite Sprite   
---@field structure UndergroundBeltStructure   
---@field underground_collision_mask CollisionMaskConnector (default: no masks)  
---@field underground_remove_belts_sprite Sprite   
---@field underground_sprite Sprite   
---@parent TransportBeltConnectablePrototype
---
--- typename: underground-belt
--- An [underground belt](https://wiki.factorio.com/Underground_belt).
UndergroundBeltPrototype = {}


---@class (exact) UnitPrototype : EntityWithOwnerPrototype
---@field absorptions_to_join_attack {'complex_type': 'dictionary', 'key': 'AirbornePollutantID', 'value': 'float'}   
---@field affected_by_tiles boolean (default: literal: value: False)  
---@field ai_settings UnitAISettings   
---@field allow_run_time_change_of_is_military_target {'complex_type': 'literal', 'value': False} (default: literal: value: False) If this is true, this entities `is_military_target property` can be changed runtime (on the entity, not on the prototype itself). 
---@field alternative_attacking_frame_sequence UnitAlternativeFrameSequence   
---@field attack_parameters AttackParameters  Requires animation in attack_parameters. Requires ammo_type in attack_parameters. 
---@field can_open_gates boolean (default: literal: value: False)  
---@field distance_per_frame float  How fast the `run_animation` frames are advanced. The animations are advanced animation_speed frames per `distance_per_frame` that the unit moves.
---
---`frames_advanced = (distance_moved ÷ distance_per_frame) * animation_speed` 
---@field distraction_cooldown uint32   
---@field dying_sound Sound  The sound file to play when entity dies. 
---@field has_belt_immunity boolean (default: literal: value: False) If the unit is immune to movement by belts. 
---@field is_military_target {'complex_type': 'literal', 'value': True} (default: literal: value: True) Whether this prototype should be a high priority target for enemy forces. See [Military units and structures](https://wiki.factorio.com/Military_units_and_structures). 
---@field light LightDefinition   
---@field max_pursue_distance double (default: literal: value: 50)  
---@field min_pursue_time uint32 (default: literal: value: 600) In ticks. 
---@field move_while_shooting boolean (default: literal: value: False)  
---@field movement_speed float  Movement speed of the unit in the world, in tiles per tick. Must be equal to or greater than 0. 
---@field radar_range uint32 (default: literal: value: 0) In chunks. The radius of how many chunks this unit charts around itself. 
---@field render_layer RenderLayer (default: literal: value: object)  
---@field rotation_speed float (default: literal: value: 0.025)  
---@field run_animation RotatedAnimation   
---@field running_sound_animation_positions {'complex_type': 'array', 'value': 'float'}  Only loaded if `walking_sound` is defined. 
---@field spawning_time_modifier double (default: literal: value: 1)  
---@field vision_distance double  Max is 100.
---
---Note: Setting to 50 or above can lead to undocumented behavior of individual units creating groups on their own when attacking or being attacked. 
---@field walking_sound Sound   
---@field warcry Sound  A sound the unit makes when it sets out to attack. 
---@parent EntityWithOwnerPrototype
---
--- typename: unit
--- Entity that moves around and attacks players, for example [biters and spitters](https://wiki.factorio.com/Enemies#Creatures).
UnitPrototype = {}


---@class (exact) UpgradeItemPrototype : SelectionToolPrototype
---@field alt_select SelectionModeData  The [SelectionModeData::mode](prototype:SelectionModeData::mode) is hardcoded to `"cancel-upgrade"`.
---
---The filters are parsed, but then ignored and forced to be empty. 
---@field always_include_tiles boolean (default: literal: value: False) This property is hardcoded to `false`. 
---@field draw_label_for_cursor_render boolean (default: literal: value: True) If the item will draw its label when held in the cursor in place of the item count. 
---@field select SelectionModeData  The [SelectionModeData::mode](prototype:SelectionModeData::mode) is hardcoded to `"upgrade"`.
---
---The filters are parsed, but then ignored and forced to be empty. 
---@field stack_size {'complex_type': 'literal', 'value': 1}  Count of items of the same name that can be stored in one inventory slot. Must be 1 when the `"not-stackable"` flag is set. 
---@parent SelectionToolPrototype
---
--- typename: upgrade-item
--- An [upgrade planner](https://wiki.factorio.com/Upgrade_planner).
---
---For an entity to be allowed as an upgrade source, it must be minable, may not have "not-upgradable" flag set and may not be [hidden](prototype:PrototypeBase::hidden). Additionally, the source entity's mining result must not be an item product that is [hidden](prototype:ItemPrototype::hidden). Mining results with no item products are allowed.
---
---For an entity to be allowed as an upgrade target, it must have least 1 item that builds it that isn't hidden.
---
---For two entities to be upgrades of each other, the two entities must have the same [fast replaceable group](prototype:EntityPrototype::fast_replaceable_group), the same [collision box](prototype:EntityPrototype::collision_box) and the same [collision mask](prototype:EntityPrototype::collision_mask). Additionally, [underground belts](prototype:UndergroundBeltPrototype) cannot be upgraded to [transport belts](prototype:TransportBeltPrototype) and vice versa.
---
---For an entity to be automatically upgraded to another entity without configuring the upgrade planner, the [next upgrade](prototype:EntityPrototype::next_upgrade) of the upgrade source entity must be set.
UpgradeItemPrototype = {}


---@class (exact) UseEntityInEnergyProductionAchievementPrototype : AchievementPrototype
---@field consumed_condition ItemIDFilter  This item need to be consumed before gaining the achievement. 
---@field entity EntityID  This entity is needed to produce energy, for the player to complete the achievement. 
---@field produced_condition ItemIDFilter  This item needs to be produced before gaining the achievement. 
---@field required_to_build EntityID  This item need to be built before gaining the achievement. 
---@parent AchievementPrototype
---
--- typename: use-entity-in-energy-production-achievement
--- This prototype is used for receiving an achievement when the player produces energy by entity.
UseEntityInEnergyProductionAchievementPrototype = {}


---@class (exact) UseItemAchievementPrototype : AchievementPrototype
---@field amount uint32 (default: literal: value: 1) How many capsules need to be used. 
---@field limit_quality QualityID   
---@field limited_to_one_game boolean (default: literal: value: False) If this is false, the player carries over their statistics from this achievement through all their saves. 
---@field to_use ItemID  This will trigger the achievement, if this capsule is used. 
---@parent AchievementPrototype
---
--- typename: use-item-achievement
--- This prototype is used for receiving an achievement when the player uses a capsule.
UseItemAchievementPrototype = {}


---@class (exact) UtilityConstants : PrototypeBase
---@field agricultural_range_visualization_color Color   
---@field artillery_range_visualization_color Color   
---@field asteroid_collector_blockage_update_tile_distance uint32   
---@field asteroid_collector_max_nurbs_control_point_separation double   
---@field asteroid_collector_navmesh_refresh_tick_interval uint32   
---@field asteroid_collector_static_head_swing_segment_count uint32   
---@field asteroid_collector_static_head_swing_strength_scale float   
---@field asteroid_fading_range float   
---@field asteroid_position_offset_to_speed_coefficient double   
---@field asteroid_spawning_offset SimpleBoundingBox   
---@field asteroid_spawning_with_random_orientation_max_speed double   
---@field blueprint_big_slots_per_row uint8  Will be clamped to the range [2, 100]. 
---@field blueprint_small_slots_per_row uint8  Will be clamped to the range [2, 100]. 
---@field bonus_gui_ordering BonusGuiOrdering  The base game uses more entries here that are applied via the ammo-category.lua file. 
---@field building_buildable_tint Color   
---@field building_buildable_too_far_tint Color   
---@field building_collision_mask CollisionMaskConnector   
---@field building_ignorable_tint Color   
---@field building_no_tint Color   
---@field building_not_buildable_tint Color   
---@field capsule_range_visualization_color Color   
---@field capture_water_mask_at_layer uint8  Layer within `ground-natural` [tile render layer](prototype:TileRenderLayer) group, before which terrain lightmap alpha channel is copied into water mask. Decals, which need to be masked by water should have their [DecorativePrototype::tile_layer](prototype:DecorativePrototype::tile_layer) set to only slightly larger value than `capture_water_mask_at_layer`, to avoid risk of undefined behavior caused by rendering tiles into layers between `capture_water_mask_at_layer` and decal's `tile_layer`. 
---@field chart ChartUtilityConstants  Chart means map and minimap. 
---@field chart_search_highlight Color   
---@field checkerboard_black Color   
---@field checkerboard_white Color   
---@field clear_cursor_volume_modifier float   
---@field clipboard_history_size uint32   
---@field color_filters {'complex_type': 'array', 'value': 'ColorFilterData'}   
---@field construction_robots_use_busy_robots_queue boolean   
---@field count_button_size int32   
---@field crafting_queue_slots_per_row uint8  Will be clamped to the range [1, 100]. 
---@field daytime_color_lookup DaytimeColorLookupTable   
---@field deconstruct_mark_tint Color   
---@field default_alert_icon_scale float   
---@field default_alert_icon_scale_by_type {'complex_type': 'dictionary', 'key': 'string', 'value': 'float'}   
---@field default_alert_icon_shift_by_type {'complex_type': 'dictionary', 'key': 'string', 'value': 'Vector'}   
---@field default_collision_masks {'complex_type': 'dictionary', 'key': 'string', 'value': 'CollisionMaskConnector'}  The strings can be entity types or custom strings. 
---@field default_enemy_force_color Color   
---@field default_item_weight Weight   
---@field default_other_force_color Color   
---@field default_pipeline_extent double  The default value of [FluidBox::max_pipeline_extent](prototype:FluidBox::max_pipeline_extent). 
---@field default_planet_procession_set ProcessionSet  Must contain arrival and departure with [procession_style](prototype:ProcessionPrototype::procession_style) containing 0. 
---@field default_platform_procession_set ProcessionSet  Must contain arrival and departure with [procession_style](prototype:ProcessionPrototype::procession_style) containing 0. 
---@field default_player_force_color Color   
---@field default_scorch_mark_color Color   
---@field default_trigger_target_mask_by_type {'complex_type': 'dictionary', 'key': 'string', 'value': 'TriggerTargetMask'}  The strings are entity types. 
---@field disabled_recipe_slot_background_tint Color   
---@field disabled_recipe_slot_tint Color   
---@field drop_item_radius float   
---@field dynamic_recipe_overload_factor double   
---@field ejected_item_direction_variation double  Silently clamped to be between 0 and 0.99. 
---@field ejected_item_friction double  Silently clamped to be between 0 and 1. 
---@field ejected_item_lifetime MapTick  Silently clamped to be between 1 tick and 5 minutes (`5 * 60 * 60` ticks). 
---@field ejected_item_speed double  Silently clamped to be between 0 and 1/60. 
---@field enabled_recipe_slot_tint Color   
---@field enemies_in_simulation_volume_modifier float   
---@field entity_button_background_color Color   
---@field entity_renderer_search_box_limits EntityRendererSearchBoxLimits   
---@field environment_sounds_transition_fade_in_ticks uint32   
---@field equipment_default_background_border_color Color   
---@field equipment_default_background_color Color   
---@field equipment_default_grabbed_background_color Color   
---@field explosions_in_simulation_volume_modifier float   
---@field factoriopedia_recycling_recipe_categories {'complex_type': 'array', 'value': 'RecipeCategoryID'}   
---@field feedback_screenshot_file_name string   
---@field feedback_screenshot_subfolder_name string   
---@field filter_outline_color Color   
---@field flying_text_ttl uint32  Must be >= 1. 
---@field forced_enabled_recipe_slot_background_tint Color   
---@field freezing_temperature double   
---@field frozen_color_lookup ColorLookupTable   
---@field ghost_layer CollisionLayerID   
---@field ghost_shader_tint GhostTintSet   
---@field ghost_shaderless_tint GhostTintSet   
---@field ghost_shimmer_settings GhostShimmerConfig   
---@field gui_remark_color Color   
---@field gui_search_match_background_color Color   
---@field gui_search_match_foreground_color Color   
---@field huge_platform_animation_sound_area float   
---@field icon_shadow_color Color   
---@field icon_shadow_inset float   
---@field icon_shadow_radius float   
---@field icon_shadow_sharpness float   
---@field inserter_hand_stack_items_per_sprite ItemCountType  Must be >= 1. 
---@field inserter_hand_stack_max_sprites ItemCountType  Must be >= 1. 
---@field inventory_width uint8  Will be clamped to the range [1, 100]. 
---@field item_ammo_magazine_left_bar_color Color   
---@field item_default_random_tint_strength Color   
---@field item_health_bar_colors {'complex_type': 'array', 'value': 'ItemHealthColorData'}  There must be one array item with a threshold of `0`. 
---@field item_outline_color Color   
---@field item_outline_inset float   
---@field item_outline_radius float   
---@field item_outline_sharpness float   
---@field item_tool_durability_bar_color Color   
---@field landing_area_clear_zone_radius float  Radius of area where cargo pods won't land. 
---@field landing_area_max_radius float  Max radius where cargo pods will land. 
---@field landing_squash_immunity MapTick   
---@field large_area_size float   
---@field large_blueprint_area_size float   
---@field light_renderer_search_distance_limit uint8  Can be set to anything from range 0 to 255, but larger values will be clamped to 160. Setting it to larger values can have performance impact (growing geometrically). 
---@field lightning_attractor_collection_range_color Color   
---@field lightning_attractor_protection_range_color Color   
---@field logistic_gui_selected_network_highlight_tint Color   
---@field logistic_gui_unselected_network_highlight_tint Color   
---@field logistic_robots_use_busy_robots_queue boolean   
---@field logistic_slots_per_row uint8  Will be clamped to the range [2, 100]. 
---@field low_energy_robot_estimate_multiplier double   
---@field main_menu_background_image_location FileName   
---@field main_menu_background_vignette_intensity float   
---@field main_menu_background_vignette_sharpness float   
---@field main_menu_simulations {'complex_type': 'dictionary', 'key': 'string', 'value': 'SimulationDefinition'}  The strings represent the names of the simulations. 
---@field manual_rail_building_reach_modifier double   
---@field map_editor MapEditorConstants   
---@field max_belt_stack_size uint8  Must be >= 1. 
---@field max_fluid_flow FluidAmount   
---@field max_logistic_filter_count LogisticFilterIndex   
---@field max_terrain_building_size uint8   
---@field maximum_quality_jump uint8  Cap for how many steps of quality the output of something (miner/crafter) may be higher than the input (resource/ingredients). Must be >= 1. 
---@field maximum_recipe_overload_multiplier uint32   
---@field medium_area_size float   
---@field medium_blueprint_area_size float   
---@field merge_bonus_gui_production_bonuses boolean  If not set, defaults to 'true' when modded and 'false' when vanilla. 
---@field minimap_slot_clicked_tint Color   
---@field minimap_slot_hovered_tint Color   
---@field minimum_recipe_overload_multiplier uint32   
---@field missing_preview_sprite_location FileName   
---@field module_inventory_width uint8  Will be clamped to the range [1, 100]. 
---@field moving_sound_count_reduction_rate float  Silently clamped to be between 0 and 1. 
---@field player_colors {'complex_type': 'array', 'value': 'PlayerColorData'}  The table with `name = "default"` must exist and be the first member of the array. 
---@field probability_product_count_tint Color   
---@field quality_selector_dropdown_threshold uint8   
---@field rail_planner_count_button_color Color   
---@field rail_segment_colors {'complex_type': 'array', 'value': 'Color'}   
---@field recipe_step_limit uint32   
---@field remote_view_LPF_max_cutoff_frequency float   
---@field remote_view_LPF_min_cutoff_frequency float   
---@field rocket_lift_weight Weight   
---@field script_command_console_chat_color Color   
---@field select_group_row_count uint8  Will be clamped to the range [1, 100]. 
---@field select_slot_row_count uint8  Will be clamped to the range [1, 100]. 
---@field selected_chart_search_highlight Color   
---@field server_command_console_chat_color Color   
---@field show_chunk_components_collision_mask CollisionMaskConnector   
---@field small_area_size float   
---@field small_blueprint_area_size float   
---@field space_LPF_max_cutoff_frequency float   
---@field space_LPF_min_cutoff_frequency float   
---@field space_platform_acceleration_expression MathExpression  Variables: speed, thrust, weight, width, height 
---@field space_platform_asteroid_chunk_trajectory_updates_per_tick uint32  How many asteroid chunks should be processed per tick, see [space_platform_max_relative_speed_deviation_for_asteroid_chunks_update](prototype:UtilityConstants::space_platform_max_relative_speed_deviation_for_asteroid_chunks_update). 
---@field space_platform_dump_cooldown uint32  Determines how fast space platforms will send items in drop slots to the surface. Each item type has its own cooldown. 
---@field space_platform_manual_dump_cooldown uint32  Delay after manual transfer until space platform sends items in drop slots to the surface. Overrides remaining space_platform_dump_cooldown in this instance. 
---@field space_platform_max_relative_speed_deviation_for_asteroid_chunks_update float  Space platform remembers relative speed range which asteroids use while it moves. When the range is larger than the specified deviation, the platform will start updating cached trajectories of all asteroid chunks over multiple ticks. 
---@field space_platform_max_size SimpleBoundingBox   
---@field space_platform_relative_speed_factor double   
---@field space_platform_starfield_movement_vector Vector   
---@field spawner_evolution_factor_health_modifier float   
---@field starmap_orbit_clicked_color Color   
---@field starmap_orbit_default_color Color   
---@field starmap_orbit_disabled_color Color   
---@field starmap_orbit_hovered_color Color   
---@field time_to_show_full_health_bar MapTick  The number of ticks to show a segmented unit's health bar after fully regenerating. 
---@field tooltip_monitor_edge_border int32  Must be >= 1. 
---@field train_inactivity_wait_condition_default uint32   
---@field train_on_elevated_rail_shadow_shift_multiplier Vector   
---@field train_path_finding TrainPathFinderConstants   
---@field train_pushed_by_player_ignores_friction boolean   
---@field train_pushed_by_player_max_acceleration double   
---@field train_pushed_by_player_max_speed double   
---@field train_temporary_stop_wait_time uint32   
---@field train_time_wait_condition_default uint32   
---@field train_visualization TrainVisualizationConstants   
---@field trash_inventory_width uint8  Will be clamped to the range [1, 100]. 
---@field tree_leaf_distortion_distortion_far Vector   
---@field tree_leaf_distortion_distortion_near Vector   
---@field tree_leaf_distortion_speed_far Vector   
---@field tree_leaf_distortion_speed_near Vector   
---@field tree_leaf_distortion_strength_far Vector   
---@field tree_leaf_distortion_strength_near Vector   
---@field tree_shadow_roughness float   
---@field tree_shadow_speed float   
---@field turret_range_visualization_color Color   
---@field underground_belt_max_distance_tint Color   
---@field underground_pipe_max_distance_tint Color   
---@field unit_group_max_pursue_distance double   
---@field unit_group_pathfind_resolution int8   
---@field walking_sound_count_reduction_rate float  Silently clamped to be between 0 and 1. 
---@field water_collision_mask CollisionMaskConnector   
---@field weapons_in_simulation_volume_modifier float   
---@field zero_count_value_tint Color   
---@field zoom_to_world_can_use_nightvision boolean   
---@field zoom_to_world_daytime_color_lookup DaytimeColorLookupTable   
---@field zoom_to_world_effect_strength float   
---@parent PrototypeBase
---
--- typename: utility-constants
--- Constants used by the game that are not specific to certain prototypes. See [utility-constants.lua](https://github.com/wube/factorio-data/blob/master/core/prototypes/utility-constants.lua) for the values used by the base game.
UtilityConstants = {}


---@class (exact) UtilitySounds : PrototypeBase
---@field achievement_unlocked Sound   
---@field alert_destroyed Sound   
---@field armor_insert Sound   
---@field armor_remove Sound   
---@field axe_fighting Sound   
---@field axe_mining_ore Sound   
---@field axe_mining_stone Sound   
---@field build_animated_huge Sound   
---@field build_animated_large Sound   
---@field build_animated_medium Sound   
---@field build_animated_small Sound   
---@field build_blueprint_huge Sound   
---@field build_blueprint_large Sound   
---@field build_blueprint_medium Sound   
---@field build_blueprint_small Sound   
---@field build_ghost_upgrade Sound   
---@field build_ghost_upgrade_cancel Sound   
---@field build_huge Sound   
---@field build_large Sound   
---@field build_medium Sound   
---@field build_small Sound   
---@field cannot_build Sound   
---@field clear_cursor Sound   
---@field confirm Sound   
---@field console_message Sound   
---@field crafting_finished Sound   
---@field deconstruct_huge Sound   
---@field deconstruct_large Sound   
---@field deconstruct_medium Sound   
---@field deconstruct_robot Sound   
---@field deconstruct_small Sound   
---@field default_driving_sound InterruptibleSound   
---@field default_landing_steps Sound   
---@field default_manual_repair Sound   
---@field drop_item Sound   
---@field entity_settings_copied Sound   
---@field entity_settings_pasted Sound   
---@field game_lost Sound   
---@field game_won Sound   
---@field gui_click Sound   
---@field inventory_click Sound   
---@field inventory_move Sound   
---@field item_deleted Sound   
---@field item_spawned Sound   
---@field list_box_click Sound   
---@field metal_walking_sound Sound   
---@field mining_wood Sound   
---@field new_objective Sound   
---@field paste_activated Sound   
---@field picked_up_item Sound   
---@field rail_plan_start Sound   
---@field research_completed Sound   
---@field rotated_huge Sound   
---@field rotated_large Sound   
---@field rotated_medium Sound   
---@field rotated_small Sound   
---@field scenario_message Sound   
---@field segment_dying_sound Sound  Only present when the Space Age mod is loaded. 
---@field smart_pipette Sound   
---@field switch_gun Sound   
---@field tutorial_notice Sound   
---@field undo Sound   
---@field wire_connect_pole Sound   
---@field wire_disconnect Sound   
---@field wire_pickup Sound   
---@parent PrototypeBase
---
--- typename: utility-sounds
--- Sounds used by the game that are not specific to certain prototypes.
UtilitySounds = {}


---@class (exact) UtilitySprites : PrototypeBase
---@field achievement_label Sprite   
---@field achievement_label_completed Sprite   
---@field achievement_label_failed Sprite   
---@field achievement_warning Sprite   
---@field add Sprite   
---@field add_white Sprite   
---@field alert_arrow Sprite   
---@field ammo_damage_modifier_constant Sprite   
---@field ammo_damage_modifier_icon Sprite   
---@field ammo_icon Sprite   
---@field and_or Sprite   
---@field any_quality Sprite   
---@field area_icon Sprite   
---@field arrow_button Animation   
---@field artillery_range_modifier_constant Sprite   
---@field artillery_range_modifier_icon Sprite   
---@field asteroid_chunk_editor_icon Sprite   
---@field asteroid_collector_path_blocked_icon Sprite   
---@field backward_arrow Sprite   
---@field backward_arrow_black Sprite   
---@field bar_gray_pip Sprite   
---@field battery Sprite   
---@field beacon_distribution_modifier_constant Sprite   
---@field beacon_distribution_modifier_icon Sprite   
---@field belt_stack_size_bonus_modifier_constant Sprite   
---@field belt_stack_size_bonus_modifier_icon Sprite   
---@field bookmark Sprite   
---@field brush_circle_shape Sprite   
---@field brush_icon Sprite   
---@field brush_square_shape Sprite   
---@field buildability_collision Sprite   
---@field buildability_collision_elevated Sprite   
---@field buildability_elevated_collision_bottom Sprite   
---@field buildability_elevated_collision_line Sprite   
---@field buildability_elevated_collision_top Sprite   
---@field bulk_inserter_capacity_bonus_modifier_constant Sprite   
---@field bulk_inserter_capacity_bonus_modifier_icon Sprite   
---@field cable_editor_icon Sprite   
---@field cargo_bay_not_connected_icon Sprite   
---@field cargo_landing_pad_count_modifier_constant Sprite   
---@field cargo_landing_pad_count_modifier_icon Sprite   
---@field center Sprite   
---@field change_recipe Sprite   
---@field change_recipe_productivity_modifier_constant Sprite   
---@field change_recipe_productivity_modifier_icon Sprite   
---@field character_additional_mining_categories_modifier_constant Sprite   
---@field character_additional_mining_categories_modifier_icon Sprite   
---@field character_build_distance_modifier_constant Sprite   
---@field character_build_distance_modifier_icon Sprite   
---@field character_crafting_speed_modifier_constant Sprite   
---@field character_crafting_speed_modifier_icon Sprite   
---@field character_health_bonus_modifier_constant Sprite   
---@field character_health_bonus_modifier_icon Sprite   
---@field character_inventory_slots_bonus_modifier_constant Sprite   
---@field character_inventory_slots_bonus_modifier_icon Sprite   
---@field character_item_drop_distance_modifier_constant Sprite   
---@field character_item_drop_distance_modifier_icon Sprite   
---@field character_item_pickup_distance_modifier_constant Sprite   
---@field character_item_pickup_distance_modifier_icon Sprite   
---@field character_logistic_requests_modifier_constant Sprite   
---@field character_logistic_requests_modifier_icon Sprite   
---@field character_logistic_trash_slots_modifier_constant Sprite   
---@field character_logistic_trash_slots_modifier_icon Sprite   
---@field character_loot_pickup_distance_modifier_constant Sprite   
---@field character_loot_pickup_distance_modifier_icon Sprite   
---@field character_mining_speed_modifier_constant Sprite   
---@field character_mining_speed_modifier_icon Sprite   
---@field character_reach_distance_modifier_constant Sprite   
---@field character_reach_distance_modifier_icon Sprite   
---@field character_resource_reach_distance_modifier_constant Sprite   
---@field character_resource_reach_distance_modifier_icon Sprite   
---@field character_running_speed_modifier_constant Sprite   
---@field character_running_speed_modifier_icon Sprite   
---@field check_mark Sprite   
---@field check_mark_dark_green Sprite   
---@field check_mark_green Sprite   
---@field check_mark_white Sprite   
---@field circuit_network_panel Sprite   
---@field cliff_deconstruction_enabled_modifier_constant Sprite   
---@field cliff_deconstruction_enabled_modifier_icon Sprite   
---@field cliff_editor_icon Sprite   
---@field clock Sprite   
---@field clone Sprite   
---@field clone_editor_icon Sprite   
---@field close Sprite   
---@field close_black Sprite   
---@field close_fat Sprite   
---@field close_map_preview Sprite   
---@field clouds Animation   
---@field collapse Sprite   
---@field collapse_dark Sprite   
---@field color_effect Sprite   
---@field color_picker Sprite   
---@field confirm_slot Sprite   
---@field construction_radius_visualization Sprite   
---@field controller_joycon_a Sprite   
---@field controller_joycon_b Sprite   
---@field controller_joycon_back Sprite   
---@field controller_joycon_black_a Sprite   
---@field controller_joycon_black_b Sprite   
---@field controller_joycon_black_back Sprite   
---@field controller_joycon_black_dpdown Sprite   
---@field controller_joycon_black_dpleft Sprite   
---@field controller_joycon_black_dpright Sprite   
---@field controller_joycon_black_dpup Sprite   
---@field controller_joycon_black_left_stick Sprite   
---@field controller_joycon_black_leftshoulder Sprite   
---@field controller_joycon_black_leftstick Sprite   
---@field controller_joycon_black_lefttrigger Sprite   
---@field controller_joycon_black_paddle1 Sprite   
---@field controller_joycon_black_paddle2 Sprite   
---@field controller_joycon_black_paddle3 Sprite   
---@field controller_joycon_black_paddle4 Sprite   
---@field controller_joycon_black_right_stick Sprite   
---@field controller_joycon_black_rightshoulder Sprite   
---@field controller_joycon_black_rightstick Sprite   
---@field controller_joycon_black_righttrigger Sprite   
---@field controller_joycon_black_start Sprite   
---@field controller_joycon_black_x Sprite   
---@field controller_joycon_black_y Sprite   
---@field controller_joycon_dpdown Sprite   
---@field controller_joycon_dpleft Sprite   
---@field controller_joycon_dpright Sprite   
---@field controller_joycon_dpup Sprite   
---@field controller_joycon_left_stick Sprite   
---@field controller_joycon_leftshoulder Sprite   
---@field controller_joycon_leftstick Sprite   
---@field controller_joycon_lefttrigger Sprite   
---@field controller_joycon_paddle1 Sprite   
---@field controller_joycon_paddle2 Sprite   
---@field controller_joycon_paddle3 Sprite   
---@field controller_joycon_paddle4 Sprite   
---@field controller_joycon_right_stick Sprite   
---@field controller_joycon_rightshoulder Sprite   
---@field controller_joycon_rightstick Sprite   
---@field controller_joycon_righttrigger Sprite   
---@field controller_joycon_start Sprite   
---@field controller_joycon_x Sprite   
---@field controller_joycon_y Sprite   
---@field controller_ps_a Sprite   
---@field controller_ps_b Sprite   
---@field controller_ps_back Sprite   
---@field controller_ps_black_a Sprite   
---@field controller_ps_black_b Sprite   
---@field controller_ps_black_back Sprite   
---@field controller_ps_black_dpdown Sprite   
---@field controller_ps_black_dpleft Sprite   
---@field controller_ps_black_dpright Sprite   
---@field controller_ps_black_dpup Sprite   
---@field controller_ps_black_left_stick Sprite   
---@field controller_ps_black_leftshoulder Sprite   
---@field controller_ps_black_leftstick Sprite   
---@field controller_ps_black_lefttrigger Sprite   
---@field controller_ps_black_right_stick Sprite   
---@field controller_ps_black_rightshoulder Sprite   
---@field controller_ps_black_rightstick Sprite   
---@field controller_ps_black_righttrigger Sprite   
---@field controller_ps_black_start Sprite   
---@field controller_ps_black_x Sprite   
---@field controller_ps_black_y Sprite   
---@field controller_ps_dpdown Sprite   
---@field controller_ps_dpleft Sprite   
---@field controller_ps_dpright Sprite   
---@field controller_ps_dpup Sprite   
---@field controller_ps_left_stick Sprite   
---@field controller_ps_leftshoulder Sprite   
---@field controller_ps_leftstick Sprite   
---@field controller_ps_lefttrigger Sprite   
---@field controller_ps_right_stick Sprite   
---@field controller_ps_rightshoulder Sprite   
---@field controller_ps_rightstick Sprite   
---@field controller_ps_righttrigger Sprite   
---@field controller_ps_start Sprite   
---@field controller_ps_x Sprite   
---@field controller_ps_y Sprite   
---@field controller_steamdeck_a Sprite   
---@field controller_steamdeck_b Sprite   
---@field controller_steamdeck_back Sprite   
---@field controller_steamdeck_black_a Sprite   
---@field controller_steamdeck_black_b Sprite   
---@field controller_steamdeck_black_back Sprite   
---@field controller_steamdeck_black_dpdown Sprite   
---@field controller_steamdeck_black_dpleft Sprite   
---@field controller_steamdeck_black_dpright Sprite   
---@field controller_steamdeck_black_dpup Sprite   
---@field controller_steamdeck_black_left_stick Sprite   
---@field controller_steamdeck_black_leftshoulder Sprite   
---@field controller_steamdeck_black_leftstick Sprite   
---@field controller_steamdeck_black_lefttrigger Sprite   
---@field controller_steamdeck_black_paddle1 Sprite   
---@field controller_steamdeck_black_paddle2 Sprite   
---@field controller_steamdeck_black_paddle3 Sprite   
---@field controller_steamdeck_black_paddle4 Sprite   
---@field controller_steamdeck_black_right_stick Sprite   
---@field controller_steamdeck_black_rightshoulder Sprite   
---@field controller_steamdeck_black_rightstick Sprite   
---@field controller_steamdeck_black_righttrigger Sprite   
---@field controller_steamdeck_black_start Sprite   
---@field controller_steamdeck_black_x Sprite   
---@field controller_steamdeck_black_y Sprite   
---@field controller_steamdeck_dpdown Sprite   
---@field controller_steamdeck_dpleft Sprite   
---@field controller_steamdeck_dpright Sprite   
---@field controller_steamdeck_dpup Sprite   
---@field controller_steamdeck_left_stick Sprite   
---@field controller_steamdeck_leftshoulder Sprite   
---@field controller_steamdeck_leftstick Sprite   
---@field controller_steamdeck_lefttrigger Sprite   
---@field controller_steamdeck_paddle1 Sprite   
---@field controller_steamdeck_paddle2 Sprite   
---@field controller_steamdeck_paddle3 Sprite   
---@field controller_steamdeck_paddle4 Sprite   
---@field controller_steamdeck_right_stick Sprite   
---@field controller_steamdeck_rightshoulder Sprite   
---@field controller_steamdeck_rightstick Sprite   
---@field controller_steamdeck_righttrigger Sprite   
---@field controller_steamdeck_start Sprite   
---@field controller_steamdeck_x Sprite   
---@field controller_steamdeck_y Sprite   
---@field controller_xbox_a Sprite   
---@field controller_xbox_b Sprite   
---@field controller_xbox_back Sprite   
---@field controller_xbox_black_a Sprite   
---@field controller_xbox_black_b Sprite   
---@field controller_xbox_black_back Sprite   
---@field controller_xbox_black_dpdown Sprite   
---@field controller_xbox_black_dpleft Sprite   
---@field controller_xbox_black_dpright Sprite   
---@field controller_xbox_black_dpup Sprite   
---@field controller_xbox_black_left_stick Sprite   
---@field controller_xbox_black_leftshoulder Sprite   
---@field controller_xbox_black_leftstick Sprite   
---@field controller_xbox_black_lefttrigger Sprite   
---@field controller_xbox_black_right_stick Sprite   
---@field controller_xbox_black_rightshoulder Sprite   
---@field controller_xbox_black_rightstick Sprite   
---@field controller_xbox_black_righttrigger Sprite   
---@field controller_xbox_black_start Sprite   
---@field controller_xbox_black_x Sprite   
---@field controller_xbox_black_y Sprite   
---@field controller_xbox_dpdown Sprite   
---@field controller_xbox_dpleft Sprite   
---@field controller_xbox_dpright Sprite   
---@field controller_xbox_dpup Sprite   
---@field controller_xbox_left_stick Sprite   
---@field controller_xbox_leftshoulder Sprite   
---@field controller_xbox_leftstick Sprite   
---@field controller_xbox_lefttrigger Sprite   
---@field controller_xbox_right_stick Sprite   
---@field controller_xbox_rightshoulder Sprite   
---@field controller_xbox_rightstick Sprite   
---@field controller_xbox_righttrigger Sprite   
---@field controller_xbox_start Sprite   
---@field controller_xbox_x Sprite   
---@field controller_xbox_y Sprite   
---@field copper_wire Sprite   
---@field copper_wire_highlight Sprite   
---@field copy Sprite   
---@field covered_chunk Sprite   
---@field crafting_machine_recipe_not_unlocked Sprite   
---@field create_ghost_on_entity_death_modifier_constant Sprite   
---@field create_ghost_on_entity_death_modifier_icon Sprite   
---@field cross_select Sprite   
---@field crosshair Sprite   
---@field cursor_box CursorBoxSpecification   
---@field cursor_icon Sprite   
---@field custom_tag_icon Sprite   
---@field custom_tag_in_map_view Sprite   
---@field danger_icon Sprite   
---@field deconstruction_mark Sprite   
---@field deconstruction_time_to_live_modifier_constant Sprite   
---@field deconstruction_time_to_live_modifier_icon Sprite   
---@field decorative_editor_icon Sprite   
---@field default_ammo_damage_modifier_icon Sprite   
---@field default_gun_speed_modifier_icon Sprite   
---@field default_turret_attack_modifier_icon Sprite   
---@field destination_full_icon Sprite   
---@field destroyed_icon Sprite   
---@field down_arrow Sprite   
---@field downloaded Sprite   
---@field downloading Sprite   
---@field dropdown Sprite   
---@field editor_pause Sprite   
---@field editor_play Sprite   
---@field editor_selection Sprite   
---@field editor_speed_down Sprite   
---@field editor_speed_up Sprite   
---@field electricity_icon Sprite   
---@field electricity_icon_unplugged Sprite   
---@field empty_ammo_slot Sprite   
---@field empty_armor_slot Sprite   
---@field empty_drop_cargo_slot Sprite   
---@field empty_gun_slot Sprite   
---@field empty_inserter_hand_slot Sprite   
---@field empty_module_slot Sprite   
---@field empty_robot_material_slot Sprite   
---@field empty_robot_slot Sprite   
---@field empty_trash_slot Sprite   
---@field enemy_force_icon Sprite   
---@field enter Sprite   
---@field entity_editor_icon Sprite   
---@field entity_info_dark_background Sprite   
---@field equipment_collision Sprite   
---@field equipment_grid Sprite   
---@field equipment_grid_small Sprite   
---@field equipment_slot Sprite   
---@field expand Sprite   
---@field expand_dots Sprite   
---@field explosion_chart_visualization Animation   
---@field export Sprite   
---@field export_slot Sprite   
---@field feedback Sprite   
---@field filter_blacklist Sprite   
---@field fluid_icon Sprite  The sprite will be drawn on top of [fluid turrets](prototype:FluidTurretPrototype) that are out of fluid ammunition and don't have [FluidTurretPrototype::out_of_ammo_alert_icon](prototype:FluidTurretPrototype::out_of_ammo_alert_icon) set. 
---@field fluid_indication_arrow Sprite   
---@field fluid_indication_arrow_both_ways Sprite   
---@field fluid_visualization_connection Sprite   
---@field fluid_visualization_connection_both_ways Sprite   
---@field fluid_visualization_connection_underground Sprite   
---@field fluid_visualization_extent_arrow Sprite   
---@field follower_robot_lifetime_modifier_constant Sprite   
---@field follower_robot_lifetime_modifier_icon Sprite   
---@field force_editor_icon Sprite   
---@field force_ghost_cursor Sprite   
---@field force_tile_ghost_cursor Sprite   
---@field forward_arrow Sprite   
---@field forward_arrow_black Sprite   
---@field frozen_icon Sprite   
---@field fuel_icon Sprite   
---@field game_stopped_visualization Sprite   
---@field ghost_bar_pip Sprite   
---@field ghost_cursor Sprite   
---@field give_item_modifier_constant Sprite   
---@field give_item_modifier_icon Sprite   
---@field go_to_arrow Sprite   
---@field gps_map_icon Sprite   
---@field gradient Sprite   
---@field green_circle Sprite   
---@field green_dot Sprite   
---@field green_wire Sprite   
---@field green_wire_highlight Sprite   
---@field grey_placement_indicator_leg Sprite   
---@field grey_rail_signal_placement_indicator Sprite   
---@field grid_view Sprite   
---@field gun_speed_modifier_constant Sprite   
---@field gun_speed_modifier_icon Sprite   
---@field hand Sprite   
---@field hand_black Sprite   
---@field health_bar_green_pip Sprite   
---@field health_bar_red_pip Sprite   
---@field health_bar_yellow_pip Sprite   
---@field heat_exchange_indication Sprite   
---@field hint_arrow_down Sprite   
---@field hint_arrow_left Sprite   
---@field hint_arrow_right Sprite   
---@field hint_arrow_up Sprite   
---@field import Sprite   
---@field import_slot Sprite   
---@field indication_arrow Sprite   
---@field indication_line Sprite   
---@field inserter_stack_size_bonus_modifier_constant Sprite   
---@field inserter_stack_size_bonus_modifier_icon Sprite   
---@field item_editor_icon Sprite   
---@field item_to_be_delivered_symbol Sprite   
---@field laboratory_productivity_modifier_constant Sprite   
---@field laboratory_productivity_modifier_icon Sprite   
---@field laboratory_speed_modifier_constant Sprite   
---@field laboratory_speed_modifier_icon Sprite   
---@field left_arrow Sprite   
---@field light_cone Sprite   
---@field light_medium Sprite   
---@field light_small Sprite   
---@field lightning_warning_icon Sprite   
---@field line_icon Sprite   
---@field list_view Sprite   
---@field logistic_network_panel_black Sprite   
---@field logistic_network_panel_white Sprite   
---@field logistic_radius_visualization Sprite   
---@field lua_snippet_tool_icon Sprite   
---@field map Sprite   
---@field map_exchange_string Sprite   
---@field max_distance_underground_remove_belts Sprite   
---@field max_failed_attempts_per_tick_per_construction_queue_modifier_constant Sprite   
---@field max_failed_attempts_per_tick_per_construction_queue_modifier_icon Sprite   
---@field max_successful_attempts_per_tick_per_construction_queue_modifier_constant Sprite   
---@field max_successful_attempts_per_tick_per_construction_queue_modifier_icon Sprite   
---@field maximum_following_robots_count_modifier_constant Sprite   
---@field maximum_following_robots_count_modifier_icon Sprite   
---@field medium_gui_arrow Sprite   
---@field mining_drill_productivity_bonus_modifier_constant Sprite   
---@field mining_drill_productivity_bonus_modifier_icon Sprite   
---@field mining_with_fluid_modifier_constant Sprite   
---@field mining_with_fluid_modifier_icon Sprite   
---@field missing_icon Sprite   
---@field missing_mod_icon Sprite   
---@field mod_category Sprite   
---@field mod_dependency_arrow Sprite   
---@field mod_downloads_count Sprite   
---@field mod_last_updated Sprite   
---@field mouse_cursor Sprite   
---@field mouse_cursor_macos Sprite   
---@field move_tag Sprite   
---@field multiplayer_waiting_icon Sprite   
---@field nature_icon Sprite   
---@field navmesh_pending_icon Animation   
---@field neutral_force_icon Sprite   
---@field no_building_material_icon Sprite   
---@field no_nature_icon Sprite   
---@field no_path_icon Sprite   
---@field no_platform_storage_space_icon Sprite   
---@field no_roboport_storage_space_icon Sprite   
---@field no_storage_space_icon Sprite   
---@field none_editor_icon Sprite   
---@field not_available Sprite   
---@field not_available_black Sprite   
---@field not_enough_construction_robots_icon Sprite   
---@field not_enough_repair_packs_icon Sprite   
---@field not_played_yet_dark_green Sprite   
---@field not_played_yet_green Sprite   
---@field nothing_modifier_constant Sprite   
---@field nothing_modifier_icon Sprite   
---@field notification Sprite   
---@field output_console_gradient Sprite   
---@field paint_bucket_icon Sprite   
---@field parametrise Sprite   
---@field pause Sprite   
---@field pin_arrow Sprite   
---@field pin_center Sprite   
---@field pipeline_disabled_icon Sprite   
---@field placement_indicator_leg Sprite   
---@field platform_entity_build_animations EntityBuildAnimations  Only present when the Space Age mod is loaded. 
---@field play Sprite   
---@field played_dark_green Sprite   
---@field played_green Sprite   
---@field player_force_icon Sprite   
---@field preset Sprite   
---@field pump_cannot_connect_icon Sprite   
---@field questionmark Sprite   
---@field rail_path_not_possible Sprite   
---@field rail_planner_allow_elevated_rails_modifier_constant Sprite   
---@field rail_planner_allow_elevated_rails_modifier_icon Sprite   
---@field rail_planner_indication_arrow Sprite   
---@field rail_planner_indication_arrow_anchored Sprite   
---@field rail_planner_indication_arrow_too_far Sprite   
---@field rail_signal_placement_indicator Sprite   
---@field rail_support_on_deep_oil_ocean_modifier_constant Sprite   
---@field rail_support_on_deep_oil_ocean_modifier_icon Sprite   
---@field rail_support_placement_indicator Sprite   
---@field reassign Sprite   
---@field rebuild_mark Sprite   
---@field recharge_icon Sprite   
---@field recipe_arrow Sprite   
---@field red_wire Sprite   
---@field red_wire_highlight Sprite   
---@field reference_point Sprite   
---@field refresh Sprite   
---@field refresh_white Animation   
---@field rename_icon Sprite   
---@field reset Sprite   
---@field reset_white Sprite   
---@field resource_editor_icon Sprite   
---@field resources_depleted_icon Sprite   
---@field right_arrow Sprite   
---@field robot_slot Sprite   
---@field scripting_editor_icon Sprite   
---@field search Sprite   
---@field search_icon Sprite   
---@field select_icon_black Sprite   
---@field select_icon_white Sprite   
---@field set_bar_slot Sprite   
---@field shield_bar_pip Sprite   
---@field shoot_cursor_green Sprite   
---@field shoot_cursor_red Sprite   
---@field short_indication_line Sprite   
---@field short_indication_line_green Sprite   
---@field show_electric_network_in_map_view Sprite   
---@field show_logistics_network_in_map_view Sprite   
---@field show_pipelines_in_map_view Sprite   
---@field show_player_names_in_map_view Sprite   
---@field show_rail_signal_states_in_map_view Sprite   
---@field show_recipe_icons_in_map_view Sprite   
---@field show_tags_in_map_view Sprite   
---@field show_train_station_names_in_map_view Sprite   
---@field show_turret_range_in_map_view Sprite   
---@field show_worker_robots_in_map_view Sprite   
---@field shuffle Sprite   
---@field side_menu_achievements_icon Sprite   
---@field side_menu_blueprint_library_icon Sprite   
---@field side_menu_bonus_icon Sprite   
---@field side_menu_factoriopedia_icon Sprite   
---@field side_menu_logistic_networks_icon Sprite   
---@field side_menu_map_icon Sprite   
---@field side_menu_menu_icon Sprite   
---@field side_menu_players_icon Sprite   
---@field side_menu_production_icon Sprite   
---@field side_menu_space_platforms_icon Sprite   
---@field side_menu_technology_icon Sprite   
---@field side_menu_train_icon Sprite   
---@field side_menu_tutorials_icon Sprite   
---@field slot Sprite   
---@field slots_view Sprite   
---@field small_gui_arrow Sprite   
---@field sort_by_name Sprite   
---@field sort_by_time Sprite   
---@field space_age_icon Sprite   
---@field spawn_flag Sprite   
---@field speed_down Sprite   
---@field speed_up Sprite   
---@field spray_icon Sprite   
---@field starmap_platform_moving Sprite   
---@field starmap_platform_moving_clicked Sprite   
---@field starmap_platform_moving_hovered Sprite   
---@field starmap_platform_stacked Sprite   
---@field starmap_platform_stacked_clicked Sprite   
---@field starmap_platform_stacked_hovered Sprite   
---@field starmap_platform_stopped Sprite   
---@field starmap_platform_stopped_clicked Sprite   
---@field starmap_platform_stopped_hovered Sprite   
---@field starmap_star Sprite   
---@field station_name Sprite   
---@field status_blue Sprite   
---@field status_inactive Sprite   
---@field status_not_working Sprite   
---@field status_working Sprite   
---@field status_yellow Sprite   
---@field stop Sprite   
---@field surface_editor_icon Sprite   
---@field sync_mods Sprite   
---@field technology_white Sprite   
---@field tick_custom Sprite   
---@field tick_once Sprite   
---@field tick_sixty Sprite   
---@field tile_editor_icon Sprite   
---@field tile_ghost_cursor Sprite   
---@field time_editor_icon Sprite   
---@field tip_icon Sprite   
---@field too_far Sprite   
---@field too_far_from_roboport_icon Sprite   
---@field tooltip_category_spoilable Sprite   
---@field track_button Sprite   
---@field track_button_white Sprite   
---@field train_braking_force_bonus_modifier_constant Sprite   
---@field train_braking_force_bonus_modifier_icon Sprite   
---@field train_stop_disabled_in_map_view Sprite   
---@field train_stop_full_in_map_view Sprite   
---@field train_stop_in_map_view Sprite   
---@field train_stop_placement_indicator Sprite   
---@field trash Sprite   
---@field trash_white Sprite   
---@field turret_attack_modifier_constant Sprite   
---@field turret_attack_modifier_icon Sprite   
---@field unclaimed_cargo_icon Sprite   
---@field underground_pipe_connection Sprite   
---@field underground_remove_belts Sprite   
---@field underground_remove_pipes Sprite   
---@field unlock_circuit_network_modifier_constant Sprite   
---@field unlock_circuit_network_modifier_icon Sprite   
---@field unlock_quality_modifier_constant Sprite   
---@field unlock_quality_modifier_icon Sprite   
---@field unlock_recipe_modifier_constant Sprite   
---@field unlock_recipe_modifier_icon Sprite   
---@field unlock_space_location_modifier_constant Sprite   
---@field unlock_space_location_modifier_icon Sprite   
---@field unlock_space_platforms_modifier_constant Sprite   
---@field unlock_space_platforms_modifier_icon Sprite   
---@field upgrade_blueprint Sprite   
---@field upgrade_mark Sprite   
---@field variations_tool_icon Sprite   
---@field vehicle_logistics_modifier_constant Sprite   
---@field vehicle_logistics_modifier_icon Sprite   
---@field warning Sprite   
---@field warning_icon Sprite   
---@field warning_white Sprite   
---@field white_mask Sprite   
---@field white_square Sprite   
---@field white_square_icon Sprite   
---@field wire_shadow Sprite   
---@field worker_robot_battery_modifier_constant Sprite   
---@field worker_robot_battery_modifier_icon Sprite   
---@field worker_robot_speed_modifier_constant Sprite   
---@field worker_robot_speed_modifier_icon Sprite   
---@field worker_robot_storage_modifier_constant Sprite   
---@field worker_robot_storage_modifier_icon Sprite   
---@parent PrototypeBase
---
--- typename: utility-sprites
--- Sprites used by the game that are not specific to certain prototypes.
UtilitySprites = {}


---@class (exact) ValvePrototype : EntityWithOwnerPrototype
---@field animations Animation4Way   
---@field flow_rate FluidAmount  The max flow rate through the valve per tick. 
---@field fluid_box FluidBox  Must have at least one `"output"` [FluidFlowDirection](prototype:FluidFlowDirection) and at least one `"input-output"` [FluidFlowDirection](prototype:FluidFlowDirection). 
---@field frozen_patch Sprite4Way   
---@field mode ValveMode   
---@field threshold float (default: literal: value: 0) Ignored if [ValvePrototype::mode](prototype:ValvePrototype::mode) is `"one-way"`. Must be between `0` and `1` inclusive. 
---@parent EntityWithOwnerPrototype
---
--- typename: valve
--- A passive device that provides limited control of fluid flow between pipelines.
ValvePrototype = {}


---@class (exact) VirtualSignalPrototype : Prototype
---@field icon FileName  Path to the icon file that is used to represent this virtual signal.
---
---Only loaded, and mandatory if `icons` is not defined. 
---@field icon_size SpriteSizeType (default: literal: value: 64) The size of the square icon, in pixels. E.g. `32` for a 32px by 32px icon. Must be larger than `0`.
---
---Only loaded if `icons` is not defined. 
---@field icons {'complex_type': 'array', 'value': 'IconData'}  The icon that is used to represent this virtual signal. Can't be an empty array. 
---@parent Prototype
---
--- typename: virtual-signal
--- A [virtual signal](https://wiki.factorio.com/Circuit_network#Virtual_signals).
VirtualSignalPrototype = {}


---@class (exact) WallPrototype : EntityWithOwnerPrototype
---@field circuit_connector CircuitConnectorDefinition   
---@field circuit_wire_max_distance double (default: literal: value: 0) The maximum circuit wire distance for this entity. 
---@field connected_gate_visualization Sprite   
---@field default_output_signal SignalIDConnector   
---@field draw_circuit_wires boolean (default: literal: value: True)  
---@field draw_copper_wires boolean (default: literal: value: True)  
---@field pictures WallPictures   
---@field visual_merge_group uint32 (default: literal: value: 0) Different walls will visually connect to each other if their merge group is the same. 
---@field wall_diode_green Sprite4Way   
---@field wall_diode_green_light_bottom LightDefinition   
---@field wall_diode_green_light_left LightDefinition   
---@field wall_diode_green_light_right LightDefinition   
---@field wall_diode_green_light_top LightDefinition   
---@field wall_diode_red Sprite4Way   
---@field wall_diode_red_light_bottom LightDefinition   
---@field wall_diode_red_light_left LightDefinition   
---@field wall_diode_red_light_right LightDefinition   
---@field wall_diode_red_light_top LightDefinition   
---@parent EntityWithOwnerPrototype
---
--- typename: wall
--- A [wall](https://wiki.factorio.com/Wall).
WallPrototype = {}


require("prototypes.recipe.warehouses")
require("prototypes.recipe.chemistry")

require("tweaks.entity.warfare")
require("tweaks.entity.pipes")
require("tweaks.entity.beacons") -- по маякам можно ходить
require("tweaks.entity.offshore-pumps")
require("tweaks.entity.assemblers")
require("tweaks.entity.furnaces")
require("tweaks.entity.fuel")
require("tweaks.entity.trains")
require("tweaks.entity.drills")
require("tweaks.entity.bio-mod")

require("tweaks.item.roboport")
require("tweaks.item.fuel")

require("tweaks.recipe.metallurgy")
require("tweaks.recipe.pumps")
require("tweaks.recipe.gems")
require("tweaks.recipe.module-contact")
require("tweaks.recipe.poles") -- Изменение рецептов ЛЭП
require("tweaks.recipe.yuoki")
require("tweaks.recipe.concrete")
require("tweaks.recipe.pipes")
require("tweaks.recipe.groups")

require("tweaks.technology.chemistry")
require("tweaks.technology.metallurgy")
require("tweaks.technology.warfare")
require("tweaks.technology.boilers")
require("tweaks.technology.pumps")
require("tweaks.technology.yuoki")
require("tweaks.technology.concrete")
require("tweaks.technology.fuel")

require("tweaks.custom.main-menu-background")
require("tweaks.custom.map-gen-presets")
require("tweaks.custom.icons")

require("removals.bio-modules")
require("removals.fishes")

require("graphics.train.train_reskin") -- рескин поездов
-------------------------------------------------------------------------------------------------
require("final-fixes.technologies") -- Пожалуйста не добавляйте сюда новых записей. Поищите раздел в tweaks/technology или создайте там новый
require("final-fixes.recipies")-- Пожалуйста не добавляйте сюда новых записей. Поищите раздел в tweaks/recipe или создайте там новый

require("tweaks.custom.uniform-recipies")

-- final aplying of override functions
angelsmods.functions.OV.execute()

--должно быть последним. После всех рецептов.
require("tweaks.custom.flowfix")

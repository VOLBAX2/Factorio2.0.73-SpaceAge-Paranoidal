require("__zzzparanoidal__.paralib")

--убираем лишние рецепты
paralib.bobmods.lib.tech.remove_recipe_unlock("bob-alloy-processing", "bob-stone-mixing-furnace-from-stone-furnace")
paralib.bobmods.lib.tech.remove_recipe_unlock("bob-alloy-processing", "bob-stone-furnace-from-stone-mixing-furnace")

--разблокируем рецепт для упрощенной плавки бронзы в печах
paralib.bobmods.lib.tech.add_recipe_unlock("angels-bronze-smelting-1", "bob-bronze-alloy")

--bobplates small icon size saves vram
data.raw.technology["bob-fluid-canister-processing"].icon_size = 128
data.raw.technology["bob-fluid-canister-processing"].icon = "__zzzparanoidal__/graphics/bob/fluid-canister.png"

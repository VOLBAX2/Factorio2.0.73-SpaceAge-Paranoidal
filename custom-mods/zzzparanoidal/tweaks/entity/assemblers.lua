require("__zzzparanoidal__.paralib")
-- подкрутка чтобы сборщик1 мог собирать сам себя
data.raw["assembling-machine"]["assembling-machine-1"].ingredient_count = 5
-- Добавление нужных для крафта конденсаторов категорий в сборочники
local function AssemblerTweak(name)
    if(data.raw["assembling-machine"][name]) then
        table.insert(data.raw["assembling-machine"][name].crafting_categories, "electronics")
        table.insert(data.raw["assembling-machine"][name].crafting_categories, "electronics-with-fluid")
    end
end

AssemblerTweak("burner-assembling-machine")
AssemblerTweak("assembling-machine-1")
AssemblerTweak("assembling-machine-2")
AssemblerTweak("assembling-machine-3")
AssemblerTweak("bob-assembling-machine-4")
AssemblerTweak("bob-assembling-machine-5")
AssemblerTweak("bob-assembling-machine-6")


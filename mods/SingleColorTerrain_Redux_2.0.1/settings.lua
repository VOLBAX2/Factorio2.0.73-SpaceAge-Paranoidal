data:extend({
    {
        type = "string-setting",
        name = "color-terrain",
        setting_type = "startup",
        default_value = "Green",
        allowed_values = {"Red", "Blue", "Green", "Yellow", "White","Black","Default","Chooser","Chooser - Half Bright"},
        order = "a",
        localised_name = "Single Color Terrain"
    },
    
    {
        type = "color-setting",
        name = "color-chooser",
        setting_type = "startup",
        default_value = {r=70, g=170, b=90},
        order = "b1",
        localised_name = "Color Chooser",
        localised_description = "Note that alpha channel has no effect."
    },

    {
        type = "bool-setting",
        name = "no-decor",
        setting_type = "startup",
        default_value = true,
        localised_name = "No Decorations?",
        order = "b3"
    },
    
    {
        type = "bool-setting",
        name = "no-clouds",
        setting_type = "startup",
        default_value = true,
        localised_name = "No Clouds?",
        order = "c"
    },

    {
        type = "bool-setting",
        name = "white-stone",
        setting_type = "startup",
        default_value = true,
        localised_name = "White Stone Path?",
        order = "d"
    },
    
    {
        type = "bool-setting",
        name = "white-concrete",
        setting_type = "startup",
        default_value = true,
        localised_name = "White Concrete?",
        order = "e"
    },

    {
        type = "bool-setting",
        name = "colorful-machines",
        setting_type = "startup",
        default_value = true,
        localised_name = "Colorful Assembling Machines?",
        order = "f"
    },
})
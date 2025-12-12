local colors = require("colors")
local settings = require("settings")

-- Equivalent to the --bar domain
sbar.bar(
    {
        topmost = "window",
        height = 30,
        color = colors.transparent,
        padding_right = 4,
        padding_left = 2,
        margin = 0,
        corner_radius = 6,
        y_offset = 5,
        shadow = true,
        blur_radius = 10,
        position = "top"
    }
)

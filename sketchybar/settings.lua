return {
    display = 1,
    paddings = 2,
    group_paddings = 3,

    icons = "sf_symbols",   -- Options: "sf-symbols", "nerdfont"
    animated_icons = false, -- Set to true if you want to use animated icons

    font = {
        text = "Monocraft",
        numbers = "Monocraft",
        clock = "Monocraft",
        icons = "Monocraft",
        style_map = {
            ["Regular"] = "Regular",
            ["Semibold"] = "Medium",
            ["Bold"] = "Bold",
            ["Heavy"] = "Bold",
            ["Black"] = "ExtraBold"
        }
    },

    primary_monitor = 1,
    -- Left to right ordering in which to display
    -- the aerospace workspaces. Inidices are monitor
    -- numbers in aerospace config and values are
    -- actual display ordering
    monitor_ordering = { 1, 3, 2 },
}


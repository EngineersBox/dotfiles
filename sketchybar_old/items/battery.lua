local colors = require("colors")
local settings = require("settings")

local battery = sbar.add("alias", "Control Centre,Battery", {
    label = {
        drawing = false,
    },
    position = "right",
    alias = {
        color = colors.grey
    },
    padding_left = "-5",
    update_freq = 10,
    script = "$CONFIG_DIR/items/scripts/update_battery.sh",
})
local function level_to_colour(level)
    if level < 20 then
        return colors.red
    elseif level < 50 then
        return colors.orange
    elseif level < 75 then
        return colors.yellow
    end
    return colors.light_green
end

sbar.add("event", "battery_level_update")
local battery_level = sbar.add("item", "battery_level", {
    icon = {
        drawing = false,
    },
    position = "right",
    padding_left = 5,
    label = {
        string = "???%",
        color = colors.light_grey
    }
})

battery_level:subscribe("battery_level_update", function(env)
    battery_level:set({
        label = {
            string = "" .. env.BATTERY_LEVEL .. "%"
        }
    })
    battery:set({
        alias = {
            color = level_to_colour(tonumber(env.BATTERY_LEVEL))
        }
    })
end)

sbar.add("bracket", "battery.bracket", {
    battery_level.name,
    battery.name,
}, {
	background = {
		color = colors.bar.bg
	},
	popup = {
		align = "center",
		label = {
			padding_left = 10,
			padding_right = 10,
			font = {
				style = settings.font.style_map.SemiBold,
				size = 12,
			},
			color = colors.dolphin_grey
		},
	}
})

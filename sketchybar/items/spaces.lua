local colors = require("colors")
local settings = require("settings")

local space_names = {}

local function split(inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t = {}
  for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
    table.insert(t, str)
  end
  return t
end

local function parse_string_to_table(s)
    local result = {}
    table.insert(result, {
        workspace = "...",
        monitor = 1,
    })
    for line in s:gmatch("([^\n]+)") do
        local split_line = split(line, "%s")
        local monitor = tonumber(split_line[2])
        if monitor == 1 then
            goto continue
        end
        table.insert(result, {
            workspace = split_line[1],
            monitor = tonumber(split_line[2]) == 2 and 3 or 2,
        })
        ::continue::
    end
    return result
end

local file = io.popen("aerospace list-workspaces --all --format '%{workspace} %{monitor-id}'")
local result = file:read("*a")
file:close()

local workspaces = parse_string_to_table(result)
for i, layout in ipairs(workspaces) do
    local workspace = layout["workspace"]
    local monitor = layout["monitor"]
	local space = sbar.add("space", workspace, {
        space = i,
		position = "left",
        display = monitor,
	})
	table.insert(space_names, workspace)

    space:subscribe("aerospace_workspace_change", function(env)
        local selected = env.FOCUSED_WORKSPACE == workspace
        space:set({
            label = {
                drawing = false,
            },
            icon = {
                highlight = selected,
                padding_left = selected and 8 or 5,
                padding_right = selected and 8 or 5,
                string = workspace,
                color = selected and colors.red or colors.grey,
                font = {
                    family = settings.font.clock,
                    style = selected and settings.font.style_map["Bold"] or settings.font.style_map["Regualr"],
                    size = selected and 14 or 12,
                },
            },
            background = {
                border_width = selected and 1 or 0,
                border_color = colors.bar.border,
                drawing = selected and true or false,
                corner_radius = selected and 4 or 50,
                y_offset = selected and 0 or 0,
                color = selected and colors.bar.bg2 or colors.transparent,

                height = selected and 20 or 18,
                padding_left = 6,
                padding_right = 6,
            },
            associated_display = monitor,
        })
    end)

	space:subscribe("front_app_switched", function(env)
        local selected = env.FOCUSED_WORKSPACE == workspace
		sbar.animate("elastic", 10, function()
			space:set({
				label = {
					drawing = false,
				},
				icon = {
                    highlight = selected,
					padding_left = selected and 8 or 5,
					padding_right = selected and 8 or 5,
					string = workspace,
					color = selected and colors.red or colors.grey,
					font = {
					    family = settings.font.clock,
						style = selected and settings.font.style_map["Bold"] or settings.font.style_map["Regualr"],
						size = selected and 14 or 12,
					},
				},
				background = {
					border_width = selected and 1 or 0,
					border_color = colors.bar.border,
					drawing = selected and true or false,
					corner_radius = selected and 4 or 50,
					y_offset = selected and 0 or 0,
					color = selected and colors.bar.bg2 or colors.transparent,

					height = selected and 20 or 18,
					padding_left = 6,
					padding_right = 6,
				},
                associated_display = monitor,
			})
		end)
	end)
end

sbar.add("bracket", space_names, {
	background = {
		border_width = 0,
		border_color = colors.bar.border,
		color = colors.bar.bg,
		width = "dynamic"
	},
})

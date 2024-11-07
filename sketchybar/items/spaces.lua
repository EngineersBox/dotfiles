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
local workspace_monitor_mappings = file:read("*a")
file:close()

file = io.popen("aerospace list-workspaces --focused --format '%{workspace}'")
local focused = file:read("*a"):gsub("\n", "")
file:close()

sbar.add("event", "aerospace_workspace_change")
local workspaces = parse_string_to_table(workspace_monitor_mappings)
for i, layout in ipairs(workspaces) do
    local workspace = layout["workspace"]
    local monitor = layout["monitor"]
    local initial_selected = workspace == focused
	local space = sbar.add("item", workspace, {
		position = "left",
        display = monitor,
        icon = {
            drawing = false,
        },
        label = {
            padding_left = 5,
            padding_right = 5,
            string = workspace,
            font = {
                family = "Monocraft",
                style = settings.font.style_map["Regular"],
                size = 12,
            },
            color = initial_selected and colors.pink or colors.grey,
        },
	})
	table.insert(space_names, workspace)

    space:subscribe("aerospace_workspace_change", function(env)
        local selected = env.FOCUSED_WORKSPACE == workspace
        space:set({
            label = {
                color = selected and colors.pink or colors.grey, 
                font = {
                    style = selected and settings.font.style_map["Bold"] or settings.font.style_map["Regular"],
                },
            },
            associated_display = monitor,
        })
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

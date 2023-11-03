local wezterm = require 'wezterm'
local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

--[[ THEMING ]]
config.color_scheme = 'Tomorrow Night'
config.font = wezterm.font('JetBrainsMono NF')
config.font_size = 11.0
config.underline_thickness = 3
config.underline_position = -4
config.window_background_opacity = 0.8
config.macos_window_background_blur = 20
config.window_decorations = "RESIZE"
config.use_fancy_tab_bar = false

config.colors = {
    tab_bar = {
        background = '#181a1d',
        active_tab = {
            bg_color = '#2D2A2E',
            fg_color = '#c0c0c0',
            intensity = 'Normal',
            underline = 'None',
            italic = false,
            strikethrough = false,
        }
    }
}

--[[ KEYMAPS ]]
config.keys = {
    {
        key = ";",
        mods = "SHIFT|CMD",
        action = wezterm.action.SplitHorizontal({
            domain = "CurrentPaneDomain"
        })
    },
    {
        key = "'",
        mods = "SHIFT|CMD",
        action = wezterm.action.SplitVertical({
            domain = "CurrentPaneDomain"
        })
    },
    -- activate pane selection mode with the default alphabet (labels are "a", "s", "d", "f" and so on)
    {
        key = '8',
        mods = 'CTRL',
        action = wezterm.action.PaneSelect
    },
    -- activate pane selection mode with numeric labels
    {
        key = '9',
        mods = 'CTRL',
        action = wezterm.action.PaneSelect {
            alphabet = '1234567890',
        },
    },
    -- show the pane selection mode, but have it swap the active and selected panes
    {
        key = '0',
        mods = 'CTRL',
        action = wezterm.action.PaneSelect {
            mode = 'SwapWithActive',
        },
    },
}

-- [[ STATE ]]
config.term = "wezterm"

return config

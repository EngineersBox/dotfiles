local wezterm = require 'wezterm'
local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.color_scheme = 'Tomorrow Night'
config.font = wezterm.font('JetBrainsMono NF')
config.window_background_opacity = 0.8
config.text_background_opacity = 0.8
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

return config

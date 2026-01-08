---@type Base46Table
local M = {}

M.base_30 = {
  white = "#110e06",
  darker_black = "#bcad8c",
  black = "#cabda0", --  nvim bg
  black2 = "#bcad8c",
  one_bg = "#af9f7d",
  one_bg2 = "#645538", -- StatusBar (filename)
  one_bg3 = "#110e06",
  grey = "#110e06", -- Line numbers (shouldn't be base01?)
  grey_fg = "#af9f7d", -- Why this affects comments?
  grey_fg2 = "#af9f7d",
  light_grey = "#645538",
  red = "#110e06", -- StatusBar (username)
  baby_pink = "#110e06",
  pink = "#382e1b",
  line = "#33383d", -- for lines like vertsplit
  green = "#4b3e26", -- StatusBar (file percentage)
  vibrant_green = "#4b3e26",
  nord_blue = "#110e06", -- Mode indicator
  blue = "#382e1b",
  yellow = "#4b3e26",
  sun = "#110e06",
  purple = "#4b3e26",
  dark_purple = "#110e06",
  teal = "#382e1b",
  orange = "#4b3e26",
  cyan = "#382e1b",
  statusline_bg = "#2b3035",
  lightbg = "#383d42",
  pmenu_bg = "#383d42", -- Command bar suggestions
  folder_bg = "#4b3e26",
}

M.base_16 = {
    base00 = "#cabda0",
    base01 = "#bcad8c",
    base02 = "#af9f7d",
    base03 = "#645538",
    base04 = "#110e06",
    base05 = "#382e1b",
    base06 = "#4b3e26",
    base07 = "#bcad8c",
    base08 = "#110e06",
    base09 = "#4b3e26",
    base0A = "#4b3e26",
    base0B = "#4b3e26",
    base0C = "#4b3e26",
    base0D = "#382e1b",
    base0E = "#110e06",
    base0F = "#4b3e26",
}

M.type = "light"

M.polish_hl = {
  treesitter = {
    ["@comment"] = { fg = M.base_16.base04 }
  },
}

M = require("base46").override_theme(M, "charcoal_monocrome_dark")

return M

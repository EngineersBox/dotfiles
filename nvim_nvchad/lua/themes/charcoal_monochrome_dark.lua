---@type Base46Table
local M = {}

M.base_30 = {
  white = "#a88c62",
  darker_black = "#231b0e",
  black = "#57462c", --  nvim bg
  black2 = "#2b2827",
  one_bg = "#2a2012",
  one_bg2 = "#57462c", -- StatusBar (filename)
  one_bg3 = "#a88c62",
  grey = "#a88c62", -- Line numbers (shouldn't be base01?)
  grey_fg = "#a88c62", -- Why this affects comments?
  grey_fg2 = "#2a2012",
  light_grey = "#a88c62",
  red = "#a88c62", -- StatusBar (username)
  baby_pink = "#a88c62",
  pink = "#c3a983",
  line = "#33383d", -- for lines like vertsplit
  green = "#dec8a7", -- StatusBar (file percentage)
  vibrant_green = "#dec8a7",
  nord_blue = "#a88c62", -- Mode indicator
  blue = "#c3a983",
  yellow = "#dec8a7",
  sun = "#a88c62",
  purple = "#dec8a7",
  dark_purple = "#a88c62",
  teal = "#c3a983",
  orange = "#dec8a7",
  cyan = "#c3a983",
  statusline_bg = "#2b3035",
  lightbg = "#383d42",
  pmenu_bg = "#383d42", -- Command bar suggestions
  folder_bg = "#876e48",
}

M.base_16 = {
    base00 = "#231b0e",
    base01 = "#231b0e",
    base02 = "#2a2012",
    base03 = "#57462c",
    base04 = "#a88c62",
    base05 = "#c3a983",
    base06 = "#dec8a7",
    base07 = "#231b0e",
    base08 = "#a88c62",
    base09 = "#dec8a7",
    base0A = "#dec8a7",
    base0B = "#dec8a7",
    base0C = "#dec8a7",
    base0D = "#c3a983",
    base0E = "#a88c62",
    base0F = "#876e48",
}

M.type = "dark"

M.polish_hl = {
  treesitter = {
    ["@comment"] = { fg = M.base_16.base04 }
  },
}

M = require("base46").override_theme(M, "charcoal_monocrome_dark")

return M

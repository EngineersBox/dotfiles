local configuration = vim.fn['gruvbox_material#get_configuration']()
local colors = vim.fn['gruvbox_material#get_palette'](configuration.background, configuration.foreground, configuration.colors_override)

return {
  normal = {
    a = { bg = "None", fg = colors.grey2[1], gui = "bold" },
    b = { bg = "None", fg = colors.light4 },
    c = { bg = "None", fg = colors.light4 },
  },
  insert = {
    a = { bg = "None", fg = colors.bg_green[1], gui = "bold" },
    b = { bg = "None", fg = colors.light4 },
    c = { bg = "None", fg = colors.light4 },
  },
  visual = {
    a = { bg = "None", fg = colors.bg_red[1], gui = "bold" },
    b = { bg = "None", fg = colors.light4 },
    c = { bg = "None", fg = colors.light4 },
  },
  replace = {
    a = { bg = "None", fg = colors.bg_yellow[1], gui = "bold" },
    b = { bg = "None", fg = colors.light4 },
    c = { bg = "None", fg = colors.light4 },
  },
  command = {
    a = { bg = "None", fg = colors.blue[1], gui = "bold" },
    b = { bg = "None", fg = colors.light4 },
    c = { bg = "None", fg = colors.light4 },
  },
  terminal = {
    a = { bg = "None", fg = colors.purple[1], gui = "bold" },
    b = { bg = "None", fg = colors.light4 },
    c = { bg = "None", fg = colors.light4 },
  },
  inactive = {
    a = { bg = "None", fg = colors.grey2[1], gui = "bold" },
    b = { bg = "None", fg = colors.light4 },
    c = { bg = "None", fg = colors.light4 },
  },
}

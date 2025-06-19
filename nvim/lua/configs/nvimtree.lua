local nvchad_configs = require("nvchad.configs.nvimtree");
-- Ignores NvChad cutsom Icons as they don't work with
-- patched nerdfonts, they end up with incorrect displayed
-- icons.
nvchad_configs.renderer = {
    group_empty = true,
    icons = {},
}
return nvchad_configs

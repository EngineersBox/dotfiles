-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

-- ---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "chocolate",
	hl_override = {
		Comment = { italic = true },
		["@comment"] = { italic = true },
	},
}

M.ui = {
	cmp = {
		style = "atom_colored",
	},
	statusline = {
		theme = "minimal",
		separator_style = "block",
        order = { "mode", "file", "arrow", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cwd", "cursor" },
        modules = {
            arrow = function()
                local config = require("nvconfig").ui.statusline
                local sep_style = config.separator_style
                local utils = require "nvchad.stl.utils"

                local sep_icons = utils.separators
                local separators = (type(sep_style) == "table" and sep_style) or sep_icons[sep_style]

                local sep_l = separators["left"]
                local sep_r = "%#St_sep_r#" .. separators["right"] .. " %#ST_EmptySpace#"

                local function gen_block(icon, txt, sep_l_hlgroup, iconHl_group, txt_hl_group)
                  return sep_l_hlgroup .. sep_l .. iconHl_group .. icon .. " " .. txt_hl_group .. " " .. txt .. sep_r
                end
                local arrow_statusline = require("arrow.statusline")
                local status = arrow_statusline.text_for_statusline(nil, nil)
                if string.len(status) == 0 then
                    status = "0"
                end
                return gen_block(
		            "󱡁",
                    status,
                    "%#St_cwd_sep#",
                    "%#St_cwd_bg#",
                    "%#St_cwd_txt#"
                )
            end,
        },

	},
	lsp = {
		signature = true,
		semantic_tokens = true,
	},
}

return M

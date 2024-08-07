-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

-- ---@type ChadrcConfig
local M = {}

M.ui = {
	theme = "chocolate",

	cmp = {
		style = "atom_colored",
	},

	statusline = {
		theme = "minimal",
		separator_style = "round",
	},

	lsp = {
		signature = true,
		semantic_tokens = true,
	},

	hl_override = {
		Comment = { italic = true },
		["@comment"] = { italic = true },
	},
}

return M

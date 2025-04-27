return {
	-- {
	--   "ellisonleao/gruvbox.nvim",
	--   priority = 1000 ,
	--   config = function()
	--       vim.o.background = "dark"
	--       vim.cmd([[colorscheme gruvbox]])
	--   end,
	-- },
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			-- Optionally configure and load the colorscheme
			-- directly inside the plugin declaration.
			vim.g.gruvbox_material_enable_italic = true
			vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
			vim.g.gruvbox_material_inlay_hints_background = "dimmed"
			vim.g.gruvbox_material_diagnostic_line_highlight = 1
			vim.api.nvim_create_autocmd("ColorScheme", {
				group = vim.api.nvim_create_augroup("custom_highlights_gruvboxmaterial", {}),
				pattern = "gruvbox-material",
				callback = function()
					local config = vim.fn["gruvbox_material#get_configuration"]()
					local palette = vim.fn["gruvbox_material#get_palette"](
						config.background,
						config.foreground,
						config.colors_override
					)
					local set_hl = vim.fn["gruvbox_material#highlight"]
					set_hl("NormalMoody", palette.blue, palette.none)
					set_hl("InsertMoody", palette.fg0, palette.none)
					set_hl("VisualMoody", palette.purple, palette.none)
					set_hl("CommandMoody", palette.green, palette.none)
					set_hl("ReplaceMoody", palette.orange, palette.none)
					set_hl("SelectMoody", palette.yellow, palette.none)
					set_hl("TerminalMoody", palette.aqua, palette.none)
					set_hl("TerminalNormalMoody", palette.aqua, palette.none)
					set_hl("CursorLineNr", {"#73d3de", "284"}, palette.none)
				end,
			})
			vim.cmd.colorscheme("gruvbox-material")
		end,
	},
}

local lualine = require("lualine")
local icon = require("config.icons")
local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn", "info", "hint" },
	symbols = {
		error = icon.diagnostics.Error,
		hint = icon.diagnostics.Hint,
		info = icon.diagnostics.Info,
		warn = icon.diagnostics.Warning,
	},
	colored = true,
	update_in_insert = false,
	always_visible = false,
}

local diff = {
	"diff",
	source = function()
		local gitsigns = vim.b[vim.api.nvim_get_current_buf()].minidiff_summary
		if gitsigns then
			return {
				added = gitsigns.add,
				modified = gitsigns.change,
				removed = gitsigns.delete,
			}
		end
	end,
	symbols = {
		added = icon.git.LineAdded .. " ",
		modified = icon.git.LineModified .. " ",
		removed = icon.git.LineRemoved .. " ",
	},
	colored = true,
	always_visible = false,
}

local icons = require("config.icons")
local lsp_progress = require("lsp-progress")
lsp_progress.setup({
	spinner = icons.spinner,
	client_format = function(client_name, spinner, series_messages)
		if #series_messages > 0 then
			return ("%s %s %s"):format(client_name, spinner, table.concat(series_messages, ", "))
		end
		return nil
	end,
	format = function(messages)
		if #messages > 0 then
			return ("%s %s"):format(icons.ui.LSP, table.concat(messages, " "))
		end

		local clients = vim.lsp.get_clients()
		local client_names = {}

		for _, client in ipairs(clients) do
			if client.name == "null-ls" then
			else
				table.insert(client_names, client.name)
			end
		end
		return ("%s %s"):format(icons.kind.Event, table.concat(client_names, " "))
	end,
})
vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
vim.api.nvim_create_autocmd("User", {
	group = "lualine_augroup",
	pattern = "LspProgressStatusUpdated",
	callback = function()
		lualine.refresh()
	end,
})
lualine.setup({
	options = {
		theme = require("lualine.themes.gruvbox_custom"),
		globalstatus = true,
		section_separators = "",
		component_separators = "",
		disabled_filetypes = { "mason", "lazy", "NvimTree", "TelescopePrompt" },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", diff },
		lualine_c = { "filename", lsp_progress.progress },
		lualine_x = { diagnostics, "filetype" },
		lualine_y = {},
		lualine_z = { "location" },
	},
})

return {
	{
		"nvim-telescope/telescope.nvim",
		opts = function()
			local conf = require("nvchad.configs.telescope")
			-- conf.defaults.mappings.i = {
			-- 	["<CR>"] = "select_drop",
			-- 	["<C-b>"] = "select_default",
			-- 	["<C-'>"] = "select_horizontal",
			-- 	["<C-;>"] = "select_vertical",
			-- 	["<C-g>"] = function(prompt_bufnr)
			-- 		-- Use nvim-window-picker to choose the window by dynamically attaching a function
			-- 		local action_set = require("telescope.actions.set")
			-- 		local action_state = require("telescope.actions.state")
			--
			-- 		local picker = action_state.get_current_picker(prompt_bufnr)
			-- 		picker.get_selection_window = function(picker, entry)
			-- 			local picked_window_id = require("window-picker").pick_window()
			-- 				or vim.api.nvim_get_current_win()
			-- 			-- Unbind after using so next instance of the picker acts normally
			-- 			picker.get_selection_window = nil
			-- 			return picked_window_id
			-- 		end
			--
			-- 		return action_set.edit(prompt_bufnr, "edit")
			-- 	end,
			-- }
			return conf
		end,
	},
}

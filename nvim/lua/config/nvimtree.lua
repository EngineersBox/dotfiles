return {
	filters = { dotfiles = false },
	disable_netrw = true,
	hijack_cursor = true,
	sync_root_with_cwd = true,
    select_prompts = true,
	update_focused_file = {
		enable = true,
		update_root = false,
	},
	view = {
		width = 30,
		preserve_window_proportions = true,
	},
	renderer = {
		root_folder_label = false,
		highlight_git = true,
		indent_markers = { enable = false },
		icons = {
			glyphs = {
				default = "",
				symlink = "",
				bookmark = "󰆤",
				modified = "●",
				hidden = "󰜌",
				folder = {
					arrow_closed = "",
					arrow_open = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "󰉒",
					symlink_open = "",
				},
				git = {
					unstaged = "✗",
					staged = "✓",
					unmerged = "",
					renamed = "➜",
					untracked = "★",
					deleted = "",
					ignored = "◌",
				},
			},
		},
	},
}

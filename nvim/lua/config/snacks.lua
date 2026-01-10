---@type snacks.Config
return {
	bigfile = { enabled = true },
	dashboard = { enabled = true },
    image = { enabled = true },
	indent = { enabled = true },
	input = { enabled = true },
	picker = { enabled = true },
	quickfile = { enabled = true },
	scope = { enabled = true },
    scratch = { enabled = true },
	scroll = { enabled = true },
	statuscolumn = {
		enabled = true,
		left = { "mark", "sign" }, -- priority of signs on the left (high to low)
		right = { "fold", "git" }, -- priority of signs on the right (high to low)
		folds = {
			open = false, -- show open fold icons
			git_hl = false, -- use Git Signs hl for fold icons
		},
		git = {
			-- patterns to match Git signs
			patterns = { "GitSign", "MiniDiffSign" },
		},
		refresh = 50, -- refresh at most every 50ms
	},
	words = { enabled = true },
}

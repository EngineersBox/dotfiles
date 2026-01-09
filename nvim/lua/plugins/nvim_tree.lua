return {
	{
		"nvim-tree/nvim-web-devicons",
	},
	{
		"nvim-tree/nvim-tree.lua",
		cmd = { "NvimTreeToggle", "NvimTreeFocus" },
		config = function(_)
			require("nvim-tree").setup(require("config.nvimtree"))
		end,
	},
}

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
        enabled = false,
	},
	{
		{
			"nvim-neo-tree/neo-tree.nvim",
			branch = "v3.x",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"MunifTanjim/nui.nvim",
				"nvim-tree/nvim-web-devicons", -- optional, but recommended
			},
			lazy = false, -- neo-tree will lazily load itself
            opts = function()
                return require("config.neotree")
            end
		},
	},
}

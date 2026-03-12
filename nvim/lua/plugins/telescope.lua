return {
	{
		"nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
		cmd = "Telescope",
		config = function()
			require("telescope").setup(require("config.telescope"))
		end,
	},
	{
		"jmacadie/telescope-hierarchy.nvim",
		dependencies = {
			{
				"nvim-telescope/telescope.nvim",
			},
		},
		config = function(_, opts)
			require("telescope").load_extension("hierarchy")
		end,
	},
}

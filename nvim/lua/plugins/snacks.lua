return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = function()
		    return require("config.snacks")
		end,
	},
}

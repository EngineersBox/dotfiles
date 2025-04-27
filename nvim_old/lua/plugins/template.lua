
return {
	{
		"motosir/skel-nvim",
        lazy = false,
		config = function()
			require("skel-nvim").setup(require("configs.templates"))
		end,
	},
}

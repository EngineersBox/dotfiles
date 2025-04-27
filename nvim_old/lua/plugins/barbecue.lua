return {
    {
        "utilyre/barbecue.nvim",
        version = "*",
        name = "barbecue",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        opts = {
            attach_navic = false,
        },
        init = function()
            require("barbecue.ui").toggle(true)
        end,
    }
}


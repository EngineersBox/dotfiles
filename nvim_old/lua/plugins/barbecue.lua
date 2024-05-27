return {
    {
        "utilyre/barbecue.nvim",
        version = "*",
        name = "barbecue",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        config = function(_, _)
            require("barbecue.ui").toggle(true)
        end
    }
}


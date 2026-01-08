return {
    {
        "saecki/crates.nvim",
        lazy = true,
        version = "*"
    },
    {
        "mrcjkb/rustaceanvim",
        version = '^6.0.2', -- Recommended
        lazy = false,
        dependencies = {
            "lvimuser/lsp-inlayhints.nvim",
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        config = function()
            require("config.rust")
        end
    }
}

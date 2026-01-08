return {
    {
        "mubin-thinks/charcoal.nvim",
        dependencies = { "nvim-mini/mini.base16" },
        lazy = false,
        priority = 1000,
        config = function()
            require("charcoal").setup()
        end
    }
}


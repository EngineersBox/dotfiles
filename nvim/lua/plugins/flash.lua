return {
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {},
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash search" },
            { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash treesitter" },
            { "r", mode = "o", function() require("flash").remote() end, desc = "Flash remote search (e.g. yr" },
            { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Flash treesitter search (e.g yR)" },
            { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Flash in-code search" },
        },
    }
}

return {
    {
        "ray-x/guihua.lua",
        build = "cd lua/fzy && make"
    },
    {
        "ray-x/sad.nvim",
        lazy = true,
        event = "VeryLazy",
        dependencies = {
            "ray-x/guihua.lua"
        },
        opts = {
            debug = false, -- print debug info
              diff = 'delta', -- you can use `less`, `diff-so-fancy`
              ls_file = 'fd', -- also git ls-files
              exact = false, -- exact match
              vsplit = false, -- split sad window the screen vertically, when set to number
              -- it is a threadhold when window is larger than the threshold sad will split vertically,
              height_ratio = 0.6, -- height ratio of sad window when split horizontally
              width_ratio = 0.6, -- height ratio of sad window when split vertically
        }
    }
}

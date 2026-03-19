return {
    {
        "ej-shafran/compile-mode.nvim",
        branch = "latest",
        lazy = false,
        config = function() 
            return require("config.compile_mode")
        end
    }
}

return {
    {
        "luukvbaal/statuscol.nvim",
        lazy = false,
        config = function()
            require("statuscol").setup(require("config.status_col"))
        end
    }
}

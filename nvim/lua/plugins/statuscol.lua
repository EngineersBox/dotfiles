return {
    {
        "luukvbaal/statuscol.nvim",
        lazy = false,
        enabled = false,
        config = function()
            require("statuscol").setup(require("config.status_col"))
        end
    }
}

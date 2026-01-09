return {
    {
        "serhez/bento.nvim",
        enabled = false,
        lazy = false,
        opts = function()
            return require("config.bento")
        end
    }
}

return {
    {
        "serhez/bento.nvim",
        lazy = false,
        opts = function()
            return require("config.bento")
        end
    }
}

return {
    {
        "sphamba/smear-cursor.nvim",
        init = function()
            local cursor = require("smear_cursor")
            cursor.setup({})
        end,
    }
}

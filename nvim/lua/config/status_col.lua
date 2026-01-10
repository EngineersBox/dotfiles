local builtin = require("statuscol.builtin")
return {
    segments = {
        {
            text = { builtin.foldfunc },
            click = "v:lua.ScFa",
        },
        {
            sign = {
                namespace = { "diagnostic" },
                maxwidth = 1,
                colwidth = 1,
            },
            click = "v:lua.ScSa",
            condition = { builtin.not_empty },
        },
        {
            text = { builtin.lnumfunc },
            click = "v:lua.ScLa",
            condition = { true, builtin.not_empty },
        },
        -- {
        --     sign = {
        --         name = { ".*" }, -- marks
        --         maxwidth = 2,
        --         colwidth = 1,
        --     },
        --     click = "v:lua.ScSa",
        --     condition = { builtin.not_empty },
        -- },
        {
            sign = {
                namespace = { "gitsigns" },
                maxwidth = 1,
                colwidth = 1,
            },
            condition = { builtin.not_empty },
        },
    },
}

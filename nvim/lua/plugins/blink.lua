return {
    {
        "windwp/nvim-autopairs",
        opts = {
            fast_wrap = {},
            disable_filetype = { "TelescopePrompt", "vim" },
        },
    },
    {
        "onsails/lspkind.nvim"
    },
    {
        "saghen/blink.cmp",
        dependencies = {
            "windwp/nvim-autopairs",
        },
        version = "1.*",
        event = { "InsertEnter", "CmdLineEnter" },
        opts = function()
            return require("config.blink")
        end,
        opts_extend = { "sources.default" }
    }
}

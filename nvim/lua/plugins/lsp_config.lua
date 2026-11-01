return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
        build = ":TSUpdate",
        config = function()
            require("config/treesitter")
        end
    },
    {
        "neovim/nvim-lspconfig",
        event = "VeryLazy",
        dependencies = {
            "williamboman/mason.nvim",
            "antosha417/nvim-lsp-file-operations",
        },
        config = function(_, _)
            require("config.lspconfig")
        end,
        opts = {
            diagnostics = {
                virtual_text = true,
            },
            inlay_hints = {
                enabled = true
            }
        }
    }
}

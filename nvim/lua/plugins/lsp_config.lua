return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
        build = ":TSUpdate",
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
    },
    {
        "MysticalDevil/inlay-hints.nvim",
        event = "LspAttach",
        dependencies = { "neovim/nvim-lspconfig" },
        config = function()
            local inlay_hints = require("inlay-hints")
            inlay_hints.setup()
        end
    }
}

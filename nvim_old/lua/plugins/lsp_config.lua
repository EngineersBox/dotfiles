return {
    {
        "neovim/nvim-lspconfig",
        config = function(_, _)
            local nvchad_configs = require("nvchad.configs.lspconfig")
            nvchad_configs.defaults()
            require("configs.lspconfig")
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
-- return {
--     {
--        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
--         opts = {
--             diagnostics = {
--                 virtual_text = false
--             }
--         }
--     }
-- }

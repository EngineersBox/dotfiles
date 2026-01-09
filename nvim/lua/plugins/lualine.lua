return {
    {
    "linrongbin16/lsp-progress.nvim",
        event = "LspAttach",
    },
    {
        'nvim-lualine/lualine.nvim',
        lazy = false,
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require("config.lualine")
        end
    }
}

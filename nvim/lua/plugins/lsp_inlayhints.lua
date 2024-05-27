return {
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

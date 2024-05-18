return {
    "sainnhe/sonokai",
    lazy = false,
    priority = 1000,
    config = function()
        vim.g.sonokai_style = "default"
        vim.g.sonokai_diagnostic_virtual_text = "highlighted"
        -- vim.cmd([[colorscheme sonokai]])
    end
}

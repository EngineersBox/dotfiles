return {
    "sainnhe/sonokai",
    lazy = false,
    priority = 1000,
    config = function()
        vim.cmd([[colorscheme sonokai]])
        vim.g.sonokai_style="default"
        vim.g.sonokai_daignostic_virtual_text=""
    end
}

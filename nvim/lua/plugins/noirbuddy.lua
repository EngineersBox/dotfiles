return {
    {
        'jesseleite/nvim-noirbuddy',
        dependencies = {
            { 'tjdevries/colorbuddy.nvim' }
        },
        lazy = true,
        priority = 999,
        opts = {
            preset = "minimal",
            colors = {
                primary = "#b85456",
                background = "#211f1e"
            }
        }
    },
    {
        "ntk148v/komau.vim",
        lazy = false
    },
    {
        "kdheepak/monochrome.nvim",
        lazy = false
    }
}

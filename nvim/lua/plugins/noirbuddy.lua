return {
    {
        'jesseleite/nvim-noirbuddy',
        dependencies = {
            { 'tjdevries/colorbuddy.nvim' }
        },
        lazy = true,
        priority = 999,
        opts = {
            preset = "crt-amber",
            colors = {
                primary = "#b85456"
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

return {
    {
        'Bekaboo/dropbar.nvim',
        dependencies = {
          'nvim-telescope/telescope-fzf-native.nvim',
          build = 'make'
        },
        lazy = false,
        -- event = "InsertEnter",
        config = function()
            require("dropbar").setup({})
        end
    },
}


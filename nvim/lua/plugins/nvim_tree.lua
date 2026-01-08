return {
    {
        "nvim-tree/nvim-tree.lua",
        lazy = false,
        config = function(opts)
            require("nvim-tree").setup(require("config.nvimtree"))
        end
    }
}

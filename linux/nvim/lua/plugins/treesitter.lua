return {
    "nvim-treesitter/nvim-treesitter",
    priority = 100,
    config = function(_)
        require("nvim-treesitter.configs").setup({
            ensure_installed = "all",
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            matchup = {
                enable = true
            },
            indent = {
                enable = true
            }
        })
    end
}

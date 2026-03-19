vim.api.nvim_create_autocmd("User", {
    pattern = "TSUpdate",
    callback = function()
        require("nvim-treesitter.parsers").comment = {
            install_info = {
                url = "https://github.com/OXY2DEV/tree-sitter-comment",

                branch = "main", -- only needed if different from default branch
                queries = "queries/",
            },
        }
    end
})
return {
    highlight = {
        enable = true,
        use_languagetree = true,
    },
    indent = { enable = true },
}

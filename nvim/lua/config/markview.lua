vim.api.nvim_create_autocmd("User", {
    pattern = "TSUpdate",
    callback = function ()
        require("nvim-treesitter.parsers").asciidoc = {
            install_info = {
                branch = "master",
                location = "tree-sitter-asciidoc",
                queries = "queries/asciidoc/",
                requires = { "asciidoc_inline" },
                url = "https://github.com/cathaysia/tree-sitter-asciidoc"
            }
        };
        require("nvim-treesitter.parsers").asciidoc_inline = {
            install_info = {
                branch = "master",
                location = "tree-sitter-asciidoc_inline",
                queries = "queries/asciidoc_inline",
                url = "https://github.com/cathaysia/tree-sitter-asciidoc"
            }
        };
    end
});
return {}

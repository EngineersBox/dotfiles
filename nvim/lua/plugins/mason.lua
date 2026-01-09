return  {
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        opts = {
            registries = {
                "github:mason-org/mason-registry",
            },
            ui = {
                icons = {
                    package_pending = " ",
                    package_installed = " ",
                    package_uninstalled = " ",
                },
            },
            max_concurrent_installers = 10,
            ensure_installed = {
                "lua-language-server",
                "html-lsp",
                "prettier",
                "stylua",
                "jdtls",
                "java-language-server",
                "json-lsp",
                "gopls",
                "glint",
                "groovy-language-server",
                "cmake-language-server",
                "clojure-lsp",
                "vim-language-server",
                "asm-lsp",
                "bash-language-server",
                "awk-language-server",
                "dot-language-server",
                "texlab",
                "buf-language-server",
                "dockerfile-language-server",
                "docker-compose-language-server",
                "marksman",
                "jinja-lsp"
            },
            automatic_enable = false
        },
    }
}


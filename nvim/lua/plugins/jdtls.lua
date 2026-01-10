return {
    {
        "mfussenegger/nvim-jdtls",
        ft = "java",
        config = function()
            local on_attach = function(client, bufnr)
                require("config.lspconfig").on_attach(client, bufnr)
            end
            local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
            local jdtls_workspace_dir = vim.fs.abspath('~/.cache/' .. project_name)
            local config = {
                on_attach = on_attach,
                cmd = {
                    "jdtls",
                    "--jvmArg=-Declipse.application=org.eclipse.jdt.ls.core.id1",
                    "--jvmArg=-Dosgi.bundles.defaultStartLevel=4",
                    "--jvmArg=-Declipse.product=org.eclipse.jdt.ls.core.product",
                    "--jvmArg=-Dlog.level=ALL",
                    "--jvmArg=-Xmx4G",
                    "--jvmArg=--add-modules=ALL-SYSTEM",
                    "--jvmArg=--add-opens java.base/java.util=ALL-UNNAMED",
                    "--jvmArg=--add-opens java.base/java.lang=ALL-UNNAMED",
                    "-data", jdtls_workspace_dir
                },
                root_dir = vim.fs.root(0, {
                    "gradlew",
                    "build.gradle",
                    ".git",
                    "pom.xml"
                }),
                java = {
                    import = {
                        gradle = {
                            enabled = true,
                        },
                        maven = {
                            enabled = true,
                        },
                        exclusions = {
                            "**/node_modules/**",
                            "**/.metadata/**",
                            "**/archetype-resources/**",
                            "**/META-INF/maven/**",
                            "/**/test/**"
                        }
                    },
                    maven = {
                        downloadSources = true,
                    },
                    quickfix = {
                        enabled = true,
                    },
                    rename = {
                        enabled = true,
                    },
                    signatureHelp = {
                        enabled = true,
                        description = true,
                    },
                    completion = {
                        importOrder = {
                            "java",
                            "javax",
                            "com",
                            "org",
                        },
                    },
                }
            }
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "java",
                callback = function()
                    require("jdtls").start_or_attach(config)
                end,
            })
        end
    }
}

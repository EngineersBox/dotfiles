return {
    {
        "mfussenegger/nvim-jdtls",
        config = function()
            local config = {
                cmd = {"jdtls", "-data", vim.fn.getcwd()},
                root_dir = vim.fs.root(0, {".git", "mvnw", "gradlew", "pom.xml"}),
                settings = {
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
                    },
                },
            }
            require("jdtls").start_or_attach(config)
        end,
    }
}

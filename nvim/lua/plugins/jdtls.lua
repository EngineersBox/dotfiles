return {
    {
        "mfussenegger/nvim-jdtls",
        config = function()
            local config = {
                cmd = {
                    "java",
                    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
                    "-Dosgi.bundles.defaultStartLevel=4",
                    "-Declipse.product=org.eclipse.jdt.ls.core.product",
                    "-Dlog.protocol=true",
                    "-Dlog.level=ALL",
                    "-Xmx1g",
                    "--add-modules=ALL-SYSTEM",
                    "--add-opens", "java.base/java.util=ALL-UNNAMED",
                    "--add-opens", "java.base/java.lang=ALL-UNNAMED",
                    "-jar", "/opt/homebrew/opt/jdtls/libexec/plugins/org.eclipse.equinox.launcher.cocoa.macosx.aarch64_1.2.1300.v20250331-1702.jar",
                    "-configuration", "/opt/homebrew/opt/jdtls/libexec/config_mac",
                    "-data", vim.fn.getcwd(),
                },
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

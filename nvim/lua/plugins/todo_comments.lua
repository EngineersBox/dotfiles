return {
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        event = "VeryLazy",
        opts = {
            search = {
                command = "rg",
                args = {
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                },
                keywords = {
                    FIX  = { icon = " ", color = "info", alt = { "body", } },
                    TODO = { icon = " ", color = "info", alt = { "todo", } },
                    HACK = { icon = " ", color = "warning", alt = { "hack", } },
                    WARN = { icon = " ", color = "warning", alt = { "warn", } },
                    TEST = { icon = "⏲ ", color = "test", alt = { "test", } },
                    DEBUG = { icon = " ", color = "warning", alt = { "test", } },
                },
                merge_keywords = false,
                -- regex that will be used to match keywords.
                -- don't replace the (KEYWORDS) placeholder
                pattern = [[\b(KEYWORDS):]], -- ripgrep regex
                -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
            },
        }
    }
}

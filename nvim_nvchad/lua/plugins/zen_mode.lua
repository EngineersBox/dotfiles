return {
    {
        "folke/zen-mode.nvim",
        init = function()
            require("zen-mode").setup({
                on_open = function(win)
                    vim.cmd("highlight clear")
                    vim.opt.laststatus = 0
                    require("noirbuddy").setup({
                        preset = "crt-amber",
                        colors = {
                            primary = "#b85456"
                        }
                    })
                    -- vim.cmd.colorscheme("lackluster")
                end,
                on_close = function()
                    vim.cmd("highlight clear")
                    vim.opt.laststatus = 3
                    local state = require("nvchad.themes.state")
                    local utils = require("nvchad.themes.utils")
                    local config = require("nvconfig")
                    state.active_theme = config.base46.theme
                    state.confirmed = true
                    local name = config.base46.theme
                    package.loaded.chadrc = nil
                    local old_theme = require("chadrc").base46.theme
                    old_theme = '"' .. old_theme .. '"'
                    require("nvchad.utils").replace_word(old_theme, '"' .. name .. '"')
                    vim.cmd.colorscheme("gruvbox-material")
                    utils.reload_theme(name)
                end
            })
        end
    },
    {
        "slugbyte/lackluster.nvim",
        lazy = false,
        priority = 1000,
        init = function()
            -- vim.cmd.colorscheme("lackluster")
            -- vim.cmd.colorscheme("lackluster-hack") -- my favorite
            -- vim.cmd.colorscheme("lackluster-mint")
        end,
    },
    {
        "zenbones-theme/zenbones.nvim",
        -- Optionally install Lush. Allows for more configuration or extending the colorscheme
        -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
        -- In Vim, compat mode is turned on as Lush only works in Neovim.
        dependencies = "rktjmp/lush.nvim",
        lazy = false,
        priority = 1000,
        -- you can set set configuration options here
        -- config = function()
        --     vim.g.zenbones_darken_comments = 45
        --     vim.cmd.colorscheme('zenbones')
        -- end
    },
    {
        "wnkz/monoglow.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            on_colors = function(colors)
                colors.glow = "#b85456"
            end
        },
    }
}

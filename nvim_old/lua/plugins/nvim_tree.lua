return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        { "nvim-tree/nvim-web-devicons" }
    },
    opts = {
        renderer = {
            icons = {
                show = {
                    folder_arrow = true
                }
            },
            indent_markers = {
                enable = true
            },
            highlight_git = true,
            highlight_diagnostics = true,
            highlight_opened_files = "all",
            highlight_modified = "all",
            highlight_bookmarks = "all",
        },
        on_attach = function(bufnr)
            local api = require("nvim-tree.api")
            local function opts(desc)
                return {
                    desc = "nvim-tree: " .. desc,
                    buffer = bufnr,
                    noremap = true,
                    silent = true,
                    nowait = true
                }
            end
            -- default mappings
            api.config.mappings.default_on_attach(bufnr)
            -- custom mappings
            vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
            vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
            local treeutils = require("treeutils")
            vim.keymap.set('n', '<c-f>', treeutils.launch_find_files, opts('Launch Find Files'))
            vim.keymap.set('n', '<c-g>', treeutils.launch_live_grep,  opts('Launch Live Grep'))
        end
    }
}

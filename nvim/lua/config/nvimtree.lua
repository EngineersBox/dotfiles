return {
    hijack_cursor = true,
    filters = {
        custom = { "^.git$" },
        dotfiles = false,
    },
    sync_root_with_cwd = true,
    update_focused_file = {
        enable = true,
        update_root = true,
    },
    git = {
        enable = true,
        show_on_dirs = false,
    },
    renderer = {
        root_folder_label = false,
        highlight_git = false,
    },
    view = {
        adaptive_size = true,
    },
}

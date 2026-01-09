return {
    {
        "rmagatti/goto-preview",
        dependencies = {
            "rmagatti/logger.nvim",
            "nvim-telescope/telescope.nvim",
        },
        event = "BufEnter",
        opts = {
            references = { -- Configure the telescope UI for slowing the references cycling window.
                provider = "telescope", -- telescope|fzf_lua|snacks|mini_pick|default
                telescope = require("telescope.themes").get_dropdown({ hide_preview = false })
            },
        },
        config = true, -- necessary as per https://github.com/rmagatti/goto-preview/issues/88}
    }
}

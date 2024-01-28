return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim"
        }
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
        config = function(_, _)
            local telescope = require("telescope")
            telescope.load_extension("fzf")
            -- NOTE: Requires rcarriga/nvim-notify
            --telescope.load_extension("notify")
        end
    },
    {
        "nvim-telescope/telescope-project.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim"
        },
        config = function(_, _)
            require("telescope").load_extension("project")
        end
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim"
        },
        config = function(_, _)
            require("telescope").load_extension("file_browser")
        end

    },
    {
        "joehannes-os/telescope-media-files.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim"
        },
        config = function(_, _)
            require("telescope").load_extension("media_files")
        end
    }
}

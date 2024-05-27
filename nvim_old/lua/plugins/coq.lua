return {
    {
        "ms-jpq/coq_nvim",
        dependencies = {
            "neovim/nvim-lspconfig"
        },
        branch = "coq",
        init = function()
            vim.cmd([[
                let g:coq_settings = { "auto_start": "shut-up" }
            ]])
        end
    },
    {
        "ms-jpq/coq.artifacts",
        dependencies  = {
            "ms-jpq/coq_nvim"
        },
        branch = "artifacts"
    },
    {
        "ms-jpq/coq.thirdparty",
        dependencies  = {
            "ms-jpq/coq_nvim"
        },
        branch = "3p"
    }
}

local lsps = {
    "pyright",
    "tsserver",
    "rust_analyzer",
    "cmake",
    "clangd",
    "clojure_lsp",
    "gopls",
    "terraformls",
    "vimls",
    "asm_lsp",
    "bashls",
    "dotls",
    "glslls",
    "svlangserver",
    "texlab",
    "ansiblels",
    "bufls",
    "dockerls",
    "opencl_ls",
    "marksman"
}

return {
    {
        "ray-x/guihua.lua",
        build = "cd lua/fzy && make"
    },
    {
        "ray-x/navigator.lua",
        dependencies = {
            "ray-x/guihua.lua",
        },
        opts = {
            lsp = {
                enabled = true,
                format_on_save = true,
                diagnostic = {
                    virtual_text = true,
                    update_in_insert = true,
                },
                disable_lsp = "all"
                --servers = lsps
            }
        }
    }
}
-- return {}

return {
    {
        "saecki/crates.nvim",
        lazy = true,
        version = "*"
    },
    {
        "mrcjkb/rustaceanvim",
        version = '^6.0.2', -- Recommended
        lazy = false,
        dependencies = {
            "lvimuser/lsp-inlayhints.nvim",
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        config = function()
            local nvchad_configs = require("nvchad.configs.lspconfig")
            -- Mappings.
            -- See `:help vim.diagnostic.*` for documentation on any of the below functions
            local key_opts = { noremap = true, silent = true }
            vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, key_opts)
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, key_opts)
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next, key_opts)
            vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, key_opts)
            local bufopts = { noremap = true, silent = true }
            -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
            -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
            -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
            -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
            -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
            -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
            -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
            -- vim.keymap.set('n', '<space>wl', function()
            --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            -- end, bufopts)
            -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
            -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
            vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)

            -- Use an on_attach function to only map the following keys
            -- after the language server attaches to the current buffer
            local on_attach = function(client, bufnr)
                nvchad_configs.on_attach(client, bufnr)
                if client.server_capabilities["documentSymbolProvider"] then
                    require("nvim-navic").attach(client, bufnr)
                end
                local bufnr = vim.api.nvim_get_current_buf()
                vim.keymap.set(
                    "n",
                    "dr",
                    function()
                      vim.cmd.RustLsp({'relatedDiagnostics'})
                    end,
                    { silent = true, buffer = bufnr }
                )
                vim.keymap.set(
                    "n",
                    "J",
                    function()
                      vim.cmd.RustLsp({'joinLines'})
                    end,
                    { silent = true, buffer = bufnr }
                )
            end
            vim.g.rustaceanvim = {
                inlay_hints = {
                    highlight = "NonText",
                },
                tools = {
                    hover_actions = {
                        auto_focus = true,
                    },
                },
                server = {
                    on_init = nvchad_configs.on_init,
                    on_attach = on_attach,
                    capabilities = nvchad_configs.capabilities,
                },
            }
        end
    }
}

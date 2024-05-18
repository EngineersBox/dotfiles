return {
    {
        "saecki/crates.nvim",
        tag = "stable",
        config = function()
            require("crates").setup()
        end,
    },
    {
        "mrcjkb/rustaceanvim",
        version = '^4', -- Recommended
        ft = { 'rust' },
        init = function()
            local on_attach = function(client, bufnr)
		require("inlay-hints").on_attach(client, bufnr)
                -- Enable completion triggered by <c-x><c-o>
                vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
                -- Mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local bufopts = { noremap = true, silent = true, buffer = bufnr }
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
                vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
                vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
                vim.keymap.set('n', '<space>wl', function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, bufopts)
                vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
                vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
                vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
                vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)

                -- require("lsp_signature").on_attach({}, bufnr)
                -- vim.keymap.set(
                --     { 'n' },
                --     '<C-k>',
                --     function() require('lsp_signature').toggle_float_win() end,
                --     bufopts
                -- )
                --
                -- vim.keymap.set(
                --     { 'n' },
                --     '<Leader>k',
                --     function() vim.lsp.buf.signature_help() end,
                --     bufopts
                -- )
            end
            vim.g.rustaceanvim = {
                server = {
                    on_attach = on_attach,
                    settings = {
                        ["rust-analyzer"] = {
                            inlayHints = {
                              bindingModeHints = {
                                enable = false,
                              },
                              chainingHints = {
                                enable = true,
                              },
                              closingBraceHints = {
                                enable = true,
                                minLines = 25,
                              },
                              closureReturnTypeHints = {
                                enable = "never",
                              },
                              lifetimeElisionHints = {
                                enable = "never",
                                useParameterNames = false,
                              },
                              maxLength = 25,
                              parameterHints = {
                                enable = true,
                              },
                              reborrowHints = {
                                enable = "never",
                              },
                              renderColons = true,
                              typeHints = {
                                enable = true,
                                hideClosureInitialization = false,
                                hideNamedConstructor = false,
                              },
                            },
                        }
                    }
                },
            }
        end
    }
}

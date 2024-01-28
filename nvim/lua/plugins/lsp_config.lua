return {
    {
        "neovim/nvim-lspconfig",
        config = function(_, _)
            local lspconfig = require("lspconfig")
            -- Mappings.
            -- See `:help vim.diagnostic.*` for documentation on any of the below functions
            local key_opts = { noremap=true, silent=true }
            vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, key_opts)
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, key_opts)
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next, key_opts)
            vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, key_opts)

            -- Use an on_attach function to only map the following keys
            -- after the language server attaches to the current buffer
            local on_attach = function(_, bufnr)
              -- Enable completion triggered by <c-x><c-o>
              vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

              -- Mappings.
              -- See `:help vim.lsp.*` for documentation on any of the below functions
              local bufopts = { noremap=true, silent=true, buffer=bufnr }
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
            end

            lspconfig['jdtls'].setup({
                on_attach = on_attach,
                cmd = { "jdtls" },
                root_dir = function(name)
                    return lspconfig['jdtls'].util.root_pattern(
                        'pom.xml',
                        'gradle.build',
                        '.git'
                    )(name) or vim.fn.getcwd()
                end
            })
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = true

            lspconfig['jsonls'].setup({
                on_attach = on_attach,
                capabilities = capabilities
            })
            lspconfig['lua_ls'].setup({
                on_attach = on_attach,
                settings = {
                    Lua = {
                        runtime = {
                            version = 'LuaJIT',
                        },
                        diagnostics = {
                            globals = {'vim'},
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            })
            local lsps = {
                'pyright',
                'tsserver',
                -- 'rust_analyzer',
                'cmake',
                'clangd',
                'clojure_lsp',
                'gopls',
                'terraformls',
                'vimls',
                'asm_lsp',
                'bashls',
                'dotls',
                'glslls',
                'svlangserver',
                'texlab',
                'ansiblels',
                'bufls',
                'dockerls',
                'opencl_ls',
                'marksman'
            }
            for _,lsp_name in ipairs(lsps) do
                lspconfig[lsp_name].setup({
                    on_attach = on_attach,
                })
            end
        end
    }
}

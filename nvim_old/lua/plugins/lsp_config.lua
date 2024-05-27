return {
    {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        opts = {},
        config = function(_, opts)
            require("lsp_signature").setup(opts)
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function(_, _)
            vim.lsp.set_log_level("debug")
            local lspconfig = require("lspconfig")
            -- Mappings.
            -- See `:help vim.diagnostic.*` for documentation on any of the below functions
            local key_opts = { noremap = true, silent = true }
            vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, key_opts)
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, key_opts)
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next, key_opts)
            vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, key_opts)

            -- Use an on_attach function to only map the following keys
            -- after the language server attaches to the current buffer
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
                            globals = { 'vim' },
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                        telemetry = {
                            enable = false,
                        },
			hint = {
			    enable = false,
			}
                    },
                },
            })
            local lsps = {
                'pyright',
                'tsserver',
                'cmake',
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
            for _, lsp_name in ipairs(lsps) do
                lspconfig[lsp_name].setup({
                    on_attach = on_attach,
                })
            end
            lspconfig["zls"].setup({
                on_attach = on_attach,
                settings = {
                    zls = {
                        enable_inlay_hints = true,
                        inlay_hints_show_builtin = true,
                        inlay_hints_exclude_single_argument = true,
                        inlay_hints_hide_redundant_param_names = false,
                        inlay_hints_hide_redundant_param_names_last_token = false,
                    },
                }
            })
            local root_pattern = lspconfig.util.root_pattern('.git')
            -- Might be cleaner to try to expose this as a pattern from `lspconfig.util`, as
            -- really it is just stolen from part of the `clangd` config
            local function format_clangd_command()
                -- Turn the name of the current file into the name of an expected container, assuming that
                -- the container running/building this file is named the same as the basename of the project
                -- that the file is in
                --
                -- The name of the current buffer
                local bufname = vim.api.nvim_buf_get_name(0)
                -- Project root
                local project_root = vim.loop.cwd()
                -- Turned into a filename
                local filename = lspconfig.util.path.is_absolute(bufname) and bufname or lspconfig.util.path.join(project_root, bufname)
                -- Then the directory of the project
                local project_dirname = root_pattern(filename) or lspconfig.util.path.dirname(filename)
                -- And finally perform what is essentially a `basename` on this directory
                local basename = vim.fn.fnamemodify(lspconfig.util.find_git_ancestor(project_dirname), ':t')
                if (basename == nil) then
                    return nil
                end
                local name, _ = string.gsub(
                    string.lower(basename),
                    "-",
                    "_"
                )
                return { "/usr/local/bin/cclangd", name, project_root }
            end
            lspconfig["ccls"].setup({
                on_attach = on_attach,
                cmd = format_clangd_command(),
            })
        end,
        opts = {
            diagnostics = {
                virtual_text = true,
            },
            inlay_hints = {
                enabled = true
            }
        }
    },
    {
       "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        opts = {
            diagnostics = {
                virtual_text = false
            }
        }
    }
}

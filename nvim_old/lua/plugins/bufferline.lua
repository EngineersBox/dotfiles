return {
    {
        "akinsho/bufferline.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        init = function()
            vim.cmd([[
                nnoremap <silent> n<leader>1 <cmd>lua require("bufferline").go_to(1, true)<CR>
                nnoremap <silent> n<leader>2 <cmd>lua require("bufferline").go_to(2, true)<CR>
                nnoremap <silent> n<leader>3 <cmd>lua require("bufferline").go_to(3, true)<CR>
                nnoremap <silent> n<leader>4 <cmd>lua require("bufferline").go_to(4, true)<CR>
                nnoremap <silent> n<leader>5 <cmd>lua require("bufferline").go_to(5, true)<CR>
                nnoremap <silent> n<leader>6 <cmd>lua require("bufferline").go_to(6, true)<CR>
                nnoremap <silent> n<leader>7 <cmd>lua require("bufferline").go_to(7, true)<CR>
                nnoremap <silent> n<leader>8 <cmd>lua require("bufferline").go_to(8, true)<CR>
                nnoremap <silent> n<leader>9 <cmd>lua require("bufferline").go_to(9, true)<CR>
                nnoremap <silent> n<leader>! <cmd>lua require("bufferline").go_to(1, true)<CR>
                nnoremap <silent> n<leader>@ <cmd>lua require("bufferline").go_to(2, true)<CR>
                nnoremap <silent> n<leader># <cmd>lua require("bufferline").go_to(3, true)<CR>
                nnoremap <silent> n<leader>$ <cmd>lua require("bufferline").go_to(4, true)<CR>
                nnoremap <silent> n<leader>% <cmd>lua require("bufferline").go_to(5, true)<CR>
                nnoremap <silent> n<leader>^ <cmd>lua require("bufferline").go_to(6, true)<CR>
                nnoremap <silent> n<leader>& <cmd>lua require("bufferline").go_to(7, true)<CR>
                nnoremap <silent> n<leader>* <cmd>lua require("bufferline").go_to(8, true)<CR>
                nnoremap <silent> n<leader>( <cmd>lua require("bufferline").go_to(9, true)<CR>
                nnoremap <silent> n<TAB> :BufferLineCycleNext<CR>
                nnoremap <silent> n<S-TAB> :BufferLineCyclePrev<CR>
                nnoremap <silent> n<leader>bp :BufferLinePick<CR>
                nnoremap <silent> n<leader>bd :BufferLinePickClose<CR>
                nnoremap <silent> n<leader>bP :BufferLineTogglePin<CR>
            ]])
        end,
        opts = function(_, opts)
            local configuration = vim.fn['sonokai#get_configuration']()
            local palette = vim.fn['sonokai#get_palette'](configuration.style, configuration.colors_override)
            local bl = require("bufferline")
            opts.options = {
                numbers = function(opts)
                    return string.format('%s·%s', opts.raise(opts.id), opts.lower(opts.ordinal))
                end,
                indicator = {
                    icon = nil,
                    style = "underline"
                },
                color_icons = true,
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        text_align = "center",
                        separator = true,
                        highlight = "Directory"
                    },
                    {
                        filetype = "tagbar",
                        text = "Structure",
                        text_align = "center",
                        separator = true
                    },
                    {
                        filetype = "guihua",
                        text = "LSP | Diagnostic",
                        text_align = "center",
                        separator = true
                    }
                },
                show_buffer_icons = true,
                show_buffer_close_icons = true,
                show_close_icon = true,
                show_tab_indicators = true,
                separator_style = "slant",
                always_show_bufferline = true,
                hover = {
                    enabled = true,
                    delay = 200,
                    reveal = {'close'}
                },
                diagnostics = "nvim-lsp",
                diagnostics_indicator = function(count, level, diagnostics_dict, context)
                    local s = " "
                    for e, n in pairs(diagnostics_dict) do
                        local sym = e == "error" and " " or (e == "warning" and " " or "" )
                        s = s .. n .. sym
                    end
                    return s
                end,
                groups = {
                    options = {
                        toggle_hidden_on_enter = true -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
                    },
                    items = {
                        bl.groups.builtin.pinned,
                        bl.groups.builtin.ungrouped,
                        {
                            name = "Tests", -- Mandatory
                            highlight = {
                                fg = palette.green[1],
                                sp = palette.red[1]
                            }, -- Optional
                            priority = 2, -- determines where it will appear relative to other groups (Optional)
                            icon = "", -- Optional
                            matcher = function(buf) -- Mandatory
                                return buf.name:match('%_test')
                                    or buf.name:match('%_spec')
                            end,
                            separator = {
                                style = require('bufferline.groups').separator.pill,
                            },
                        },
                        {
                            name = "Configs",
                            highlight = {
                                fg = palette.yellow[1],
                                sp = palette.red[1]
                            },
                            priority = 3,
                            matcher = function(buf)
                                return buf.name:match("%.conf")
                                    or buf.name:match("%.toml")
                                    or buf.name:match("%.properties")
                            end,
                            separator = {
                                style = require('bufferline.groups').separator.pill,
                            },
                        },
                        {
                            name = "Docs",
                            highlight = {
                                --underline = false,
                                fg = palette.blue[1],
                                sp = palette.red[1]
                            },
                            auto_close = false,  -- whether or not close this group if it doesn't contain the current buffer
                            matcher = function(buf)
                                return buf.name:match('%.md')
                                    or buf.name:match('%.txt')
                            end,
                            separator = {
                                style = require('bufferline.groups').separator.pill,
                            },
                        }
                    }
                }
            }
        end
    }
}

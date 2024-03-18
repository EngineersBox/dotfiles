return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        init = function()
            vim.cmd([[
                set guioptions-=e " Use showtabline in gui vim
                set sessionoptions+=tabpages,globals " store tabpages and globals in session
            ]])
        end,
        opts = function(_, opts)
            local configuration = vim.fn['sonokai#get_configuration']()
            local palette = vim.fn['sonokai#get_palette'](configuration.style, configuration.colors_override)

            local colors = {
                red = '#cdd6f4',
                grey = '#181825',
                black = '#1e1e2e',
                white = '#313244',
                light_green = '#6c7086',
                orange = '#fab387',
                green = '#a6e3a1',
                blue = '#80A7EA',
            }

            local theme = {
                normal = {
                    a = { fg = colors.black, bg = colors.blue },
                    b = { fg = colors.blue, bg = colors.white },
                    c = { fg = colors.white, bg = colors.black },
                    z = { fg = colors.white, bg = colors.black },
                },
                insert = { a = { fg = colors.black, bg = colors.orange } },
                visual = { a = { fg = colors.black, bg = colors.green } },
                replace = { a = { fg = colors.black, bg = colors.green } },
            }

            local vim_icons = {
                function()
                    return " "
                end,
                separator = { left = "", right = "" },
                color = { bg = "#313244", fg = "#80A7EA" },
            }

            local space = {
                function()
                    return " "
                end,
            }

            local filename = {
                'filename',
                color = { bg = "#80A7EA", fg = "#242735" },
                separator = { left = "", right = "" },
            }

            local filetype = {
                "filetype",
                icon_only = true,
                colored = true,
                color = { bg = "#313244" },
                separator = { left = "", right = "" },
            }

            local filetype_tab = {
                "filetype",
                icon_only = true,
                colored = true,
                color = { bg = "#313244" },
            }

            local buffer = {
            --	require 'tabline'.tabline_buffers,
                {},
                separator = { left = "", right = "" },
            }

            local tabs = {
            --	require 'tabline'.tabline_tabs,
                {},
                separator = { left = "", right = "" },
            }

            local fileformat = {
                'fileformat',
                color = { bg = "#b4befe", fg = "#313244" },
                separator = { left = "", right = "" },
            }

            local encoding = {
                'encoding',
                color = { bg = "#313244", fg = "#80A7EA" },
                separator = { left = "", right = "" },
            }

            local branch = {
                'branch',
                color = { bg = "#a6e3a1", fg = "#313244" },
                separator = { left = "", right = "" },
            }

            local diff = {
                "diff",
                color = { bg = "#313244", fg = "#313244" },
                separator = { left = "", right = "" },
            }

            local modes = {
                'mode', --fmt = function(str) return str:sub(1, 1) end,
                separator = { left = "", right = "" },
            }

            local function getLspName()
                local msg = 'No Active Lsp'
                local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
                local clients = vim.lsp.get_active_clients()
                if next(clients) == nil then
                    return msg
                end
                for _, client in ipairs(clients) do
                    local filetypes = client.config.filetypes
                    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                        return "  " .. client.name
                    end
                end
                return "  " .. msg
            end

            local dia = {
                'diagnostics',
                color = { bg = "#313244", fg = "#80A7EA" },
                separator = { left = "", right = "" },
                sources = { 'nvim_diagnostic' },
                symbols = { error = ' ', warn = ' ', info = ' ' },
                diagnostics_color = {
                    color_error = { fg = palette.red[1] },
                    color_warn = { fg = palette.yellow[1] },
                    color_info = { fg = palette.green[1] },
                },
            }

            local lsp = {
                function()
                    return getLspName()
                end,
                separator = { left = "", right = "" },
                color = { bg = "#f38ba8", fg = "#1e1e2e" },
            }
            opts.options = {
                icons_enabled = true,
                theme = 'sonokai',
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = false, -- true: one statusline at bottom of nvim, false: statusline for every window in nvim
                refresh = {
                    statusline = 1000,
                    winbar = 1000,
                }
            }
            opts.sections = {
                lualine_a = {
                    --{ 'mode', fmt = function(str) return str:gsub(str, "  ") end },
                    modes,
                    vim_icons,
                    --{ 'mode', fmt = function(str) return str:sub(1, 1) end },
                },
                lualine_b = {
                    space,

                },
                lualine_c = {

                    filename,
                    filetype,
                    space,
                    branch,
                    diff,
                },
                lualine_x = {
                    space,
                },
                lualine_y = {
                    encoding,
                    fileformat,
                    space,
                },
                lualine_z = {
                    dia,
                    lsp,
                }
            }
            opts.inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { 'filename' },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {}
            }
            opts.tabline = {}
            opts.winbar = {}
            opts.inactive_winbar = {}
        end
    }
}

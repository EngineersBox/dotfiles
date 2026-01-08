return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
    },
    {
        "neovim/nvim-lspconfig",
        event = "VeryLazy",
        dependencies = {
            "williamboman/mason.nvim",
            "antosha417/nvim-lsp-file-operations",
        },
        config = function(_, _)
            require("config.lspconfig")
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
    "linrongbin16/lsp-progress.nvim",
        event = "LspAttach",
        opts = function()
          local icons = require("config.icons")
          return {
            spinner = icons.spinner,
            client_format = function(client_name, spinner, series_messages)
              if #series_messages > 0 then
                return ("%s %s %s"):format(client_name, spinner, table.concat(series_messages, ", "))
              end
              return nil
            end,
            format = function(messages)
              if #messages > 0 then
                return ("%s %s"):format(icons.ui.LSP, table.concat(messages, " "))
              end

              local clients = vim.lsp.get_clients()
              local client_names = {}

              for _, client in ipairs(clients) do
                if client.name == "null-ls" then
                else
                  table.insert(client_names, client.name)
                end
              end
              return ("%s %s"):format(icons.kind.Event, table.concat(client_names, " "))
            end,
          }
        end,
        config = function(_, opts)
          local lualine = require("lualine")
          local lsp_progress = require("lsp-progress")
          lsp_progress.setup(opts)
          lualine.setup({
            sections = {
              lualine_c = vim.list_extend(lualine.get_config().sections.lualine_c, {
                function()
                  return lsp_progress.progress()
                end,
              }),
            },
          })
          vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
          vim.api.nvim_create_autocmd("User", {
            group = "lualine_augroup",
            pattern = "LspProgressStatusUpdated",
            callback = function()
              lualine.refresh()
            end,
          })
        end,
    },
    {
        "MysticalDevil/inlay-hints.nvim",
        event = "LspAttach",
        dependencies = { "neovim/nvim-lspconfig" },
        config = function()
            local inlay_hints = require("inlay-hints")
            inlay_hints.setup()
        end
    }
}

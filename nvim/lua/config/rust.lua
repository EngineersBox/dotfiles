-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- local key_opts = { noremap = true, silent = true }
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, key_opts)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, key_opts)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, key_opts)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, key_opts)
-- local bufopts = { noremap = true, silent = true }
-- local function opts(desc)
--     return { buffer = bufnr, desc = "LSP " .. desc }
-- end
-- local map = vim.keymap.set
-- map("n", "gD", vim.lsp.buf.declaration, opts("LSP go to declaration"))
-- map("n", "gd", vim.lsp.buf.definition, opts("LSP go to definition"))
-- map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts("Workspace add folder"))
-- map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts("Workspace remove folder"))
-- map("n", "<leader>wl", function()
--     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
-- end, opts "List workspace folders")
-- map("n", "<leader>D", vim.lsp.buf.type_definition, opts "LSP go to type definition")
-- map("n", "<leader>ra", require "lsp.renamer", opts("LSP rename symbol"))
-- map('n', 'K', vim.lsp.buf.hover, opts("LSP hover"))
-- map('n', 'gi', vim.lsp.buf.implementation, opts("LSP go to implementation"))
-- map('n', '<C-k>', vim.lsp.buf.signature_help, opts("LSP signature help"))
-- map('n', '<space>ca', vim.lsp.buf.code_action, opts("LSP code action"))
-- map('n', 'gr', vim.lsp.buf.references, opts("LSP view references"))
-- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)


-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local map = vim.keymap.set
    map(
        "n",
        "dr",
        function()
          vim.cmd.RustLsp({'relatedDiagnostics'})
        end,
        { silent = true, buffer = bufnr }
    )
    map(
        "n",
        "J",
        function()
          vim.cmd.RustLsp({'joinLines'})
        end,
        { silent = true, buffer = bufnr }
    )
    require("config.lspconfig").on_attach(client, bufnr)
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
        on_attach = on_attach,
    },
}

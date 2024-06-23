local nvchad_configs = require("nvchad.configs.lspconfig")

local on_attach = function(client, bufnr)
    nvchad_configs.on_attach(client, bufnr)
    if client.server_capabilities["documentSymbolProvider"] then
        require("nvim-navic").attach(client, bufnr)
    end
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    -- local bufopts = { noremap = true, silent = true, buffer = bufnr }
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
    -- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    -- vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lspconfig = require("lspconfig")
local servers = {
  "html",
  "cssls",
  "pyright",
  "tsserver",
  "cmake",
  "clangd",
  "clojure_lsp",
  "gopls",
  "vimls",
  "asm_lsp",
  "bashls",
  "dotls",
  "texlab",
  "bufls",
  "dockerls",
  "marksman",
  "jinja_lsp"
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = nvchad_configs.on_init,
    capabilities = nvchad_configs.capabilities,
  }
end

lspconfig['jdtls'].setup({
    on_init = nvchad_configs.on_init,
    on_attach = on_attach,
    capabilities = nvchad_configs.capabilities,
    cmd = { "jdtls" },
    root_dir = function(name)
        return lspconfig['jdtls'].util.root_pattern(
            'pom.xml',
            'gradle.build',
            '.git'
        )(name) or vim.fn.getcwd()
    end
})

lspconfig['jsonls'].setup({
    on_attach = on_attach,
    on_init = nvchad_configs.on_init,
    capabilities = nvchad_configs.capabilities,
})
lspconfig['lua_ls'].setup({
    on_attach = on_attach,
    on_init = nvchad_configs.on_init,
    capabilities = nvchad_configs.capabilities,
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
        },
    },
})
lspconfig['groovyls'].setup({
    on_attach = on_attach,
    on_init = nvchad_configs.on_init,
    capabilities = nvchad_configs.capabilities,
    cmd = {
        "java",
        "-jar",
        "/home/jackkilrain/repos/groovy-language-server/build/libs/groovy-language-server-all.jar"
    },
})

-- jinja_lsp
vim.filetype.add {
  extension = {
    jinja = 'jinja',
    jinja2 = 'jinja',
    j2 = 'jinja',
  },
}

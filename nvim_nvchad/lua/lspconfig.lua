local nvchad_configs = require("nvchad.configs.lspconfig")

local on_attach = function(client, bufnr)
    nvchad_configs.on_attach(client, bufnr)
    if client.server_capabilities["documentSymbolProvider"] then
        require("nvim-navic").attach(client, bufnr)
    end
    -- Enable completion triggered by <c-x><c-o>
    -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    -- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    --   vim.lsp.handlers.hover, { focusable = false }
    -- )

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
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
    -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    -- vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lspconfig = require("lspconfig")
local servers = {
  "html",
  "cssls",
  "pyright",
  "ts_ls",
  "cmake",
  -- "clangd",
  "clojure_lsp",
  "gopls",
  "vimls",
  "asm_lsp",
  "bashls",
  "dotls",
  "texlab",
  "buf_ls",
  "dockerls",
  "marksman",
  "jinja_lsp",
  "jdtls",
  "zls",
  "wgsl_analyzer",
  "vhdl_ls",
  "veridian",
  "verible",
  "thriftls",
  "tflint",
  "texlab",
  "svls",
  "svlangserver",
  "zls",
  "dartls"
}

-- Disable inline diagnostics in favour of tiny_inline_diagnostic
vim.diagnostic.config({virtual_text = false})

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = nvchad_configs.on_init,
    capabilities = nvchad_configs.capabilities,
  }
end

-- lspconfig['jdtls'].setup({
--     on_init = nvchad_configs.on_init,
--     on_attach = on_attach,
--     capabilities = nvchad_configs.capabilities,
--     cmd = { "jdtls" },
--     root_dir = function(name)
--         return lspconfig['jdtls'].util.root_pattern(
--             'pom.xml',
--             'gradle.build',
--             '.git'
--         )(name) or vim.fn.getcwd()
--     end
-- })

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

local root_pattern = lspconfig.util.root_pattern('.git')
local function file_exists(name)
   local f=io.open(name,"r")
   if f ~= nil then io.close(f) return true else return false end
end
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
    local project_root = vim.fn.getcwd()
    -- Turned into a filename
    local filename = vim.startswith(bufname, "/") and bufname or lspconfig.util.path.join(project_root, bufname)
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
    if (file_exists(project_root .. "/cclangd")) then
        return { project_root .. "/cclangd" }
    else
        return { "/usr/local/bin/cclangd", name, project_root }
    end
end
lspconfig["clangd"].setup({
    on_attach = on_attach,
    cmd = format_clangd_command(),
})

-- jinja_lsp
vim.filetype.add {
  extension = {
    jinja = 'jinja',
    jinja2 = 'jinja',
    j2 = 'jinja',
  },
}

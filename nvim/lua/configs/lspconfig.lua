local nvchad_configs = require("nvchad.configs.lspconfig")
nvchad_configs.defaults()

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

local servers = {
    html = {},
    cssls = {},
    pyright = {},
    ts_ls = {},
    cmake = {},
    clangd = {},
    gopls = {},
    vimls = {},
    asm_lsp = {},
    bashls = {},
    dotls = {},
    buf_ls = {},
    dockerls = {},
    marksman = {},
    jinja_lsp = {},
    texlab = {},
    zls = {},
    -- rust_analyzer = {},
    json_ls = {},
}

-- Disable inline diagnostics in favour of tiny_inline_diagnostic
vim.diagnostic.config({ virtual_text = false });

-- lsps with default config
for lsp, _ in pairs(servers) do
    servers[lsp] = {
        on_attach = on_attach,
        on_init = nvchad_configs.on_init,
        capabilities = nvchad_configs.capabilities,
    }
end

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local jdtls_workspace_dir = vim.fs.abspath('~/.cache/' .. project_name)
servers.jdtls = {
    on_init = nvchad_configs.on_init,
    on_attach = on_attach,
    capabilities = nvchad_configs.capabilities,
    cmd = {
        "jdtls",
        "-java-executable", "/Library/Java/JavaVirtualMachines/openjdk-21.jdk/Contents/Home/bin/java",
        "-data", jdtls_workspace_dir
    },
    root_dir = vim.fs.root(0, {
        "gradlew",
        "build.gradle",
        ".git",
        "pom.xml"
    }),
    settings = {
        java = {
            eclipse = {
				downloadSources = true,
			},
			configuration = {
				updateBuildConfiguration = "interactive",
			},
			gradle = {
				enabled = true,
			},
			maven = {
				downloadSources = true,
			},
			implementationsCodeLens = {
				enabled = true,
			},
			referencesCodeLens = {
				enabled = true,
			},
			references = {
				includeDecompiledSources = true,
			},
            inlayHints = {
                parameterNames = {
                    enabled = 'all', -- literals, all, none
                },
            },
            signatureHelp = {
                enabled = true,
            },
            autobuild = {
                enabled = true,
            }
        },
        signatureHelp = { enabled = true },
    },
    flags = {
        allow_incremental_sync = true,
    },
}
servers.lua_ls = {
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
}
servers.groovyls = {
    on_attach = on_attach,
    on_init = nvchad_configs.on_init,
    capabilities = nvchad_configs.capabilities,
    cmd = { "groovy_language_server" },
}

local function escape_wildcards(path)
  return path:gsub('([%[%]%?%*])', '\\%1')
end

local util = {}

function util.strip_archive_subpath(path)
  -- Matches regex from zip.vim / tar.vim
  path = vim.fn.substitute(path, 'zipfile://\\(.\\{-}\\)::[^\\\\].*$', '\\1', '')
  path = vim.fn.substitute(path, 'tarfile:\\(.\\{-}\\)::.*$', '\\1', '')
  return path
end

function util.search_ancestors(startpath, func)
  vim.validate('func', func, 'function')
  if func(startpath) then
    return startpath
  end
  local guard = 100
  for path in vim.fs.parents(startpath) do
    -- Prevent infinite recursion if our algorithm breaks
    guard = guard - 1
    if guard == 0 then
      return
    end

    if func(path) then
      return path
    end
  end
end

function util.root_pattern(...)
  local patterns = vim.iter({...}):flatten(math.huge):totable()
  return function(startpath)
    startpath = util.strip_archive_subpath(startpath)
    for _, pattern in ipairs(patterns) do
      local match = util.search_ancestors(startpath, function(path)
        for _, p in ipairs(vim.fn.glob(table.concat({ escape_wildcards(path), pattern }, '/'), true, true)) do
          if vim.uv.fs_stat(p) then
            return path
          end
        end
      end)

      if match ~= nil then
        local real = vim.uv.fs_realpath(match)
        return real or match -- fallback to original if realpath fails
      end
    end
  end
end

local root_pattern = util.root_pattern('.git')
local function file_exists(name)
    local f = io.open(name, "r")
    if f ~= nil then
        io.close(f)
        return true
    else
        return false
    end
end
-- Might be cleaner to try to expose this as a pattern from `lspconfig`, as
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
    local filename = vim.startswith(bufname, "/")
        and bufname
        or table.concat({project_root, bufname}, "/")
    -- Then the directory of the project
    local project_dirname = root_pattern(filename) or vim.fs.dirname(filename)
    -- And finally perform what is essentially a `basename` on this directory
    local basename = vim.fn.fnamemodify(vim.fs.dirname(
        vim.fs.find(
            '.git',
            { path = project_dirname, upward = true }
        )[1]
    ), ':t')
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
servers.clangd = {
    on_attach = on_attach,
    cmd = format_clangd_command(),
}

-- jinja_lsp
vim.filetype.add {
    extension = {
        jinja = 'jinja',
        jinja2 = 'jinja',
        j2 = 'jinja',
    },
}

for lsp, config in pairs(servers) do
    vim.lsp.config(lsp, config)
    vim.lsp.enable(lsp)
end

local autocmd = vim.api.nvim_create_autocmd

autocmd("BufReadPost", {
    pattern = "*",
    callback = function()
        local line = vim.fn.line "'\""
        if
            line > 1
            and line <= vim.fn.line "$"
            and vim.bo.filetype ~= "commit"
            and vim.fn.index({ "xxd", "gitrebase" }, vim.bo.filetype) == -1
        then
            vim.cmd 'normal! g`"'
        end
    end,
})

vim.o.foldmethod = 'expr'
-- Default to treesitter folding
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
-- Prefer LSP folding if client supports it
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client:supports_method('textDocument/foldingRange') then
            local win = vim.api.nvim_get_current_win()
            vim.wo[win][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
        end
    end,
})

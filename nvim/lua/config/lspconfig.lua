local M = {}

function M.on_attach(client, bufnr)
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
	require("mappings").lsp_mappings(bufnr)
end

local lspconfig = require("lspconfig")
local servers = {
	html = {},
	cssls = {},
	pyright = {},
	ts_ls = {},
	cmake = {},
	clojure_lsp = {},
	gopls = {},
	vimls = {},
	asm_lsp = {},
	bashls = {},
	dotls = {},
	texlab = {},
	buf_ls = {},
	dockerls = {},
	marksman = {},
	jinja_lsp = {},
	jdtls = {},
	zls = {},
	wgsl_analyzer = {},
	vhdl_ls = {},
	veridian = {},
	verible = {},
	thriftls = {},
	tflint = {},
	svls = {},
	svlangserver = {},
	dartls = {},
	c3_lsp = {},
}

-- lsps with default config
for lsp, _ in pairs(servers) do
	servers[lsp] = {
		on_attach = M.on_attach,
	}
end

-- Disable inline diagnostics in favour of tiny_inline_diagnostic
local x = vim.diagnostic.severity
vim.diagnostic.config({
	virtual_text = false,
	signs = { text = { [x.ERROR] = "󰅙", [x.WARN] = "", [x.INFO] = "󰋼", [x.HINT] = "󰌵" } },
	underline = true,
	float = { border = "single" },
})
servers.lua_ls = {
	on_attach = M.on_attach,
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
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

local root_pattern2 = lspconfig.util.root_pattern(".git")
local function file_exists(name)
	local f = io.open(name, "r")
	if f ~= nil then
		io.close(f)
		return true
	else
		return false
	end
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
	local project_dirname = root_pattern2(filename) or lspconfig.util.path.dirname(filename)
	-- And finally perform what is essentially a `basename` on this directory
	local basename = vim.fn.fnamemodify(lspconfig.util.find_git_ancestor(project_dirname), ":t")
	if basename == nil then
		return nil
	end
	local name, _ = string.gsub(string.lower(basename), "-", "_")
	if file_exists(project_root .. "/cclangd") then
		return { project_root .. "/cclangd" }
	else
		return { "/usr/local/bin/cclangd", name, project_root }
	end
end
servers.clangd = {
	on_attach = M.on_attach,
	cmd = format_clangd_command(),
}

-- jinja_lsp
vim.filetype.add({
	extension = {
		jinja = "jinja",
		jinja2 = "jinja",
		j2 = "jinja",
	},
})

for lsp, config in pairs(servers) do
	vim.lsp.config(lsp, config)
	vim.lsp.enable(lsp)
end

local autocmd = vim.api.nvim_create_autocmd

autocmd("BufReadPost", {
	pattern = "*",
	callback = function()
		local line = vim.fn.line("'\"")
		if
			line > 1
			and line <= vim.fn.line("$")
			and vim.bo.filetype ~= "commit"
			and vim.fn.index({ "xxd", "gitrebase" }, vim.bo.filetype) == -1
		then
			vim.cmd('normal! g`"')
		end
	end,
})

vim.o.foldmethod = "expr"
-- Default to treesitter folding
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- Prefer LSP folding if client supports it
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client:supports_method("textDocument/foldingRange") then
			local win = vim.api.nvim_get_current_win()
			vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
		end
	end,
})

return M

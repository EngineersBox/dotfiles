local M = {}
local map = vim.keymap.set
local snacks = require("snacks")

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Windows
map("n", "<leader>wv", "<cmd> vsplit<CR>", { desc = "Window split vertically" })
map("n", "<leader>wh", "<cmd> split<CR>", { desc = "Window split horizontally" })

-- Buffers
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "General clear highlights" })
map("n", "<C-s>", "<cmd>w<CR>", { desc = "Buffer save file" })
map("n", "<leader>b", "<cmd>enew<CR>", { desc = "Buffer new" })
map("n", "<tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Buffer goto next" })
map("n", "<S-tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Buffer goto prev" })
map("n", "<leader>x", function()
	vim.api.nvim_command("bp|sp|bn|bd")
end, { desc = "Buffer close" })
map({ "n", "x" }, "<leader>fm", function()
	require("conform").format({ lsp_fallback = true })
end, { desc = "Buffer format" })
map({ "n", "v" }, "<leader>.", function() snacks.scratch() end, { desc = "Sratch buffer toggle" })
map({ "n", "v" }, "<leader>S", function() snacks.scratch.select() end, { desc = "Sratch buffer select" })

-- LSP
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })
function M.lsp_mappings(bufnr)
	local function opts(desc)
		return { buffer = bufnr, desc = "LSP " .. desc }
	end
	local goto_preview = require("goto-preview")
	local telescope = require("telescope.builtin")
	map("n", "gpD", function()
		goto_preview.goto_preview_declaration({})
	end, { desc = "Preview declaration" })
	map("n", "gP", function()
		goto_preview.close_all_win()
	end, { desc = "Preview close all windows" })
	map("n", "gpr", function()
		goto_preview.goto_preview_references()
	end, { desc = "Preview references" })

	map("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
	map("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
	local ts_lsp_conf = {
		jump_type = "never",
		reuse_win = true,
	}
	map("n", "gu", function()
		telescope.lsp_references(ts_lsp_conf)
	end, opts("preview references"))
	map("n", "gpd", function()
		telescope.lsp_definitions(ts_lsp_conf)
	end, opts("preview definitions"))
	map("n", "gpt", function()
		telescope.lsp_type_definitions(ts_lsp_conf)
	end, opts("preview type definitions"))
	map("n", "gpi", function()
		telescope.lsp_implementations(ts_lsp_conf)
	end, opts("preview implementations"))
	map("n", "gco", "<cmd>Telescope lsp_outgoing_calls<CR>", opts("preview outgoing calls"))
	map("n", "gci", "<cmd>Telescope lsp_incoming_calls<CR>", opts("preview incoming calls"))

	map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts("Workspace add folder"))
	map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts("Workspace remove folder"))
	map("n", "<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, opts("List workspace folders"))
	map("n", "<leader>ra", require("lsp.renamer"), opts("rename symbol"))
	map("n", "K", function()
		vim.lsp.buf.hover({ border = "single" })
	end, opts("hover"))
	map("n", "<C-k>", vim.lsp.buf.signature_help, opts("signature help"))
	map("n", "<space>ca", vim.lsp.buf.code_action, opts("code action"))
	map("n", "<C-/>", function()
		require("snacks").words.jump(1, true)
	end, opts("jump to next occurance of word under cursor"))
end

-- NvimTree
-- map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "NvimTree toggle" })
-- NeoTree
local neotree_open = false
map("n", "<C-n>", function()
	if neotree_open then
		vim.cmd("Neotree close")
	else
		vim.cmd("Neotree source=filesystem reveal=true position=left")
	end
	neotree_open = not neotree_open
end, { desc = "NeoTree toggle" })

-- Git
local gitsigns = require("gitsigns")
map({ "n", "v" }, "ghp", function()
	gitsigns.preview_hunk()
end, { desc = "Git preview hunk" })
map({ "n", "v" }, "ghip", function()
	gitsigns.preview_hunk_inline()
end, { desc = "Git preview hunk inline" })
map({ "n", "v" }, "ghr", function()
	gitsigns.reset_hunk()
end, { desc = "Git reset hunk" })
map("n", "gbr", function()
	gitsigns.reset_buffer()
end, { desc = "Git reset buffer" })
map({ "n", "v" }, "gb", function()
	gitsigns.blame()
end, { desc = "Git toggle blame" })
map({ "n", "v" }, "gbl", function()
	gitsigns.blame_line()
end, { desc = "Git blame line" })
map("n", "<leader>gs", "<cmd>Neotree git_status<CR>", { desc = "Git status" })

-- Trouble
map("n", "<leader>td", "<cmd> Trouble diagnostics toggle<CR>", { desc = "Trouble global diagnostics" })
map("n", "<leader>tD", "<cmd> Trouble diadnostics toggle filter.buf=0<CR>", { desc = "Trouble buffer diagnostics" })
map("n", "<leader>ts", "<cmd> Trouble symbols toggle focus=false<CR>", { desc = "Trouble symbols" })
map(
	"n",
	"<leader>tl",
	"<cmd> Trouble lsp toggle focus=false win.postion=right<CR>",
	{ desc = "Trouble LSP definitions, references, etc" }
)
map("n", "<leader>tL", "<cmd> Trouble loclist toggle<CR>", { desc = "Trouble location list" })
map("n", "<leader>tq", "<cmd> Trouble qflist<CR>", { desc = "Trouble quickfix list" })

-- Telescope
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map(
	"n",
	"<leader>fa",
	"<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
	{ desc = "telescope find all files" }
)
map("n", "<leader>ft", "<cmd> TodoTelescope<CR>", { desc = "Telescope find TODOs" })
map("n", "<leader>km", "<cmd>Telescope keymaps<CR>", { desc = "Telescope search keymaps" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- Terminal
map("t", "<C-h>", [[<C-\><C-N><C-h>]], { desc = "Terminal move to right window" })
map("t", "<C-l>", [[<C-\><C-N><C-l>]], { desc = "Terminal move to left window" })
map("t", "<C-j>", [[<C-\><C-N><C-j>]], { desc = "Terminal move to below window" })
map("t", "<C-k>", [[<C-\><C-N><C-k>]], { desc = "Terminal move to above window " })
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })
map({ "n", "t" }, "<C-t>", function()
	require("config.term").toggle({
		pos = "float",
		id = "floatTerm",
	})
end, { desc = "Terminal toggle floating term" })
map("n", "<leader>h", function()
	require("config.term").new({ pos = "sp" })
end, { desc = "Terminal new horizontal term" })
map("n", "<leader>v", function()
	require("config.term").new({ pos = "vsp" })
end, { desc = "Terminal new vertical term" })
map({ "n", "t" }, "<A-v>", function()
	require("config.term").toggle({ pos = "vsp", id = "vtoggleTerm" })
end, { desc = "Terminal toggleable vertical term" })
map({ "n", "t" }, "<A-h>", function()
	require("config.term").toggle({ pos = "sp", id = "htoggleTerm" })
end, { desc = "Terminal toggleable horizontal term" })
map({ "n", "t" }, "<A-i>", function()
	require("config.term").toggle({ pos = "float", id = "floatTerm" })
end, { desc = "Terminal toggle floating term" })

-- WhichKey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "WhichKey all keymaps" })
map("n", "<leader>wk", function()
	vim.cmd("WhichKey " .. vim.fn.input("WhichKey: "))
end, { desc = "whichkey query lookup" })

return M

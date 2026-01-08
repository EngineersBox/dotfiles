local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Windows
map("n", "<C-h>", "<C-w>h", { desc = "Window goto left" })
map("n", "<C-l>", "<C-w>l", { desc = "Window goto right" })
map("n", "<C-j>", "<C-w>j", { desc = "Window goto down" })
map("n", "<C-k>", "<C-w>k", { desc = "Window goto up" })
map("n", "<leader>wv", "<cmd> vsplit<CR>", { desc = "Window split vertically" })
map("n", "<leader>wh", "<cmd> split<CR>", { desc = "Window split horizontally" })

-- Buffers
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "General clear highlights" })
map("n", "<C-s>", "<cmd>w<CR>", { desc = "Buffer save file" })
map("n", "<leader>b", "<cmd>enew<CR>", { desc = "Buffer new" })
map("n", "<tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Buffer goto next" })
map("n", "<S-tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Buffer goto prev" })
map("n", "<leader>x", function()
    -- TODO: Make this generic to any amount of buffers and position
    local bl = require("bufferline")
    bl.cycle(-1)
    bl.close_in_direction("right")
end, { desc = "Buffer close" })
map({ "n", "x" }, "<leader>fm", function()
    require("conform").format { lsp_fallback = true }
end, { desc = "Buffer format" })

-- LSP
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })

-- Keymap List
map("n", "ch", "<cmd> Telescope keymaps<CR>", { desc = "Telescope search keymaps" });

-- NvimTree
map("n", "<C-n>", "<cmd> NvimTreeToggle<CR>", { desc = "NvimTree toggle" })

-- Previews
map("n", "gpd", function() require("goto-preview").goto_preview_definition() end, { desc = "Preview definition" })
map("n", "gpD", function() require("goto-preview").goto_preview_declaration() end, { desc = "Preview declaration" })
map("n", "gpt", function() require("goto-preview").goto_preview_type_definition() end, { desc = "Preview type definition" })
map("n", "gpi", function() require("goto-preview").goto_preview_implementation() end, { desc = "Preview implementation" })
map("n", "gP", function() require("goto-preview").close_all_win() end, { desc = "Preview close all windows" })
map("n", "gr", function() require("goto-preview").goto_preview_references() end, { desc = "Preview references" })

-- Git
local gitsigns = require('gitsigns')
map({ "n", "v" }, "ghp", function() gitsigns.preview_hunk() end, { desc = "Git preview hunk" })
map({ "n", "v" }, "ghip", function() gitsigns.preview_hunk_inline() end, { desc = "Git preview hunk inline" })
map({ "n", "v" }, "ghr", function() gitsigns.reset_hunk() end, { desc = "Git reset hunk" })
map("n", "gbr", function() gitsigns.reset_buffer() end, { desc = "Git reset buffer" })
map({ "n", "v" }, "gb", function() gitsigns.blame() end, { desc = "Git toggle blame" })
map({ "n", "v" }, "gbl", function() gitsigns.blame_line() end, { desc = "Git blame line" })

-- Trouble
map("n", "<leader>td", "<cmd> Trouble diagnostics toggle<CR>", { desc = "Trouble global diagnostics" })
map("n", "<leader>tD", "<cmd> Trouble diadnostics toggle filter.buf=0<CR>", { desc = "Trouble buffer diagnostics" })
map("n", "<leader>ts", "<cmd> Trouble symbols toggle focus=false<CR>", { desc = "Trouble symbols" })
map("n", "<leader>tl", "<cmd> Trouble lsp toggle focus=false win.postion=right<CR>", { desc = "Trouble LSP definitions, references, etc" })
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

-- Comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- Terminal
map("t", "<C-h>", [[<C-\><C-N><C-h>]], { desc = "Terminal move to right window" })
map("t", "<C-l>", [[<C-\><C-N><C-l>]], { desc = "Terminal move to left window" })
map("t", "<C-j>", [[<C-\><C-N><C-j>]], { desc = "Terminal move to below window" })
map("t", "<C-k>", [[<C-\><C-N><C-k>]], { desc = "Terminal move to above window " })
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

map("n", "<leader>h", function()
  require("config.term").new { pos = "sp" }
end, { desc = "Terminal new horizontal term" })
map("n", "<leader>v", function()
  require("config.term").new { pos = "vsp" }
end, { desc = "Terminal new vertical term" })
map({ "n", "t" }, "<A-v>", function()
  require("config.term").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "Terminal toggleable vertical term" })
map({ "n", "t" }, "<A-h>", function()
  require("config.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "Terminal toggleable horizontal term" })
map({ "n", "t" }, "<A-i>", function()
  require("config.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "Terminal toggle floating term" })

-- WhichKey 
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "WhichKey all keymaps" })
map("n", "<leader>wk", function()
  vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
end, { desc = "whichkey query lookup" })

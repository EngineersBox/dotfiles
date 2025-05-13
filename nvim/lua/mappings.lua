require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Disable arrow keys
-- map("n", "<Up>", "<Nop>")
-- map("n", "<Down>", "<Nop>")
-- map("n", "<Left>", "<Nop>")
-- map("n", "<Right>", "<Nop>")

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

-- Hop
map("n", "<leader>hw", "<cmd> HopWord<CR>", { desc = "Hop to word" })
map("n", "<leader>hl", "<cmd> HopLine<CR>", { desc = "Hop to line" })
map("n", "<leader>hc1", "<cmd> HopChar1<CR>", { desc = "Hop to 1 specified character" })
map("n", "<leader>hc2", "<cmd> HopChar2<CR>", { desc = "Hop to 2 specified characters" })

-- Trouble
map("n", "<leader>td", "<cmd> Trouble diagnostics toggle<CR>", { desc = "Trouble global diagnostics" })
map("n", "<leader>tD", "<cmd> Trouble diadnostics toggle filter.buf=0<CR>", { desc = "Trouble buffer diagnostics" })
map("n", "<leader>ts", "<cmd> Trouble symbols toggle focus=false<CR>", { desc = "Trouble symbols" })
map("n", "<leader>tl", "<cmd> Trouble lsp toggle focus=false win.postion=right<CR>", { desc = "Trouble LSP definitions, references, etc" })
map("n", "<leader>tL", "<cmd> Trouble loclist toggle<CR>", { desc = "Trouble location list" })
map("n", "<leader>tq", "<cmd> Trouble qflist<CR>", { desc = "Toruble quickfix list" })

-- Todo-comments
map("n", "<leader>ft", "<cmd> TodoTelescope<CR>", { desc = "Telescope find TODOs" })

-- Split
map("n", "<leader>wv", "<cmd> vsplit<CR>", { desc = "Window split vertically" })
map("n", "<leader>wh", "<cmd> split<CR>", { desc = "Window split horizontally" })

-- Terminal
map(
    { "n", "t" }, "<C-t>",
    function()
        require("nvchad.term").toggle {
            pos = "float",
            id = "floatTerm"
        }
    end,
    { desc = "Terminal toggle floating term" }
)
map("t", "<C-h>", [[<C-\><C-N><C-h>]], { desc = "Terminal move to right window" })
map("t", "<C-l>", [[<C-\><C-N><C-l>]], { desc = "Terminal move to left window" })
map("t", "<C-j>", [[<C-\><C-N><C-j>]], { desc = "Terminal move to below window" })
map("t", "<C-k>", [[<C-\><C-N><C-k>]], { desc = "Terminal move to above window " })

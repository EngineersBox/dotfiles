call plug#begin()

Plug 'sheerun/vim-polyglot'
Plug 'sainnhe/sonokai'
"Plug 'itchyny/lightline.vim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'tpope/vim-fugitive'
Plug 'frazrepo/vim-rainbow'
Plug 'itchyny/vim-gitbranch'
Plug 'tikhomirov/vim-glsl'
Plug 'preservim/nerdtree' |
				  \ Plug 'Xuyuanp/nerdtree-git-plugin' |
                  \ Plug 'ryanoasis/vim-devicons' | 
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
Plug 'w0rp/ale'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }
Plug 'numToStr/Comment.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'voldikss/vim-floaterm'
" Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'neovim/nvim-lspconfig'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
Plug 'kosayoda/nvim-lightbulb'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'rmagatti/goto-preview'
Plug 'mfussenegger/nvim-jdtls'
Plug 'simrat39/rust-tools.nvim'
Plug 'jose-elias-alvarez/typescript.nvim'
Plug 'weilbith/nvim-code-action-menu'
Plug 'stevearc/dressing.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'nvim-telescope/telescope-project.nvim'
Plug 'goolord/alpha-nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'm-demare/hlargs.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'joehannes-os/telescope-media-files.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'luochen1990/rainbow'
Plug 'phaazon/hop.nvim'
Plug 'preservim/nerdcommenter'
Plug 'andymass/vim-matchup'
Plug 'folke/noice.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'rcarriga/nvim-notify'
Plug 'windwp/nvim-autopairs'
Plug 'abecodes/tabout.nvim'
" Plug 'karb94/neoscroll.nvim'
Plug 'declancm/cinnamon.nvim'
Plug 'gorbit99/codewindow.nvim'

call plug#end()

syntax on
let g:sonokai_style = 'default'
colorscheme sonokai
set autoindent
set smartindent
set number relativenumber
set mouse=a
set nocompatible
set termguicolors
set number
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevelstart=99

set clipboard=unnamedplus
set encoding=UTF-8

highlight CursorLineNr guifg=#73d3de
set cursorline
set cursorlineopt=number

set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'sonokai',
      \ 'active': {
      \ 	'right': [
	  \ 		[ 'syntastic', 'lineinfo' ],
      \         [ 'percent' ],
      \         [ 'fileformat', 'fileencoding', 'filetype' ]
	  \		],
      \ 	'left': [
	  \			[ 'mode', 'paste' ],
      \         [ 'gitbranch', 'readonly', 'filename', 'modified' ]
	  \		]
      \ },
      \ 'component_expand': {
      \ 	'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \ 	'syntastic': 'error',
      \ },
      \ 'component_function': {
      \ 	'gitbranch': 'gitbranch#name'
	  \ },
	  \ }

let g:rainbow_active = 1
" TODO: Fix colouring of rainbow brackets here
let g:rainbow_conf = {
			\ 'guifgs': ['LightBlue','LightCyan','LightGreen','LightYellow','LightRed','LightMagenta'],
			\ 'ctermfgs': ['LightBlue','LightCyan','LightGreen','LightYellow','LightRed','LightMagenta'],
			\ }

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:python3_host_prog = '/usr/local/opt/python@3.10/bin/python3'

let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

let g:NERDTreeGitStatusShowClean = 1
" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() > 0 || exists("s:stdin") | NERDTree | TagbarToggle | wincmd p | else | Alpha | endif 
"autocmd VimEnter * Alpha | if argc() = 0 | wincmd p | endif
"autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
"autocmd VimEnter * TagbarToggle | if (argc() > 0 || exists("s:std_in")) | wincmd p | endif
autocmd CursorHold,CursorHoldI * lua require('nvim-lightbulb').update_lightbulb()

nmap <F8> :TagbarToggle<CR>

highlight GitGutterAdd guifg=#a1d373 ctermfg=2
highlight GitGutterChange guifg=#f19465 ctermfg=3
highlight GitGutterDelete guifg=#f45e84 ctermfg=1

let g:coq_settings = { 'auto_start': 'shut-up' }

nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>
nnoremap gpt <cmd>lua require('goto-preview').goto_preview_type_definition()<CR>
nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>
nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>
nnoremap gr <cmd>lua require('goto-preview').goto_preview_references()<CR>
nnoremap <A-CR> :CodeActionMenu<CR>

nmap <F9> :FloatermNew<CR>

nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<CR>
nnoremap <leader>fb <cmd>Telescope buffers<CR>
nnoremap <leader>fB <cmd>Telescope file_browser<CR>
nnoremap <leader>fo <cmd>Telescope oldfiles<CR>
nnoremap <leader>fh <cmd>Telescope help_tags<CR>

nnoremap n<TAB> :bn<CR>
nnoremap n<S-TAB> :bp<CR>
nnoremap n<leader>bd :bd<CR>

nnoremap <leader>hw :HopWord<CR>
nnoremap <leader>hl :HopLine<CR>
nnoremap <leader>hc1 :HopChar1<CR>
nnoremap <leader>hc2 :HopChar2<CR>

lua <<EOF
local codewindow = require('codewindow')
codewindow.setup({
	auto_enable = true,
	exclude_filetypes = { "nerdtree", "tagbar" },
	minimap_width = 15,
})
codewindow.apply_default_keybinds()

-- require('neoscroll').setup({})
require('cinnamon').setup({})

require("nvim-autopairs").setup({})
require("tabout").setup({})

require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = false, -- use a classic bottom cmdline for search
    command_palette = false, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
   views = {
      cmdline_popup = {
        position = {
          row = 5,
          col = "50%",
        },
        size = {
          width = 60,
          height = "auto",
        },
      },
    },
})

vim.g.matchup_matchparen_offscreen = { method = "popup" }

require("hlargs").setup({
	disable = function(_, bufnr)
		if vim.b.semantic_tokens then
			return true
		end
		local clients = vim.lsp.get_active_clients({ bufnr = bufnr })
		for _, c in pairs(clients) do
			local caps = c.server_capabilities
			if c.name ~= "null-ls" and caps.semanticTokensProvider and caps.semanticTokensProvider.full then
				vim.b.semantic_tokens = true
				return vim.b.semantic_tokens
			end
		end
	end,
})

require('hop').setup({})

local configuration = vim.fn['sonokai#get_configuration']()
local palette = vim.fn['sonokai#get_palette'](configuration.style, configuration.colors_override)

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

local lualine = require('lualine')
local lualine_config = {
  options = {
    theme = "sonokai",
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
	lualine_b = {
		'filename',
		'branch',
		{
		  'diagnostics',
		  sources = { 'nvim_diagnostic' },
		  symbols = { error = ' ', warn = ' ', info = ' ' },
		  diagnostics_color = {
			color_error = { fg = palette.red[1] },
			color_warn = { fg = palette.yellow[1] },
			color_info = { fg = palette.green[1] },
		  },
		}
	},
    lualine_c = { 'fileformat' },
    lualine_x = {},
    lualine_y = {
		'filetype',
		{
			'filesize',
			cond = conditions.buffer_not_empty
		},
		'progress'
	},
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
}

lualine.setup(lualine_config)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv'", { noremap = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv'", { noremap = true })
vim.keymap.set("v", ">", ">gv", { noremap = true })
vim.keymap.set("v", "<", "<gv", { noremap = true })

vim.api.nvim_set_hl(0, "@punctuation.bracket", { link = "" })

local alpha = require("alpha")
local alphaterm = require("alpha.term")
local dashboard = require("alpha.themes.dashboard")
  -- dashboard.section.header.val = {
  --   [[=================     ===============     ===============   ========  ========]],
  --   [[\\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //]],
  --   [[||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||]],
  --   [[|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||]],
  --   [[||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||]],
  --   [[|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||]],
  --   [[||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||]],
  --   [[|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||]],
  --   [[||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||]],
  --   [[||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||]],
  --   [[||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||]],
  --   [[||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||]],
  --   [[||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||]],
  --   [[||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||]],
  --   [[||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||]],
  --   [[||.=='    _-'                                                     `' |  /==.||]],
  --   [[=='    _-'                        N E O V I M                         \/   `==]],
  --   [[\   _-'                                                                `-_   /]],
  --   [[ `''                                                                      ``' ]],
-- 
  -- }

dashboard.section.buttons.val = {
    dashboard.button("f", "  Find a file", ":Telescope find_files <CR>"),
    dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("p", "  Find a project", ":Telescope project <CR>"),
    dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
    dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
    dashboard.button("c", "  Configuration", ":e $MYVIMRC<CR>"),
    dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}
local function footer()
    -- Number of plugins
    local total_plugins = #vim.tbl_keys(vim.g.plugs)
    local datetime = os.date "%d-%m-%Y %H:%M:%S"
    local plugins_text = "   "
      .. total_plugins
      .. " plugins"
      .. "   v"
      .. vim.version().major
      .. "."
      .. vim.version().minor
      .. "."
      .. vim.version().patch
      .. "   "
      .. datetime

    -- Quote
    local fortune = require("alpha.fortune")
    local quote = table.concat(fortune(), "\n")

    return plugins_text .. "\n" .. quote
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
-- dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true

local width = 52 -- 104
local height = 17 -- 28
dashboard.section.terminal.command = "cat | " .. os.getenv("HOME") .. "/.config/nvim/doom/render.sh"
dashboard.section.terminal.width = width
dashboard.section.terminal.height = height
dashboard.section.terminal.opts.redraw = true

dashboard.config.layout = {
	{ type = "padding", val = 1 },
	dashboard.section.terminal,
	{ type = "padding", val = height + 8 },
	dashboard.section.buttons,
	{ type = "padding", val = 1 },
	dashboard.section.footer,
}

alpha.setup(dashboard.opts)

require("Comment").setup()

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup({
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = true,
})

require("nvim-treesitter.configs").setup({
	ensure_installed = "all",
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
	},
	matchup = {
		enable = true,
	}
})

require('goto-preview').setup({
	default_mappings = true,
})

require("typescript").setup({})

local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
      ["rust-analyzer"] = {}
    }
}

local telescope = require('telescope')
telescope.setup({
	extensions = {
		media_files = {
			find_cmd = "rg",
		},
	},
})
telescope.load_extension('project')
telescope.load_extension('fzf')
telescope.load_extension('media_files')
telescope.load_extension('file_browser')
telescope.load_extension('noice')
-- telescope.load_extension("ui-select")

require("dressing").setup({
      input = {
            relative = "editor",
      },
      select = {
            backend = { "telescope", "fzf", "builtin" }
      },
})

-- local chadtree_settings = { 
-- 	theme = {
--  	text_colour_set = "nord",
--	 },	
-- }
-- vim.api.nvim_set_var("chadtree_settings", chadtree_settings)
EOF

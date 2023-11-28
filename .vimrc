call plug#begin()

Plug 'sheerun/vim-polyglot'
Plug 'sainnhe/sonokai'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'tpope/vim-fugitive'
Plug 'frazrepo/vim-rainbow'
Plug 'itchyny/vim-gitbranch'
Plug 'tikhomirov/vim-glsl'
"Plug 'preservim/nerdtree' |
				  "\ Plug 'Xuyuanp/nerdtree-git-plugin' |
				  "\ Plug 'ryanoasis/vim-devicons'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'folke/neodev.nvim'
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
Plug 'stevearc/dressing.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'folke/todo-comments.nvim'
Plug 'folke/trouble.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'nvim-telescope/telescope-project.nvim'
Plug 'goolord/alpha-nvim'
Plug 'm-demare/hlargs.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'joehannes-os/telescope-media-files.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
"Plug 'luochen1990/rainbow'
Plug 'phaazon/hop.nvim'
Plug 'preservim/nerdcommenter'
Plug 'andymass/vim-matchup'
Plug 'folke/noice.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'rcarriga/nvim-notify'
Plug 'windwp/nvim-autopairs'
Plug 'abecodes/tabout.nvim'
Plug 'declancm/cinnamon.nvim'
Plug 'gorbit99/codewindow.nvim'
Plug 'wellle/targets.vim'
"Plug 'kdheepak/tabline.nvim'
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
Plug 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'
Plug 'petertriho/nvim-scrollbar'
Plug 'kevinhwang91/nvim-hlslens'
Plug 'uga-rosa/ccc.nvim'
Plug 'sudormrfbin/cheatsheet.nvim'
Plug 'saecki/crates.nvim', { 'tag': 'v0.3.0' }
Plug 'lvimuser/lsp-inlayhints.nvim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'jbyuki/venn.nvim'
Plug 'SmiteshP/nvim-navic'
Plug 'utilyre/barbecue.nvim'
Plug 'timtro/glslView-nvim' ", { ft: 'glsl' }
Plug 'artempyanykh/marksman'
Plug 'sindrets/diffview.nvim'
Plug 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make' }
Plug 'ray-x/sad.nvim'
Plug 'ray-x/navigator.lua'
Plug 'mikesmithgh/kitty-scrollback.nvim'

call plug#end()

" Advised settings for NvimTree
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

set termguicolors
syntax on
let g:sonokai_style = 'default'
let g:sonokai_diagnostic_virtual_text = ''
colorscheme sonokai
set autoindent
set smartindent
set number relativenumber
set mouse=a
set mousemoveevent
set nocompatible
set termguicolors
set number
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldtext=substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend))
set fillchars=fold:\ 
set foldnestmax=3
set foldminlines=1
set foldlevelstart=99

set clipboard=unnamedplus
set encoding=UTF-8

highlight CursorLineNr guifg=#73d3de
set cursorline
set cursorlineopt=number

set guioptions+=m
let g:guifont='JetBrainsMono Nerd Font'

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

let g:python3_host_prog = '/usr/local/bin/python3'

let g:gitgutter_sign_added = '▐'
let g:gitgutter_sign_modified = '▐'
let g:gitgutter_sign_removed = '▐'
let g:gitgutter_sign_removed_first_line = '▐'
let g:gitgutter_sign_removed_above_and_below = '▐'
let g:gitgutter_sign_modified_removed = '▐'

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
let g:NERDTreeShowLineNumbers = 0
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let g:NERDTreeGitStatusShowClean = 1

autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() > 0 || exists("s:stdin") | NERDTree | LspAndDiag | wincmd p | else | Alpha | endif 
"autocmd VimEnter * Alpha | if argc() = 0 | wincmd p | endif
"autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
"autocmd VimEnter * TagbarToggle | if (argc() > 0 || exists("s:std_in")) | wincmd p | endif
autocmd VimEnter * if argc() > 0 || exists("s:stdin") | NvimTreeOpen | wincmd p | else | Alpha | endif 
autocmd CursorHold,CursorHoldI * lua require('nvim-lightbulb').update_lightbulb()
autocmd CursorHold,CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()

" nmap <F7> :CHADopen --nofocus<CR>
nmap <F21> :FloatermNew<CR>
nmap <F20> :TagbarToggle<CR>
nmap <F19> :LspAndDiag<CR>
nmap <F18> :NvimTreeToggle<CR>

highlight GitGutterAdd guifg=#a1d373 ctermfg=2
highlight GitGutterChange guifg=#f19465 ctermfg=3
highlight GitGutterDelete guifg=#f45e84 ctermfg=1

let g:coq_settings = { 'auto_start': 'shut-up' }

nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>
nnoremap gpt <cmd>lua require('goto-preview').goto_preview_type_definition()<CR>
nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>
nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>
nnoremap gr <cmd>lua require('goto-preview').goto_preview_references()<CR>
nnoremap <leader>ac :CodeActionMenu<CR>

nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<CR>
nnoremap <leader>fb <cmd>Telescope buffers<CR>
nnoremap <leader>fB <cmd>Telescope file_browser<CR>
nnoremap <leader>fo <cmd>Telescope oldfiles<CR>
nnoremap <leader>fh <cmd>Telescope help_tags<CR>


nnoremap <silent> n<leader>1 <cmd>lua require("bufferline").go_to(1, true)<CR>
nnoremap <silent> n<leader>2 <cmd>lua require("bufferline").go_to(2, true)<CR>
nnoremap <silent> n<leader>3 <cmd>lua require("bufferline").go_to(3, true)<CR>
nnoremap <silent> n<leader>4 <cmd>lua require("bufferline").go_to(4, true)<CR>
nnoremap <silent> n<leader>5 <cmd>lua require("bufferline").go_to(5, true)<CR>
nnoremap <silent> n<leader>6 <cmd>lua require("bufferline").go_to(6, true)<CR>
nnoremap <silent> n<leader>7 <cmd>lua require("bufferline").go_to(7, true)<CR>
nnoremap <silent> n<leader>8 <cmd>lua require("bufferline").go_to(8, true)<CR>
nnoremap <silent> n<leader>9 <cmd>lua require("bufferline").go_to(9, true)<CR>
nnoremap <silent> n<leader>! <cmd>lua require("bufferline").go_to(1, true)<CR>
nnoremap <silent> n<leader>@ <cmd>lua require("bufferline").go_to(2, true)<CR>
nnoremap <silent> n<leader># <cmd>lua require("bufferline").go_to(3, true)<CR>
nnoremap <silent> n<leader>$ <cmd>lua require("bufferline").go_to(4, true)<CR>
nnoremap <silent> n<leader>% <cmd>lua require("bufferline").go_to(5, true)<CR>
nnoremap <silent> n<leader>^ <cmd>lua require("bufferline").go_to(6, true)<CR>
nnoremap <silent> n<leader>& <cmd>lua require("bufferline").go_to(7, true)<CR>
nnoremap <silent> n<leader>* <cmd>lua require("bufferline").go_to(8, true)<CR>
nnoremap <silent> n<leader>( <cmd>lua require("bufferline").go_to(9, true)<CR>
nnoremap <silent> n<TAB> :BufferLineCycleNext<CR>
nnoremap <silent> n<S-TAB> :BufferLineCyclePrev<CR>
nnoremap <silent> n<leader>bp :BufferLinePick<CR>
nnoremap <silent> n<leader>bd :BufferLinePickClose<CR>
nnoremap <silent> n<leader>bP :BufferLineTogglePin<CR>

nnoremap <leader>hw :HopWord<CR>
nnoremap <leader>hl :HopLine<CR>
nnoremap <leader>hc1 :HopChar1<CR>
nnoremap <leader>hc2 :HopChar2<CR>

nnoremap <leader>/ :nohl<CR>

autocmd! BufNewFile,BufRead *.vs,*.vsh,*.fs,*.fsh set ft=glsl

"vnoremap <leader>dt <cmd>lua require("dapui").toggle()<CR>
"vnoremap <leader>de <cmd>lua require("dapui").eval()<CR>
"vnoremap <leader>db <cmd>lua require("dap").toggle_breakpoint()
"vnoremap <leader>dc <cmd>lua require("dap").continue()
"vnoremap <leader>ds <cmd>lua require("dap").step_over()
"vnoremap <leader>dS <cmd>lua require("dap").step_into()
"vnoremap <leader>dr <cmd>lua require("dap").repl.toggle()

lua <<EOF
require("kitty-scrollback").setup({})
local dap = require("dap")

local dapui = require("dapui")
dapui.setup({})

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.10.0/'
local codelldb_path = extension_path .. 'adapter/codelldb'
dap.adapters.codelldb = {
    type = 'server',
    port = "${port}",
    executable = {
        command = codelldb_path,
        args = {"--port", "${port}"},
    }
}

dap.configurations.rust = {
    {
        name = "Rust debug",
        type = "codelldb",
        request = "launch",
        program = function()
            vim.fn.jobstart("cargo build")
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = true,
        showDisassembly = "never"
    },
}

require("nvim-dap-virtual-text").setup()
require("neodev").setup({
    library = {
        plugins = {
            "nvim-dap-ui"
        },
        types = true
    },
})

vim.keymap.set('v', '<leader>dt', function() require("dapui").toggle() end)
vim.keymap.set('v', '<leader>de', function() require("dapui").eval() end)
vim.keymap.set('v', '<F5>', function() require('dap').continue() end)
vim.keymap.set('v', '<F6>', function() require('dap').step_over() end)
vim.keymap.set('v', '<F7>', function() require('dap').step_into() end)
vim.keymap.set('v', '<F8>', function() require('dap').step_out() end)
vim.keymap.set('v', '<Leader>db', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('v', '<Leader>dB', function() require('dap').set_breakpoint() end)
vim.keymap.set('v', '<Leader>dl', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('[DAP BREAKPOINT LOG]: ')) end)
vim.keymap.set('v', '<Leader>dr', function() require('dap').repl.toggle() end)
vim.keymap.set('v', '<Leader>dl', function() require('dap').run_last() end)
vim.keymap.set({'n', 'v'}, '<Leader>dh', function() require('dap.ui.widgets').hover() end)
vim.keymap.set({'n', 'v'}, '<Leader>dp', function() require('dap.ui.widgets').preview() end)
vim.keymap.set('v', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)
vim.keymap.set('v', '<Leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end)

require('hlslens').setup()

local function nvim_tree_on_attach(bufnr)
    local api = require("nvim-tree.api")

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
    vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
    local treeutils = require("treeutils")
    vim.keymap.set('n', '<c-f>', treeutils.launch_find_files, opts('Launch Find Files'))
    vim.keymap.set('n', '<c-g>', treeutils.launch_live_grep,  opts('Launch Live Grep'))

end

require("nvim-tree").setup({
    renderer = {
        icons = {
            show = {
                folder_arrow = false
            }
        },
        indent_markers = {
            enable = true
        },
        highlight_git = true,
        highlight_diagnostics = true,
        highlight_opened_files = "all",
        highlight_modified = "all",
        highlight_bookmarks = "all"
    },
    on_attach = nvim_tree_on_attach
})

local configuration = vim.fn['sonokai#get_configuration']()
local palette = vim.fn['sonokai#get_palette'](configuration.style, configuration.colors_override)

local bl = require("bufferline")
bl.setup({
    options = {
        numbers = function(opts)
            return string.format('%s·%s', opts.raise(opts.id), opts.lower(opts.ordinal))
        end,
        indicator = {
            icon = nil,
            style = "underline"
        },
        color_icons = true,
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = "center",
                separator = true,
                highlight = "Directory"
            },
            {
                filetype = "tagbar",
                text = "Structure",
                text_align = "center",
                separator = true
            },
            {
                filetype = "guihua",
                text = "LSP | Diagnostic",
                text_align = "center",
                separator = true
            }
        },
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        separator_style = "padded_slant",
        always_show_bufferline = true,
        hover = {
            enabled = true,
            delay = 200,
            reveal = {'close'}
        },
        diagnostics = "nvim-lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local s = " "
            for e, n in pairs(diagnostics_dict) do
                local sym = e == "error" and " " or (e == "warning" and " " or "" )
                s = s .. n .. sym
            end
            return s
        end,
        groups = {
            options = {
                toggle_hidden_on_enter = true -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
            },
            items = {
                bl.groups.builtin.pinned,
                bl.groups.builtin.ungrouped,
                {
                    name = "Tests", -- Mandatory
                    highlight = {
                        fg = palette.green[1],
                        sp = palette.red[1]
                    }, -- Optional
                    priority = 2, -- determines where it will appear relative to other groups (Optional)
                    icon = "", -- Optional
                    matcher = function(buf) -- Mandatory
                        return buf.name:match('%_test')
                            or buf.name:match('%_spec')
                    end,
                    separator = {
                        style = require('bufferline.groups').separator.pill,
                    },
                },
                {
                    name = "Configs",
                    highlight = {
                        fg = palette.yellow[1],
                        sp = palette.red[1]
                    },
                    priority = 3,
                    matcher = function(buf)
                        return buf.name:match("%.conf")
                            or buf.name:match("%.toml")
                            or buf.name:match("%.properties")
                    end,
                    separator = {
                        style = require('bufferline.groups').separator.pill,
                    },
                },
                {
                    name = "Docs",
                    highlight = {
                        --underline = false,
                        fg = palette.blue[1],
                        sp = palette.red[1]
                    },
                    auto_close = false,  -- whether or not close this group if it doesn't contain the current buffer
                    matcher = function(buf)
                        return buf.name:match('%.md')
                            or buf.name:match('%.txt')
                    end,
                    separator = {
                        style = require('bufferline.groups').separator.pill,
                    },
                }
            }
        }
    }
})
--require("tabline").setup({
	-- Defaults configuration options
--	enable = false,
--	options = {
		-- If lualine is installed tabline will use separators configured in lualine by default.
		-- These options can be used to override those settings.
--		component_separators = { '', '' },
--		section_separators = { '', '' },
--		max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
--		show_tabs_always = true, -- this shows tabs only when there are more than one tab or if the first tab is named
--		show_devicons = true, -- this shows devicons in buffer section
--		colored = true,
--		show_bufnr = false, -- this appends [bufnr] to buffer section,
--		tabline_show_last_separator = true,
--		show_filename_only = true, -- shows base filename only instead of relative path in filename
--		modified_icon = "+ ", -- change the default modified icon
--		modified_italic = true, -- set to true by default; this determines whether the filename turns italic if modified
--		show_tabs_only = false, -- this shows only tabs instead of tabs + buffers
--	}
--})
vim.cmd [[
	set guioptions-=e " Use showtabline in gui vim
	set sessionoptions+=tabpages,globals " store tabpages and globals in session
]]

local colors = {
	red = '#cdd6f4',
	grey = '#181825',
	black = '#1e1e2e',
	white = '#313244',
	light_green = '#6c7086',
	orange = '#fab387',
	green = '#a6e3a1',
	blue = '#80A7EA',
}

local theme = {
	normal = {
		a = { fg = colors.black, bg = colors.blue },
		b = { fg = colors.blue, bg = colors.white },
		c = { fg = colors.white, bg = colors.black },
		z = { fg = colors.white, bg = colors.black },
	},
	insert = { a = { fg = colors.black, bg = colors.orange } },
	visual = { a = { fg = colors.black, bg = colors.green } },
	replace = { a = { fg = colors.black, bg = colors.green } },
}

local vim_icons = {
	function()
		return " "
	end,
	separator = { left = "", right = "" },
	color = { bg = "#313244", fg = "#80A7EA" },
}

local space = {
	function()
		return " "
	end,
}

local filename = {
	'filename',
	color = { bg = "#80A7EA", fg = "#242735" },
	separator = { left = "", right = "" },
}

local filetype = {
	"filetype",
	icon_only = true,
	colored = true,
	color = { bg = "#313244" },
	separator = { left = "", right = "" },
}

local filetype_tab = {
	"filetype",
	icon_only = true,
	colored = true,
	color = { bg = "#313244" },
}

local buffer = {
--	require 'tabline'.tabline_buffers,
    {},
	separator = { left = "", right = "" },
}

local tabs = {
--	require 'tabline'.tabline_tabs,
    {},
    separator = { left = "", right = "" },
}

local fileformat = {
	'fileformat',
	color = { bg = "#b4befe", fg = "#313244" },
	separator = { left = "", right = "" },
}

local encoding = {
	'encoding',
	color = { bg = "#313244", fg = "#80A7EA" },
	separator = { left = "", right = "" },
}

local branch = {
	'branch',
	color = { bg = "#a6e3a1", fg = "#313244" },
	separator = { left = "", right = "" },
}

local diff = {
	"diff",
	color = { bg = "#313244", fg = "#313244" },
	separator = { left = "", right = "" },
}

local modes = {
	'mode', --fmt = function(str) return str:sub(1, 1) end,
	separator = { left = "", right = "" },
}

local function getLspName()
	local msg = 'No Active Lsp'
	local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
	local clients = vim.lsp.get_active_clients()
	if next(clients) == nil then
		return msg
	end
	for _, client in ipairs(clients) do
		local filetypes = client.config.filetypes
		if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
			return "  " .. client.name
		end
	end
	return "  " .. msg
end

local dia = {
	'diagnostics',
	color = { bg = "#313244", fg = "#80A7EA" },
	separator = { left = "", right = "" },
	sources = { 'nvim_diagnostic' },
	symbols = { error = ' ', warn = ' ', info = ' ' },
	diagnostics_color = {
		color_error = { fg = palette.red[1] },
		color_warn = { fg = palette.yellow[1] },
		color_info = { fg = palette.green[1] },
	},
}

local lsp = {
	function()
		return getLspName()
	end,
	separator = { left = "", right = "" },
	color = { bg = "#f38ba8", fg = "#1e1e2e" },
}

require('lualine').setup {

	options = {
		icons_enabled = true,
		theme = 'sonokai',
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = true,
		refresh = {
			statusline = 1000,
--			tabline = 1000,
			winbar = 1000,
		}
	},

	sections = {
		lualine_a = {
			--{ 'mode', fmt = function(str) return str:gsub(str, "  ") end },
			modes,
			vim_icons,
			--{ 'mode', fmt = function(str) return str:sub(1, 1) end },
		},
		lualine_b = {
			space,

		},
		lualine_c = {

			filename,
			filetype,
			space,
			branch,
			diff,
		},
		lualine_x = {
			space,
		},
		lualine_y = {
			encoding,
			fileformat,
			space,
		},
		lualine_z = {
			dia,
			lsp,
		}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { 'filename' },
		lualine_x = { 'location' },
		lualine_y = {},
		lualine_z = {}
	},
    tabline = {},
--	tabline = {
--		lualine_a = {
--			buffer,
--		},
--		lualine_b = {
--		},
--		lualine_c = {},
--		lualine_x = {
--			tabs,
--		},
--		lualine_y = {
--			space,
--		},
--		lualine_z = {
--		},
--	},
	winbar = {},
	inactive_winbar = {},

}

local chadtree_settings = {
      theme = {
            text_colour_set = "nerdtree_syntax_dark"
      }
}
vim.api.nvim_set_var("chadtree_settings", chadtree_settings)

local codewindow = require('codewindow')
codewindow.setup({
	auto_enable = true,
	exclude_filetypes = { "NvimTree",  "nerdtree", "CHADTree", "telescope", "tagbar", "alpha", "qf" },
	minimap_width = 15,
})
codewindow.apply_default_keybinds()

-- require('neoscroll').setup({})
require('cinnamon').setup({})

require("nvim-autopairs").setup({})
require("tabout").setup({})

local noice = require("noice")
local noice_config = {
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
}
noice.setup(noice_config)

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

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true })
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
dashboard.section.terminal.command = os.getenv("HOME") .. "/.config/nvim/doom/render.sh"
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

local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}
local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

vim.g.rainbow_delimiters = { highlight = highlight }
require("ibl").setup({
	scope = { highlight = highlight },
	indent = { highlight = highlight }
})

hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

require("nvim-treesitter.configs").setup({
	ensure_installed = "all",
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	matchup = {
		enable = true,
	},
	indent = {
		enable = false,
	}
})

require('goto-preview').setup({
	default_mappings = true,
})

require("typescript").setup({})

require("lsp-inlayhints").setup({})
vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
vim.api.nvim_create_autocmd("LspAttach", {
  group = "LspAttach_inlayhints",
  callback = function(args)
    if not (args.data and args.data.client_id) then
      return
    end

    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    require("lsp-inlayhints").on_attach(client, bufnr)
  end,
})

local liblldb_path = extension_path .. 'lldb/lib/liblldb'
local this_os = vim.loop.os_uname().sysname;

-- The path in windows is different
if this_os:find "Windows" then
    codelldb_path = extension_path .. "adapter\\codelldb.exe"
    liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
else
    -- The liblldb extension is .so for linux and .dylib for macOS
    liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
end

local rt = require("rust-tools")
local rt_opts = {
    server = {
        on_attach = function(client, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
        end,
    },
    on_initialized = function()
        require("lsp-inlayhints").set_all()
    end,
    tools = {
        inlay_hints = {
              auto = true,
        },
    },
    dap = {
        adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
    },
}
rt.setup(rt_opts)
rt.inlay_hints.enable()

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
local lspconfig = require("lspconfig")
lspconfig['jdtls'].setup({
	on_attach = on_attach,
	flags = flags,
	cmd = { "jdtls" },
	root_dir = function(name)
		return lspconfig['jdtls'].util.root_pattern(
			'pom.xml',
			'gradle.build',
			'.git'
		)(name) or vim.fn.getcwd()
	end
})
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig['jsonls'].setup({
	on_attach = on_attach,
	flags = flags,
	capabilities = capabilities
})
lspconfig['lua_ls'].setup({
	on_attach = on_attach,
	flags = flags,
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
			},
			diagnostics = {
				globals = {'vim'},
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
local lsps = {
	'pyright',
	'tsserver',
--	'rust_analyzer',
	'cmake',
	'clangd',
	'clojure_lsp',
	'gopls',
	'terraformls',
	'vimls',
	'asm_lsp',
	'bashls',
	'dotls',
	'glslls',
	'svlangserver',
	'texlab',
	'ansiblels',
	'bufls',
	'dockerls',
	'opencl_ls',
	'marksman'
}
for _,lsp_name in ipairs(lsps) do
	lspconfig[lsp_name].setup({
		on_attach = on_attach,
		flags = flags
	})
end

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
--telescope.load_extension('noice')
telescope.load_extension("notify")
-- telescope.load_extension("ui-select")
require("navigator").setup({
	lsp = {
		servers = lsps
	}
})

require("dressing").setup({
      input = {
            relative = "editor",
      },
      select = {
            backend = { "telescope", "fzf", "builtin" }
      },
})

local coq = require("coq")

require("lsp_lines").setup({})

vim.diagnostic.config({
  virtual_text = false,
})

require("todo-comments").setup({})
require("trouble").setup({})

require("scrollbar").setup({
	handlers = {
		search = true,
		ale = true,
	}
})

require("ccc").setup({
	highlighter = {
		auto_enable = true,
	},
})

require("crates").setup()

local barbecue = require("barbecue")
barbecue.setup()

-- venn.nvim: enable or disable keymappings
function _G.ToggleVenn()
    local venn_enabled = vim.inspect(vim.b.venn_enabled)
    if venn_enabled == "nil" then
        vim.b.venn_enabled = true
        vim.cmd[[setlocal ve=all]]
        -- draw a line on HJKL keystokes
        vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", {noremap = true})
        vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", {noremap = true})
        vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", {noremap = true})
        vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", {noremap = true})
        -- draw a box by pressing "f" with visual selection
        vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", {noremap = true})
        vim.api.nvim_buf_set_keymap(0, "v", "F", ":VFill<CR>", {noremap = true})
    else
        vim.cmd[[setlocal ve=]]
        vim.cmd[[mapclear <buffer>]]
        vim.b.venn_enabled = nil
    end
end
vim.api.nvim_set_keymap('n', '<leader>v', ":lua ToggleVenn()<CR>", { noremap = true})

-- local chadtree_settings = { 
-- 	theme = {
--  	text_colour_set = "nord",
--	 },	
-- }
-- vim.api.nvim_set_var("chadtree_settings", chadtree_settings)

require("glslView").setup({
  exe_path = "$(which glslViewer)",
  arguments = { "-l", "-w", "128", "-h", "256" },
})
require('sad').setup({
  debug = false, -- print debug info
  diff = 'delta', -- you can use `less`, `diff-so-fancy`
  ls_file = 'fd', -- also git ls-files
  exact = false, -- exact match
  vsplit = false, -- split sad window the screen vertically, when set to number
  -- it is a threadhold when window is larger than the threshold sad will split vertically,
  height_ratio = 0.6, -- height ratio of sad window when split horizontally
  width_ratio = 0.6, -- height ratio of sad window when split vertically
})
EOF

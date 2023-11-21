--Advised settings for NvimTree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd([[
    set termguicolors
    syntax on
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
    set laststatus=2
    " TODO: Move the below git sutff to the gitgutter plugin lua module
    highlight GitGutterAdd guifg=#a1d373 ctermfg=2
    highlight GitGutterChange guifg=#f19465 ctermfg=3
    highlight GitGutterDelete guifg=#f45e84 ctermfg=1
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() > 0 || exists("s:stdin") | NvimTreeOpen | wincmd p | else | Alpha | endif
    autocmd CursorHold,CursorHoldI * lua require('nvim-lightbulb').update_lightbulb()
    autocmd CursorHold,CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
    " TODO: Move the below file bindings to the GLSL plugin lua module
    autocmd! BufNewFile,BufRead *.vs,*.vsh,*.fs,*.fsh set ft=glsl
]]);

vim.g.sonokai_style = 'default'
vim.g.sonokai_diagnostic_virtual_text = ''
vim.g.guifont = 'JetBrainsMono Nerd Font'

vim.g.lightline = {
    colorscheme = 'sonokai',
    active = {
        right = {
            { 'syntastic',  'lineinfo' },
            { 'percent' },
            { 'fileformat', 'fileencoding', 'filetype' }
        },
        left = {
            { 'mode',      'paste' },
            { 'gitbranch', 'readonly', 'filename', 'modified' }
        }
    },
    component_expand = {
        syntastic = 'SyntasticStatuslineFlag',
    },
    component_type = {
        syntastic = 'error',
    },
    component_function = {
        gitbranch = 'gitbranch#name'
    },
}

vim.g.rainbow_active = 1
-- TODO: Fix colouring of rainbow brackets here
vim.g.rainbow_conf = {
    guifgs = { 'LightBlue', 'LightCyan', 'LightGreen', 'LightYellow', 'LightRed', 'LightMagenta' },
    ctermfgs = { 'LightBlue', 'LightCyan', 'LightGreen', 'LightYellow', 'LightRed', 'LightMagenta' },
}

vim.g.syntastic_always_populate_loc_list = 1
vim.g.syntastic_auto_loc_list = 1
vim.g.syntastic_check_on_open = 1
vim.g.syntastic_check_on_wq = 0

vim.g.python3_host_prog = '/usr/local/bin/python3'

vim.g.gitgutter_sign_added = '▐'
vim.g.gitgutter_sign_modified = '▐'
vim.g.gitgutter_sign_removed = '▐'
vim.g.gitgutter_sign_removed_first_line = '▐'
vim.g.gitgutter_sign_removed_above_and_below = '▐'
vim.g.gitgutter_sign_modified_removed = '▐'

vim.g.coq_settings = { auto_start = 'shut-up' }

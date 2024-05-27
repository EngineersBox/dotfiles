--Advised settings for NvimTree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd([[
    set termguicolors
    syntax on
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
]]);

vim.g.guifont = 'JetBrainsMono Nerd Font'

vim.g.python3_host_prog = '/usr/local/bin/python3'

vim.g.gitgutter_sign_added = '▐'
vim.g.gitgutter_sign_modified = '▐'
vim.g.gitgutter_sign_removed = '▐'
vim.g.gitgutter_sign_removed_first_line = '▐'
vim.g.gitgutter_sign_removed_above_and_below = '▐'
vim.g.gitgutter_sign_modified_removed = '▐'

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

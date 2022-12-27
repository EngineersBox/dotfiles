call plug#begin()

Plug 'sheerun/vim-polyglot'
Plug 'phanviet/vim-monokai-pro'
Plug 'valloric/youcompleteme'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'frazrepo/vim-rainbow'
Plug 'itchyny/vim-gitbranch'
Plug 'vim-syntastic/syntastic'
Plug 'tikhomirov/vim-glsl'
Plug 'preservim/nerdtree' |
                  \ Plug 'Xuyuanp/nerdtree-git-plugin' |
                  \ Plug 'ryanoasis/vim-devicons' | 
                  \ Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
Plug 'w0rp/ale'

call plug#end()

syntax on
set autoindent
set smartindent
set number
set mouse=a
set nocompatible
set termguicolors
set number
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

colorscheme monokai_pro
set clipboard=unnamedplus
set encoding=UTF-8

highlight CursorLineNr guifg=#73d3de
set cursorline
set cursorlineopt=number

set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
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
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
autocmd VimEnter * TagbarToggle | if (argc() > 0 || exists("s:std_in")) && (&filetype ==# 'c' || &filetype ==# 'cpp') | wincmd p | endif

nmap <F8> :TagbarToggle<CR>

highlight GitGutterAdd guifg=#a1d373 ctermfg=2
highlight GitGutterChange guifg=#f19465 ctermfg=3
highlight GitGutterDelete guifg=#f45e84 ctermfg=1

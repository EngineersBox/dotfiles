vim.wo.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.showmatch = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.undofile = true

vim.cmd.colorscheme("monoglow-void")
vim.cmd("highlight WinSeparator guifg=#232323")

vim.cmd([[
    set foldmethod=expr
    set foldexpr=nvim_treesitter#foldexpr()
    set foldtext=substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend))
    set fillchars=fold:\
    set foldnestmax=3
    set foldminlines=1
    set foldlevelstart=99
    set cursorline
    set cursorlineopt=screenline,number
    set switchbuf=useopen
    set whichwrap=b,s
]])

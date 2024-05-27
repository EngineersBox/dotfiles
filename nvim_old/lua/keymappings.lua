vim.cmd([[
nmap <F20> :TagbarToggle<CR>
nmap <F19> :LspAndDiag<CR>
nmap <F18> :NvimTreeToggle<CR>

nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>
nnoremap gpt <cmd>lua require('goto-preview').goto_preview_type_definition()<CR>
nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>
nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>
nnoremap gr <cmd>lua require('goto-preview').goto_preview_references()<CR>

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

nnoremap <leader>/ :nohl<CR>
]])

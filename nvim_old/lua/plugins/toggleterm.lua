return {
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = true,
        init = function()
            vim.cmd([[
                nnoremap <leader>ttv :ToggleTerm size=60 dir=~ direction=vertical<CR>
		nnoremap <leader>tth :ToggleTerm size=60 dir=~ direction=horizontal<CR>
		nnoremap <leader>ttf :ToggleTerm size=60 dir=~ direction=float<CR>
		nnoremap <leader>ttt :ToggleTerm size=60 dir=~ direction=tab<CR>
            ]])
        end
    }
}

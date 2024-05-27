return {
    {
        "smoka7/hop.nvim",
        version = "*",
        opts = {},
        init = function()
            vim.cmd([[
                nnoremap <leader>hw :HopWord<CR>
                nnoremap <leader>hl :HopLine<CR>
                nnoremap <leader>hc1 :HopChar1<CR>
                nnoremap <leader>hc2 :HopChar2<CR>
            ]])
        end
    }
}

return {
	{
		"terrortylor/nvim-comment",
        config = function(_, _)
            require("nvim_comment").setup({
                line_mapping = "<leader>cc",
                operator_mapping = "<leader>c"
            })
        end
	}
}

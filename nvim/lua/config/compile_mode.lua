vim.g.compile_mode = {
    input_word_completion = true,
    default_command = {
        python = "python3 %",
        lua = "lua %",
        c = "make -k ",
        cpp = "make -k ",
        rust = "cargo run %"
    }
}
return {
}

local vc = vim.cmd
vc(string.format("hi BorderLine ctermbg=NONE guibg=NONE"))
vc(string.format("hi EndOfBuffer ctermfg=NONE guifg=NONE"))
vc(string.format("hi FloatBorder ctermbg=NONE guibg=NONE"))
vc(string.format("hi LineNr ctermbg=NONE guibg=NONE"))
vc(string.format("hi Normal ctermbg=NONE guibg=NONE"))
vc(string.format("hi NormalFloat ctermbg=NONE guibg=NONE"))
vc(string.format("hi NormalNC ctermbg=NONE guibg=NONE"))
vc(string.format("hi NonText ctermbg=NONE guibg=NONE gui=NONE guifg=White"))
vc(string.format("hi Pmenu ctermbg=NONE guibg=NONE"))
vc(string.format("hi SignColumn ctermbg=NONE guibg=NONE"))
vc(string.format("hi StatusLine ctermbg=NONE guibg=NONE guifg=NONE gui=NONE"))
vc(string.format("hi StatusLineNC ctermbg=NONE guibg=NONE gui=NONE"))
vc(string.format("hi TelescopePromptCounter ctermbg=NONE guifg=White"))
vc(string.format("hi VertSplit ctermbg=NONE guibg=NONE gui=NONE"))
local bufferline = require("bufferline")
return {
    options = {
        style_preset = bufferline.style_preset.no_italic,
        offsets = {
            {
                filetype = "NvimTree",
                text="Nvim Tree",
                separator= false,
                text_align = "center"
            }
        },
        indicator = {
            style = "underline"
        },
        diagnostics = "nvim_lsp",
        separator_style = {"", ""},
        modified_icon = '●',
        show_close_icon = false,
        show_buffer_close_icons = false,
        separator_style = "thin",
        always_show_bufferline = true,
    }
}

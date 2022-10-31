vim.cmd [[highlight IndentBlanklineContextChar guifg=#C68AEE gui=nocombine]]
vim.cmd [[highlight IndentBlanklineContextSpaceChar guifg=#C68AEE gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineContextStart guifg=#C68AEE gui=nocombine]]

require("indent_blankline").setup{
    show_current_context = true,
    show_current_context_start = true,
    use_treesitter = true,
    --use_treesitter_scope = true
}

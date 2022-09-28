local set = vim.opt

set.expandtab = true
set.smarttab = true
set.smartindent = true
set.shiftwidth = 4
set.tabstop = 4

set.hlsearch = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true

set.splitbelow = true
set.splitright = true
set.wrap = false
set.scrolloff = 5
set.fileencoding = 'utf-8'
set.termguicolors = true
set.number = true
set.cursorline = true

set.hidden = true

vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "#b6becb", bg = "#1a1e24" })
vim.api.nvim_set_hl(0, "StatusLine", { fg = "#b6beca", bg = "#1a1e23" })

local set = vim.opt

vim.cmd [[set mouse=a]] -- Allows mouse to be used

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
set.relativenumber = true
set.cursorline = true
set.hidden = true

-- This sets colour to dashboard
vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#94F7C5" })
vim.api.nvim_set_hl(0, "DashboardCenter", { fg = "#70A5EB" })
vim.api.nvim_set_hl(0, "DashboardFooter", { fg = "#C68AEE" })

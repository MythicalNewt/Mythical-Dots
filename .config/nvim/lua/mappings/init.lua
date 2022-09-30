local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

vim.g.mapleader = ' '

map('n', '<leader>t', ':NvimTreeToggle<CR>', opts) -- toggle nvim tree
map('n', '<leader>c', ':noh<CR>', opts) -- clear search highlight

vim.keymap.set('n', '<leader>`', '<CMD>lua require("FTerm").toggle()<CR>')

vim.keymap.set('n', '<leader>ff', '<CMD>lua require("telescope.builtin").find_files()<CR>')
vim.keymap.set('n', '<leader>fg', '<CMD>lua require("telescope.builtin").live_grep()<CR>')
vim.keymap.set('n', '<leader>fh', '<CMD>lua require("telescope.builtin").help_tags()<CR>')

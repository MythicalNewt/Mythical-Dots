local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

vim.g.mapleader = ' '

map('n', '<leader>t', ':NvimTreeToggle<CR>', opts) -- toggle nvim tree
map('n', '<leader>c', ':noh<CR>', opts) -- clear search highlight

map('n', '<leader>`', '<CMD>lua require("FTerm").toggle()<CR>', opts) -- open fterm

map('n', '<leader>ff', '<CMD>lua require("telescope.builtin").find_files()<CR>', opts) -- call telescope file searcher
map('n', '<leader>fg', '<CMD>lua require("telescope.builtin").live_grep()<CR>', opts) -- search words in files through telescope

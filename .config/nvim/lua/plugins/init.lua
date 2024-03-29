return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use {'decaycs/decay.nvim', as = 'decay'} -- Decay colourscheme
    use {
        'kyazdani42/nvim-tree.lua',
        requires = { 'kyazdani42/nvim-web-devicons',}, -- optional, for file icons
    --tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
    use {
        'nvim-lualine/lualine.nvim', -- Status line
         requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use 'neovim/nvim-lspconfig' -- LSP plugin
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin
    use 'onsails/lspkind.nvim' -- Vscode like icons for cmp
    use {
        'nvim-treesitter/nvim-treesitter', -- Provides better syntax highlighting and is a base for more plugins
        run = ':TSUpdate' -- Packer will fail on first install comment this out and then install for first time
    }                     -- You can uncomment this later and run :luafile %
    use 'RRethy/vim-illuminate' -- Illuminates similar tokens
    use "numToStr/FTerm.nvim"  -- Terminal in neovim
    use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'} -- Provides emacs like tabs
    use 'ellisonleao/glow.nvim' -- Markdown preview plugin
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.x', -- $ yay -S ripgrep fd 
        requires = {'nvim-lua/plenary.nvim'} -- File finder and more
    }
    use "windwp/nvim-autopairs" -- Inserts pairs of brackets and more
    use 'lervag/vimtex' -- LaTeX filetype and syntax plugin
end)

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use {'decaycs/decay.nvim', as = 'decay'}
    use {
        'kyazdani42/nvim-tree.lua',
        requires = { 'kyazdani42/nvim-web-devicons',}, -- optional, for file icons
    --tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
    use {
        'nvim-lualine/lualine.nvim',
         requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin
    use 'onsails/lspkind.nvim' -- Vscode like icons for cmp
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate' -- Packer will fail on first install comment this out and then install for first time
    }                     -- You can uncomment this later and run :luafile %
    use 'RRethy/vim-illuminate'
    use "numToStr/FTerm.nvim"
    use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
    use 'ellisonleao/glow.nvim'
    use 'glepnir/dashboard-nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.x', -- $ yay -S ripgrep fd
        -- or                            , branch = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
        require("indent_blankline").setup { filetype_exclude = { "dashboard" }}
        end
    }
end)

require("lazy").setup({

    -- LSP configurations
    -- 'neovim/nvim-lspconfig',
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    'neovim/nvim-lspconfig',


    -- Completion framework
    { 'hrsh7th/nvim-cmp', dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'saadparwaiz1/cmp_luasnip'
    }},

    { 'theprimeagen/harpoon', dependencies = {
        'nvim-lua/plenary.nvim',
    }},

    -- Snippets
    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets',

    -- File explorer
    'nvim-tree/nvim-tree.lua',

    -- Fuzzy finder
    'nvim-telescope/telescope.nvim',

    -- Git integration
    'tpope/vim-fugitive',
    'lewis6991/gitsigns.nvim',

    -- Status line
    'nvim-lualine/lualine.nvim',

    -- Treesitter for syntax highlighting
    {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require    'nvim-treesitter.configs'.setup {
                ensure_installed = {"lua"},
                highlight = {
                    enable = true,
                },
            }
        end
    },

    -- Better error display
    { 'glepnir/lspsaga.nvim',
      config = function()
        require('lspsaga').setup({})
      end,
      dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons',
      }
    },

    'shaunsingh/nord.nvim',          -- color
    'folke/tokyonight.nvim',         -- color
    'gruvbox-community/gruvbox',     -- color
    'sainnhe/everforest',            -- color
    'sainnhe/gruvbox-material',      -- color
    'sainnhe/sonokai',               -- color
    {
     'rose-pine/neovim',
     name = 'rose-pine'             -- color
    },

    -- I gave up on opening nvim in last cursor position
    -- so I have resorted to a plugin
    'farmergreg/vim-lastplace',

    'mbbill/undotree',

    'folke/zen-mode.nvim',

})

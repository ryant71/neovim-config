-- This file can be loaded by calling `lua require("plugins")` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

	use {
	  "someone-stole-my-name/yaml-companion.nvim",
	  requires = {
		  { "neovim/nvim-lspconfig" },
		  { "nvim-lua/plenary.nvim" },
		  { "nvim-telescope/telescope.nvim" },
	  },
	  config = function()
		require("telescope").load_extension("yaml_schema")
	  end,
	}

	use {
		"autozimu/LanguageClient-neovim",
    	branch = 'next',
    	run = 'bash install.sh'
	}

    -- begin theprimegean --
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- use({
    --     'rose-pine/neovim',
    --     as = 'rose-pine',
    --     config = function()
    --         vim.cmd('colorscheme rose-pine')
    --     end
    -- })

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/playground')
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
                'williamboman/mason.nvim',
                run = function()
                -- pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    }

    use {
       "nvim-lualine/lualine.nvim",
       requires = { "kyazdani42/nvim-web-devicons", opt = true }
    }

	use("folke/zen-mode.nvim")

    -- use({
    --     "andrewferrier/wrapping.nvim",
    --     config = function()
    --         require("wrapping").setup()
    --     end,
    -- })

    use("shaunsingh/nord.nvim")      -- color
    use("folke/tokyonight.nvim")     -- color
    use("gruvbox-community/gruvbox") -- color
    use("sainnhe/everforest")        -- color
    use("sainnhe/gruvbox-material")  -- color
    use("sainnhe/sonokai")           -- color
    -- use("x/rose-pine")             -- color

    -- I gave up on opening nvim in last cursor position
    -- so I have resorted to a plugin
    use("farmergreg/vim-lastplace")

	use("sbdchd/neoformat")

end)

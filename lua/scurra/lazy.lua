require("lazy").setup({

	-- LSP configurations
	-- 'neovim/nvim-lspconfig',
	{ 'williamboman/mason.nvim' },
	{ 'williamboman/mason-lspconfig.nvim' },
	{ 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },
	'neovim/nvim-lspconfig',


	-- Completion framework
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'saadparwaiz1/cmp_luasnip'
		}
	},

	{
		'theprimeagen/harpoon',
		dependencies = {
			'nvim-lua/plenary.nvim',
		}
	},

	-- Snippets
	'L3MON4D3/LuaSnip',
	'rafamadriz/friendly-snippets',

	-- File explorer
	{
		'nvim-tree/nvim-tree.lua',
		config = function()
			require('nvim-tree').setup({
				sort = {
					sorter = "case_sensitive",
				},
				view = {
					width = 30,
				},
				renderer = {
					group_empty = true,
				},
				filters = {
					dotfiles = true,
				},
			}
			)
		end
	},


	'sbdchd/neoformat',

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
			require 'nvim-treesitter.configs'.setup {
				ensure_installed = { "lua" },
				highlight = {
					enable = true,
				},
			}
		end
	},

	-- Better error display
	{
		'glepnir/lspsaga.nvim',
		config = function()
			require('lspsaga').setup({})
		end,
		dependencies = {
			'nvim-treesitter/nvim-treesitter',
			'nvim-tree/nvim-web-devicons',
		}
	},

	'shaunsingh/nord.nvim',      -- color
	'folke/tokyonight.nvim',     -- color
	'gruvbox-community/gruvbox', -- color
	'sainnhe/everforest',        -- color
	'sainnhe/gruvbox-material',  -- color
	'sainnhe/sonokai',           -- color
	{
		'rose-pine/neovim',
		name = 'rose-pine' -- color
	},

	-- I gave up on opening nvim in last cursor position
	-- so I have resorted to a plugin
	'farmergreg/vim-lastplace',

	'mbbill/undotree',


	{
		"jakobkhansen/journal.nvim",
		config = function()
			require("journal").setup()
		end,
	},

	-- begin: writing --

	-- what you'd think it is
	{
		'iamcco/markdown-preview.nvim',
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" }
	},

	-- distraction-free writing
	'folke/zen-mode.nvim',

	-- line and word wraps
	'preservim/vim-pencil',

	-- end writing --
	-- see after/plugin/writing for config

	--
	{
		"FeiyouG/commander.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		keys = {
			{ "<leader>f",  "<CMD>Telescope commander<CR>", mode = "n" },
			{ "<leader>fc", "<CMD>Telescope commander<CR>", mode = "n" }
		},
		-- config = function()
		--   require("commander").setup({
		--     components = {
		--       "DESC",
		--       "KEYS",
		--       "CAT",
		--     },
		--     sort_by = {
		--       "DESC",
		--       "KEYS",
		--       "CAT",
		--       "CMD"
		--     },
		--     integration = {
		--       telescope = {
		--         enable = true,
		--       },
		--       lazy = {
		--         enable = true,
		--         set_plugin_name_as_cat = true
		--       }
		--     }
		--   })
		-- end,
	},

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	-- {
	--   "0xstepit/flow.nvim",
	--   lazy = false,
	--   priority = 1000,
	--   opts = {},
	-- },

	{
	  "0xstepit/flow.nvim",
	  lazy = false,
	  priority = 1000,
	  opts = {},
	  config = function()
		require("flow").setup{
		  transparent = true,
		  fluo_color = "orange",
		  mode = "normal",
		  aggressive_spell = false,
		}
		vim.cmd "colorscheme flow"
	  end,
	}
})

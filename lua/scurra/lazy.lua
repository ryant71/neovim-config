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
        "otavioschwanck/arrow.nvim",
        opts = {
            show_icons = true,
            leader_key = ';', -- Recommended to be a single key
            buffer_leader_key = 'm', -- Per Buffer Mappings
        }
    },

    -- Snippets
    {
      "L3MON4D3/LuaSnip",
      dependencies = 'rafamadriz/friendly-snippets',
    },

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

    {
      'stevearc/oil.nvim',
      opts = {},
      -- Optional dependencies
      dependencies = { { "echasnovski/mini.icons", opts = {} } },
      -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
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
    'rebelot/kanagawa.nvim',     -- color
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
    -- {
    --     'iamcco/markdown-preview.nvim',
    --     cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    --     build = "cd app && yarn install",
    --     init = function()
    --         vim.g.mkdp_filetypes = { "markdown" }
    --     end,
    --     ft = { "markdown" }
    -- },

    -- distraction-free writing
    'folke/zen-mode.nvim',

    {
    	"preservim/vim-pencil",
    	cmd = { "PencilToggle", "PencilSoft", "PencilHard" },
    	keys = {
    		{
    			"<leader>'",
    			function()
    				vim.cmd("PencilToggle")
    			end,
    			desc = "Toggle text wrap",
    		},
    	},
    	config = function() end,
    },
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
          -- mode = "normal",
          aggressive_spell = false,
        }
        vim.cmd "colorscheme flow"
      end,
    },

      -- { 'codota/tabnine-nvim', build = "./dl_binaries.sh" },

    ---@type LazySpec
    {
      "mikavilpas/yazi.nvim",
      event = "VeryLazy",
      keys = {
        -- 👇 in this section, choose your own keymappings!
        {
          "<leader>-",
          "<cmd>Yazi<cr>",
          desc = "Open yazi at the current file",
        },
        {
          -- Open in the current working directory
          "<leader>cw",
          "<cmd>Yazi cwd<cr>",
          desc = "Open the file manager in nvim's working directory" ,
        },
        {
          -- NOTE: this requires a version of yazi that includes
          -- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
          '<c-up>',
          "<cmd>Yazi toggle<cr>",
          desc = "Resume the last yazi session",
        },
      },
      ---@type YaziConfig
      opts = {
        -- if you want to open yazi instead of netrw, see below for more info
        open_for_directories = false,
        keymaps = {
          show_help = '<f1>',
        },
      },
    },

    {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
    },

    {
      "sphamba/smear-cursor.nvim",
      opts = {},
    },

    {
      "karb94/neoscroll.nvim",
      config = function ()
        require('neoscroll').setup({})
      end
    },

    {
      "nvzone/typr",
      cmd = "TyprStats",
      dependencies = "nvzone/volt",
      opts = {},
    },
    {
      "folke/trouble.nvim",
      opts = {}, -- for default options, refer to the configuration section for custom setup.
      cmd = "Trouble",
      keys = {
        {
          "<leader>xx",
          "<cmd>Trouble diagnostics toggle<cr>",
          desc = "Diagnostics (Trouble)",
        },
        {
          "<leader>xX",
          "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
          desc = "Buffer Diagnostics (Trouble)",
        },
        {
          "<leader>cs",
          "<cmd>Trouble symbols toggle focus=false<cr>",
          desc = "Symbols (Trouble)",
        },
        {
          "<leader>cl",
          "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
          desc = "LSP Definitions / references / ... (Trouble)",
        },
        {
          "<leader>xL",
          "<cmd>Trouble loclist toggle<cr>",
          desc = "Location List (Trouble)",
        },
        {
          "<leader>xQ",
          "<cmd>Trouble qflist toggle<cr>",
          desc = "Quickfix List (Trouble)",
        },
      },
    },
    {
      "terrastruct/d2-vim",
      ft = { "d2" },
      init = function()
        vim.g.d2_ascii_autorender = 1
        vim.g.d2_ascii_command = "d2"
        vim.g.d2_ascii_preview_width = vim.o.columns / 1.7
        vim.g.d2_ascii_mode = "extended"
        --    
        vim.g.d2_fmt_autosave = 1
        vim.g.d2_fmt_command = "d2 fmt"
        vim.g.d2_fmt_fail_silently = 0
        --
        vim.g.d2_play_command = "d2 play"
        vim.g.d2_play_theme = 0
        vim.g.d2_play_sketch = 0
      end,
    },

    {
      "ravsii/tree-sitter-d2",
      dependencies = { "nvim-treesitter/nvim-treesitter" },
      build = "make nvim-install",
    },

    "github/copilot.vim",

    "xiyaowong/transparent.nvim",

    {'akinsho/toggleterm.nvim', version = "*", config = true},

  }
)

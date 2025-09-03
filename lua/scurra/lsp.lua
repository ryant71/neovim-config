-- LSP setup
local nvim_lsp = require('lspconfig')

-- TypeScript and JavaScript
nvim_lsp.ts_ls.setup{}

-- Python
--nvim_lsp.pyright.setup{}

nvim_lsp.ruff.setup {
  init_options = {
    settings = {
      logLevel = 'debug',
      logFile = "~/.local/state/nvim/ruff.log",
      configuration = "~/.config/nvim/ruff.toml",
      configurationPreference = "filesystemFirst",
      lint = {
        enable = true,
        preview = true,
      },
      format = {
        enable = true,
      }
    }
  }
}

require'lspconfig'.terraformls.setup{}
vim.api.nvim_create_autocmd({"BufWritePre"}, {
  pattern = {"*.tf", "*.tfvars"},
  callback = function()
    vim.lsp.buf.format()
  end,
})


require('lspconfig').typos_lsp.setup({
    -- Logging level of the language server. Logs appear in :LspLog. Defaults to error.
    cmd_env = { RUST_LOG = "error" },
    init_options = {
        -- Custom config. Used together with a config file found in the workspace or its parents,
        -- taking precedence for settings declared in both.
        -- Equivalent to the typos `--config` cli argument.
        config = '~/code/typos-lsp/crates/typos-lsp/tests/typos.toml',
        -- How typos are rendered in the editor, can be one of an Error, Warning, Info or Hint.
        -- Defaults to error.
        diagnosticSeverity = "Error"
    }
})

-- Enable debug logs for the LSP client. Recommended for debugging only.
vim.lsp.set_log_level("debug")

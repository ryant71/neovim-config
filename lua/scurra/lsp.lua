-- LSP setup
local nvim_lsp = require('lspconfig')

-- TypeScript and JavaScript
nvim_lsp.tsserver.setup{}

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

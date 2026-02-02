-- Neovim 0.11+ LSP configs
-- Register configs with vim.lsp.config(<server>, <opts>) then enable with vim.lsp.enable(<server>)

-- TypeScript / JavaScript
vim.lsp.config("ts_ls", {})
vim.lsp.enable("ts_ls")

-- Python (pyright) — still optional/commented out
-- vim.lsp.config("pyright", {})
-- vim.lsp.enable("pyright")

-- Ruff (linter/formatter via ruff-lsp)
vim.lsp.config("ruff", {
  init_options = {
    settings = {
      logLevel = "debug",
      logFile = "~/.local/state/nvim/ruff.log",
      configuration = "~/.config/nvim/ruff.toml",
      configurationPreference = "filesystemFirst",
      lint = {
        enable = true,
        preview = true,
      },
      format = {
        enable = true,
      },
    },
  },
})
vim.lsp.enable("ruff")

-- Terraform
vim.lsp.config("terraformls", {})
vim.lsp.enable("terraformls")

-- Format on save for Terraform files
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*.tf", "*.tfvars" },
  callback = function()
    vim.lsp.buf.format()
  end,
})

-- Typos (typos-lsp)
vim.lsp.config("typos_lsp", {
  -- Logs from the language server itself (appears in :LspLog)
  cmd_env = { RUST_LOG = "error" },
  init_options = {
    -- Merged with any workspace config (this value takes precedence on overlap)
    config = "~/code/typos-lsp/crates/typos-lsp/tests/typos.toml",
    diagnosticSeverity = "Error",
  },
})
vim.lsp.enable("typos_lsp")

-- Enable debug logs for the LSP client (use only while debugging)
vim.lsp.set_log_level("debug")


-- Neovim 0.11+ LSP configurations
-- Register configs with vim.lsp.config(<server>, <opts>) then enable with vim.lsp.enable(<server>)

-- Mason setup for LSP server management
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { "pyrefly", "lua_ls", "ruff", "terraformls", "typos_lsp", "ts_ls" },
})

-- Global LSP keymaps and setup
local function on_attach(client, bufnr)
  local opts = { buffer = bufnr, remap = false }
  
  -- Navigation
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  
  -- Documentation
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
  
  -- Workspace
  vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)
  
  -- Code actions
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  
  -- Formatting
  vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)
end

-- Python (pyrefly)
vim.lsp.config("pyrefly", {
  on_attach = on_attach,
})
vim.lsp.enable("pyrefly")

-- TypeScript / JavaScript
vim.lsp.config("ts_ls", {
  on_attach = on_attach,
})
vim.lsp.enable("ts_ls")

-- Lua
vim.lsp.config("lua_ls", {
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = { enable = false },
    },
  },
})
vim.lsp.enable("lua_ls")

-- Ruff (linter/formatter via ruff-lsp)
vim.lsp.config("ruff", {
  on_attach = on_attach,
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
vim.lsp.config("terraformls", {
  on_attach = on_attach,
})
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
  on_attach = on_attach,
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
vim.lsp.set_log_level("warn")

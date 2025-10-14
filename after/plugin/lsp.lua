-- Additional LSP configuration
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  handlers = {
    lsp_zero.default_setup,

    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()

      -- new Neovim 0.11+ API
      vim.lsp.config("lua_ls", lua_opts)
      vim.lsp.enable("lua_ls")
    end,
  },
})

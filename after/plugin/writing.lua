-- Autocommands
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown',
  callback = function()
    -- vim.cmd('ZenMode')
    vim.cmd('PencilSoft')
  end
})

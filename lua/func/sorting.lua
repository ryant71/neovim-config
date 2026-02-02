
vim.api.nvim_create_user_command('SortLine', function()
  local line = vim.fn.getline('.')
  local sorted = vim.fn.sort(vim.fn.split(line))
  vim.fn.setline('.', table.concat(sorted, ' '))
end, {})

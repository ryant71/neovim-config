-- Lua function using par to format lines
function FormatWithPar()
  vim.cmd([[
    if mode() ==# 'v' || mode() ==# 'V'
      '<,'>!par 80q
    else
      normal! vip!par 80q
    endif
  ]])
end

-- Key mappings (example: <leader>p)
vim.keymap.set({'n', 'v'}, '<leader>8', FormatWithPar, { desc = "Format text with par" })

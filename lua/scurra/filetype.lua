vim.filetype.add {
  pattern = {
    ['.*'] = {
      priority = math.huge,
      function(path, bufnr)
        local line1 = table.concat(vim.api.nvim_buf_get_lines(bufnr, 0, 1, false), "\n")
        local line2 = table.concat(vim.api.nvim_buf_get_lines(bufnr, 1, 2, false), "\n")
        if vim.regex([[^AWSTemplateFormatVersion]]):match_str(line1) or
           vim.regex([[AWS::Serverless-2016-10-31]]):match_str(line1) then
          return 'yaml.cloudformation'
        elseif vim.regex([["']AWSTemplateFormatVersion]]):match_str(line1) or
           vim.regex([["']AWSTemplateFormatVersion]]):match_str(line2) or
           vim.regex([[AWS::Serverless-2016-10-31]]):match_str(line1) or
           vim.regex([[AWS::Serverless-2016-10-31]]):match_str(line2) then
          return 'json.cloudformation'
        end
      end,
    },
  },
}


vim.lsp.config('cfn_lsp', {
  cmd = { vim.fn.expand('~/.local/bin/cfn-lsp-extra') },

  -- make sure you actually set these filetypes somewhere (ftdetect/autocmd)
  filetypes = { 'yaml.cloudformation', 'json.cloudformation' },

  -- simple, robust root detection in 0.11+
  -- (you can also use a function if you need complex logic)
  root_markers = { '.git' },

  settings = {
    documentFormatting = true,
  },
})

-- Enable it
vim.lsp.enable('cfn_lsp')

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*.json.tmpl",
  callback = function()
    vim.bo.filetype = "json"
  end,
})

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*.conf.tmpl",
  callback = function()
    vim.bo.filetype = "ini"
  end,
})

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*",
  callback = function()
    if vim.bo.filetype == "template" then
      vim.bo.filetype = "ini"
    end
  end,
})


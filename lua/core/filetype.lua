vim.filetype.add {
  pattern = {
    ['.*'] = {
      function(_, bufnr)
        local lines = vim.api.nvim_buf_get_lines(bufnr, 0, 2, false)
        local line1, line2 = lines[1] or '', lines[2] or ''

        if line1:match('^#!.*%f[%w]uv%s+run') then
          return 'python'
        end

        local cfn_yaml = vim.regex([[^AWSTemplateFormatVersion\|AWS::Serverless-2016-10-31]])
        local cfn_json = vim.regex([[["']AWSTemplateFormatVersion\|AWS::Serverless-2016-10-31]])
        if cfn_yaml:match_str(line1) then
          return 'yaml.cloudformation'
        elseif cfn_json:match_str(line1) or cfn_json:match_str(line2) then
          return 'json.cloudformation'
        end
      end,
      { priority = math.huge },
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


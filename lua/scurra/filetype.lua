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

require('lspconfig.configs').cfn_lsp = {
  default_config = {
    cmd = { os.getenv("HOME") .. '/.local/bin/cfn-lsp-extra' },
    filetypes = { 'yaml.cloudformation', 'json.cloudformation' },
    root_dir = function(fname)
      return require('lspconfig').util.find_git_ancestor(fname) or vim.fn.getcwd()
    end,
    settings = {
      documentFormatting = false,
    },
  },
}
require('lspconfig').cfn_lsp.setup{}

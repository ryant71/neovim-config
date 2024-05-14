require('lint').linters_by_ft = {
  	markdown = {'cfn-lint'}
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
callback = function()
  require("lint").try_lint("cfn-lint")
end,
})

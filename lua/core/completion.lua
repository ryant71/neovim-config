---  for 'nvim-lua/completion-nvim'
---  https://chatgpt.com/c/1ad72731-d9b1-4cd2-b971-10aa3a48fdf1
-- Configure completion-nvim
-- vim.o.completeopt = "menuone,noinsert,noselect"
-- vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
---

-- Completion setup
local cmp = require'cmp'
cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
    }
})


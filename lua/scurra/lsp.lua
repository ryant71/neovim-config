-- LSP setup
local nvim_lsp = require('lspconfig')

-- YAML Language Server setup
nvim_lsp.yamlls.setup{
    settings = {
        yaml = {
            schemas = {
                ["https://raw.githubusercontent.com/awslabs/goformation/master/schema/cloudformation.schema.json"] = "/*"
            }
        }
    }
}

-- TypeScript and JavaScript
nvim_lsp.tsserver.setup{}

-- Python
nvim_lsp.pyright.setup{}

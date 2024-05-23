-- Treesitter setup
require('nvim-treesitter.configs').setup {
    ensure_installed = {"yaml"},
    highlight = {
        enable = true,
    },
}

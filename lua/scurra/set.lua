vim.g.mapleader = " "

vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.isfname:append("@-@")
vim.opt.iskeyword:append("-")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"
vim.opt.cmdheight = 2

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append("c")

vim.opt.cursorline = true
vim.opt.errorbells = false

vim.opt.listchars = {eol = '↲', tab = '▸ ', trail = '·'}

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.paste = true

vim.g.python3_host_prog = '/Users/ryan/.pyenv/versions/neovim/bin/python'

-- trying this out
--
-- vim.g.yaml_disable_languageserver = {'cloudformation'}
vim.g.cfnlint_args = "--ignore-checks W"

-- Define LanguageClient server commands
vim.g.LanguageClient_serverCommands = {
    ['yaml.cloudformation'] = {'~/.local/bin/cfn-lsp-extra'},
    ['json.cloudformation'] = {'~/.local/bin/cfn-lsp-extra'}
}

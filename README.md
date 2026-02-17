# NEOVIM CONFIG

## layout

    .
    ├── after
    │   ├── ftplugin
    │   │   ├── json.lua
    │   │   ├── lua.lua
    │   │   ├── markdown.lua
    │   │   ├── sh.lua
    │   │   ├── template.lua
    │   │   ├── typescript.lua
    │   │   └── yaml.lua
    │   ├── plugin
    │   │   ├── arrow.lua
    │   │   ├── colors.lua
    │   │   ├── fugitive.lua
    │   │   ├── lualine.lua
    │   │   ├── luasnip.lua
    │   │   ├── markdown.lua
    │   │   ├── multiply.lua
    │   │   ├── tabnine.lua
    │   │   ├── telescope.lua
    │   │   ├── toggleterm.lua
    │   │   ├── treesitter.lua
    │   │   ├── undotree.lua
    │   │   ├── writing.lua
    │   │   └── zenmode.lua
    │   └── queries
    │       └── yaml
    │           └── injections.scm
    ├── init.lua
    ├── lazy-lock.json
    ├── lua
    │   ├── core
    │   │   ├── completion.lua
    │   │   ├── filetype.lua
    │   │   ├── init.lua
    │   │   ├── keymaps.lua
    │   │   ├── lazy.lua
    │   │   ├── lsp.lua
    │   │   ├── nvim-tree.lua
    │   │   ├── set.lua
    │   │   └── treesitter.lua
    │   ├── func
    │   │   ├── init.lua
    │   │   ├── multiply.lua
    │   │   ├── my_colorselect.lua
    │   │   ├── my_info.lua
    │   │   ├── par.lua
    │   │   └── sorting.lua
    │   └── testing
    │       ├── test.lua
    │       └── yaml-companion.lua
    ├── my_keys.md
    ├── README.md
    ├── ruff.toml
    └── typrstats


## lsp-zero

For the options I've added, I installed the following:

        pipx install cfn-lsp-extra
        pipx install cfn-lint
        pip install "python-lsp-server[yapf]"
        ~~brew install~~ chktex     # LaTeX linter
        ~~brew install~~ checkmake  # Makefile linter
        ~~brew install~~ yamllint   # yaml linter
        ~~brew install~~ hadolint   # Dockerfile linter

## TODO

### Language Modes

Cloudformation, SaltStack, Jinja2

### Miscellaneous

* Make python-language-server faster...
* ...

## Acknowledgements

* [Your first vimrc - ThePrimeagen](https://www.youtube.com/watch?v=x2QJYq4IX6M)
* [ThePrimeagen's GitHub repo](https://github.com/ThePrimeagen/.dotfiles/tree/master/vim-2022/.config/nvim)
* [0 to LSP: Neovim from scratch](https://www.youtube.com/watch?v=w7i4amO_zaE)

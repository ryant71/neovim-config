# NEOVIM CONFIG

## layout
        .
        ├── README.md
        ├── after
        │   └── plugin
        │       ├── colors.lua
        │       ├── fugitive.lua
        │       ├── harpoon.lua
        │       ├── lsp.lua
        │       ├── lualine.lua
        │       ├── telescope.lua
        │       ├── treesitter.lua
        │       ├── undotree.lua
        │       └── zenmode.lua
        ├── init.lua
        ├── lua
        │   └── scurra
        │       ├── init.lua
        │       ├── packer.lua
        │       ├── remap.lua
        │       └── set.lua
        └── plugin
            └── packer_compiled.lua
## lsp-zero

For the options I've added, I installed the following:

        pipx install cfn-lsp-extra
        pipx install cfn-lint
        pip install "python-lsp-server[yapf]"
        brew install chktex     # LaTeX linter
        brew install checkmake  # Makefile linter
        brew install yamllint   # yaml linter
        brew install hadolint   # Dockerfile linter

## TODO

### Language Modes

SaltStack, Jinja2

### Miscellaneous

* Make python-language-server faster...
* ...

## Acknowledgements

* [Your first vimrc - ThePrimeagen](https://www.youtube.com/watch?v=x2QJYq4IX6M)
* [ThePrimeagen's GitHub repo](https://github.com/ThePrimeagen/.dotfiles/tree/master/vim-2022/.config/nvim)
* [0 to LSP: Neovim from scratch](https://www.youtube.com/watch?v=w7i4amO_zaE)

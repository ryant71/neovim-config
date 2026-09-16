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

## Troubleshooting

Using treesitter as an example.

### 1. Run Neovim with your normal config, but in head‑less mode

```bash
  # Use the same init.lua you normally load (the one in ~/.config/neovim-config)
  nvim -u ~/.config/neovim-config/init.lua --headless +'lua require("nvim-treesitter.configs")' +'qa!'
```

- -u <file> tells Neovim to source that init file.
- --headless starts Neovim without a UI.
- + commands are executed after the init is sourced:
    - lua require("nvim-treesitter.configs") tries to load the Treesitter config module.
    - qa! quits Neovim (the ! forces quit even if there are errors).

You should see the same “module … not found” stack trace that you get when you start Neovim normally.

────────────────────────────────────────────────────────────────────────────────

### 2. Run Neovim with a clean environment (no plugins) to verify the module is missing

```bash
  nvim --headless -u NONE +'lua require("nvim-treesitter.configs")' +'qa!'
```

- -u NONE skips loading any user config or plugins.
- If this still fails, the module truly isn’t installed in your runtimepath.
- If it succeeds (unlikely), the problem is that something in your config is removing the plugin’s path.

────────────────────────────────────────────────────────────────────────────────

### 3. Check that the plugin is actually installed where Neovim expects it

```bash
  # Show where Neovim is looking for runtime files
  nvim --headless +'lua print(vim.inspect(vim.opt.rtp))' +'qa!'
```

Look for a path that ends with something like .../lazy-rocks/nvim-treesitter (or .../pack/.../start/nvim-treesitter).
If that directory is missing, the plugin wasn’t installed.

────────────────────────────────────────────────────────────────────────────────

### 4. List the installed lazy‑rock plugins (if you use lazy.nvim)

```bash
  # Lazy.nvim writes a lockfile; you can grep it
  grep -i nvim-treesitter ~/.local/share/nvim/lazy/lazy.nvim.lock
```

If the lockfile has no entry for nvim-treesitter, the plugin never got installed.

────────────────────────────────────────────────────────────────────────────────

### 5. Force‑install (or reinstall) the plugin with lazy.nvim

```bash
  # Open a temporary Neovim session just to run Lazy’s sync command
  nvim --headless -c 'lua require("lazy").sync()' +'qa!'
```

This will download any missing plugins, including nvim-treesitter. After it finishes, re‑run step 1 to verify the module loads.

────────────────────────────────────────────────────────────────────────────────

### 6. Optional: Run a minimal Lua script outside Neovim to double‑check the Lua path

If you want to see the exact package.path/package.cpath that Neovim uses:

```bash
  cat > /tmp/check_treesitter.lua <<'EOF'
  print("Lua path:")
  print(package.path)
  print("\nC path:")
  print(package.cpath)
  EOF

  nvim --headless -c "lua dofile('/tmp/check_treesitter.lua')" +'qa!'
```

The output will show the directories that Lua searches for .lua and compiled .so files. Verify that a directory containing nvim-treesitter/configs.lua appears in package.path.

────────────────────────────────────────────────────────────────────────────────

What to look for

┌──────┬────────────────────────────────────────────────────────────────────────┬──────────────────────────────────────────────────────────────────────────────┐
│ Step │ Expected result                                                        │ What it tells you                                                            │
├──────┼────────────────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────────────────────┤
│ 1    │ Same “module not found” error                                          │ Confirms the problem reproduces in headless mode.                            │
├──────┼────────────────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────────────────────┤
│ 2    │ Same error (or a different “module not found” from a different path)   │ Shows whether the module is missing globally or only when your config loads. │
├──────┼────────────────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────────────────────┤
│ 3    │ runtimepath contains a path ending in nvim-treesitter                  │ If missing, the plugin isn’t on the runtimepath.                             │
├──────┼────────────────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────────────────────┤
│ 4    │ Entry in lazy.nvim.lock                                                │ If missing, lazy.nvim never installed it.                                    │
├──────┼────────────────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────────────────────┤
│ 5    │ lazy.sync() finishes without errors                                    │ Plugin should now be present; re‑run step 1.                                 │
├──────┼────────────────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────────────────────┤
│ 6    │ package.path includes a directory that has nvim-treesitter/configs.lua │ Confirms Lua can locate the file.                                            │
└──────┴────────────────────────────────────────────────────────────────────────┴──────────────────────────────────────────────────────────────────────────────┘

────────────────────────────────────────────────────────────────────────────────

### Quick “one‑liner” to test everything at once

```bash
  nvim --headless -u ~/.config/neovim-config/init.lua \
    +'lua print("rtp:", vim.inspect(vim.opt.rtp))' \
    +'lua print("path:", package.path)' \
    +'lua print("cpath:", package.cpath)' \
    +'lua require("nvim-treesitter.configs")' +'qa!'
```

## Acknowledgements

* [Your first vimrc - ThePrimeagen](https://www.youtube.com/watch?v=x2QJYq4IX6M)
* [ThePrimeagen's GitHub repo](https://github.com/ThePrimeagen/.dotfiles/tree/master/vim-2022/.config/nvim)
* [0 to LSP: Neovim from scratch](https://www.youtube.com/watch?v=w7i4amO_zaE)

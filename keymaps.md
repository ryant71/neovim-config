# Files & Search

  `<leader>e`       Open file manager (Oil) at current file's dir
  `-`               Same as above
  `<leader>E`       Open file manager in a split to the right
  `<leader>ff`      Find files (Telescope)
  `<C-p>`           Find git-tracked files
  `<leader>ss`      Grep the project for a prompted string

# Bookmarks (arrow)

  `<C-s>`           Bookmark / unbookmark current file
  `;`               Bookmark menu: key jumps, `v`/`-` split, `e` edit
  `H` / `L`         Previous / next bookmarked file
  `<leader>m`       Line bookmarks in this buffer

# Marks

  `ma`              Set mark a (lowercase: this file only)
  `mA`              Set mark A (uppercase: global, jumps across files)
  `'a` / `` `a ``   Jump to mark a: line / exact column
  `''`              Back to where you were before the last jump
  `` `. ``          Position of the last change
  `:marks`          List marks           `:delm a` delete mark a

# Folding                                     (treesitter, opens unfolded)

  `za`              Toggle fold under cursor
  `zc` / `zo`       Close / open fold
  `zM` / `zR`       Close all / open all folds
  `zj` / `zk`       Move to next / previous fold
  `[z` / `]z`       Jump to start / end of current fold
  `zv`              Open just enough folds to show the cursor

# Clipboard & Registers                       (normal + visual)

  `<leader>y`       Yank to system clipboard
  `<leader>Y`       Yank line to system clipboard
  `<leader>p`       Paste from system clipboard        (normal)
  `<leader>pp`      Paste over selection, keep yank    (visual)
  `<leader>d`       Delete without overwriting yank
  `"ry`             Yank into register r
  `"rp`             Put from register r

# Change Case

  `guw`             Lowercase to end of word
  `guW`             Lowercase to end of WORD
  `gUW`             Uppercase to end of WORD
  `guaW`            Lowercase whole WORD
  `gUaW`            Uppercase whole WORD

# Editing

  `<leader>u`       Toggle undo tree

# Snippets (LuaSnip)                          (insert + select)

  `<C-k>`           Expand snippet trigger before cursor    (insert)
  `<C-l>` / `<C-j>` Next / previous placeholder
  `<C-e>`           Cycle choice (when a choice node is active)
  `<CR>`            Snippets also show in the completion menu
  `args`            sh: usage() + flag/positional parsing
  Own snippets live in `luasnippets/<filetype>.lua`

# Windows

  `<C-w> n`         New window below    [empty file]
  `<C-w> ^`         New window below    [previous file]
  `<C-w> s`         New window below    [same file]
  `<C-w> v`         New window right    [same file]
  `<C-w> hjkl`      Move to window left/down/up/right
  `<leader>hjkl`    Same as above

# Toggles

  `<leader>L`       Show/hide whitespace chars  (`:set list!`)

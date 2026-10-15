# Files & Search

  `<leader>e`       Open file manager (Oil) at current file's dir
  `-`               Same as above
  `<leader>E`       Open file manager in a split to the right
  `<leader>ff`      Find files (Telescope)
  `<C-p>`           Find git-tracked files
  `<leader>ss`      Grep the project for a prompted string

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

# Windows

  `<C-w> n`         New window below    [empty file]
  `<C-w> ^`         New window below    [previous file]
  `<C-w> s`         New window below    [same file]
  `<C-w> v`         New window right    [same file]
  `<C-w> hjkl`      Move to window left/down/up/right
  `<leader>hjkl`    Same as above

# Toggles

  `<leader>L`       Show/hide whitespace chars  (`:set list!`)

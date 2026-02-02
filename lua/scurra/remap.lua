--local set = vim.keymap.set
-- if you want to replace vim.keymap.set() with set()

vim.g.mapleader = " "

-- vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })

vim.keymap.set("n", "<Up>", "<Nop>")
vim.keymap.set("n", "<Down>", "<Nop>")
vim.keymap.set("n", "<Left>", "<Nop>")
vim.keymap.set("n", "<Right>", "<Nop>")
vim.keymap.set("n", "<F1>", "<Nop>")

vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>l", "<C-w>l")


vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
-- paste over something without losing copied text
-- https://youtu.be/w7i4amO_zaE?t=1594
vim.keymap.set("x", "<leader>pp", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set("n", "<leader>y", [["+y]])
vim.keymap.set("v", "<leader>y", [["+y]])

vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set("v", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<leader>d", [["_d]])
vim.keymap.set("v", "<leader>d", [["_d]])

-- paste from system clipboard
vim.keymap.set("n", "<leader>p", [["+p]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format)

--vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
--vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
--vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
--vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")


vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vl", "<cmd>e ~/.config/nvim/lua/scurra/lazy.lua<CR>");


vim.keymap.set("n", "<leader>.", "<cmd>set cursorline!<CR>")
vim.keymap.set("n", "<leader>,", "<cmd>set cursorcolumn!<CR>")


-- normal mode = jump around
vim.keymap.set("n", "<C-j>", "20<Down>zz")
vim.keymap.set("n", "<C-k>", "20<Up>zz")

-- normal mode = drag lines aroung
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")

-- vim.keymap.set("n", "cc", "cO")
-- vim.keymap.set("n", "cc",  "<cmd>silent cc :setlocal noai<CR>cc:setlocal ai<CR>")

-- make cc cut a line without jumping into INSERT mode afterwards
-- vim.keymap.set("n", "cc", "0c$<Esc>")
vim.keymap.set("n", "<leader>c", "cc<Esc>")

vim.keymap.set("n", "Y", "y$")
vim.keymap.set("n", "C", "c$")


-- Netrw
---
vim.keymap.set("n", "<leader>e", function()
    vim.cmd("Ex")
end)

-- Open window to the right with netrw ready
vim.keymap.set("n", "<leader>er", "<cmd>Vex!<CR>")

vim.keymap.set("n", "<leader>l", "<cmd>set invlist<CR>")

-- Make lower case with Capitalised first letter
vim.keymap.set(
  'n',
  '<leader>C',
  [[:s/\<<C-r><C-w>\>/\u\L&/e<CR>]],
  { noremap = true, silent = true, desc = "Title-case word under cursor" }
)

-- remove trailing spaces
vim.api.nvim_set_keymap('n', '<leader>fs', ':%s/\\s\\+$//<CR>', {noremap = true})
-- replace tabs with 4 spaces
vim.api.nvim_set_keymap('n', '<leader>ft', ':%s/	/    /g<CR>', {noremap = true})

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.keymap.set("n", "<leader>-", function()
  require("yazi").yazi()
end)

-- make this work sometime
-- vim.keymap.set("n", '<leader><leader>s"', 'ysiw"')

vim.keymap.set('n', '<leader>0', ':nohlsearch<CR>', { noremap = true, silent = true })

-- double zero takes you beginning of line
vim.keymap.set("n", '00', '0', { noremap = true, silent = true })
-- zero takes you to first non white-space character
vim.keymap.set("n", "0", "^", { noremap = true, silent = true })


vim.keymap.set("n", "<leader>uu", function()
  local word = vim.fn.expand("<cword>")
  local UWORD = word:upper()
  vim.cmd("%s/\\<" .. word .. "\\>/" .. UWORD .. "/g")
end, { desc = "Uppercase word under cursor and all occurrences" })


vim.keymap.set('n', '<F1>', '<Nop>')
vim.keymap.set('i', '<F1>', '<Nop>')
vim.keymap.set('v', '<F1>', '<Nop>')
vim.keymap.set('c', '<F1>', '<Nop>')


vim.g.mapleader = " "

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
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set("n", "<leader>y", [["+y]])
vim.keymap.set("v", "<leader>y", [["+y]])

vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set("v", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<leader>d", [["_d]])
vim.keymap.set("v", "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

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


vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- Netrw
---
vim.keymap.set("n", "<leader>e", function()
    vim.cmd("Ex")
end)

-- Open window to the right with netrw ready
vim.keymap.set("n", "<leader>er", "<cmd>Vex!<CR>")

vim.keymap.set("n", "<leader>l", "<cmd>set invlist<CR>")

-- remove trailing spaces
vim.api.nvim_set_keymap('n', '<leader>fs', ':%s/\\s\\+$//<CR>', {noremap = true})
-- replace tabs with 4 spaces
vim.api.nvim_set_keymap('n', '<leader>ft', ':%s/	/    /g<CR>', {noremap = true})

vim.keymap.set("n", "0", "^")

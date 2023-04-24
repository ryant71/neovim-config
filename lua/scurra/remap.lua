vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

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
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

--vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
--vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/scurra/packer.lua<CR>");

---
---
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
vim.keymap.set("n", "cc", "0c$<Esc>")

vim.keymap.set("n", "Y", "y$")
vim.keymap.set("n", "C", "c$")


vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

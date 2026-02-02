local multiply = require("func.multiply").multiply_number_at_cursor

vim.keymap.set("n", "<leader>2", function() multiply(2) end, { desc = "Double number under cursor" })
vim.keymap.set("n", "<leader>3", function() multiply(3) end, { desc = "Triple number under cursor" })
vim.keymap.set("n", "<leader>4", function() multiply(4) end, { desc = "Quadruple number under cursor" })
-- Add more if you like

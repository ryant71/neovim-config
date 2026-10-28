require("luasnip.loaders.from_vscode").lazy_load()
-- Own snippets: luasnippets/<filetype>.lua in the config dir
require("luasnip.loaders.from_lua").lazy_load()

local ls = require("luasnip")

vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

-- Normal mode: resume a snippet after leaving insert mode, but only when the
-- cursor is inside one; otherwise keep the key's usual behaviour
local function jump_or(dir, keys)
	return function()
		if ls.in_snippet() and ls.jumpable(dir) then
			ls.jump(dir)
		else
			vim.api.nvim_feedkeys(vim.keycode(keys), "n", false)
		end
	end
end
vim.keymap.set("n", "<C-L>", jump_or( 1, "<C-L>"), {silent = true})
vim.keymap.set("n", "<C-J>", jump_or(-1, "20<Down>zz"), {silent = true})

vim.keymap.set({"i", "s"}, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})

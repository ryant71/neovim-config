--
-- When running in Windsurf via its neovim plugin
--
if vim.g.vscode then
  -- Windsurf-compatible keymaps only
  vim.opt.runtimepath:remove(vim.fn.stdpath("config") .. "/after")
  require("core.keymaps")
  return
end

--
-- Full Neovim setup (Telescope, nvim-tree, etc.)
--

-- Bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

---- https://chatgpt.com/c/1ad72731-d9b1-4cd2-b971-10aa3a48fdf1
-- vim.cmd [[autocmd BufEnter * lua require'completion'.on_attach()]]

-- if running nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- rest of nvim-tree config in lua/core
require("core")
require("func")
require("testing")

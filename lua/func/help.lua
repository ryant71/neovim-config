-- function open_info_popup()
--  local file_path = '~/.config/nvim/remaps.txt'
--  local file = io.open(file_path, 'r')
--  local file_content = file:read('*all')
--  file:close()
-- 
--  local bufnr = vim.api.nvim_create_buf(false, true)
--  vim.api.nvim_buf_set_lines(bufnr, 0, -1, true, vim.split(file_content, '\n'))
-- 
--  vim.api.nvim_buf_set_option(bufnr, 'bufhidden', 'delete')
--  vim.api.nvim_buf_set_option(bufnr, 'modifiable', false)
-- 
--  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<esc>', ':q<cr>', {})
--  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'q', ':q<cr>', {})
--  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<cr>', ':q<cr>', {})
-- 
--  vim.api.nvim_command('noautocmd split')
--  vim.api.nvim_win_set_buf(0, bufnr)
-- end

local M = {}

function M.open_info_popup()
    local file_path = vim.fn.expand('~/.config/nvim/keymaps.md')
    local fh = io.open(file_path, 'r')
    local lines = {}
    if fh then
        for line in fh:lines() do table.insert(lines, line) end
        fh:close()
    end
    local width = vim.api.nvim_get_option('columns')
    local height = vim.api.nvim_get_option('lines')
    local opts = {
        relative = 'editor',
        width =  math.min(math.floor(width * 0.6), 100),
        height = math.floor(height * 0.6),
        row = height * 0.1,
        col = width * 0.1,
        style = 'minimal',
        border = 'double',
        title = 'Help Me',
        title_pos = 'center'
    }

    local bufnr = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(bufnr, 0, -1, true, lines)
    local winid = vim.api.nvim_open_win(bufnr, true, opts)
    vim.api.nvim_win_set_option(winid, 'wrap', false)
    vim.api.nvim_win_set_option(winid, 'cursorline', false)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<esc>', ':q!<cr>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'q', ':q!<cr>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<cr>', ':q!<cr>', {})
end

vim.keymap.set('n', '<leader>i', function() require('func.help').open_info_popup() end, { noremap = true })


-- local function get_schema()
--   local schema = require("yaml-companion").get_buf_schema(0)
--   if schema.result[1].name == "none" then
--     return ""
--   end
--   return schema.result[1].name
-- end

return M
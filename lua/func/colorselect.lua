local M = {}

local Color_win_id = nil
local Color_buf_nr = nil
local prev_colorscheme = nil

function M.select_color_from_menu()
    local line_number = vim.api.nvim_win_get_cursor(0)[1]
    local line_contents = vim.api.nvim_buf_get_lines(0, line_number - 1, line_number, false)[1]
    if line_contents and line_contents ~= "" then
        pcall(vim.cmd, 'colorscheme ' .. line_contents)
    end
end

local function close_popup()
    if Color_win_id ~= nil and vim.api.nvim_win_is_valid(Color_win_id) then
        vim.api.nvim_win_close(Color_win_id, true)
    end
    Color_win_id = nil
    Color_buf_nr = nil
end

local function restore_and_close()
    if prev_colorscheme then
        pcall(vim.cmd, 'colorscheme ' .. prev_colorscheme)
        prev_colorscheme = nil
    end
    close_popup()
end

local function confirm_and_close()
    prev_colorscheme = nil
    close_popup()
end

function M.open_color_popup()
    if Color_win_id ~= nil and vim.api.nvim_win_is_valid(Color_win_id) then
        restore_and_close()
        return
    end

    prev_colorscheme = vim.g.colors_name

    local colorschemes = vim.fn.getcompletion('', 'color')
    local max_length = 0
    for _, cs in ipairs(colorschemes) do
        if #cs > max_length then max_length = #cs end
    end

    local editor_w = vim.api.nvim_get_option("columns")
    local editor_h = vim.api.nvim_get_option("lines")
    local win_h = math.min(20, #colorschemes)
    local win_w = max_length + 2

    local opts = {
        relative = "editor",
        width = win_w,
        height = win_h,
        row = math.floor((editor_h - win_h) / 2),
        col = math.floor((editor_w - win_w) / 2),
        style = "minimal",
        border = "double",
        title = " Color Select ",
        title_pos = "center",
    }

    Color_buf_nr = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(Color_buf_nr, 0, -1, true, colorschemes)

    Color_win_id = vim.api.nvim_open_win(Color_buf_nr, true, opts)
    vim.api.nvim_win_set_option(Color_win_id, "cursorline", true)
    vim.api.nvim_win_set_option(Color_win_id, "wrap", false)

    -- Jump cursor to the currently active colorscheme
    if prev_colorscheme then
        for i, cs in ipairs(colorschemes) do
            if cs == prev_colorscheme then
                vim.api.nvim_win_set_cursor(Color_win_id, {i, 0})
                break
            end
        end
    end

    local map_opts = { nowait = true, noremap = true, silent = true, buffer = Color_buf_nr }
    vim.keymap.set('n', '<esc>', restore_and_close, map_opts)
    vim.keymap.set('n', 'q',    restore_and_close, map_opts)
    vim.keymap.set('n', '<cr>', confirm_and_close,  map_opts)

    -- Live preview: apply colorscheme as cursor moves
    vim.api.nvim_create_autocmd("CursorMoved", {
        buffer = Color_buf_nr,
        callback = M.select_color_from_menu,
    })
end

vim.api.nvim_set_keymap("n", "<leader>oo", ":lua require('func.colorselect').open_color_popup()<cr>", { noremap = true })

return M

M = {}

function M.select_color_from_menu()
    local line_number = vim.api.nvim_win_get_cursor(0)[1]
    local line_contents = vim.api.nvim_buf_get_lines(0, line_number - 1, line_number, false)[1]
    vim.api.nvim_exec('colorscheme ' .. line_contents, true)
end

function M.open_color_popup()
    if Color_win_id ~= nil and vim.api.nvim_win_is_valid(Color_win_id) then
        -- Close menu
        vim.api.nvim_win_close(Color_win_id, true)
        Color_win_id = nil
        Color_buf_nr = nil
        return
    end

    -- Create a table to hold the colorschemes
    local colorschemes_table = {}
    
    -- Get all available colorschemes
    local colorschemes = vim.fn.getcompletion('', 'color')
    
    -- Add each colorscheme to the table
    local max_length = 0
    for _, colorscheme in ipairs(colorschemes) do
        if string.len(colorscheme) >= max_length then
            max_length = string.len(colorscheme)
        end
        table.insert(colorschemes_table, colorscheme)
    end

    local width = vim.api.nvim_get_option("columns")
    local height = vim.api.nvim_get_option("lines")
    local opts = {
        relative = "editor",
        width = max_length + 2,
        height = 10,
        row = height * 0.4,
        col = width * 0.4,
        style = "minimal",
        border = "double",
        title = "Color Select",
        title_pos = "center"
    }

    local Color_buf_nr = vim.api.nvim_create_buf(false, true)

    vim.api.nvim_buf_set_lines(Color_buf_nr, 0, -1, true, colorschemes_table)
    vim.api.nvim_buf_set_keymap(Color_buf_nr, "n", "<esc>", ":q!<cr>", {nowait = true, noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(Color_buf_nr, "n", "q", ":q!<cr>", {nowait = true, noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(Color_buf_nr, "n", "<leader>", "<nop>", {nowait = true, noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(Color_buf_nr, "n", "<buffer> <leader>", "<esc>", {nowait = true, noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(Color_buf_nr, "n", "<cr>", ":lua M.select_color_from_menu()<cr>", {})

    local Color_win_id = vim.api.nvim_open_win(Color_buf_nr, true, opts)

    vim.api.nvim_win_set_option(Color_win_id, "wrap", false)
    vim.api.nvim_win_set_option(Color_win_id, "cursorline", true)

    -- Set up the CursorMoved autocmd event to execute the line under the cursor
    vim.api.nvim_command("autocmd CursorMoved <buffer> lua require('my_colorselect').select_color_from_menu()")
end

vim.api.nvim_set_keymap("n", "<leader>c", ":lua require('my_colorselect').open_color_popup()<cr>", { noremap = true })

return M

function select_color_from_menu()
    local line_number = vim.api.nvim_win_get_cursor(0)[1]
    local line_contents = vim.api.nvim_buf_get_lines(0, line_number - 1, line_number, false)[1]
	vim.cmd("colorscheme " .. line_contents)
end

function open_color_popup()
    local file_path = vim.fn.expand('~/.config/nvim/lua/scurra/packer.lua')
    local file_contents = vim.fn.readfile(file_path)
    local lines = {}
    for _, line in ipairs(file_contents) do
        local pattern = "%s*use%([^%/]+/([^%)%s]+)\"%)%s*--%s*color$"
        local result = string.match(line, pattern)
        table.insert(lines, result)
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
        title = 'Color Select',
        title_pos = 'center'
    }
    local bufnr = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(bufnr, 0, -1, true, lines)
    local winid = vim.api.nvim_open_win(bufnr, true, opts)
    vim.api.nvim_win_set_option(winid, 'wrap', false)
    vim.api.nvim_win_set_option(winid, 'cursorline', true)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<esc>', ':q!<cr>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'q', ':q!<cr>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<cr>', ':lua select_color_from_menu()<cr>', {})
end

vim.api.nvim_set_keymap('n', '<leader>c', ':lua open_color_popup()<cr>', { noremap = true })

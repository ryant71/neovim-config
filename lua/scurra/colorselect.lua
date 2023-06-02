M = {}

-- Define the function to execute the line under the cursor
function ExecuteFloatingWindowLine()
   local line = vim.fn.getline('.')
   -- Execute the line as a Vimscript expression
   vim.api.nvim_exec('colorscheme' .. line, true)
end

-- Set up the CursorMoved autocmd event to execute the line under the cursor

function M.select_color_from_menu()
    local line_number = vim.api.nvim_win_get_cursor(0)[1]
    local line_contents = vim.api.nvim_buf_get_lines(0, line_number - 1, line_number, false)[1]
    -- vim.cmd("colorscheme " .. line_contents
    vim.api.nvim_exec('colorscheme ' .. line_contents, true)
end

function M.open_color_popup()

    if Color_win_id ~= nil and vim.api.nvim_win_is_valid(Color_win_id) then
        -- close menu
        vim.api.nvim_win_close(Color_win_id, true)
        Color_win_id = nil
        Color_buf_nr = nil
        return
    end

    local file_path = vim.fn.expand("~/.config/nvim/lua/scurra/packer.lua")
    local file_contents = vim.fn.readfile(file_path)
    local lines = {}
	local max_length = 0
	local col_count = 0
    for _, line in ipairs(file_contents) do
        local pattern = "%s*use%([^%/]+/([^%)%s]+)\"%)%s*--%s*color$"
        local result = string.match(line, pattern)
        if result ~= nil then
            result = result:gsub("%.nvim$", "")
			if string.len(result) >= max_length then
				max_length = string.len(result)
			end
			col_count = col_count + 1
        end
        table.insert(lines, result)
    end
    local width = vim.api.nvim_get_option("columns")
    local height = vim.api.nvim_get_option("lines")
    local opts = {
        relative = "editor",
        -- width =  math.min(math.floor(width * 0.6), 50),
		width = max_length + 2,
        -- height = math.min(math.floor(height * 0.6), 20),
		height = col_count,
        row = height * 0.4,
        col = width * 0.4,
        style = "minimal",
        border = "double",
        title = "Color Select",
        title_pos = "center"
    }

    -- vim.api.nvim_command("autocmd CursorMoved <buffer> lua M.select_color_from_menu()")

    local Color_buf_nr = vim.api.nvim_create_buf(false, true)

    vim.api.nvim_buf_set_lines(Color_buf_nr, 0, -1, true, lines)
    --vim.api.nvim_command("setlocal timeoutlen=10")
    vim.api.nvim_buf_set_keymap(Color_buf_nr, "n", "<esc>", ":q!<cr>", {nowait = true, noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(Color_buf_nr, "n", "q", ":q!<cr>", {nowait = true, noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(Color_buf_nr, "n", "<leader>", "<nop>", {nowait = true, noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(Color_buf_nr, "n", "<buffer> <leader>", "<esc>", {nowait = true, noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(Color_buf_nr, "n", "<cr>", ":lua M.select_color_from_menu()<cr>", {})

    -- Create a mapping to execute the line under the cursor
    -- vim.api.nvim_buf_set_keymap(0, 'n', '<CR>', '<Cmd>lua ExecuteFloatingWindowLine()<CR>', { silent = true, noremap = true })

    local Color_win_id = vim.api.nvim_open_win(Color_buf_nr, true, opts)

    vim.api.nvim_win_set_option(Color_win_id, "wrap", false)
    vim.api.nvim_win_set_option(Color_win_id, "cursorline", true)

end

vim.api.nvim_set_keymap("n", "<leader>c", ":lua M.open_color_popup()<cr>", { noremap = true })

-- function list_colorschemes()
--     local colorschemes = vim.api.nvim_get_option("colorscheme")
--     if type(colorschemes) == "string" then
--         colorschemes = {colorschemes}
--     end
--     return colorschemes
-- end
-- 
-- available_colorschemes = list_colorschemes()
-- for _, colorscheme in ipairs(available_colorschemes) do
--     print(colorscheme)
-- end

-- function foo()
--     local colorschemes = {}
--     local output = vim.fn.execute('colorscheme')
--     for line in string.gmatch(output, '[^\r\n]+') do
--         if not line:match('^No colorscheme loaded') then
--             table.insert(colorschemes, line)
--         end
--     end
-- 
--     for _, name in ipairs(colorschemes) do
--         print(name)
--     end
-- end
-- 
-- foo()

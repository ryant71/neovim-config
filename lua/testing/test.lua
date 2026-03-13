local M = {}

-- Set leader key
vim.g.mapleader = ' '

-- Function to list leader mappings across modes
function M.list_leader_mappings()
    local modes = { 'n', 'v', 'x', 's', 'o', 'i', 'l', 'c', 't' }
    local leader_mappings = {}

    for _, mode in ipairs(modes) do
        local mappings = vim.api.nvim_get_keymap(mode)

        for _, map in ipairs(mappings) do
            if map.lhs:find('^' .. vim.g.mapleader) then
                table.insert(leader_mappings, { mode = mode, lhs = map.lhs, rhs = map.rhs, callback = map.callback })
            end
        end
    end

    print("Leader Key Mappings:")
    for _, map in ipairs(leader_mappings) do
        local rhs = map.rhs or (map.callback and "<function>" or "nil")
        print(string.format("mode: %s lhs: %s -> rhs: %s", map.mode, map.lhs, rhs))
    end
end

-- Call the function to list leader mappings
M.list_leader_mappings()

return M

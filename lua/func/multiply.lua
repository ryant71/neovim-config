local M = {}

--- Multiply the integer (quoted or unquoted) under the cursor by `factor`.
-- Preserves surrounding quotes and any trailing punctuation.
function M.multiply_number_at_cursor(factor)
  -- get 1-based row, 0-based col from Neovim
  local row, col0 = unpack(vim.api.nvim_win_get_cursor(0))
  local line = vim.api.nvim_get_current_line()
  local cursor_col = col0 + 1  -- convert to 1-based for Lua string indexing

  -- Pattern: optional '"' , optional '-' , digits+ , optional '"'
  -- Captures: start position of match, end position *after* the match
  for startPos, endPosEx in line:gmatch("()\"?%-?%d+\"?()") do
    local endPos = endPosEx - 1
    -- Check if cursor is within this match
    if cursor_col >= startPos and cursor_col <= endPos then
      -- extract the matched token (including quotes if present)
      local token = line:sub(startPos, endPos)
      -- detect and strip quotes
      local had_quotes = token:sub(1,1) == '"' and token:sub(-1,-1) == '"'
      local num_str = had_quotes and token:sub(2, -2) or token
      local num = tonumber(num_str)
      if num then
        -- compute and re-wrap if needed
        local new_num = tostring(num * factor)
        local replacement = had_quotes and ('"' .. new_num .. '"') or new_num

        -- rebuild line: [before token] + replacement + [after token]
        local before = line:sub(1, startPos - 1)
        local after  = line:sub(endPos + 1)
        vim.api.nvim_set_current_line(before .. replacement .. after)
        return
      end
    end
  end

  print("No number found under cursor")
end

return M

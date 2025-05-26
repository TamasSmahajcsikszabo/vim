local M = {}

-- Map of pairs: opening -> closing
local pairs = {
  ["("] = ")",
  ["["] = "]",
  ["{"] = "}",
  ['"'] = '"',
  ["'"] = "'",
  ["|"] = "|",
}

-- Function to insert pair and move cursor between
function M.insert_pair(open)
  local close = pairs[open]
  if close == nil then return end

  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local line = vim.api.nvim_get_current_line()

  local new_line = line:sub(1, col) .. open .. close .. line:sub(col + 1)
  vim.api.nvim_set_current_line(new_line)
  vim.api.nvim_win_set_cursor(0, { row, col + 1 })
end

return M

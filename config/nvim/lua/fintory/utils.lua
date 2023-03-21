local M = {}

M.has_value = function(table, val)
  for _, value in ipairs(table) do
    if value == val then
      return true
    end
  end

  return false
end

return M

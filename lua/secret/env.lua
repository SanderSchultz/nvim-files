local M = {}

for line in io.lines(vim.fn.stdpath("config") .. "/.env") do
  for key, val in string.gmatch(line, "([%w_]+)%s*=%s*(.+)") do
    M[key] = val
  end
end

return M

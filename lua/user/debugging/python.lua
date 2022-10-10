local M = {}

function M.setup(_)
  -- require("nvim-dap-python").setup({})
  require('dap-python').setup("/Users/maxsydney/.virtualenvs/debugpy/bin/python")
end

return M

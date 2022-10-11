local M = {}

function M.setup(_)
  -- require("nvim-dap-python").setup({})
  require('dap-python').setup("/home/maxsydney/debugpy/bin/python")
end

return M

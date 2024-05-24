-- Set up codelldb adapter here

require('dap').adapters.codelldb = {
  type = 'server',
  port = "13000",
  executable = {
    command = '/home/max/.local/share/nvim/mason/packages/codelldb/codelldb',
    args = {"--port", "13000"},
  }
}

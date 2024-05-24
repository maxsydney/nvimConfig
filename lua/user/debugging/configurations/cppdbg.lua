-- Configuration set with VS code launch.json
-- Simply set up adapter here

require("dap").adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = '/home/max/.local/share/nvim/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
}

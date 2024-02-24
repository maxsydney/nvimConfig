-- Very simple configuration using dap-python
local env = os.getenv("VIRTUAL_ENV")
require('dap-python').setup(env .. '/bin/python')

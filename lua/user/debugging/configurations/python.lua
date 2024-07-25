-- Very simple configuration using dap-python
local pythonEnv = os.execute("which python3")
require('dap-python').setup(pythonEnv)

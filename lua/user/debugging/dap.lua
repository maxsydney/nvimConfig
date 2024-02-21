local dap, dapui = require("dap"), require("dapui")

-- Does the configuration have to come before call to setup?
-- Launch dap-ui on dap events
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end
dapui.setup()

dap.adapters.lldb = {
    -- C++/Rust configuration
	type = "executable",
	command = "/usr/bin/lldb-vscode", -- adjust as needed
	name = "lldb",
}

local lldb = {
	name = "Launch lldb",
	type = "lldb", -- matches the adapter
	request = "launch", -- could also attach to a currently running process
	program = function()
		return vim.fn.input(
			"Path to executable: ",
			vim.fn.getcwd() .. "/",
			"file"
		)
	end,
	cwd = "${workspaceFolder}",
	stopOnEntry = false,
	args = {},
	runInTerminal = false,
}

dap.configurations.rust = {
	lldb -- different debuggers or more configurations can be used here
}

-- Python configuration
require('dap-python').setup('/usr/local/bin/python3')

-- Lua configuration
dap.adapters["local-lua"] = {
  type = "executable",
  command = "node",
  args = {
    "/absolute/path/to/local-lua-debugger-vscode/extension/debugAdapter.js"
  },
  enrich_config = function(config, on_config)
    if not config["extensionPath"] then
      local c = vim.deepcopy(config)
      -- 💀 If this is missing or wrong you'll see 
      -- "module 'lldebugger' not found" errors in the dap-repl when trying to launch a debug session
      c.extensionPath = "/absolute/path/to/local-lua-debugger-vscode/"
      on_config(c)
    else
      on_config(config)
    end
  end,
}

-- Set debugger keymaps
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("n", "<F5>", "lua require'dap'.continue()", opts)
keymap("n", "<F17>", "lua require'dap'.stop()", opts) -- Shift-F5
keymap("n", "<F10>", "lua require'dap'.step_over()", opts)
keymap("n", "<F23>", "lua require'dap'.step_out()", opts) -- shift-f11
keymap("n", "<F11>", "lua require'dap'.step_into()", opts)
keymap("n", '<leader>dl', "lua require'dap'.run_last()", opts)
keymap("n", "Db", "lua require'dap'.toggle_breakpoint()", opts)
keymap("n", "nv", "lua require'dap.ui.widgets'.hover()", opts)
--[[ keymap("n", "<Leader>dp", "lua require'dap.ui.widgets'.hover()", opts) ]] -- widgets frames? From help dap-configuration suggested keymaps

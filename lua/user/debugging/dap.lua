-- 
-- Configure DAP and associated UI
--

local dap, dapui = require("dap"), require("dapui")

-- Load nvim-dap-projects to allow for project specific configuration
require('nvim-dap-projects').search_project_config()

--[[ -- Load launch.json and auto-fill configurations ]]
--[[ require('dap.ext.vscode').load_launchjs(nil, { cppdbg = { 'c', 'cpp' } }) ]]

-- Launch dap-ui on dap events
dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end
--[[ dap.listeners.before.event_terminated.dapui_config = function() ]]
--[[     dapui.close() ]]
--[[ end ]]
--[[ dap.listeners.before.event_exited.dapui_config = function() ]]
--[[     dapui.close() ]]
--[[ end ]]
dapui.setup()

-- Set debugger keymaps
vim.keymap.set('n', '<F5>', function() dap.continue() end)
vim.keymap.set('n', '<F17>', function()
    dap.terminate()
    dapui.close()
end)
vim.keymap.set('n', '<S-F5>', function()
    dap.terminate()
    dapui.close()
end)
vim.keymap.set('n', '<F10>', function() dap.step_over() end)
vim.keymap.set('n', '<F11>', function() dap.step_into() end)
vim.keymap.set('n', '<F23>', function() dap.step_out() end)
vim.keymap.set('n', 'Db', function() dap.toggle_breakpoint() end)
vim.keymap.set('n', 'DB', function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end)
vim.keymap.set('n', '<Leader>lp',
    function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() dap.repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() dap.run_last() end)
vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
    require('dap.ui.widgets').hover()
end)
vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
    require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.frames)
end)
--[[ vim.keymap.set('n', '<Leader>df', function() require 'telescope'.extensions.dap.frames {} end) ]]
vim.keymap.set('n', '<Leader>ds', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.scopes)
end)

-- For closing floating DAP windows with q
vim.api.nvim_create_autocmd("FileType", {
    pattern = "dap-float",
    callback = function()
        vim.keymap.set('n', 'q', function()
            vim.api.nvim_win_close(0, false)
        end)
    end
})

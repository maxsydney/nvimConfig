
vim.cmd([[
let g:vimspector_sidebar_width = 85
let g:vimspector_bottombar_height = 15
let g:vimspector_terminal_maxwidth = 70
]])


-- Also set some convenient F row keymaps
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("n", "<F5>", "<cmd>call vimspector#Launch()<cr>", opts)
keymap("n", "<F8>", "<cmd>call vimspector#Reset()<cr>", opts)
keymap("n", "<F10>", "<cmd>call vimspector#StepOver()<cr>", opts)
keymap("n", "<F11>", "<cmd>call vimspector#StepInto()<cr>", opts)
keymap("n", "<S-F11>", "<cmd>call vimspector#StepOut()<cr>", opts)

keymap("n", "Db", "<cmd>call vimspector#ToggleBreakpoint()<cr>", opts)
keymap("n", "Dw", "<cmd>call vimspector#AddWatch()<cr>", opts)
keymap("n", "De", "<cmd>call vimspector#Evaluate()<cr>", opts)

-- -- Vimspector
-- vim.cmd([[
-- nmap <F9> 
-- nmap <F5> <cmd>call vimspector#StepOver()<cr>
-- nmap <F8> <cmd>call vimspector#Reset()<cr>
-- nmap <F11> <cmd>call vimspector#StepOver()<cr>")
-- nmap <F12> <cmd>call vimspector#StepOut()<cr>")
-- nmap <F10> <cmd>call vimspector#StepInto()<cr>")
-- ]])
-- map('n', "Db", ":call vimspector#ToggleBreakpoint()<cr>")
-- map('n', "Dw", ":call vimspector#AddWatch()<cr>")
-- map('n', "De", ":call vimspector#Evaluate()<cr>")


vim.cmd([[
let g:vimspector_sidebar_width = 25
let g:vimspector_bottombar_height = 15
let g:vimspector_terminal_maxwidth = 70

function! s:CustomiseUI()
  " Customise the basic UI...

  " Close the output window
  call win_gotoid( g:vimspector_session_windows.output )
  q
endfunction

function s:SetUpTerminal()
  " Customise the terminal window size/position
  " For some reasons terminal buffers in Neovim have line numbers
  call win_gotoid( g:vimspector_session_windows.terminal )
  set norelativenumber nonumber
endfunction

augroup MyVimspectorUICustomistaion
  autocmd!
  autocmd User VimspectorUICreated call s:CustomiseUI()
  autocmd User VimspectorTerminalOpened call s:SetUpTerminal()
augroup END

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


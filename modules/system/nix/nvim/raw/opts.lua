vim.opt.shiftwidth = 2
vim.opt.tabstop = 2 
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.relativenumber = true

vim.diagnostic.config({
  virtual_text = true,
  virtual_lines = true,
})

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
map('n', '<c-t>', ":ToggleTerm size=15<CR>", opts)
map('n', '<c-n>', ":Neotree filesystem reveal toggle<CR>", opts)
map('v', '<Tab>', '>gv', opts)
map('v', '<S-Tab>', '<gv', opts)
map('n', '<leader>ff', 'Telescope find_files<CR>', opts)
map('n', '<leader>gs', 'Telescope grep_string<CR>', opts)

vim.cmd [[
  set nobackup
  cnoreabbrev W! w!
  cnoreabbrev Q! q!
  cnoreabbrev Qall! qall!
  cnoreabbrev Wq wq
  cnoreabbrev Wa wa
  cnoreabbrev wQ wq
  cnoreabbrev WQ wq
  cnoreabbrev W w
  cnoreabbrev Q q
  cnoreabbrev Qall qall 
]]


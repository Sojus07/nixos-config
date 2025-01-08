{
  config,
  pkgs,
  nixvim,
  ...
}:
{
  programs.nixvim = {
    extraConfigLua = ''
      local map = vim.api.nvim_set_keymap
      local opts = { noremap = true, silent = true } 
      vim.g.mapleader = " "
      map('n', '<c-t>', ":ToggleTerm size=40 direction=float<CR>", opts)
      map('n', '<c-n>', ":Neotree filesystem reveal right toggle<CR>", opts)

      map('v', '<Tab>', '>gv', opts)
      map('v', '<S-Tab>', '<gv', opts)

      vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })

      vim.cmd("highlight Pmenu guibg=NONE")

      vim.opt.shiftwidth = 2
      vim.opt.tabstop = 2 
      vim.opt.softtabstop = 2
      vim.opt.cursorline = true
      vim.opt.expandtab = true
      vim.opt.autoindent = true
      vim.opt.smartindent = true
      vim.opt.number = true
      vim.diagnostic.config({
          virtual_text = true,
          virtual_lines = true,
      })

      vim.cmd [[
        hi VertSplit guibg=NONE guifg=#000000
        set notermguicolors
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
    '';
  };
}

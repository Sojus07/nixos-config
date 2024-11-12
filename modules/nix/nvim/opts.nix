{ config, pkgs, nixvim, ... }:
{
	programs.nixvim = {
		extraConfigLua = ''
			local map = vim.api.nvim_set_keymap
			local opts = { noremap = true, silent = true }

			vim.g.mapleader = " "
			map('n', '<c-t>', ":ToggleTerm size=40 direction=float<CR>", opts)
			map('n', '<c-n>', ":Neotree filesystem reveal right<CR>", opts)
			map('n', '<Leader>c', ":ClangdMemoryUsage<CR>", opts)

			map('v', '<Tab>', '>gv', opts)
			map('v', '<S-Tab>', '<gv', opts)

			vim.opt.shiftwidth = 4
			vim.opt.tabstop = 4  
			vim.opt.cursorline = true
			vim.opt.expandtab = true
			vim.opt.autoindent = true
			vim.opt.smartindent = true
			vim.opt.softtabstop = 4

		'';
	};
}

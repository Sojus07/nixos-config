{ config, pkgs, nixvim, ... }:
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

            vim.opt.shiftwidth = 4
			vim.opt.tabstop = 4  
			vim.opt.cursorline = true
			vim.opt.expandtab = true
			vim.opt.autoindent = true
			vim.opt.smartindent = true
			vim.opt.softtabstop = 4
            vim.opt.number = true;
            vim.cmd [[
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

            local _border = "rounded"
            vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
                  vim.lsp.handlers.hover, {
                    border = _border
                  }
                )

                vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
                  vim.lsp.handlers.signature_help, {
                    border = _border
                  }
                )

                vim.diagnostic.config{
                  float={border=_border}
                };

                require('lspconfig.ui.windows').default_options = {
                  border = _border
                }
		'';
	};
}

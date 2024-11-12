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
            vim.opt.numbers = true;


            # cmp
            return {
            {
                "hrsh7th/nvim-cmp",
                dependencies = {
                    'hrsh7th/cmp-nvim-lsp',
                    'hrsh7th/cmp-buffer',
                    'hrsh7th/cmp-path',
                    'hrsh7th/cmp-cmdline',
                    'hrsh7th/cmp-nvim-lua',
                    'hrsh7th/cmp-calc',
                    'f3fora/cmp-spell',
                    'hrsh7th/cmp-emoji',
                    'saadparwaiz1/cmp_luasnip',
                    'L3MON4D3/LuaSnip',

                    {
                        'windwp/nvim-autopairs',
                        event = "InsertEnter",
                        config = true
                    },
                },
                config = function()
                    local cmp = require("cmp")

                    vim.opt.completeopt = { "menu", "menuone", "noinsert", "noselect" }

                    cmp.setup({
                        sorting = {
                            comparators = {
                                cmp.config.compare.offset,
                                cmp.config.compare.exact,
                                cmp.config.compare.recently_used,
                                require("clangd_extensions.cmp_scores"),
                                cmp.config.compare.kind,
                                cmp.config.compare.sort_text,
                                cmp.config.compare.length,
                                cmp.config.compare.order,
                            },
                        },
                        window = {
                            completion = {
                                autocomplete = true,
                                col_offset = -3,
                                side_padding = 0,
                            },
                        },

                        mapping = cmp.mapping.preset.insert({
                            ["<Tab>"] = cmp.mapping(function(fallback)
                                if cmp.visible() then
                                    cmp.select_next_item()
                                else
                                    fallback()
                                end
                            end, { "i", "s" }),

                            ["<S-Tab>"] = cmp.mapping(function(fallback)
                                if cmp.visible() then
                                    cmp.select_prev_item()
                                else
                                    fallback()
                                end
                            end, { "i", "s" }),

                            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                            ["<C-f>"] = cmp.mapping.scroll_docs(4),
                            ["<C-Space>"] = cmp.mapping.complete(),
                            ["<C-e>"] = cmp.mapping.abort(),
                            ["<C-Left>"] = cmp.mapping.abort(),
                            ["<CR>"] = cmp.mapping.confirm({ select = false }),
                        }),

                        sources = cmp.config.sources({
                            { name = 'nvim_lsp' },
                            { name = 'luasnip' },
                            { name = 'buffer' },
                            { name = 'path' },
                            { name = 'nvim_lua' },
                            { name = 'calc' },
                            { name = 'spell' },
                            { name = 'emoji' },
                            { name = 'crates' },
                        }),
                        highlight = {
                            default = "Subtle"

                        };
                    })
                end
            },
        }

		'';
	};
}

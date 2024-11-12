{ config, pkgs, nixvim, ... }:
{
    imports = [
        nixvim.homeManagerModules.nixvim
		./cmp.nix
		./lsp.nix
	];
    programs.nixvim = {
        enable = true;
        colorschemes.oxocarbon.enable = true;
        extraConfigLua = ''
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
		'';

		plugins = {
            lualine = {
                enable = true;
            };
        };
    };
}


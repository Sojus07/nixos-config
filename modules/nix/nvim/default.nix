{ config, pkgs, nixvim, ... }:
{
    imports = [
        nixvim.homeManagerModules.nixvim
		./cmp.nix
		#./lsp.nix
	];
    programs.nixvim = {
        enable = true;
        colorschemes.oxocarbon.enable = true;
        plugins = {
            lualine = {
                enable = true;
            };
        };
    };
}


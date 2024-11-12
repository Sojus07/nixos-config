{ config, pkgs, nixvim, ... }:
{
    imports = [
        nixvim.homeManagerModules.nixvim
		./cmp.nix
		./lsp.nix
		./neotree.nix
		./opts.nix
		./lualine.nix
	];
    programs.nixvim = {
        enable = true;
        colorschemes.oxocarbon.enable = true;
    };
}


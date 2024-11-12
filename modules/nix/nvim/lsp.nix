{ config, pkgs, nixvim, ... }:
{
	programs.nixvim.plugins = {
		lsp = {
			enable = true;
		};
	};
}

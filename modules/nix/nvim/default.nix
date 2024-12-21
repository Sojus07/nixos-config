{
  config,
  pkgs,
  nixvim,
  ...
}:
let
  nixvim = import (
    builtins.fetchGit {
      url = "https://github.com/nix-community/nixvim";
      ref = "nixos-24.11";
    }
  );
in
{
  imports = [
    nixvim.homeManagerModules.nixvim
    ./cmp.nix
    ./lsp.nix
    ./neotree.nix
    ./opts.nix
    ./lualine.nix
    ./alpha.nix
    ./dev.nix
    ./nonels.nix
  ];
  programs.nixvim = {
    enable = true;
    colorschemes.oxocarbon.enable = true;
    plugins = {
      neocord.enable = true;
    };
  };
}

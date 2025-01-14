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
    ./dev.nix
    ./nonels.nix
    ./treesitter.nix
  ];
  programs.nixvim = {
    enable = true;
    colorschemes.oxocarbon.enable = true;
    plugins = {
      neocord = {
        enable = true;
        settings = {
          auto_update = true;
          global_timer = true;
          log_level = null;
          show_time = true;
          workspace_text = "WS: %s";
        };
      };
    };
  };
}

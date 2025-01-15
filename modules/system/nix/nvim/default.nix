{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./lsp.nix
    ./terminal.nix
    ./neotree.nix
    ./opts.nix
  ];
  vim = {
    theme = {
      enable = true;
      name = "horizon";
      style = "dark";
    };
  };
}


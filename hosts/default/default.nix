{ config, pkgs, ... }:
{
  imports = [
    ./windowManager/dwm/default.nix
    ./editors/nvim/default.nix
    ./system/default.nix
  ];
}

{ config, pkgs, ... }:
{
  imports = [
    ./system/windowManager/dwm/default.nix
    ./system/default.nix
  ];
  hardware = {
    bluetooth = {
      enable = true;
    };
    graphics = {
      enable = true;
    };
  };
  virtualisation = {
    docker = {
      enable = true;
    };
  };
}

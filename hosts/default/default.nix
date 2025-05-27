{ config, pkgs, ... }:
{
  imports = [
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

{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    hackrf
  ];

  hardware = {
    bluetooth = {
      enable = true;
    };
    graphics = {
      enable = true;
    };
  };
}

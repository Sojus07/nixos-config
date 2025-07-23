{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    dmenu
  ];
  services = {
    xserver = {
      enable = true;
      displayManager.startx.enable = true;
      windowManager = {
        dwm = {
          enable = true;
          package = pkgs.dwm.overrideAttrs {
            src = ./source/dwm;
          };
        };
      };
    };
  };
}

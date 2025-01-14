{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    dmenu
    (st.overrideAttrs (oldAttrs: rec {
      configFile = writeText "config.def.h" (builtins.readFile ./source/st/config.def.h);
    }))
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

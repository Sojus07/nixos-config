{ config, pkgs, ... }:
{
  programs.alacritty = {
    enable = true;

    settings = {
      window = {
        opacity = 0.8;
        blur = true;
      };
      colors = {
        primary = {
          background = "#000000";
          foreground = "#FFFFFF";
        };
      };
      font = {
        size = 18;
        normal = {
          family = "FantasqueSansMNerdFont";
        };
      };
    };
  };
}

{ config, pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      window.dimensions = {
        lines = 4;
        columns = 200;
      };
      font = {
        size = 17;
        normal = {
          family = "FantasqueSansMono";
          style = "Regular";
        };
      };
      terminal = {
        shell = "tmux";
      };
      colors = {
        primary = {
          foreground = "#FFFFFF";
          background = "#161616";
        };
      };
    };
  };
}

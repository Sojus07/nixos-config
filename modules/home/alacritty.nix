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
        size = 15;
        normal = {
          family = "TerminessNerdFont";
          style = "Regular";
        };
      };
      terminal = {
        shell = "bash";
      };
      colors = {
        primary = {
          background = "#000000"; 
          foreground = "#FFFFFF"; 
        };
        normal = {
          black   = "#000000"; 
          red     = "#FFFFFF"; 
          green   = "#FFFFFF"; 
          yellow  = "#FFFFFF"; 
          blue    = "#FFFFFF"; 
          magenta = "#FFFFFF"; 
          cyan    = "#FFFFFF"; 
          white   = "#FFFFFF"; 
        };
        bright = {
          black   = "#000000"; 
          red     = "#FFFFFF"; 
          green   = "#FFFFFF"; 
          yellow  = "#FFFFFF"; 
          blue    = "#FFFFFF"; 
          magenta = "#FFFFFF"; 
          cyan    = "#FFFFFF"; 
          white   = "#FFFFFF"; 
        };
      };
    };
  };
}

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
        shell = "tmux";
      };
      colors = {
        primary = {
          background = "#090a0a"; 
          foreground = "#b6b7b7"; 
          cursor     = "#b6b7b7"; 
        };
        normal = {
          black   = "#090a0a"; 
          red     = "#3C3E41"; 
          green   = "#403F40"; 
          yellow  = "#3F4043"; 
          blue    = "#4A4B4F"; 
          magenta = "#5E5F61"; 
          cyan    = "#69696A"; 
          white   = "#b6b7b7"; 
        };
        bright = {
          black   = "#7f8080"; 
          red     = "#3C3E41"; 
          green   = "#403F40"; 
          yellow  = "#3F4043"; 
          blue    = "#4A4B4F"; 
          magenta = "#5E5F61"; 
          cyan    = "#69696A"; 
          white   = "#b6b7b7"; 
        };
      };
    };
  };
}

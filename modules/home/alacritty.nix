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
          background = "#1c1c1c"; 
          foreground = "#b6b7b7"; 
        };
        normal = {
          black   = "#1c1c1c"; 
          red     = "#3C3E41"; 
          green   = "#403F40"; 
          yellow  = "#3F4043"; 
          blue    = "#4A4B4F"; 
          magenta = "#5E5F61"; 
          cyan    = "#69696A"; 
          white   = "#b6b7b7"; 
        };
        bright = {
          black   = "#1c1c1c"; 
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

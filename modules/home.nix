{ config, pkgs, ... }:
{
  home = {
    enableNixpkgsReleaseCheck = false;
    stateVersion = "24.11";
    file = {
      ".wp/galaxy.png".source = ./raw/wp/galaxy.png;
      ".wp/eye.png".source = ./raw/wp/eye.png;
    };
  };

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
          foreground = "#ffffff";
          background = "#000000";
        };
        normal = {
          black   = "#000000";
          red     = "#ffffff";
          green   = "#ffffff";
          yellow  = "#ffffff";
          blue    = "#ffffff";
          magenta = "#ffffff";
          cyan    = "#ffffff";
          white   = "#ffffff";
        };
        bright = {
          black   = "#000000";
          red     = "#ffffff";
          green   = "#ffffff";
          yellow  = "#ffffff";
          blue    = "#ffffff";
          magenta = "#ffffff";
          cyan    = "#ffffff";
          white   = "#ffffff";
        };
      };
    };
  };
}


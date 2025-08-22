{ config, pkgs, ... }:
{
  imports = 
  [ 
    ./tmux.nix 
    ./alacritty.nix 
    ./discord.nix
    ./sway/sway.nix
  ];
  home = {
    enableNixpkgsReleaseCheck = false;
    stateVersion = "24.11";
    file = {
      ".wp/galaxy.png".source = ../raw/wp/galaxy.png;
      ".wp/eye.png".source = ../raw/wp/eye.png;
      ".wp/anime.png".source = ../raw/wp/anime.png;
    };
  };
}


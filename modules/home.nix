{ config, pkgs, ... }:
{
  imports = [
    ./nix/user.nix
    ./nix/nvim/default.nix

    ./nix/hypr/default.nix
    ./nix/bspwm/default.nix
  ];

  home.enableNixpkgsReleaseCheck = false;
  home.stateVersion = "24.05";
  home.file = {
    ".wp/temple.png".source = ./raw/wp/temple.png;
    ".wp/skull_purple.png".source = ./raw/wp/skull_purple.png;
  };
}

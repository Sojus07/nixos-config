{ config, pkgs, ... }:
{
  imports = [
    ./nix/user.nix
    ./nix/nvim/default.nix
    #./nix/hypr/default.nix
    #./nix/bspwm/default.nix
    ./nix/sway/default.nix
  ];

  home = {
    enableNixpkgsReleaseCheck = false;
    stateVersion = "24.05";
    file = {
      ".wp/temple.png".source = ./raw/wp/temple.png;
      ".wp/skull_purple.png".source = ./raw/wp/skull_purple.png;
      ".wp/gruvbox-dark-blue.png".source = ./raw/wp/gruvbox-dark-blue.png;
    };
  };
}

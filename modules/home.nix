{ config, pkgs, ... }:
{
  imports = [
    ./nix/user.nix
    ./nix/hypr.nix
    ./nix/kitty.nix
    ./nix/nvim/default.nix
    ./nix/herbst.nix
  ];

  home.enableNixpkgsReleaseCheck = false;
  home.stateVersion = "24.05";
  home.file = {
    # WAYBAR
    ".config/waybar/style.css".source = ./raw/waybar/style.css;
    ".config/waybar/config".source = ./raw/waybar/config;
    # WP
    ".wp/temple.png".source = ./raw/wp/temple.png;
    ".wp/skull_purple.png".source = ./raw/wp/skull_purple.png;
  };
}

{ config, pkgs, ... }:
{
  imports = [
    ./hypr.nix
    ./kitty.nix
  ];
  home.file = {
    # WAYBAR
    ".config/waybar/style.css".source = ./raw/waybar/style.css;
    ".config/waybar/config".source = ./raw/waybar/config;
  };
}

{ config, pkgs, ... }:
{
  imports = [
    ./sway.nix
  ];
  home.file = {
    # ROFI
    ".config/rofi/config.rasi".source = ./raw/rofi/config.rasi;
    # WEZTERM
    ".config/wezterm/wezterm.lua".source = ./raw/wezterm/wezterm.lua;
    # WAYBAR
    ".config/waybar/style.css".source = ./raw/waybar/style.css;
    ".config/waybar/config".source = ./raw/waybar/config;
  };
}

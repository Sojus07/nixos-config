{ config, pkgs, ... }:
{
  imports = [
    ./sway.nix
  ];
  home = {
    packages = with pkgs; [
      waybar
      swaybg
      slurp
      grim
    ];
    file = {
      ".config/rofi/config.rasi".source = ./raw/config.rasi;
      ".config/waybar/style.css".source = ./raw/style.css;
      ".config/waybar/config".source = ./raw/config;
    };
  };  
}

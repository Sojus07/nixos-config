{ config, pkgs, ... }:
{
  imports = [
    ./sway.nix
    ./alacritty.nix
  ];

  home = {
    file = {
      ".config/rofi/config.rasi".source = ./raw/config.rasi;
    };
  };
}

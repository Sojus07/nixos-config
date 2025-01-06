{ config, pkgs, ... }:
{
  imports = [
    ./sway.nix
    ./alacritty.nix
  ];

  home = {
    file = {
      ".config/rofi/rofi.rasi".source = ./raw/rofi.rasi;
    };
  };
}

{ config, pkgs, ... }:
{
  imports = [
    ./i3.nix
    ./alacritty.nix
  ];

  home.file = {
    ".config/i3/i3status.conf".source = ./raw/i3status.conf;
  };
}

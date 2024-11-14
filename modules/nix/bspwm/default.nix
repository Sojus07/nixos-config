{ config, pkgs, ... }:
{
  imports = [
    ./bspwm.nix
    ./alacritty.nix
    ./polybar.nix
  ];
  #home.file = {

  #};
}

{ config, pkgs, ... }:
{
  imports = [
    ./bspwm.nix
    ./alacritty.nix
    #./polybar.nix
    ./eww.nix
  ];
  #home.file = {

  #};
}

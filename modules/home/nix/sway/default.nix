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
  };  
}

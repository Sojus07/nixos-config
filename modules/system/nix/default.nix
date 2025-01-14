{ config, pkgs, ... }:
{
  imports = [
    ./dns.nix
    ./gaming.nix
    ./firefox.nix
    ./x/dwm/default.nix
  ];
}

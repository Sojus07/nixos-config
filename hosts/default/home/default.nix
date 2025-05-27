{ config, pkgs, ... }:
{
  imports = [
    ./alacritty.nix
    ./git.nix
    ./tmux.nix
    ./sway.nix
    ./waybar.nix
  ];
}

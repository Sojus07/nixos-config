{ config, pkgs, ... }:
{
  imports = [
    ../../../../default/windowManager/sway/default.nix
    ./alacritty.nix
    ./shell.nix
    ./git.nix
    ./tmux.nix
    ./mpd.nix
  ];
}

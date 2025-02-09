{ config, pkgs, ... }:
{
  imports = [
    ./sway/default.nix
    ./alacritty.nix
    ./shell.nix
    ./git.nix
    ./tmux.nix
    ./mpd.nix
  ];
}

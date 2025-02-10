{ config, pkgs, ... }:
{
  imports = [
    ./alacritty.nix
    ./shell.nix
    ./git.nix
    ./tmux.nix
    ./mpd.nix
  ];
}

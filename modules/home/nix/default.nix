{ config, pkgs, ... }:
{
  imports = [
    ./nvim/default.nix
    ./alacritty.nix
    ./shell.nix
    ./git.nix
    ./tmux.nix
    ./mpd.nix
  ];
}

{ config, pkgs, ... }:
{
  imports = [
    #./nixvim/default.nix
    ./alacritty.nix
    ./shell.nix
    ./git.nix
    ./tmux.nix
    ./mpd.nix
  ];
}

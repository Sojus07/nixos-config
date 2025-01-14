{ config, pkgs, ... }:
{
  imports = [
    ./nvim/default.nix
    ./alacritty.nix
    ./bash.nix
    ./git.nix
    ./tmux.nix
    ./mpd.nix
  ];
}

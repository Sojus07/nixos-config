{ config, pkgs, ... }:
{
  imports = [
    ./nvim/default.nix
    ./bspwm/default.nix
    ./hypr/default.nix
    ./bash.nix
    ./git.nix
    ./tmux.nix
    ./mpd.nix
  ];
}

{ config, pkgs, ... }:
{
  imports = [
    ./nvim/default.nix
    ./bash.nix
    ./git.nix
    ./tmux.nix
    ./mpd.nix
  ];
}

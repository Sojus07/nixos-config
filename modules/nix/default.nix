{ config, pkgs, ... }:
{
  imports = [
    ./nvim/default.nix
    ./sway/default.nix
    ./bash.nix
    ./git.nix
    ./tmux.nix
    ./mpd.nix
  ];
}

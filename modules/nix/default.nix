{ config, pkgs, ... }:
{
  imports = [
    ./editors/nvim/default.nix
    ./wm/sway/default.nix
    ./bash.nix
    ./git.nix
    ./tmux.nix
    ./mpd.nix
  ];
}

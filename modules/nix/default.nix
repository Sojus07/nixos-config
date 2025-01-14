{ config, pkgs, ... }:
{
  imports = [
    ./editors/nvim/default.nix
    #./wm/sway/default.nix
    ./wm/i3/default.nix
    ./bash.nix
    ./git.nix
    ./tmux.nix
    ./mpd.nix
  ];
}

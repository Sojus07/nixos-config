{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    mpc
  ];
  services = {
    mpd = {
      enable = true;
      musicDirectory = "/home/fabian/.music";
      extraConfig = ''
        audio_output {
          type "pipewire"
          name "Pipewire Output"
        }
      '';
    };
  };

  programs = {
    ncmpcpp = {
      enable = true;
      mpdMusicDir = "/home/fabian/.music";
    };
  };
}

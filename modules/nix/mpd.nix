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
      settings = {
        ncmpcpp_directory = "~/.ncmpcpp";
        mpd_host = "localhost";
        mpd_port = 6600;
        header_window_color = "cyan";
        progressbar_look = "░█";
        visualizer_type = "wave";
        visualizer_color = "cyan";
        visualizer_look = "┃│";
      };
    };
  };
}

{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    mpc
    mpd-discord-rpc
    mpv
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

        audio_output {
          type            "fifo"
          name            "Visualizer feed"
          path            "/tmp/mpd.fifo"
          format          "44100:16:2"
        }

      '';
    };
  };

  programs = {
    ncmpcpp = {
      enable = true;
      mpdMusicDir = "/home/fabian/.music";
      bindings = [
      ];
      settings = {
        ncmpcpp_directory = "~/.ncmpcpp";
        mpd_host = "localhost";
        mpd_port = 6600;
        header_window_color = "cyan";
        progressbar_look = "━━━";
        visualizer_color = "cyan";
        visualizer_look = "┃│";
        now_playing_prefix = "󰮯 ";
        visualizer_type = "wave";
        song_status_format = " $2%a $4⟫$3⟫ $8%t $4⟫$3⟫ $5%b ";
        autocenter_mode = "yes";
        centered_cursor = "yes";
        display_bitrate = "no";
        enable_window_title = "no";
        follow_now_playing_lyrics = "yes";
        ignore_leading_the = "yes";
        empty_tag_marker = "";
        visualizer_data_source = "/tmp/mpd.fifo";
        visualizer_output_name = "my_fifo";
        header_visibility = false;
        statusbar_visibility = true;
        titles_visibility = true;
      };
    };
  };
}

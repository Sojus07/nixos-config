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
      package = pkgs.ncmpcpp.override { visualizerSupport = true; };
      mpdMusicDir = "/home/fabian/.music";
      settings = {
        mpd_port = 6600;
        mpd_crossfade_time = 2;
        mouse_support = "yes";
        visualizer_data_source = "/tmp/mpd.fifo";
        visualizer_output_name = "my_fifo";
        visualizer_in_stereo = "yes";
        visualizer_type = "spectrum";
        visualizer_look = "█┇";
        visualizer_color = "7, 5, 4, 3";
        startup_screen = "playlist";
        startup_slave_screen = "visualizer";
        song_list_format = "[%l] - [ %a | %t] ";
        locked_screen_width_part = 50;
        ask_for_locked_screen_width_part = "no";
        playlist_display_mode = "classic";
        autocenter_mode = "yes";
        progressbar_look = "___";
        header_visibility = "no";
        statusbar_visibility = "no";
        titles_visibility = "no";
        follow_now_playing_lyrics = "no";
        enable_window_title = "no";
        external_editor = "vis";
        colors_enabled = "yes";
        empty_tag_color = "red";
        header_window_color = "yellow";
        volume_color = "yellow";
        state_line_color = "red";
        state_flags_color = "yellow";
        main_window_color = "default";
        color1 = "red";
        color2 = "red";
        progressbar_color = "5";
        progressbar_elapsed_color = "4";
        statusbar_color = "black";
        alternative_ui_separator_color = "magenta";
        window_border_color = "yellow";
        active_window_border = "magenta";
      };
    };
  };
}

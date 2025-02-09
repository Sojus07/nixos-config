{ config, pkgs, ... }:
{
  programs.alacritty = {
  enable = true;
  settings = {
    window.dimensions = {
      lines = 4;
      columns = 200;
    };
    font = {
      size = 17;
      normal = {
        family = "TerminessNerdFont";
        style = "Regular";
      };
    };
    terminal = {
      shell = "tmux";
    };
    colors = {
      primary = {
        foreground = "#f2f4f8";
        background = "#121212";
      };
      normal = {
        black   = "#121212";
        red     = "#ee5396";
        green   = "#25be6a";
        yellow  = "#08bdba";
        blue    = "#78a9ff";
        magenta = "#be95ff";
        cyan    = "#33b1ff";
        white   = "#dfdfe0";
      };
      bright = {
        black   = "#525252";
        red     = "#ff7eb6";
        green   = "#42be65";
        yellow  = "#3ddbd9";
        blue    = "#82cfff";
        magenta = "#df99ff";
        cyan    = "#6ea6ff";
        white   = "#ffffff";
      };
    };
  };
};

}

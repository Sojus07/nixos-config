{
  config,
  pkgs,
  nixvim,
  ...
}:
let
  nixvim = import (
    builtins.fetchGit {
      url = "https://github.com/nix-community/nixvim";
    }
  );
in
{
  imports = [
    nixvim.homeManagerModules.nixvim
    ./cmp.nix
    ./lsp.nix
    ./neotree.nix
    ./opts.nix
    ./lualine.nix
    ./dev.nix
    ./nonels.nix
    ./treesitter.nix
  ];
  programs.nixvim = {
    enable = true;
    plugins = {
      transparent = {
        enable = false;
        settings = {
          groups = [
            "Normal"
            "NormalNC"
            "CursorLine"
            "StatusLine"
            "StatusLineNC"
            "EndOfBuffer"

          ];
          exclude_groups = [ ];
          extra_groups = [
            "BufferLineTabClose"
            "BufferLineBufferSelected"
            "BufferLineFill"
            "BufferLineBackground"
            "BufferLineSeparator"
            "BufferLineIndicatorSelected"
          ];
        };
      };

      neocord = {
        enable = true;
        settings = {
          auto_update = true;
          global_timer = true;
          log_level = null;
          show_time = true;
          workspace_text = "WS: %s";
        };
      };
    };
  };
}

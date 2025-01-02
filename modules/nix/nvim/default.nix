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
      ref = "nixos-24.11";
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
    ./alpha.nix
    ./dev.nix
    ./nonels.nix
    ./treesitter.nix
  ];
  programs.nixvim = {
    enable = true;
    colorschemes.oxocarbon.enable = true;
    plugins = {
      neocord = {
        enable = true;
        settings = {
          auto_update = true;
          blacklist = [ ];
          client_id = "1157438221865717891";
          debounce_timeout = 10;
          editing_text = "Editing...";
          enable_line_number = false;
          file_assets = null;
          file_explorer_text = "Browsing...";
          git_commit_text = "Committing changes...";
          global_timer = true;
          line_number_text = "Line %s out of %s";
          log_level = null;
          logo = "auto";
          logo_tooltip = null;
          main_image = "language";
          plugin_manager_text = "Managing plugins...";
          reading_text = "Reading...";
          show_time = true;
          terminal_text = "Using a 1337 Terminal...";
          workspace_text = "Working on %s";
        };
      };
    };
  };
}

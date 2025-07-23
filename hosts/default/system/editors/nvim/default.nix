{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./lsp.nix
    ./terminal.nix
    ./neotree.nix
    ./cmp.nix
    ./lualine.nix
    ./snip.nix
                #./extraPlugins.nix
  ];
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        ui = {
          noice = {
            enable = true;
          };
        };
        extraLuaFiles = [
          (builtins.path {
            path = ./raw/opts.lua;
            name = "opts.lua";
          })
        ];
        autopairs.nvim-autopairs.enable = true;
        telescope.enable = true;
        theme = {
          enable = true;
          name = "base16";
          base16-colors = {
            base00 = "#000000";
            base01 = "#101010";
            base02 = "#202020";
            base03 = "#303030";
            base04 = "#404040";
            base05 = "#ffffff";
            base06 = "#ffffff";
            base07 = "#ffffff";
            base08 = "#ffffff";
            base09 = "#ffffff";
            base0A = "#ffffff";
            base0B = "#ffffff";
            base0C = "#ffffff";
            base0D = "#ffffff";
            base0E = "#ffffff";
            base0F = "#ffffff";
          }; 
        };
      };
    };
  };
}


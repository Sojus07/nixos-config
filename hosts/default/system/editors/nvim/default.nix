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
          name = "oxocarbon";
          style = "dark";
        };
      };
    };
  };
}


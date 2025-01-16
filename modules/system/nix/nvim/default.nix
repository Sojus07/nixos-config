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
  ];
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
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
        };
      };
    };
  };
}


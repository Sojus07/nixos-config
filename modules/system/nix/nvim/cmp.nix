{
  pkgs,
  lib,
  ...
}: {
  programs.nvf.settings.vim = {
    extraLuaFiles = [
      (builtins.path {
        path = ./raw/cmp.lua;
        name = "my-lua-file";
      })
    ];
    autocomplete = {
      nvim-cmp = {
        enable = true;
        setupOpts = {
          completion = {
            completeopt = "menu,menuone,noinsert,noselect";
          };
        };
        #sourcePlugins = [
        #  "crates-nvim"
        #  "cmp-nvim-lsp"
        #  "rustaceanvim"
        #];
      };
    };
  };
}

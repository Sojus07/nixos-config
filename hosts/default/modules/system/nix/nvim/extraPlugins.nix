{ pkgs, lib, ... }:
{
  programs.nvf.settings.vim = {
    extraPlugins = with pkgs; {
      neocord = {
        package = vimPlugins.neocord;
        setup = "require('neocord').setup {}";
      };
    };
  };
}

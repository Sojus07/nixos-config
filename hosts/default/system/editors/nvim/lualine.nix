{ pkgs, lib, ... }:
{
  programs.nvf.settings.vim = {
    statusline = {
      lualine = {
        enable = true;
        theme = "oxocarbon"; 
        globalStatus = true;
        icons.enable = true;
        ignoreFocus = [
          "neo-tree"
          "filename"
          "location"
        ];
        componentSeparator = {
          left = "";
          right = "";
        }; 
        sectionSeparator = {
          left = "";
          right = "";
        };
      };
    };
  };
}

{
  config,
  pkgs,
  nixvim,
  ...
}:
{
  programs.nixvim = {
    plugins = {
      lualine = {
        enable = true;
      };
    };
  };
}

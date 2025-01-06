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
        enable = false;
        settings = {
          options = {
            theme = "horizon";
          };
        };
      };
    };
  };
}

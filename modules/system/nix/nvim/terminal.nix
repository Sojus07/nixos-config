{
  pkgs,
  lib,
  ...
}: {
  vim = {
    terminal = {
      enable = true;
      lazygit.enable = true;
    };
  };
}

{
  pkgs,
  lib,
  ...
}: {
  vim = {
    globals = {
      mapleader = " ";

      shiftwidth = 2;
      tabstop = 2;
      softtabstop = 2;
    };
  };
}

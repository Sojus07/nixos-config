{ config, pkgs, ... }:
{
  hardware = {
    rtl-sdr = {
      enable = true;
    };
    hackrf = {
      enable = true;
    };
  };
}
